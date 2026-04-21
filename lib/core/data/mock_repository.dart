import 'package:flutter/material.dart';
import 'package:mobile_app/core/models/app_models.dart';

class MockRepository {
  static final List<Topic> topics = [
    Topic(
      id: 'ux-basics',
      title: 'UI/UX Design Basics',
      shortDescription: 'Build intuitive and beautiful user experiences.',
      description:
          'Learn how to approach interface design with empathy, structure, and clarity. This topic helps you understand user behavior and transform insights into practical designs.',
      category: TopicCategory.design,
      order: 1,
      lessons: const [
        Lesson(
          id: 'ux-1',
          title: 'Introduction to UI/UX',
          summary: 'Understand the difference between UI and UX.',
          content:
              'UI is what people see and interact with. UX is how they feel while using the product. Great products combine both. Start by identifying user goals, then map each interface element to a user need.',
          minutes: 5,
          order: 1,
        ),
        Lesson(
          id: 'ux-2',
          title: 'Design Thinking',
          summary: 'A practical framework for solving design problems.',
          content:
              'Design Thinking has five core steps: Empathize, Define, Ideate, Prototype, and Test. Keep each cycle short and involve users as early as possible to avoid building the wrong solution.',
          minutes: 7,
          order: 2,
        ),
        Lesson(
          id: 'ux-3',
          title: 'User Research',
          summary: 'Collect insights through observation and interviews.',
          content:
              'Talk to real users and ask open-ended questions. Focus on tasks, pain points, and context. Summarize findings into patterns and personas that guide design decisions.',
          minutes: 10,
          order: 3,
        ),
      ],
      quizQuestions: const [
        QuizQuestion(
          id: 'ux-q1',
          prompt: 'What is the main goal of user research?',
          options: [
            'Pick trendy colors',
            'Understand user needs and behavior',
            'Increase app animation speed',
            'Reduce development costs only',
          ],
          correctIndex: 1,
          feedback: 'User research reveals real needs and context.',
        ),
        QuizQuestion(
          id: 'ux-q2',
          prompt: 'Which step comes first in Design Thinking?',
          options: ['Prototype', 'Empathize', 'Test', 'Define'],
          correctIndex: 1,
          feedback: 'Empathy is the foundation of user-centered design.',
        ),
        QuizQuestion(
          id: 'ux-q3',
          prompt: 'UX primarily focuses on:',
          options: [
            'Visual assets only',
            'Code performance only',
            'User experience and usability',
            'Marketing channel growth',
          ],
          correctIndex: 2,
          feedback: 'UX is about how users feel and succeed with a product.',
        ),
      ],
    ),
    Topic(
      id: 'web-fundamentals',
      title: 'Web Development',
      shortDescription: 'Core building blocks of modern web apps.',
      description:
          'Cover essential front-end concepts including semantic HTML, reusable CSS patterns, and JavaScript fundamentals for interactive experiences.',
      category: TopicCategory.development,
      order: 2,
      lessons: const [
        Lesson(
          id: 'web-1',
          title: 'HTML Essentials',
          summary: 'Structure content with semantic elements.',
          content:
              'Use semantic tags like header, main, section, and article. This improves accessibility, readability, and SEO. Organize content hierarchy before styling.',
          minutes: 8,
          order: 1,
        ),
        Lesson(
          id: 'web-2',
          title: 'CSS Layout Patterns',
          summary: 'Master flexbox and grid for responsive layouts.',
          content:
              'Use flexbox for one-dimensional alignment and grid for two-dimensional page structure. Build mobile-first and scale up through breakpoints.',
          minutes: 9,
          order: 2,
        ),
        Lesson(
          id: 'web-3',
          title: 'JavaScript Basics',
          summary: 'Add behavior and interactivity.',
          content:
              'Start with variables, functions, and control flow. Then connect logic to DOM events. Keep code modular and descriptive for maintainability.',
          minutes: 11,
          order: 3,
        ),
      ],
      quizQuestions: const [
        QuizQuestion(
          id: 'web-q1',
          prompt: 'What is flexbox best for?',
          options: [
            'Database schema design',
            'One-dimensional layouts',
            'Image compression',
            'Version control',
          ],
          correctIndex: 1,
          feedback: 'Flexbox excels at horizontal or vertical alignment.',
        ),
        QuizQuestion(
          id: 'web-q2',
          prompt: 'Semantic HTML helps with:',
          options: [
            'Accessibility and clarity',
            'Only visual styling',
            'Only performance',
            'Only analytics',
          ],
          correctIndex: 0,
          feedback:
              'Semantic structure improves multiple dimensions of quality.',
        ),
      ],
    ),
    Topic(
      id: 'digital-marketing',
      title: 'Digital Marketing',
      shortDescription: 'Grow audience and engagement through strategy.',
      description:
          'Understand core channels and campaign planning fundamentals. Learn to evaluate performance using clear goals and measurable metrics.',
      category: TopicCategory.business,
      order: 3,
      lessons: const [
        Lesson(
          id: 'mkt-1',
          title: 'Marketing Foundations',
          summary: 'Understand target audience and value proposition.',
          content:
              'Define your audience and core message first. Select channels based on behavior, not trends. Keep your strategy focused and measurable.',
          minutes: 7,
          order: 1,
        ),
        Lesson(
          id: 'mkt-2',
          title: 'Content Strategy',
          summary: 'Plan useful content for each stage of the funnel.',
          content:
              'Map content to awareness, consideration, and conversion. Reuse strong ideas in different formats to keep consistency and save effort.',
          minutes: 8,
          order: 2,
        ),
      ],
      quizQuestions: const [
        QuizQuestion(
          id: 'mkt-q1',
          prompt: 'A value proposition should answer:',
          options: [
            'What makes your offer useful',
            'What logo font to use',
            'How many ads to buy',
            'How to avoid user feedback',
          ],
          correctIndex: 0,
          feedback: 'Value proposition explains why users should care.',
        ),
      ],
    ),
    Topic(
      id: 'data-science',
      title: 'Data Science Basics',
      shortDescription:
          'Explore data, detect patterns, and communicate findings.',
      description:
          'Learn the mindset and methods behind practical data work: cleaning, exploring, modeling, and storytelling with data.',
      category: TopicCategory.data,
      order: 4,
      lessons: const [
        Lesson(
          id: 'data-1',
          title: 'Data Types and Sources',
          summary: 'Understand where data comes from and what it means.',
          content:
              'Different data types require different handling strategies. Establish clear definitions and source reliability before analysis.',
          minutes: 8,
          order: 1,
        ),
        Lesson(
          id: 'data-2',
          title: 'Exploratory Analysis',
          summary: 'Find trends, outliers, and opportunities.',
          content:
              'Start with summaries and visualizations. Ask simple questions first, then drill down. Validate assumptions before drawing conclusions.',
          minutes: 10,
          order: 2,
        ),
      ],
      quizQuestions: const [
        QuizQuestion(
          id: 'data-q1',
          prompt: 'Why is exploratory analysis important?',
          options: [
            'It replaces all modeling',
            'It helps uncover patterns and issues early',
            'It is only for dashboards',
            'It removes the need for clean data',
          ],
          correctIndex: 1,
          feedback:
              'Exploration reveals shape and quality before deep analysis.',
        ),
      ],
    ),
  ];

