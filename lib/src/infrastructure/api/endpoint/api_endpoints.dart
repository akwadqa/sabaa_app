class ApiEndPoints {
  static const domain = "sabaa.api";

  //? --- Home ---
  static const String homeServices = 'sabaa.api.category.home_page';


  //? --- Comment ---
  static const String createComment = 'sabaa.api.comment.create_comment';

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

  //? --- Product ---
  static const String productDetails = 'sabaa.api.post.post_details';
  static const String addProductToFavorite = 'product_favorite';

  //? --- Post ---
  static const String deletePost = 'sabaa.api.post.delete_post';
  static const String createPost = 'sabaa.api.post.create_post';

  //? --- Category ---
  static const String subCategory = 'sabaa.api.category.subcategory_attributes';

  //? --- Filter ---
  static const String productsByFilter = 'products_by_filter';

  //? --- Search ---
  static const String search = 'search';
}
