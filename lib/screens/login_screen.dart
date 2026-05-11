import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSignUp = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            margin: const EdgeInsets.all(AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Text(
                  'ℋ',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                
                // Title
                Text(
                  _isSignUp ? AppStrings.signUp : AppStrings.signIn,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),

                // Email Field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: AppStrings.email,
                    filled: true,
                    fillColor: AppColors.lightGray,
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

                // Password Field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: AppStrings.password,
                    filled: true,
                    fillColor: AppColors.lightGray,
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

                // Error Message
                if (_errorMessage != null)
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.error.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      border: Border.all(color: AppColors.error),
                    ),
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(color: AppColors.error),
                    ),
                  ),
                const SizedBox(height: AppSpacing.lg),

                // Sign In/Up Button
                Consumer<AuthService>(
                  builder: (context, authService, _) {
                    return SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: authService.isLoading
                            ? null
                            : () async {
                          setState(() => _errorMessage = null);
                          try {
                            if (_isSignUp) {
                              await authService.signUpWithEmail(
                                _emailController.text,
                                _passwordController.text,
                              );
                            } else {
                              await authService.signInWithEmail(
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                            if (mounted) {
                              Navigator.of(context).pushReplacementNamed('/dashboard');
                            }
                          } catch (e) {
                            setState(() => _errorMessage = e.toString());
                          }
                        },
                        child: authService.isLoading
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                            : Text(_isSignUp ? AppStrings.signUp : AppStrings.signIn),
                      ),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.lg),

                // Google Sign In Button
                Consumer<AuthService>(
                  builder: (context, authService, _) {
                    return SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: authService.isLoading
                            ? null
                            : () async {
                          try {
                            await authService.signInWithGoogle();
                            if (mounted) {
                              Navigator.of(context).pushReplacementNamed('/dashboard');
                            }
                          } catch (e) {
                            setState(() => _errorMessage = e.toString());
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('🔵', style: TextStyle(fontSize: 18)),
                              const SizedBox(width: AppSpacing.md),
                              const Text(AppStrings.signInWithGoogle),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.lg),

                // Toggle Sign In/Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _isSignUp ? AppStrings.haveAccount : AppStrings.dontHaveAccount,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isSignUp = !_isSignUp;
                          _errorMessage = null;
                        });
                      },
                      child: Text(
                        _isSignUp ? AppStrings.signInHere : AppStrings.signUpHere,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.md),

                // Back to Home
                TextButton(
                  onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
                  child: const Text('← Back to Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
