import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';
import 'package:spotifyclone/common/widgets/appbar/app_bar.dart';
import 'package:spotifyclone/common/widgets/basic_app_button.dart';
import 'package:spotifyclone/core/configs/assets/app_vectors.dart';
import 'package:spotifyclone/presentation/auth/pages/signIn.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
     bool obscure = true;
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
            _registerText(),
            const SizedBox(
              height: 50,
            ),
            textField(context, 'Full Name'),
            const SizedBox(
              height: 16,
            ),
            textField(context, 'Enter Email'),
            const SizedBox(
              height: 16,
            ),
            passwordField(context, 'Password',obscure),
            const SizedBox(
              height: 16,
            ),
            BasicAppButton(onPressed: () {}, title: 'Create Account'),
            const Spacer(),
            signinText(context),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text('Register',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ));
  }

  Widget textField(BuildContext context, title) {
    return TextField(
        decoration: InputDecoration(
      hintText: title,
    ).applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget passwordField(BuildContext context, title, bool obscure) {
    return TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: title,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(obscure ? Iconsax.eye : Iconsax.eye_slash)),
        ).applyDefaults(Theme.of(context).inputDecorationTheme));
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
                MaterialPageRoute(builder: (context)=>const SignInPage(), ));
          },
          child: const Text(
            'sign In',
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
