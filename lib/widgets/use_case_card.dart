import 'package:flutter/material.dart';
import '../models/content.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class UseCaseCard extends StatelessWidget {
  final UseCase useCase;

  const UseCaseCard({
    Key? key,
    required this.useCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: AppColors.gradientBlue,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            useCase.icon,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            useCase.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            useCase.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
