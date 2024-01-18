import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

class NotificationService {

  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final notificationPayload = BehaviorSubject<String?>();

  Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTap,

    );
  }

  void onNotificationTap(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      notificationPayload.add(payload);
    }

  }

  void closeNotificationPayload(){
    notificationPayload.value = null;
  }

  static Future requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();
    if (status != PermissionStatus.granted) {

      print('Notification permission denied');
    }
  }


  NotificationDetails notificationDetails()  {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          channelDescription: 'Channel Desc',
          importance: Importance.max
      ),
    );

  }


  Future showLocalNotifications(String title,String body,String payload) async {
    await _flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        notificationDetails(),
        payload: payload
    );
  }


}