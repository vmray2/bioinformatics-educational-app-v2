import 'dart:convert';
import 'package:binf_educational_app_redone/domain/models/competency_badge.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final badgesProvider = FutureProvider<List<CompetencyBadge>>((ref) async {
  final String jsonString = await rootBundle.loadString('assets/data/badges.json');
  
  final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
  
  return jsonList.map((item) => CompetencyBadge.fromJson(item as Map<String, dynamic>)).toList();
});