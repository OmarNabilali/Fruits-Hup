import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits/core/cubits/orders_cubti/orders_cubit.dart';
import 'package:fruits/core/utils/functions/show_snack_bar_widget.dart';
import 'package:fruits/core/utils/widgets/custom_button.dart';
import 'package:fruits/features/check_out/domain/entitis/order_entity.dart';
import 'package:fruits/features/check_out/domain/entitis/paypal_payment/paypal_payment.dart';
import 'package:fruits/features/check_out/presentation/views/order_tracking_view.dart';
import 'package:fruits/features/check_out/presentation/views/widgets/custom_check_out_address.dart';
import 'package:fruits/features/check_out/presentation/views/widgets/custom_page_view_check_out.dart';

class CustomCheckOutViewBody extends StatefulWidget {
  const CustomCheckOutViewBody({super.key});
  @override
  State<CustomCheckOutViewBody> createState() => _CustomCheckOutViewBodyState();
}

class _CustomCheckOutViewBodyState extends State<CustomCheckOutViewBody> {
  int selectIndex = 0;
  late PageController controller;
  int currentPage = 0;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    valueNotifier.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(getSteps().length, (index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    controller.jumpToPage(currentPage = index);
                  } else if (index == 1) {
                    if (orderEntity.isPaymentCashed != null) {
                      controller.jumpToPage(currentPage = index);
                    } else {
                      showSnackBarWidget(context, 'يرجي تحديد طريقه الدفع');
                    }
                  } else {
                    _handleAddressShipping();
                  }
                  if (orderEntity.isPaymentCashed != null) {
                  } else {
                    showSnackBarWidget(context, 'يرجي تحديد طريقه الدفع');
                  }
                },
                child: IsSelectedSteps(
                  isSelected: currentPage >= index,
                  index: index + 1,
                  text: getSteps()[index],
                ),
              );
            }),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: CustomPageViewCheckOut(
              valueListenable: valueNotifier,
              formKey: formKey,
              controller: controller,
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
            ),
          ),

          CustomButton(
            buttonName: currentPage == 2 ? ' Paypal' : 'التالي',
            onPressed: () async {
              if (currentPage == 0) {
                _handleShipping(orderEntity, context);
              } else if (currentPage == 1) {
                _handleAddressShipping();
              } else {
                await BlocProvider.of<OrdersCubit>(
                  context,
                ).addOrders(orderEntity: orderEntity);
                if (!mounted) return;
                Navigator.pop(context);
                if (!mounted) return;

                showSnackBarWidget(context, 'تمت العمليه بنجاح');
                // PayWithPaybal();
              }
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  void _handleAddressShipping() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      controller.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _handleShipping(OrderEntity checkOutEntity, BuildContext context) {
    if (checkOutEntity.isPaymentCashed != null) {
      controller.animateToPage(
        currentPage + 1,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeIn,
      );
    } else {
      showSnackBarWidget(context, 'يرجي تحديد طريقه الدفع');
    }
  }

  void PayWithPaybal() {
    try {
      var orderEntity = context.read<OrderEntity>();

      print("subtotal: ${orderEntity.calculateSubTotal()}");
      PaypalPaymentEntity paymentEntity = PaypalPaymentEntity.fromEntity(
        orderEntity,
      );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId:
                "AeKd-XWJbFIbPcMUi-URA3SMtgDDVoXsq1jbKx1IzRSBPP3DYlLdjycHR-qsu_ICX0aP7B0v_FaPna6a",
            secretKey:
                "EGIod9Yvj6cefU0S18bEd0eEP1lsDDDrzZrudDQxkQQmxp0sG7IlXY4htv8E661ga-LygQrrfCP-enJf",
            transactions: [paymentEntity.toJson()],

            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              print("onSuccess: $params");
            },
            onError: (error) {
              if (!mounted) return;
              Navigator.pop(context);
              log('error $error');
            },
            onCancel: () {
              print('cancelled:');
            },
          ),
        ),
      );

      log(paymentEntity.toJson().toString());
    } catch (e) {
      log('Error : ${e.toString()}');
    }
  }
}

List getSteps() {
  return ['الشحن', 'العنوان', 'الدفع'];
}
