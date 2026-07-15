import 'dart:convert';
import 'package:binf_educational_app_redone/domain/models/curriculum.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final curriculumProvider = FutureProvider<Curriculum>((ref) async {
  final String jsonString = await rootBundle.loadString('assets/data/curriculum.json');
  
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  
  return Curriculum.fromJson(jsonMap);
});