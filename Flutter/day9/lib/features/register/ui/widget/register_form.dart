import 'package:day9/core/widgets/custom_text_field.dart';
import 'package:day9/features/register/logic/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<RegisterProvider>();
    return Form(
      key: provider.formKey,
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(
            controller: provider.nameController,
            hintText: 'Full Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter full name';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: provider.emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter email address';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: provider.phoneController,
            hintText: 'Phone Number',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter phone number';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
          ),
          CustomTextField(
            controller: provider.ageController,
            hintText: 'Age',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter age';
              }
              return null;
            },
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            controller: provider.passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
