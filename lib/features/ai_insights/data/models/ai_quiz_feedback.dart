class AiQuizFeedback {
  final String questionId;
  final String questionText;
  final String selectedAnswer;
  final String correctAnswer;
  final bool isCorrect;
  final String explanation;
  final List<String> conceptTags;
  final String? improvementTip;

  const AiQuizFeedback({
    required this.questionId,
    required this.questionText,
    required this.selectedAnswer,
    required this.correctAnswer,
    required this.isCorrect,
    required this.explanation,
    required this.conceptTags,
    this.improvementTip,
  });

  factory AiQuizFeedback.fromJson(Map<String, dynamic> json) {
    return AiQuizFeedback(
      questionId: json['questionId'] as String,
      questionText: json['questionText'] as String,
      selectedAnswer: json['selectedAnswer'] as String,
      correctAnswer: json['correctAnswer'] as String,
      isCorrect: json['isCorrect'] as bool,
      explanation: json['explanation'] as String,
      conceptTags: List<String>.from(json['conceptTags'] as List),
      improvementTip: json['improvementTip'] as String?,
    );
  }
}
