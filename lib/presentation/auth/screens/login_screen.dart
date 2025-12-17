import 'package:flutter/material.dart';
import 'package:moviebasket/common/helper/navigation/app_navigation.dart';
import 'package:moviebasket/core/theme/app_colors.dart';
import 'package:moviebasket/presentation/auth/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MovieBasket',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),

            SizedBox(height: 20),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: AppColors.textSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: 20),

            TextFormField(
              obscureText: _showPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: AppColors.textSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () => {
                      setState(() {
                        _showPassword = !_showPassword;
                      }),
                    },
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),

            SizedBox(height: 15),

            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = !_rememberMe;
                    });
                  },
                ),
                Text('Remember Me', style: TextStyle(fontSize: 15)),
              ],
            ),

            SizedBox(height: 15),

            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(),
                child: Text(
                  'LogIn',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dodn't have an account ? "),
                GestureDetector(
                  onTap: () {
                    AppNavigation.pushReplacement(context, SignupScreen());
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
