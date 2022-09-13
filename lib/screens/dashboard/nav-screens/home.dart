// ignore_for_file: unnecessary_new, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slms/models/transactions/transactions.dart';
import 'package:slms/screens/dashboard/actions/accounts.dart';
import 'package:slms/screens/dashboard/actions/chats.dart';
import 'package:slms/screens/dashboard/actions/notifications.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transaction> transaction = [];
  final String baseUrl = "http://127.0.0.1:8000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetcheData();
        },
        child: const Icon(Icons.cloud_download),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Text(
            'HIFADHI',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: const Color.fromARGB(255, 1, 1, 63),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UserAccount(),
                  ),
                );
              },
              icon: const Icon(
                Icons.person,
                size: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Chats(),
                ));
              },
              icon: const Icon(
                Icons.chat,
                size: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Notifications(),
                ));
              },
              icon: const Icon(
                Icons.notifications,
                size: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Amount',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          '5000',
                          style: TextStyle(fontSize: 50, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Transactions',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w200,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ...transaction.map(
                            (transact) => Card(
                              child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 252, 213, 108),
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Color.fromARGB(255, 10, 95, 13),
                                  ),
                                ),
                                title: Text(transact.amount),
                                subtitle: Text(transact.source),
                                trailing: const Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                          const Card(
                            //color: Colors.blueGrey,
                            elevation: 3,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 252, 213, 108),
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Color.fromARGB(255, 10, 95, 13),
                                ),
                              ),
                              title: Text('5000'),
                              subtitle: Text('via: 0750751332'),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          const Card(
                            //color: Colors.blueGrey,
                            elevation: 3,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 252, 213, 108),
                                child: Icon(
                                  Icons.add,
                                  color: Color.fromARGB(255, 10, 30, 95),
                                ),
                              ),
                              title: Text('50000'),
                              subtitle: Text('Loan credited'),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          const Card(
                            //color: Colors.blueGrey,
                            elevation: 3,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 252, 213, 108),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Color.fromARGB(255, 250, 30, 30),
                                ),
                              ),
                              title: Text('50000'),
                              subtitle: Text('Loan withdrawal'),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  fetcheData() async {
    final Dio dio = new Dio();

    try {
      var res = await dio.get("$baseUrl/alldeposits");
      print(res.statusCode);
      print(res.data);
      var resData = res.data as List;

      setState(() {
        transaction = resData.map((e) => Transaction.fromJson(e)).toList();
      });
    } on DioError catch (e) {
      print(e);
    }
  }
}
