import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabaa/features/order/data/repository/order_repository.dart';
import 'package:sabaa/features/order/domain/create_payment/create_payment_response.dart';
import 'package:sabaa/features/order/domain/order_summary/order_summary_model.dart';
import 'package:sabaa/features/order/domain/order_summary/payment_response_model.dart';
import 'package:sabaa/features/order/domain/upload_capture/upload_capture_response.dart';
import 'package:sabaa/features/order/presentation/controller/order_state.dart';
import 'package:sabaa/src/core/shared_widgets/app_toast.dart';
import 'package:sabaa/src/core/utils/functions/image_picker_utils.dart';

part 'order_controller.g.dart';

@riverpod
class OrderController extends _$OrderController {
  final _picker = ImagePicker();

  @override
  FutureOr<OrderState> build() {
    return OrderState.init();
  }

  List<InvoiceModel> _invoices = [];
  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoadingPage = false;
  String? _customerId;
  Future<void> changeSelectedType(
      {required String type, required String customerId}) async {
    _invoices.clear();
    _currentPage = 0;
    _totalPages = 0;
    state = AsyncData(state.value!.copyWith(
      ordersTypeFilter: type,
      filterLoading: true,
    ));
    await getOrderSummary(customerId: customerId, page: 1, showLoading: false);
    state = AsyncData(state.value!.copyWith(filterLoading: false));
  }

  void changeSelectedPaymentMethod(String? method) {
    state = AsyncData(state.value!.copyWith(paymentMethod: method));
  }

  void setSummaryAction(String? action) {
    state = AsyncData(state.value!.copyWith(summaryAction: action));
  }

  Future<void> changeSelectedAction({
    required String action,
    required String customerId,
  }) async {
    _invoices.clear();
    _currentPage = 0;
    _totalPages = 0;

    state = AsyncData(
      state.value!.copyWith(
        selectedAction: action,
        summaryAction: action,
        filterLoading: true,
      ),
    );

    await getOrderSummary(
      customerId: customerId,
      page: 1,
      showLoading: false,
    );

    state = AsyncData(state.value!.copyWith(filterLoading: false));
  }

  Future<OrderSummaryModel?> getOrderSummary({
    required String customerId,
    required int page,
    bool showLoading = true,
    String? fromDate, // yyyy-MM-dd
    String? toDate,
  }) async {
    try {
      _isLoadingPage = true;
      if (showLoading) {
        state = AsyncData(
            state.value!.copyWith(orderSummary: const AsyncLoading()));
      }
      final currentAction = state.value!.selectedAction; // 👈 read from state

      final response = await ref.read(orderRepositoryProvider).getOrderSummary(
            customerId: customerId,
            status: state.value!.ordersTypeFilter != 'all'
                ? state.value!.ordersTypeFilter
                : null,
            page: page,
            action: currentAction,
            fromDate: fromDate, 
            toDate: toDate, 
          );

      _currentPage = response.pagination!.currentPage;
      _totalPages = response.pagination!.totalPages;

      if (page == 1) {
        _invoices = List.from(response.data?.invoices ?? []);
      } else {
        // _invoices.addAll(response.data?.invoices ?? []);
        _invoices = [..._invoices, ...(response.data?.invoices ?? [])];
      }

      // final updatedSummary = response.data!.copyWith(invoices: _invoices);
      final updatedSummary = OrderSummaryModel(
          customerId: response.data?.customerId ?? '',
          totalSales: response.data?.totalSales ?? 0,
          totalReturnSales: response.data?.totalReturnSales ?? 0,
          totalInvoicesAmount: response.data?.totalInvoicesAmount ?? 0,
          outstandingBalance: response.data?.outstandingBalance ?? 0,
          invoices: [..._invoices]);
      state = AsyncData(
          state.value!.copyWith(orderSummary: AsyncData(updatedSummary)));
      _customerId = customerId;
      return updatedSummary;
    } catch (e, st) {
      state = AsyncData(state.value!.copyWith(orderSummary: AsyncError(e, st)));
      return null;
    } finally {
      _isLoadingPage = false;
    }
  }

