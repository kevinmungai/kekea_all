import 'package:built_collection/built_collection.dart';
import '../../utils/sale_product_utils/get_sale_totals.dart';
import '../../bloc/business_person_status_bloc/bloc.dart';
import '../../bloc/product_list_status_bloc/bloc.dart';
import '../../data/customer/customer.dart';
import '../../data/payment_method/payment_method.dart';
import '../../data/sale_product/sale_product.dart';
import 'bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class PaymentInputBloc extends Bloc<PaymentInputEvent, PaymentInputState> {
  final ProductListStatusBloc productListStatusBloc;
  final BusinessPersonStatusBloc businessPersonStatusBloc;

  PaymentInputBloc({
    @required this.productListStatusBloc,
    @required this.businessPersonStatusBloc,
  })  : assert(
            productListStatusBloc != null && businessPersonStatusBloc != null),
        super(
          PaymentInputState(
            paymentMethod: PaymentMethod.cash(),
            customer: Customer(),
          ),
        );

  @override
  Stream<PaymentInputState> mapEventToState(PaymentInputEvent event) async* {
    yield* event.when(
      selectPaymentMethod: (PaymentMethod paymentMethod) async* {
        yield state.copyWith(paymentMethod: paymentMethod);
      },
      changeCashAmountGiven: (BigInt amountGiven) async* {
        final BigInt total = productListStatusBloc.state.maybeWhen(
          present: (_, BuiltList<SaleProduct> selectedProducts, __) =>
              getSaleTotals(saleProducts: selectedProducts),
          orElse: () => BigInt.zero,
        );

        yield state.copyWith(
          paymentMethod: PaymentMethod.cash(
            amountGiven: amountGiven,
            total: total,
            change: amountGiven - total,
          ),
        );
      },
      changeMpesaRefNumber: (String mpesaRefNumber) async* {
        yield state.copyWith(
          paymentMethod: PaymentMethod.mpesa(
            refNumber: mpesaRefNumber,
          ),
        );
      },
      changeCardRefNumber: (String cardRefNumber) async* {
        yield state.copyWith(
          paymentMethod: PaymentMethod.card(
            refNumber: cardRefNumber,
          ),
        );
      },
      changeCreditCustomerPhone: (String customerPhone) async* {
        yield state.copyWith(
          paymentMethod: PaymentMethod.credit(
            customerPhone: customerPhone,
          ),
          customer: state.customer.copyWith(phone: customerPhone),
        );
      },
      changeCustomerPhone: (String customerPhone) async* {
        yield state.copyWith(
          customer: state.customer.copyWith(
            phone: customerPhone,
          ),
        );
      },
      submit: () async* {
        /**
        *  SENDS THE CURRENT STATE TO BUSINESS PERSON STATUS BLOC FOR SUBMISSION
        */
        businessPersonStatusBloc.add(
          BusinessPersonStatusEvent.submitPayment(
            paymentMethod: state.paymentMethod,
            customer: state.customer,
          ),
        );

        /**
         * RESETS THE STATE
         */
        yield PaymentInputState(
          customer: Customer(),
          paymentMethod: PaymentMethod.cash(),
        );
      },
    );
  }
}
