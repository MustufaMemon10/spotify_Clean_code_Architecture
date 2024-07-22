import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';
import 'package:spotifyclone/common/widgets/appbar/app_bar.dart';
import 'package:spotifyclone/common/widgets/basic_app_button.dart';
import 'package:spotifyclone/core/configs/assets/app_vectors.dart';
import 'package:spotifyclone/data/models/auth/create_user_req.dart';
import 'package:spotifyclone/domain/usecases/auth/signup.dart';
import 'package:spotifyclone/presentation/auth/pages/signIn.dart';
import 'package:spotifyclone/presentation/root/pages/root.dart';
import 'package:spotifyclone/service_locator.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
            textField(context, 'Full Name',_fullName),
            const SizedBox(
              height: 16,
            ),
            textField(context, 'Enter Email',_email),
            const SizedBox(
              height: 16,
            ),
            passwordField(context, 'Password',obscure,_password),
            const SizedBox(
              height: 16,
            ),
            BasicAppButton(onPressed: () async{
              var result = await sl<SignupUseCase>().call(
                params: CreateUserReq(fullName: _fullName.text.trim(), email: _email.text.trim(), password: _password.text.trim()
                )
              );
              result.fold(
              (l){
                var snackBar =  SnackBar(content: Text(l),behavior: SnackBarBehavior.floating,);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              (r){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>const RootPage() ), (route) => false);
              });
            }, title: 'Create Account'),
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

  Widget textField(BuildContext context, title,TextEditingController controller) {
    return TextField(
      controller: controller,
        decoration: InputDecoration(
      hintText: title,
    ).applyDefaults(Theme.of(context).inputDecorationTheme));
  }

  Widget passwordField(BuildContext context, title, bool obscure,TextEditingController controller) {
    return TextField(
        controller: controller,
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
                MaterialPageRoute(builder: (context)=> SignInPage(), ));
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
