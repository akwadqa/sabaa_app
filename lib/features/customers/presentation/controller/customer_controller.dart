import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/customers/data/repository/customer_repository.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_params.dart';
import 'package:sabaa/features/customers/domain/model/create_customer_response/create_customer_response.dart';
import 'package:sabaa/features/customers/presentation/controller/customer_state.dart';

part 'customer_controller.g.dart';

@riverpod
class CustomersController extends _$CustomersController {
  @override
  FutureOr<CustomerState> build() {
    return CustomerState.init();
  }

  List<CustomerModel> _customers = [];
  int _currentPage = 1;
  int _totalPages = 1;

  void changeSelectedType(String? type) {
    state = AsyncData(state.value!.copyWith(customerType: type));
  }

  void changeSelectedGroup(String? group) {
    state = AsyncData(state.value!.copyWith(customerGroup: group));
  }

  void changeSelectedZone(String? zone) {
    state = AsyncData(state.value!.copyWith(zone: zone));
  }

  void changeName(String name) {
    state = AsyncData(state.value!.copyWith(name: name));
  }

  void changePhone(String phone) {
    state = AsyncData(state.value!.copyWith(phone: phone));
  }

  void changeStreet(String street) {
    state = AsyncData(state.value!.copyWith(street: street));
  }

  void changeBuilding(String building) {
    state = AsyncData(state.value!.copyWith(building: building));
  }

  Future<CustomerModel?> saveCustomer() async {
    try {
      final params = CreateCustomerParams(
        customer_name: state.value!.name ?? '',
        phone: state.value!.phone ?? '',
        street_number: state.value!.street ?? '',
        building_number: state.value!.building ?? '',
        zone_number: state.value!.zone ?? '',
        // customer_type: state.value!.customerType ?? '',
        customer_type: 'Company',
        customer_group: 'test customer grp',
        // customer_group: state.value!.customerGroup ?? '',
      );

      state = AsyncData(
          state.value!.copyWith(createCustomerResponse: AsyncLoading()));
      final response =
          await ref.read(customerRepositoryProvider).createCustomer(params);

      state = AsyncData(
          state.value!.copyWith(createCustomerResponse: AsyncData(response)));
      return response;
    } catch (e, st) {
      state = AsyncData(
          state.value!.copyWith(createCustomerResponse: AsyncError(e, st)));
      return null;
      //
    }
  }

  bool get isFormValid {
    final currentState = state.value;
    return currentState != null &&
        (currentState.name?.isNotEmpty ?? false) &&
        (currentState.phone?.isNotEmpty ?? false) &&
        (currentState.customerType?.isNotEmpty ?? false) &&
        (currentState.customerGroup?.isNotEmpty ?? false) &&
        (currentState.street?.isNotEmpty ?? false) &&
        (currentState.building?.isNotEmpty ?? false) &&
        (currentState.zone?.isNotEmpty ?? false);
  }

  String search = '';

  Future<List<CustomerModel>> getCustomers(
      {required int page, bool showLoading = true}) async {
    try {
      if (showLoading) {
        state = AsyncData(state.value!.copyWith(customersList: AsyncLoading()));
      }

      final repo = ref.read(customerRepositoryProvider);
      final response = await repo.getCustomers(page: page, name: search);

      _currentPage = response.pagination!.currentPage;
      _totalPages = response.pagination!.totalPages;

      if (page == 1) {
        _customers = List.from(response.data!);
      } else {
        _customers.addAll(response.data!);
      }

      state = AsyncData(
          state.value!.copyWith(customersList: AsyncData([..._customers])));
      return _customers;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }

  Future<bool> loadNextPage() async {
    if (_currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await getCustomers(page: nextPage, showLoading: false);
    return result.isNotEmpty;
  }

  Future<bool> refresh() async {
    _customers.clear();
    _currentPage = 1;
    _totalPages = 1;
    await getCustomers(page: 1);
    return true;
  }
}
