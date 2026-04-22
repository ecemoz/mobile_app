import 'package:mobile_app/features/ai_insights/data/models/ai_quiz_feedback.dart';
import 'package:mobile_app/features/ai_insights/data/models/ai_recommendation.dart';

abstract class AiInsightsRepository {
  Future<AiRecommendation> getRecommendation({required String userId});
  Future<List<AiQuizFeedback>> getQuizFeedback({
    required String quizId,
    required Map<String, int> answers,
  });
}
