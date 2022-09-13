import 'dart:async';

import 'package:mysql1/mysql1.dart';

Future main() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(
    ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      db: 'slmns',
      password: '',
    ),
  );

  await conn.close();
}
