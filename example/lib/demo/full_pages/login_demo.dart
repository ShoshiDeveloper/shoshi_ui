import 'package:flutter/material.dart';
import 'package:shoshi_ui/shoshi_ui.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = STheme.of(context);

    return SScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: SSpacings.s24,
        children: [
          Text('Welcome', style: theme.textStyles.h1(weight: FontWeight.w700)),
          Form(
            key: formKey,
            onChanged: () {
              print('form onchjange');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SSpacings.s08,
              children: [
                SInput(hint: 'Login', isAutoValidate: false),
                SInput(
                  hint: 'Password',
                  isAutoValidate: false,
                  obscureText: true,
                  validator: (value) => value != '1234' ? 'Wrong password' : null,
                ),
                SButton.text('Forgot password'),
              ],
            ),
          ),

          Column(
            spacing: SSpacings.s08,
            children: [
              SButton('Login', infinityWidth: true, onTap: () => formKey.currentState?.validate()),
              SButton.text('Create account'),
            ],
          ),
        ],
      ),
    );
  }
}
