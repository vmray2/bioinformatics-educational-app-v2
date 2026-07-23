import 'dart:convert';
import 'package:binf_educational_app_redone/domain/models/activity.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final activitiesProvider = FutureProvider<List<Activity>>((ref) async {
  final String jsonString = await rootBundle.loadString('assets/data/activities.json');
  
  final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
  
  return jsonList.map((item) => Activity.fromJson(item as Map<String, dynamic>)).toList();
});

final activityByIdProvider = Provider.family<AsyncValue<Activity>, String>((ref, id) {
  final activitiesAsync = ref.watch(activitiesProvider);

  return activitiesAsync.whenData(
    (activities) => activities.firstWhere(
      (m) => m.activityId == id,
      orElse: () => throw Exception('Module ID $id not found'),
    ),
  );
});