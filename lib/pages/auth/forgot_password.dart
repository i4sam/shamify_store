import 'package:e_store/constants/my_validators.dart';
import 'package:e_store/pages/auth/text_form_field_widget.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/button_widget.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  static String routeName = '/ForgotPasswordPage';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController _emailController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _forgotPasswordFunction() async {
    bool isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      // Implement your forgot password logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            IconlyLight.arrowLeft2,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      AssetsManager.forgotPasswordImage,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                const TitleWidget(
                  label: 'Forgot Password',
                  color: Colors.purple,
                  fontSize: 36,
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Column(
                    children: [
                      const SubtitleWidget(
                        label:
                            'Enter your email address below to receive a password reset link.',
                      ),
                      const SizedBox(height: 24.0),
                      Form(
                        key: _formKey,
                        child: TextFormFieldWidget(
                          // Text field for email address
                          label: 'Email Address',
                          prefixIcon: Icons.email,
                          hintText: 'Enter your email',
                          obscureText: false,
                          controller: _emailController,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _emailController.clear();
                            },
                            icon: const Icon(Icons.clear),
                          ),
                          onFieldSubmitted: (value) {
                            _forgotPasswordFunction();
                          },
                          validator: (value) {
                            return MyValidators.emailValidator(value);
                          },
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      ButtonWidget(
                        expanded: true,
                        label: 'Send Reset Link',
                        function: _forgotPasswordFunction,
                        icon: Icons.send,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
