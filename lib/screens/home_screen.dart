import 'package:flutter/material.dart';
import '../models/content.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/navbar_widget.dart';
import '../widgets/hero_widget.dart';
import '../widgets/section_title.dart';
import '../widgets/problem_card.dart';
import '../widgets/feature_card.dart';
import '../widgets/use_case_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NavbarWidget(),
              const HeroWidget(),
              _buildSection(
                context,
                title: AppStrings.problemTitle,
                child: Column(
                  children: [
                    const SizedBox(height: AppSpacing.xl),
                    GridView.count(
                      crossAxisCount: isMobile ? 1 : 3,
                      mainAxisSpacing: AppSpacing.lg,
                      crossAxisSpacing: AppSpacing.lg,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ProblemCard(
                          problem: Problem(
                            title: AppStrings.problem1,
                            description: AppStrings.problem1Desc,
                          ),
                          icon: '🛡️',
                        ),
                        ProblemCard(
                          problem: Problem(
                            title: AppStrings.problem2,
                            description: AppStrings.problem2Desc,
                          ),
                          icon: '⚖️',
                        ),
                        ProblemCard(
                          problem: Problem(
                            title: AppStrings.problem3,
                            description: AppStrings.problem3Desc,
                          ),
                          icon: '📋',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _buildSection(
                context,
                title: AppStrings.solutionTitle,
                subtitle: AppStrings.solutionDesc,
                backgroundColor: AppColors.lightGray,
              ),
              _buildSection(
                context,
                title: AppStrings.howItWorksTitle,
                child: Column(
                  children: [
                    const SizedBox(height: AppSpacing.xl),
                    GridView.count(
                      crossAxisCount: isMobile ? 1 : 2,
                      mainAxisSpacing: AppSpacing.lg,
                      crossAxisSpacing: AppSpacing.lg,
                      childAspectRatio: isMobile ? 1 : 1.2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildStepCard(context, 1, AppStrings.step1Title, AppStrings.step1Desc),
                        _buildStepCard(context, 2, AppStrings.step2Title, AppStrings.step2Desc),
                        _buildStepCard(context, 3, AppStrings.step3Title, AppStrings.step3Desc),
                        _buildStepCard(context, 4, AppStrings.step4Title, AppStrings.step4Desc),
                      ],
                    ),
                  ],
                ),
              ),
              _buildSection(
                context,
                title: AppStrings.featuresTitle,
                backgroundColor: AppColors.lightGray,
                child: Column(
                  children: [
                    const SizedBox(height: AppSpacing.xl),
                    GridView.count(
                      crossAxisCount: isMobile ? 1 : 2,
                      mainAxisSpacing: AppSpacing.lg,
                      crossAxisSpacing: AppSpacing.lg,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        FeatureCard(
                          feature: Feature(
                            title: AppStrings.feature1,
                            description: AppStrings.feature1Desc,
                            icon: '🔐',
                          ),
                        ),
                        FeatureCard(
                          feature: Feature(
                            title: AppStrings.feature2,
                            description: AppStrings.feature2Desc,
                            icon: '🔍',
                          ),
                        ),
                        FeatureCard(
                          feature: Feature(
                            title: AppStrings.feature3,
                            description: AppStrings.feature3Desc,
                            icon: '⚡',
                          ),
                        ),
                        FeatureCard(
                          feature: Feature(
                            title: AppStrings.feature4,
                            description: AppStrings.feature4Desc,
                            icon: '✓',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _buildSection(
                context,
                title: AppStrings.useCasesTitle,
                child: Column(
                  children: [
                    const SizedBox(height: AppSpacing.xl),
                    GridView.count(
                      crossAxisCount: isMobile ? 1 : 2,
                      mainAxisSpacing: AppSpacing.lg,
                      crossAxisSpacing: AppSpacing.lg,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        UseCaseCard(
                          useCase: UseCase(
                            title: AppStrings.useCase1,
                            description: AppStrings.useCase1Desc,
                            icon: '💼',
                          ),
                        ),
                        UseCaseCard(
                          useCase: UseCase(
                            title: AppStrings.useCase2,
                            description: AppStrings.useCase2Desc,
                            icon: '☁️',
                          ),
                        ),
                        UseCaseCard(
                          useCase: UseCase(
                            title: AppStrings.useCase3,
                            description: AppStrings.useCase3Desc,
                            icon: '👔',
                          ),
                        ),
                        UseCaseCard(
                          useCase: UseCase(
                            title: AppStrings.useCase4,
                            description: AppStrings.useCase4Desc,
                            icon: '🛒',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _buildSection(
                context,
                title: AppStrings.trustTitle,
                backgroundColor: AppColors.lightGray,
                child: Column(
                  children: [
                    const SizedBox(height: AppSpacing.xl),
                    GridView.count(
                      crossAxisCount: isMobile ? 1 : 3,
                      mainAxisSpacing: AppSpacing.lg,
                      crossAxisSpacing: AppSpacing.lg,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildTrustCard(context, '🏢', AppStrings.trust1, AppStrings.trust1Desc),
                        _buildTrustCard(context, '✅', AppStrings.trust2, AppStrings.trust2Desc),
                        _buildTrustCard(context, '🔒', AppStrings.trust3, AppStrings.trust3Desc),
                      ],
                    ),
                  ],
                ),
              ),
              _buildSection(
                context,
                backgroundColor: AppColors.lightGray,
                child: Column(
                  children: [
                    SectionTitle(
                      title: AppStrings.ctaTitle,
                      subtitle: AppStrings.ctaDesc,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: AppStrings.emailCapture,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppRadius.md),
                                borderSide: const BorderSide(color: AppColors.divider),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.md,
                                vertical: AppSpacing.md,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () {},
                              child: const Text(AppStrings.ctaButton),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    String? title,
    String? subtitle,
    Widget? child,
    Color backgroundColor = Colors.white,
  }) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.xl,
        horizontal: AppSpacing.md,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              if (title != null)
                SectionTitle(
                  title: title,
                  subtitle: subtitle,
                ),
              if (child != null) child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(BuildContext context, int number, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: AppColors.gradientBlue,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textLight,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrustCard(BuildContext context, String icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.divider),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textLight,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.textDark,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Text(
            '© 2026 Holsera. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Privacy',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              const Text('•', style: TextStyle(color: Colors.white70)),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Terms',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              const Text('•', style: TextStyle(color: Colors.white70)),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Policy',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
