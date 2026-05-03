class ApiEndPoints {
  static const domain = "van_sales.van_sales.api";

  //? --- Home ---
  static const String homeDashboard = '$domain.dashboard.get_dashboard';

  //? --- Customers ---
  static const String createCustomer = '$domain.customer.create_customer';
  static const String getCustomers = '$domain.customer.get_customers';
  static const String searchCustomers = '$domain.customer.search_customers';

  //? --- Orders ---
  static const String orderSummary = '$domain.orders.get_order_summary';
  static const String getInvoiceDetails = '$domain.orders.get_invoice_details';



  //? --- AUTH ---
  static const String signIn = '$domain.auth.login';

  //? --- VAN STOCK ---
  static const String getVanStock = '$domain.inventory.get_warehouse_stock';
  //? --- MY TRIPS ---
  static const String getTripsData = '$domain.trip.get_trip_details';
  static const String updateVisitStatus = '$domain.visit.update_visit_status';
  static const String startTrip = '$domain.trip.start_trip';

  //? --- CREATION INVOICE ---
  static const String createInvoice = '$domain.orders.create_invoice';
  static const String createPaymentApi = '$domain.payments.create_payment';
  static const String createReturnOrder = '$domain.returns.create_return_order';
  //? --- Settings ---
  static const String deleteAccountApi = '$domain.profile.delete_user_profile';
  static const String logoutApi = '$domain.auth.logout';
  static const String appNotification = 'sabaa.api.api.get_notification_logs';

  static const String sendFcmToken = 'fcm_frappe.api.device_token';

}