  static const List<AchievementDefinition> achievementDefinitions = [
    AchievementDefinition(
      id: 'first_lesson',
      title: 'First Step',
      description: 'Complete your first lesson.',
      unlockHint: 'Finish any lesson',
      icon: Icons.flag_rounded,
    ),
    AchievementDefinition(
      id: 'topic_finisher',
      title: 'Topic Finisher',
      description: 'Finish all lessons in one topic.',
      unlockHint: 'Complete a full topic',
      icon: Icons.check_circle_rounded,
    ),
    AchievementDefinition(
      id: 'first_quiz',
      title: 'Quiz Rookie',
      description: 'Submit your first quiz.',
      unlockHint: 'Take any quiz',
      icon: Icons.quiz_rounded,
    ),
    AchievementDefinition(
      id: 'perfect_score',
      title: 'Perfect Score',
      description: 'Score 100% in a quiz.',
      unlockHint: 'Answer every question correctly',
      icon: Icons.workspace_premium_rounded,
    ),
    AchievementDefinition(
      id: 'consistent_learner',
      title: 'Consistent Learner',
      description: 'Complete three full topics.',
      unlockHint: 'Keep your streak alive',
      icon: Icons.local_fire_department_rounded,
    ),
    AchievementDefinition(
      id: 'badge_collector',
      title: 'Badge Collector',
      description: 'Unlock four achievements.',
      unlockHint: 'Collect badges across the app',
      icon: Icons.military_tech_rounded,
    ),
  ];
}
