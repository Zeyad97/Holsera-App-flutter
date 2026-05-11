import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/navbar_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: Column(
        children: [
          const NavbarWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Consumer<AuthService>(
                      builder: (context, authService, _) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                gradient: AppColors.gradientBlue,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xl),
                            
                            Text(
                              AppStrings.welcomeDashboard,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.lg),

                            Container(
                              padding: const EdgeInsets.all(AppSpacing.lg),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(AppRadius.lg),
                                border: Border.all(color: AppColors.divider),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.userAccount,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.lg),
                                  
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppStrings.yourEmail,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: AppColors.textLight,
                                        ),
                                      ),
                                      Text(
                                        authService.userEmail ?? 'N/A',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSpacing.md),
                                  const Divider(color: AppColors.divider),
                                  const SizedBox(height: AppSpacing.md),
                                  
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Status',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: AppColors.textLight,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: AppSpacing.md,
                                          vertical: AppSpacing.sm,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.success.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(AppRadius.sm),
                                          border: Border.all(color: AppColors.success),
                                        ),
                                        child: Text(
                                          'Verified',
                                          style: TextStyle(
                                            color: AppColors.success,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppSpacing.xl),

                            Text(
                              AppStrings.accountSettings,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.lg),

                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: () {
                                  authService.logout();
                                  Navigator.of(context).pushReplacementNamed('/home');
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: AppColors.error,
                                ),
                                child: const Text(AppStrings.signOutButton),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
