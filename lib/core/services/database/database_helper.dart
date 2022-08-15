import 'package:path/path.dart';
import 'package:shop_app/constant.dart';
import 'package:sqflite/sqflite.dart';
import '../../../model/cart_product_model.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  // ignore: unused_field
  static Database? _database;

  Future<Database?> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    // ignore: unused_local_variable
    String path = join(await getDatabasesPath(), 'CartProduct.db');

    return await openDatabase(
      path,
      version: 8,
      onCreate: (Database db, int version) async {
        await db.execute('''
      create table $tableCartProduct (
        $columnName text not null, 
        $columnImage text not null,
        $columnQuantity INTEGER not null,
        $columnId text not null,
        $columnPrice INTEGER not null)
      ''');
      },
    );
  }

  insert(CartProduct model) async {
    var dbClient = await database;
    await dbClient?.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProduct>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCartProduct);
    List<CartProduct> list = maps.isNotEmpty
        ? maps.map((e) => CartProduct.fromJson(e)).toList()
        : [];
    return list;
  }

  update(CartProduct model) async {
    var dbClient = await database;
    return await dbClient?.update(tableCartProduct, model.toJson(),
        where: '$columnId = ?', whereArgs: [model.id]);
  }

  delete(String id) async {
    var dbClient = await database;
    return await dbClient?.delete(tableCartProduct, where: 'id = ?', whereArgs: [id]);
  }
}
