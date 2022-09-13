import 'package:flutter/material.dart';
import 'package:slms/widgets/button_widget.dart';
import 'package:slms/widgets/custom_tff.dart';

class Savings extends StatefulWidget {
  const Savings({Key? key}) : super(key: key);

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  final savingsController = TextEditingController();
  final sourceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/li.png'),
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomNff(
                      controller: savingsController,
                      text: 'Amount',
                      alertMessage: 'Please Enter Amount to Deposit',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomPff(
                      controller: sourceController,
                      text: 'Source',
                      alertMessage: 'Source Account Number',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      text: 'Deposit',
                      onClicked: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
