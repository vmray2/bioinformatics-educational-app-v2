import 'dart:convert';
import 'package:binf_educational_app_redone/domain/models/competency.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final competenciesProvider = FutureProvider<List<Competency>>((ref) async {
  final String jsonString = await rootBundle.loadString('assets/data/competencies.json');
  
  final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
  
  return jsonList.map((item) => Competency.fromJson(item as Map<String, dynamic>)).toList();
});