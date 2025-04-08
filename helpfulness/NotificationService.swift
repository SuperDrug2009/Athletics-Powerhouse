import FirebaseMessaging
import UserNotifications

class NotificationService: UNNotificationServiceExtension {
  var contentHandler: ((UNNotificationContent) -> Void)?
  var bestAttemptContent: UNMutableNotificationContent?

  override func didReceive(_ request: UNNotificationRequest,
                           withContentHandler contentHandler: @escaping (UNNotificationContent)
                             -> Void) {
    self.contentHandler = contentHandler
    bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)

    if let bestAttemptContent {
      // Modify the notification content here...
      bestAttemptContent.title = "\(bestAttemptContent.title)"

      // Log Delivery signals and export to BigQuery.
      Messaging.serviceExtension()
        .exportDeliveryMetricsToBigQuery(withMessageInfo: request.content.userInfo)

      // Add image, call this last to finish with the content handler.
      Messaging.serviceExtension()
        .populateNotificationContent(bestAttemptContent, withContentHandler: contentHandler)
    }
  }

  override func serviceExtensionTimeWillExpire() {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the
    // original push payload will be used.
    if let contentHandler, let bestAttemptContent {
      contentHandler(bestAttemptContent)
    }
  }
}
