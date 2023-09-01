import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[50],
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.teal[100],
                child: const Icon(Icons.login, size: 100),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: double.infinity,
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.orange[100],
                alignment: Alignment.center,
                child: const Text("Informe seu email"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.orange[100],
                alignment: Alignment.center,
                child: const Text("Informe sua senha"),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 30,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  color: Colors.red[100],
                  alignment: Alignment.center,
                  child: const Text("Login"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.red[100],
                alignment: Alignment.center,
                child: const Text("Cadastro"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
