import 'package:flutter/material.dart';
import 'package:slms/widgets/custom_tff.dart';

import '../../../widgets/button_widget.dart';
class LoansApp extends StatefulWidget {
  const LoansApp({Key? key}) : super(key: key);

  @override
  State<LoansApp> createState() => _LoansAppState();
}

class _LoansAppState extends State<LoansApp> {
  final loanController = TextEditingController();
  final collateralController =TextEditingController();
  final guarantorController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomNff(controller: loanController, text: 'Amount', alertMessage: 'Please Enter Amount to Borrow',),
                const SizedBox(height: 10,),
                CustomTff(text: 'Guarantor', alertMessage: 'Please Enter Guarantor', controller: guarantorController),
                const SizedBox(height: 10,),
                CustomTff(text: 'Collateral', alertMessage: 'Please Enter Collateral', controller: collateralController),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(onPressed: (){}, child: const Text('Get Emergency loan'),),
                  ],
                ),
                const SizedBox(height: 10,),
                ButtonWidget(text: 'Borrow', onClicked: (){},),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
    );
  }
}
