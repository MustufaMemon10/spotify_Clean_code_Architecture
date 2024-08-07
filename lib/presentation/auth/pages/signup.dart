import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotifyclone/common/helpers/is_dark_mode.dart';
import 'package:spotifyclone/common/widgets/appbar/app_bar.dart';
import 'package:spotifyclone/common/widgets/basic_app_button.dart';
import 'package:spotifyclone/core/configs/assets/app_vectors.dart';
import 'package:spotifyclone/core/configs/theme/app_colors.dart';
import 'package:spotifyclone/data/models/auth/create_user_req.dart';
import 'package:spotifyclone/domain/usecases/auth/signup.dart';
import 'package:spotifyclone/presentation/auth/pages/signIn.dart';
import 'package:spotifyclone/presentation/auth/widgets/textfield.dart';
import 'package:spotifyclone/presentation/home/pages/home.dart';
import 'package:spotifyclone/service_locator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   TextEditingController _fullName = TextEditingController();

   TextEditingController _email = TextEditingController();

   TextEditingController _password = TextEditingController();

  bool obscure = true;
  bool _isLoading = false;

 Future<void> _handleSignup() async {
    if (_fullName.text.isNotEmpty && _email.text.isNotEmpty && _password.text.isNotEmpty) {
      setState(() {
        _isLoading = true; // Start loading
      });
      var result = await sl<SignupUseCase>().call(
        params: CreateUserReq(
          fullName: _fullName.text.trim(),
          email: _email.text.trim(),
          password: _password.text.trim(),
        ),
      );
      setState(() {
        _isLoading = false; // Stop loading
      });
      result.fold((l) {
        var snackBar = SnackBar(
          content: Text(l),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
         setState(() {
        _isLoading = false; // Start loading
      });
      }, (r) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
          (route) => false,
        );
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
      appBar: BasicAppbar(
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
            CustomTextField(title: 'Full Name', controller: _fullName),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(title: 'Email', controller: _email),
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
              onPressed: ()=> setState(() {
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
                : BasicAppButton(
                    onPressed: _handleSignup,
                    title: 'Create Account',
                  ),
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



  Widget passwordField(BuildContext context, title, bool obscure,
      TextEditingController controller, void Function() onTap) {
    return TextField(
        cursorWidth: 1,
        textInputAction: TextInputAction.go,
        cursorColor: context.isDarkMode
            ? Colors.white.withOpacity(0.6)
            : Colors.black.withOpacity(0.6),
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          hintText: title,
          suffixIcon: IconButton(
              onPressed: onTap,
              icon: Icon(obscure ? Iconsax.eye_slash : Iconsax.eye)),
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
                MaterialPageRoute(
                  builder: (context) => const SignInPage(),
                ));
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
