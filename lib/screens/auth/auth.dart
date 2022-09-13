import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slms/screens/auth/login.dart';
import 'package:slms/screens/mpango/mpango_dashboard.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        //fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/li.png'),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome!',
                          style: GoogleFonts.ubuntu(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Please join a SACCO to start with us, or login to existing account.',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                ),
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                      // child: Text(
                                      //   'Login',
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //   ),
                                      //),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: SizedBox(
                            //     width: double.infinity,
                            //     child: ElevatedButton(
                            //       onPressed: () {
                            //         Navigator.of(context).push(
                            //           MaterialPageRoute(
                            //             builder: (context) =>
                            //                 const MpangoDashboard(),
                            //           ),
                            //         );
                            //       },
                            //       child: const Padding(
                            //         padding: EdgeInsets.all(15.0),
                            //         child: Text(
                            //           'Sign Up',
                            //           style: TextStyle(
                            //             color: Colors.white,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
