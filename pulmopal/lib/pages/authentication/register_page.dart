import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulmopal/pages/authentication/login_page.dart';
import 'package:pulmopal/pages/authentication/register_page_info.dart';
import 'package:pulmopal/services/auth_services.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/PulmoPal.png'), fit: BoxFit.cover)),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 30,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/logo.png')),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 55, color: Colors.white),
                ),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: '   Email',
                        hintStyle: TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: '   Password',
                        hintStyle: TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  height: 30,
                ),
                Consumer(builder: (context, ref, child) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ref
                            .read(authControllerProvider)
                            .signUpWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterPageInfo(),
                                )));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 154, 139, 224),
                        foregroundColor: Colors.black,
                        fixedSize: const Size(200, 20)),
                    child: const Text('CONTINUE'),
                  );
                }),
                const Text('Do you have an account'),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      )),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 154, 139, 224),
                      foregroundColor: Colors.black,
                      fixedSize: const Size(200, 20)),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
