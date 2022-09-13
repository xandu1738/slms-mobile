import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_tff.dart';

class LoanApplication extends StatefulWidget {
  const LoanApplication({Key? key}) : super(key: key);

  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  final formKey = GlobalKey<FormState>();
  final guarantorController = TextEditingController();
  final amountController = TextEditingController();
  final reasonController = TextEditingController();
  final collateralController = TextEditingController();

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
                Text(
                  'Max Limit: 8000',
                  style: GoogleFonts.tienne(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTff(
                  controller: guarantorController,
                  text: 'Guarantor',
                  alertMessage: 'Please Tag Guarantor',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomNff(
                  controller: amountController,
                  text: 'Amount',
                  alertMessage: 'Loan Amount',
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    labelText: 'Select Reason',
                    fillColor: Colors.grey,
                  ),
                  items: dropdownItems,
                  onChanged: (String? value) {
                    setState(
                      () {
                        drop = value!;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTff(
                  controller: collateralController,
                  text: 'Collateral',
                  alertMessage: 'Please Enter Collateral',
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
