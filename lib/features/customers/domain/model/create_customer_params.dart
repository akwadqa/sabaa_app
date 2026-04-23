// ignore_for_file: non_constant_identifier_names

class CreateCustomerParams {
  final String customer_name;
  final String phone;
  final String street_number;
  final String building_number;
  final String zone_number;
  final String customer_type;
  final String customer_group;

  CreateCustomerParams(
      {required this.customer_name,
      required this.phone,
      required this.street_number,
      required this.building_number,
      required this.zone_number,
      required this.customer_type,
      required this.customer_group});

  Map<String, String> toJson() {
    return {
      "customer_name": customer_name,
      "phone": phone,
      "street_number": street_number,
      "building_number": building_number,
      "zone_number": zone_number,
      "customer_type": customer_type,
      "customer_group": customer_group,
    };
  }
}
