class AiRecommendation {
  final String title;
  final String reason;
  final String difficulty;
  final int estimatedLessonCount;
  final double confidenceScore;
  final String ctaLabel;

  const AiRecommendation({
    required this.title,
    required this.reason,
    required this.difficulty,
    required this.estimatedLessonCount,
    required this.confidenceScore,
    required this.ctaLabel,
  });

  factory AiRecommendation.fromJson(Map<String, dynamic> json) {
    return AiRecommendation(
      title: json['title'] as String,
      reason: json['reason'] as String,
      difficulty: json['difficulty'] as String,
      estimatedLessonCount: json['estimatedLessonCount'] as int,
      confidenceScore: (json['confidenceScore'] as num).toDouble(),
      ctaLabel: json['ctaLabel'] as String,
    );
  }
}
