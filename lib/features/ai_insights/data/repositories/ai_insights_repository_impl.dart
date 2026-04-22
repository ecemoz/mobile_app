import 'package:dio/dio.dart';
import 'package:mobile_app/features/ai_insights/data/models/ai_quiz_feedback.dart';
import 'package:mobile_app/features/ai_insights/data/models/ai_recommendation.dart';
import 'package:mobile_app/features/ai_insights/domain/repositories/ai_insights_repository.dart';

class AiInsightsRepositoryImpl implements AiInsightsRepository {
  final Dio _dio;
  final bool _useMockFallback;

  AiInsightsRepositoryImpl(this._dio, {bool useMockFallback = true})
      : _useMockFallback = useMockFallback;

  @override
  Future<AiRecommendation> getRecommendation({required String userId}) async {
    if (_useMockFallback) {
      await Future.delayed(const Duration(seconds: 2)); // Simulate network latency
      return const AiRecommendation(
        title: 'Linux File Permissions',
        reason: 'You recently struggled with chmod commands in the last quiz. This topic will solidify your understanding of read, write, and execute permissions.',
        difficulty: 'Intermediate',
        estimatedLessonCount: 4,
        confidenceScore: 0.92,
        ctaLabel: 'Start Topic',
      );
    }

    try {
      final response = await _dio.get('/api/v1/ai/recommendation/$userId');
      return AiRecommendation.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch AI recommendation: $e');
    }
  }

  @override
  Future<List<AiQuizFeedback>> getQuizFeedback({
    required String quizId,
    required Map<String, int> answers,
  }) async {
    if (_useMockFallback) {
      await Future.delayed(const Duration(seconds: 2)); // Simulate network latency
      return [
        const AiQuizFeedback(
          questionId: 'q1',
          questionText: 'What is the root directory in a Linux file system?',
          selectedAnswer: '/root',
          correctAnswer: '/',
          isCorrect: false,
          explanation: 'The "/" character represents the absolute root of the file system hierarchy. "/root" is actually the home directory for the root user, which is a common misconception.',
          conceptTags: ['File System', 'Root Directory'],
          improvementTip: 'Review the Linux Directory Structure lesson to understand the difference between the root filesystem and the root user\'s home directory.',
        ),
        const AiQuizFeedback(
          questionId: 'q2',
          questionText: 'Which command is used to list files in a directory?',
          selectedAnswer: 'ls',
          correctAnswer: 'ls',
          isCorrect: true,
          explanation: 'Spot on! The "ls" command lists directory contents. You can also use flags like "-l" for long format or "-a" to show hidden files.',
          conceptTags: ['Basic Commands', 'Navigation'],
        ),
      ];
    }

    try {
      final response = await _dio.post(
        '/api/v1/ai/quiz-feedback',
        data: {
          'quizId': quizId,
          'answers': answers,
        },
      );
      final data = response.data as List;
      return data.map((e) => AiQuizFeedback.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to fetch AI quiz feedback: $e');
    }
  }
}
