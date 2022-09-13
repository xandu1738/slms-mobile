// import 'dart:io';

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:async';

// class Loans {
//   final String guarantor;
//   final double amount;
//   final String reason;
//   final String collateral;
  
//   const Loans({
//     required this.guarantor, 
//     required this.amount, 
//     required this.reason, 
//     required this.collateral, 
//   });

//   factory Loans.fromMap(Map<String, dynamic> json) => Loans(
//     guarantor: json['guarantor'], 
//     amount: json['amount'], 
//     reason: json['reason'], 
//     collateral: json['collateral']);

//   Map<String, dynamic> toMap() {
//     return {
//       'guarantor': guarantor,
//       'amount': amount,
//       'reason': reason,
//       'collateral': collateral,
//     };
//   }

//   @override
//   String toString() {
//     return 'Loans{guarantor: $guarantor, amount: $amount, reason: $reason,collateral: $collateral,}';
//   }
// }

// class DatabaseHelper{
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? slms;
//   Future<Database?> get database async {
//     if(slms!= null){
//       return slms;
//     }return await _initDatabase();
//   }
  
//   Future<Database> _initDatabase() async{
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path =  join(await getDatabasesPath(), 'slms_database.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//       );
//   }

//   Future _onCreate(Database db, int version) async{
//     await db.execute('''
//     CREATE TABLE loans(
//       id INTEGER PRIMARY KEY AUTOINCREMENT, 
//       gurantor TEXT, 
//       amount TEXT, 
//       reason TEXT, 
//       collateral TEXT),
//       '''
//     );
//   }

//   Future<List> getLoans() async{
//     Database? db = await instance.database;
//     var loans = await db!.query('loans', orderBy: 'reason',);
//     List loansList = loans.isNotEmpty?
//     loans.map((e) => Loans.fromMap(e)).toList()
//     : [];
//     return loansList;
//   }
// }