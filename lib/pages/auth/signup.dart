import 'package:e_store/constants/my_validators.dart';
import 'package:e_store/pages/auth/image_picker_widget.dart';
import 'package:e_store/pages/auth/signin.dart';
import 'package:e_store/pages/auth/text_form_field_widget.dart';
import 'package:e_store/services/app_methods.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/app_name_text_widget.dart';
import 'package:e_store/widgets/button_widget.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_auth_buttons/res/buttons/facebook_auth_button.dart';
import 'package:social_auth_buttons/res/buttons/google_auth_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static String routeName = '/SignUpPage';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _retypePasswordController;
  late final FocusNode _fullNameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _retypePasswordFocusNode;
  late final GlobalKey<FormState> _formKey;
  bool obscureText = true;
  XFile? _pickedImage;
  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _retypePasswordController = TextEditingController();
    _fullNameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _retypePasswordFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _retypePasswordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _signUpFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save;
      if (_pickedImage == null) {
        AppMethods.showMessageDialog(
          context,
          errorMessage: 'image is required!!',
          title: 'Image required',
          message: 'make sure to pick up an image!',
          isError: true,
          fct: () {},
        );
      }
    }
  }

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await AppMethods.showImagePickerDialog(
      context: context,
      cameraFunction: () async {
        _pickedImage = await picker.pickImage(
          source: ImageSource.camera,
        );
        setState(() {});
      },
      galleryFunction: () async {
        _pickedImage = await picker.pickImage(
          source: ImageSource.gallery,
        );
        setState(() {});
      },
      removeFunction: () {
        setState(() {
          _pickedImage = null;
        });
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 128),
                    const AppNameTextWidget(fontSize: 48),
                    const SizedBox(width: 12),
                    Image.asset(
                      AssetsManager.shoppingCart,
                      width: 64,
                    ),
                  ],
                ),
                const TitleWidget(
                  label: 'Create an Account',
                ),
                const SizedBox(height: 12),
                const SubtitleWidget(
                  label:
                      'Join us to unlock the full experience and access exclusive features!',
                ),
                const SizedBox(height: 24),
                Center(
                  child: SizedBox(
                    width: size.width * 0.3,
                    height: size.width * 0.3,
                    child: ImagePickerWidget(
                      function: () async {
                        await localImagePicker();
                      },
                      pickedImage: _pickedImage,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormFieldWidget(
                  obscureText: false,
                  label: 'Full Name',
                  prefixIcon: Icons.abc,
                  hintText: 'Enter your full name',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _fullNameController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  controller: _fullNameController,
                  focusNode: _fullNameFocusNode,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_emailFocusNode);
                  },
                  validator: (value) {
                    return MyValidators.displayNamevalidator(value);
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 24),
                TextFormFieldWidget(
                  obscureText: false,
                  label: 'Email Address',
                  prefixIcon: Icons.email,
                  hintText: 'Enter your email address here.',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _emailController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  validator: (value) {
                    return MyValidators.emailValidator(value);
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 24),
                TextFormFieldWidget(
                  obscureText: obscureText,
                  label: 'Password',
                  prefixIcon: IconlyBold.password,
                  hintText: 'Create a password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context)
                        .requestFocus(_retypePasswordFocusNode);
                  },
                  validator: (value) {
                    return MyValidators.passwordValidator(value);
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 24),
                TextFormFieldWidget(
                  obscureText: obscureText,
                  prefixIcon: IconlyBold.password,
                  label: 'Re-type Password',
                  hintText: 'Re-enter your password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  controller: _retypePasswordController,
                  focusNode: _retypePasswordFocusNode,
                  onFieldSubmitted: (value) {
                    _signUpFct();
                  },
                  validator: (value) {
                    return MyValidators.confirmPasswordValidator(
                      value: value,
                      password: _passwordController.text,
                    );
                  },
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  label: 'Sign Up',
                  function: () {
                    _signUpFct();
                  },
                  icon: Icons.person_add,
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
                  text: 'Sign up with Google',
                  darkMode: false,
                  borderRadius: 16,
                  height: 48,
                ),
                const SizedBox(height: 12),
                FacebookAuthButton(
                  text: 'Sign up with Facebook',
                  textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  onPressed: () {},
                  darkMode: false,
                  borderRadius: 16,
                  height: 48,
                ),
                const SizedBox(height: 12),
                buildSignInButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignInButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero,
          ),
          onPressed: () {
            Navigator.pushNamed(context, SignIn.routeName);
          },
          child: const SubtitleWidget(
            label: 'Sign In',
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