  Future<bool> loadNextPage(String customerId) async {
    if (_isLoadingPage) return true;
    if (_totalPages > 0 && _currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await getOrderSummary(
        customerId: customerId, page: nextPage, showLoading: false);
    return result != null;
  }

  Future<bool> refresh({String? customerId}) async {
    _invoices.clear();
    _currentPage = 0;
    _totalPages = 0;
    await getOrderSummary(customerId: customerId ?? _customerId!, page: 1);
    return true;
  }

  void resetOrdersFilter({required String customerId}) {
    final current = state.value!;
    state = AsyncData(
      current.copyWith(ordersTypeFilter: 'all'),
    );
  }

  Future<bool> createPayment({
    required String invoiceId,
    required String amount,
    required String paymentMethod,
  }) async {
    final current = state.value!;

    state = AsyncData(current.copyWith(isPaying: true));

    try {
      final response = await ref.read(orderRepositoryProvider).createPayment(
            invoiceId: invoiceId,
            amount: amount,
            paymentMethod: paymentMethod,
          );

      state = AsyncData(
        current.copyWith(
          isPaying: false,
          paymentData: response.data,
        ),
      );

      return true;
    } catch (e) {
      state = AsyncData(current.copyWith(isPaying: false));
      AppToast.errorToast(e.toString());

      return false;
    }
  }
// order_controller.dart — add this method
// order_controller.dart

// order_controller.dart

  Future<bool> reconcileCreditNotes({
    required String invoiceId,
    required List<String> creditNoteIds,
    String? customerName, // ✅ pass customer name from bottom sheet
  }) async {
    final current = state.value!;
    state = AsyncData(current.copyWith(isPaying: true));

    try {
      final response =
          await ref.read(orderRepositoryProvider).reconcileCreditNotes(
                invoiceId: invoiceId,
                creditNoteIds: creditNoteIds,
              );

      // ✅ Calculate total allocated amount from all credit notes
      final totalAllocated = response.allocations.fold<double>(
        0,
        (sum, a) => sum + a.allocatedAmount.toDouble(),
      );

      // ✅ Build paymentData same as normal payment
      final paymentData = PaymentResponseModel(
        paymentId: response.invoiceId, // Invoice ID
        paymentType: 'Credit Note', // Type
        party: customerName ?? '',
        partyName: customerName ?? '',
        modeOfPayment: 'Credit Note', // Mode
        paidAmount: totalAllocated, // Sum of allocations
        currency: 'QAR',
        docStatus: 1,
      );

      state = AsyncData(current.copyWith(
        isPaying: false,
        paymentData: paymentData,
      ));

      return true;
    } catch (e) {
      state = AsyncData(current.copyWith(isPaying: false));
      AppToast.errorToast('failed_to_apply_credit_notes'.tr());
      return false;
    }
  }

  Future<UploadCaptureResponse?> uploadCapture({
    required String visitId,
    required String captureNote,
  }) async {
    final current = state.value!;

    state = AsyncData(
        current.copyWith(uploadCaptureResponse: const AsyncLoading()));

    try {
      final imageFiles = current.images!.map((path) => File(path)).toList();

      final response = await ref.read(orderRepositoryProvider).upladCapture(
            visitId: visitId,
            images: imageFiles,
            captureNote: captureNote,
          );

      state = AsyncData(
        current.copyWith(
          uploadCaptureResponse: AsyncData(response.data!),
        ),
      );

      return response.data;
    } catch (e, st) {
      state =
          AsyncData(current.copyWith(uploadCaptureResponse: AsyncError(e, st)));

      return null;
    }
  }

  Future<void> pickImage(BuildContext context) async {
    final current = state.value!;
    // if (current.images?.length >= 5) return;

    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final File? image = await showImageSourcePicker(context);

    if (image == null) return;

    final updated = List<String>.from(current.images as Iterable<dynamic>)
      ..add(image.path);

    state = AsyncData(
      current.copyWith(images: updated),
    );
  }

  /// Remove image
  void removeImage(int index) {
    final current = state.value!;
    final updated = List<String>.from(current.images as Iterable<dynamic>)
      ..removeAt(index);

    state = AsyncData(
      current.copyWith(images: updated),
    );
  }

  void addImage(String path) {
    final current = state.value!;
    final updated = List<String>.from(current.images as Iterable<dynamic>)
      ..add(path);

    state = AsyncData(
      current.copyWith(images: updated),
    );
  }
}
