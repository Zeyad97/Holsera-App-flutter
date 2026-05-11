import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class NavbarWidget extends StatelessWidget {
  final VoidCallback? onMenuTap;

  const NavbarWidget({Key? key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo
          Text(
            'ℋ',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          
          // App Name (hidden on small screens)
          Expanded(
            child: Text(
              AppStrings.appName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),

          // Auth Buttons
          Consumer<AuthService>(
            builder: (context, authService, _) {
              if (authService.isLoggedIn) {
                return Row(
                  children: [
                    FilledButton(
                      onPressed: () {
                        authService.logout();
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.error,
                      ),
                      child: const Text(AppStrings.logout),
                    ),
                  ],
                );
              }

              return Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const Text(AppStrings.signIn),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const Text(AppStrings.signUp),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
