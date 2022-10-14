import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../model/model.dart';

class ModelDatabase {
  String dbName;
  ModelDatabase(this.dbName);

  Future<Database> openDatabase() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDir.path, dbName);

    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> insertData(Model insModel) async {
    // ignore: unnecessary_this
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Expense");

    //javascript object notation
    var keyid = store.add(db, {
      "Name": insModel.name,
      "location": insModel.location,
      "review": insModel.review,
    });
    db.close();
    return keyid;
  }

  Future<List<Model>> loadData() async {
    // ignore: unnecessary_this
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("Expense");
    var snapshot = await store.find(db);
    List<Model> modelList = [];
    for (var record in snapshot) {
      int id = record.key;
      String name = record["Name"].toString();
      String location = record["location"].toString();
      String review = record["review"].toString();

      modelList.add(Model(name, location, review));
    }
    return modelList;
  }

  Future updateData(Model statement) async {
    //create db client obj
    var db = await openDatabase();

    //create store
    var store = intMapStoreFactory.store("Expense");

    //filter from 'title' and 'date'

    var updateResult = await store.update(db, statement.toMap());
    print("Update data with id $updateResult");
    db.close();
  }

  Future deleteData(Model statement) async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("Expense");
    final finder = Finder(
        filter: Filter.and(<Filter>[
      Filter.equals("Name", statement.name),
      Filter.equals("location", statement.location),
    ]));
    var deleteResult = await store.delete(db, finder: finder);
    print("Delete data with id $deleteResult");
    db.close();
  }
}
