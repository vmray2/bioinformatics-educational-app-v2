import 'dart:convert';

import 'package:binf_educational_app_redone/data/local/collections/molecule_collection.dart';
import 'package:flutter/services.dart';
import 'package:isar_community/isar.dart';

class DatabaseSeeder {
  static Future<void> seedMoleculesIfEmpty(Isar isar) async {
    final count = await isar.moleculeCollections.count();

    //Only use this if there are new changes to the molecule data
    /* await isar.writeTxn(() async {
      await isar.clear();
    }); */
    
    // Seed if the database collection is empty
    if (count == 0) {
      final jsonString = await rootBundle.loadString('assets/data/molecules.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);

      final molecules = jsonList
          .map((json) => MoleculeCollection.fromJson(json as Map<String, dynamic>))
          .toList();

      await isar.writeTxn(() async {
        await isar.moleculeCollections.putAll(molecules);
      });
    }
  }
}