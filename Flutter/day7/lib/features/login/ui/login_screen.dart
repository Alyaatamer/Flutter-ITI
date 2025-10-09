import 'package:day7/core/style/app_color.dart';
import 'package:day7/core/widgets/custom_button.dart';
import 'package:day7/core/widgets/custom_text_field.dart';
import 'package:day7/features/login/logic/login_provider.dart';
import 'package:day7/features/register/ui/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      builder: (context, child) {
        final provider = context.read<LoginProvider>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: provider.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 14,
                          children: [
                            Text(
                              'Welcome Back',
                              style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.bodyColor,
                              ),
                            ),

                            CustomTextField(
                              controller: provider.emailController,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email address';
                                }
                                return null;
                              },
                            ),

                            CustomTextField(
                              controller: provider.passwordController,
                              hintText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                            ),

                            Consumer<LoginProvider>(
                              builder: (context, provider, child) {
                                if (provider.isLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return CustomButton(
                                  onPressed: () {
                                    provider.login(context);
                                  },
                                  text: 'Login',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Are you haven\'t an account?',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.text100Color,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
