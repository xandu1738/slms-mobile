import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_tff.dart';

class Repay extends StatefulWidget {
  const Repay({Key? key}) : super(key: key);

  @override
  State<Repay> createState() => _RepayState();
}

class _RepayState extends State<Repay> {
  final formKey = GlobalKey<FormState>();

  final amountController = TextEditingController();

  final sourceController = TextEditingController();

  String drop = 'choose';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Emergency", child: Text("Emergency")),
      const DropdownMenuItem(value: "Personal", child: Text("Personal")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomNff(
                  controller: amountController,
                  text: 'Amount',
                  alertMessage: 'Loan Amount',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomNff(
                  controller: sourceController,
                  text: 'source',
                  alertMessage: 'Please Enter Source Account',
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  text: 'Apply',
                  onClicked: () async {
                    // var uno = Loans(
                    //   guarantor: guarantorController.text,
                    //   amount: double.parse(amountController.text),
                    //   reason: reasonController.text,
                    //   collateral: collateralController.text,
                    // );
                    //await insertLoan(uno);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
