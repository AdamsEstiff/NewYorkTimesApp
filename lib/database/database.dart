// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite_sqlcipher/sqflite.dart';
//
// class DatabaseFlutter extends DbConfiguration {
//   DatabaseFlutter.privateConstructor();
//
//   static final DatabaseFlutter instance = DatabaseFlutter.privateConstructor();
//
//   static Database? _database;
//
//   Future<Database> get database async => _database ??= await initiateDatabase();
//
//   Future<Database> initiateDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, databaseName);
//     //Visualizar consultas en tiempo real
//     // await Sqflite.devSetDebugModeOn(true);
//     return await openDatabase(path,
//         version: _databaseVersion,
//         password: "x1lcq2deNVSsJ9E738WoNTu7KxpAvy9GFc2w46yV",
//         onOpen: _onOpen,
//         onCreate: _onCreate,
//         onUpgrade: _onUpgrade,
//         onConfigure: _onConfigure);
//   }
//
//   Future<void> close() async {
//     if (_database != null) {
//       await _database?.close();
//       _database = null;
//     }
//   }
// }
//
// abstract class DbConfiguration {
//   final databaseName = 'samcentral.sqlite';
//
//   final _databaseVersion = 23;
//
//   bool onUpgradeIsCalled = false;
//
//   _onOpen(Database db) async {
//     if (onUpgradeIsCalled) {
//       await db.execute("VACUUM", null);
//     }
//
//     await db.execute("PRAGMA foreign_keys = ON", null);
//   }
//
//   _onCreate(Database db, int version) async {
//     final batch = db.batch();
//     // aqui la migracion
//     await batch.commit();
//   }
//
//   _onUpgrade(Database db, int oldVersion, int newVersion) async {
//     final batch = db.batch();
//     //aqui la actualizacion
//     onUpgradeIsCalled = true;
//
//     await batch.commit();
//   }
//
//   _onConfigure(Database db) async {
//     await db.execute("PRAGMA foreign_keys = OFF", null);
//   }
// }
