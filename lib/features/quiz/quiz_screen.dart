import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/app_models.dart';
import 'package:mobile_app/core/state/app_state.dart';
import 'package:mobile_app/core/theme/app_theme.dart';
import 'package:mobile_app/core/theme/app_tokens.dart';
import 'package:mobile_app/core/widgets/app_components.dart';
import 'package:mobile_app/features/quiz/quiz_result_screen.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.topic});

  final Topic topic;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _index = 0;
  final Map<String, int> _answers = <String, int>{};

  @override
  Widget build(BuildContext context) {
    final questions = widget.topic.quizQuestions;
    final current = questions[_index];
    final selected = _answers[current.id];
    final progress = (_index + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(title: Text('${widget.topic.title} Quiz')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${_index + 1} of ${questions.length}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              LinearProgressIndicator(
                value: progress,
                borderRadius: AppRadii.pill,
              ),
              const SizedBox(height: AppSpacing.lg),
              SoftSurfaceCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      current.prompt,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    ...current.options.asMap().entries.map((entry) {
                      final optionIndex = entry.key;
                      final optionText = entry.value;
                      final isSelected = selected == optionIndex;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: InkWell(
                          borderRadius: AppRadii.md,
                          onTap: () {
                            setState(() {
                              _answers[current.id] = optionIndex;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFFFEEBC)
                                  : Colors.white,
                              borderRadius: AppRadii.md,
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primaryStrong
                                    : const Color(0xFFE9E2D2),
                              ),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: isSelected
                                      ? AppColors.primaryStrong
                                      : const Color(0xFFE7DECD),
                                  child: Text(
                                    String.fromCharCode(65 + optionIndex),
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: isSelected
                                              ? Colors.white
                                              : AppColors.ink,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: Text(
                                    optionText,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const Spacer(),
              AppPrimaryButton(
                label: _index == questions.length - 1 ? 'Submit Quiz' : 'Next',
                icon: _index == questions.length - 1
                    ? Icons.check_rounded
                    : Icons.arrow_forward_rounded,
                enabled: selected != null,
                onPressed: () {
                  if (_index < questions.length - 1) {
                    setState(() => _index += 1);
                    return;
                  }

                  final outcome = context.read<AppState>().submitQuiz(
                    topic: widget.topic,
                    answers: _answers,
                  );

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (_) => QuizResultScreen(outcome: outcome),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
