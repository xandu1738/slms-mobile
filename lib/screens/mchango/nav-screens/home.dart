import 'package:flutter/material.dart';
import 'package:slms/screens/mchango/actions/chats.dart';
import 'package:slms/screens/mchango/actions/notifications.dart';
import 'package:slms/screens/mchango/actions/accounts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Text(
            'MCHANGO',
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
                        children: const [
                          Card(
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
                          Card(
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
                          Card(
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
}
