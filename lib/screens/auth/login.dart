import 'package:flutter/material.dart';
import 'package:slms/screens/dashboard/dashboard.dart';
import 'package:slms/screens/mchango/mchango_dashboard.dart';
import 'package:slms/screens/mpango/mpango_dashboard.dart';
import 'package:slms/widgets/custom_tff.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logi.png'),
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
                      text: 'ID',
                      alertMessage: 'Please Enter correct ID',
                      controller: idController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTff(
                      text: 'Password',
                      alertMessage: 'Enter correct password',
                      controller: passwordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (idController.text.contains(
                                new RegExp(r'hif', caseSensitive: false))) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Dashboard(),
                                ),
                              );
                            } else if (idController.text.contains(
                                new RegExp(r'mpa', caseSensitive: false))) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const MpangoDashboard(),
                                ),
                              );
                            } else if (idController.text.contains(
                                new RegExp(r'mch', caseSensitive: false))) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MchangoDashboard(),
                                ),
                              );
                            }
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => const Dashboard(),
                            //   ),
                            // );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'LogIn',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
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
