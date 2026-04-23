import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';

class CustomerState {
  final String? name;
  final String? phone;
  final String? street;
  final String? building;
  final String? zone;
  final String? customerType;
  final String? customerGroup;

  final AsyncValue<CustomerModel>? createCustomerResponse;
  final AsyncValue<List<CustomerModel>>? customersList;

  CustomerState({
    this.name,
    this.phone,
    this.street,
    this.building,
    this.zone,
    this.customerType,
    this.customerGroup, this.createCustomerResponse, this.customersList,
  });

  factory CustomerState.init() {
    return CustomerState(
      name: '',
      phone: '',
      createCustomerResponse: null,
      street: '',
      building: '',
      zone: null,
      customerType: null,
      customersList: null,
      customerGroup: null,
    );
  }

  CustomerState copyWith({
    String? name,
    String? phone,
    String? street,
    String? building,
    String? zone,
    String? customerType,
    String? customerGroup,
    AsyncValue<CustomerModel>? createCustomerResponse,
    AsyncValue<List<CustomerModel>>? customersList,

  }) {
    return CustomerState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      street: street ?? this.street,
      building: building ?? this.building,
      customersList: customersList ?? this.customersList,
      zone: zone ?? this.zone,
      customerType: customerType ?? this.customerType,
      customerGroup: customerGroup ?? this.customerGroup,
      createCustomerResponse: createCustomerResponse ?? this.createCustomerResponse,
    );
  }
}
