
import 'dart:convert';

import 'package:binf_educational_app_redone/domain/models/quiz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizzesProvider = FutureProvider<List<Quiz>>((ref) async {
  final String jsonString = await rootBundle.loadString('assets/data/quizzes.json');
  
  final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
  
  return jsonList.map((item) => Quiz.fromJson(item as Map<String, dynamic>)).toList();
});

final quizByIdProvider = Provider.family<AsyncValue<Quiz>, String>((ref, id) {
  final quizzesAsync = ref.watch(quizzesProvider);

  return quizzesAsync.whenData(
    (quizzes) => quizzes.firstWhere(
      (m) => m.quizId == id,
      orElse: () => throw Exception('Quiz ID $id not found'),
    ),
  );
});