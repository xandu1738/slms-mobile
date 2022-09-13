// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slms/screens/dashboard/nav-screens/home.dart';
import 'package:slms/widgets/button_widget.dart';
import 'package:slms/widgets/custom_tff.dart';
import 'package:http/http.dart' as http;

class Savings extends StatefulWidget {
  const Savings({Key? key}) : super(key: key);

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  final savingsController = TextEditingController();
  final sourceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool isLoading = false;

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
                      onClicked: () => deposit(),
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

  deposit() {
    save(savingsController.text, sourceController.text,
        DateTime.now().toString());
    setState(() {
      isLoading = false;
    });
  }

  save(amount, source, created_at) async {
    setState(() {
      // isLoading = true;
    });
    print("Calling");

    Map data = {'amount': amount, 'source': source, 'created_at': created_at};
    print(data.toString());
    final response = await http.post(
        Uri.parse("https://hifadhi.000webhost.com/api/upload.php"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: data,
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200) {
      setState(() {
        // isLoading = false;
      });
      Map<String, dynamic> resposne = jsonDecode(response.body);
      if (!resposne['error']) {
        Map<String, dynamic> transaction = resposne['data'];
        print(" Saved ${transaction['data']}");
        savePref(1, transaction['amount'], transaction['source'],
            transaction['created_at']);
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else {
        print(" ${resposne['message']}");
      }
      // _scaffoldKey.currentState
      //     // ignore: deprecated_member_use
      //     ?.showSnackBar(SnackBar(content: Text("${resposne['message']}")));
    } else {
      // _scaffoldKey.currentState
      //     // ignore: deprecated_member_use
      //     ?.showSnackBar(const SnackBar(content: Text("Please Try again")));
    }
  }

  savePref(int value, String amount, String source, String created_at) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setInt("value", value);
    preferences.setString("amount", amount);
    preferences.setString("source", source);
    preferences.setString("created_at", created_at);
    // ignore: deprecated_member_use
    preferences.commit();
  }
}
