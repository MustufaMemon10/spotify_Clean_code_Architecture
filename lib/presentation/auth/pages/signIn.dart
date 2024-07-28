import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';
import 'package:spotifyclone/common/widgets/appbar/app_bar.dart';
import 'package:spotifyclone/common/widgets/basic_app_button.dart';
import 'package:spotifyclone/core/configs/assets/app_vectors.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/data/models/auth/signIn_user.dart';
import 'package:spotifyclone/domain/usecases/auth/signin.dart';
import 'package:spotifyclone/presentation/auth/pages/signup.dart';
import 'package:spotifyclone/presentation/auth/widgets/textfield.dart';
import 'package:spotifyclone/presentation/root/pages/root.dart';
import 'package:spotifyclone/service_locator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  bool _isLoading = false;
  bool obscure = true;

  Future<void> _handleSignIn() async {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      setState(() {
        _isLoading = true; // Start loading
      });
      var result = await sl<SignInUseCase>().call(
          params: SignInUser(
              email: _email.text.toString(),
              password: _password.text.toString()));
      result.fold((l) {
        var snackbar = SnackBar(
          content: Text(
            l,
            style: const TextStyle(color: Colors.white),
          ),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }, (r) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const RootPage()),
            (route) => false);
      });
    } else {
      // Show an error message if fields are empty
      var snackBar = const SnackBar(
        content: Text('Please fill in all fields'),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _singInText(),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
                title: 'Enter username or email', controller: _email),
            const SizedBox(
              height: 16,
            ),
            TextField(
                cursorWidth: 1,
                textInputAction: TextInputAction.go,
                cursorColor: context.isDarkMode
                    ? Colors.white.withOpacity(0.6)
                    : Colors.black.withOpacity(0.6),
                obscureText: obscure,
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () => setState(() {
                            obscure = !obscure;
                          }),
                      icon: Icon(obscure ? Iconsax.eye_slash : Iconsax.eye)),
                ).applyDefaults(Theme.of(context).inputDecorationTheme)),
            const SizedBox(
              height: 16,
            ),
            _isLoading // Show loading indicator
                ? const CircularProgressIndicator(
                  color: AppColors.primary,
                ) 
                :
            BasicAppButton(
                onPressed: _handleSignIn,
                title: 'Sign In'),
            const Spacer(),
            signinText(context),
          ],
        ),
      ),
    );
  }

  Widget _singInText() {
    return const Text('Sign in',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ));
  }

  Widget signinText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do you have an account?',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: context.isDarkMode ? Colors.white : Colors.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignupPage(),
                ));
          },
          child: const Text(
            'Register Now',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff288CE9)),
          ),
        )
      ],
    );
  }
}
