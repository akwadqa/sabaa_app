class ApiEndPoints {
  static const domain = "sabaa.api";

  //? --- Home ---
  static const String homeServices = 'sabaa.api.category.home_page';



  //? --- AUTH ---
  static const String signIn = '$domain.auth.send_otp';
  static const String signUp = '$domain.auth.sign_up';
  static const String verifyOtp = '$domain.auth.verify_otp';

  //? --- Notification ---
  static const String appNotification = 'sabaa.api.api.get_notification_logs';

  //? --- Settings ---
  static const String deleteAccountApi = '$domain.profile.delete_user_profile';
  static const String logoutApi = '$domain.auth.logout';

  static const String sendFcmToken = 'fcm_frappe.api.device_token';

}
