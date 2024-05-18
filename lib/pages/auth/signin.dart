import 'package:e_store/constants/my_validators.dart';
import 'package:e_store/pages/auth/forgot_password.dart';
import 'package:e_store/pages/auth/signup.dart';
import 'package:e_store/pages/auth/text_form_field_widget.dart';
import 'package:e_store/root_page.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/app_name_text_widget.dart';
import 'package:e_store/widgets/button_widget.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:social_auth_buttons/res/buttons/facebook_auth_button.dart';
import 'package:social_auth_buttons/res/buttons/google_auth_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static String routeName = '/SignInPage';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final GlobalKey<FormState> _formKey;
  bool obscureText = true;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 128),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppNameTextWidget(fontSize: 48),
                    const SizedBox(width: 12),
                    Image.asset(
                      AssetsManager.shoppingCart,
                      width: 64,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const TitleWidget(
                  label: 'Welcome back to Shamify',
                ),
                const SizedBox(height: 12),
                const SubtitleWidget(
                  label:
                      'To unlock the full experience and access exclusive features, please log in. Let\'s embark on this journey together!',
                ),
                const SizedBox(height: 24),
                TextFormFieldWidget(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  label: 'Email Address',
                  hintText: 'Enter your email address here.',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.clear),
                  ),
                  prefixIcon: Icons.email,
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  obscureText: false,
                  validator: (value) {
                    return MyValidators.emailValidator(value);
                  },
                  onFieldSubmitted: (value) {
                    // Request focus for the password field regardless of whether the email field loses focus.
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                ),
                const SizedBox(height: 24),
                TextFormFieldWidget(
                  keyboardType: TextInputType.visiblePassword,
                  label: 'Password',
                  hintText: 'Enter your account password here.',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                  prefixIcon: IconlyBold.password,
                  obscureText: obscureText,
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  onFieldSubmitted: (value) {
                    _loginFct();
                  },
                  validator: (value) {
                    return MyValidators.passwordValidator(value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, ForgotPasswordPage.routeName);
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                ButtonWidget(
                  label: 'Login',
                  function: () async {
                    _loginFct();
                  },
                  icon: Icons.login,
                  expanded: true,
                ),
                const SizedBox(height: 12),
                Center(
                  child: SubtitleWidget(
                    label: 'OR CONNECT USING',
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 12),
                GoogleAuthButton(
                  textStyle: const TextStyle(fontSize: 16, color: Colors.black),
                  onPressed: () {},
                  darkMode: false,
                  borderRadius: 16,
                  height: 48,
                ),
                const SizedBox(height: 12),
                FacebookAuthButton(
                  textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  onPressed: () {},
                  darkMode: false,
                  borderRadius: 16,
                  height: 48,
                ),
                const SizedBox(height: 12),
                buildSignUpButton(context),
                const SizedBox(height: 12),
                ButtonWidget(
                  label: 'Skip For Now!',
                  function: () async {
                    Navigator.pushNamed(context, RootPage.routeName);
                  },
                  icon: Icons.login,
                  expanded: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignUpButton(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account? ',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUp(),
                ),
              );
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
