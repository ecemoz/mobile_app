import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/features/ai_insights/data/models/ai_quiz_feedback.dart';
import 'package:mobile_app/features/ai_insights/data/models/ai_recommendation.dart';
import 'package:mobile_app/features/ai_insights/data/repositories/ai_insights_repository_impl.dart';
import 'package:mobile_app/features/ai_insights/domain/repositories/ai_insights_repository.dart';

// Dio Provider
final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );
});

// Repository Provider
final aiInsightsRepositoryProvider = Provider<AiInsightsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AiInsightsRepositoryImpl(dio, useMockFallback: true);
});

// Recommendation Provider
final aiRecommendationProvider = FutureProvider.family<AiRecommendation, String>((ref, userId) async {
  final repository = ref.watch(aiInsightsRepositoryProvider);
  return repository.getRecommendation(userId: userId);
});

// Quiz Feedback Parameters Data Class
class QuizFeedbackParams {
  final String quizId;
  final Map<String, int> answers;

  const QuizFeedbackParams({
    required this.quizId,
    required this.answers,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuizFeedbackParams &&
      other.quizId == quizId &&
      _mapEquals(other.answers, answers);
  }

  @override
  int get hashCode => quizId.hashCode ^ _mapHashCode(answers);

  bool _mapEquals(Map<String, int> a, Map<String, int> b) {
    if (a.length != b.length) return false;
    for (final key in a.keys) {
      if (a[key] != b[key]) return false;
    }
    return true;
  }

  int _mapHashCode(Map<String, int> map) {
    int hash = 0;
    for (final entry in map.entries) {
      hash ^= entry.key.hashCode ^ entry.value.hashCode;
    }
    return hash;
  }
}

// Quiz Feedback Provider
final aiQuizFeedbackProvider = FutureProvider.family<List<AiQuizFeedback>, QuizFeedbackParams>((ref, params) async {
  final repository = ref.watch(aiInsightsRepositoryProvider);
  return repository.getQuizFeedback(
    quizId: params.quizId,
    answers: params.answers,
  );
});
