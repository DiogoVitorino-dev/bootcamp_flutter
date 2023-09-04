import 'package:bootcamp_flutter/pages/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var email = TextEditingController(text: "");
    var senha = TextEditingController(text: "");
    var hidePassword = false;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                          flex: 5,
                          child: Image.network(
                              "https://lp.dio.me/wp-content/uploads/2023/03/LOGO-DIO-COLOR.png")),
                      Expanded(child: Container())
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "ja tem cadastro?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Faça seu login e make the change_",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: email,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 0),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          prefixIcon: const Icon(Icons.email),
                          prefixIconColor: Colors.purple[400],
                          hintText: "Email",
                          hintStyle: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      obscureText: hidePassword,
                      controller: senha,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 0),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          prefixIcon: const Icon(Icons.password),
                          prefixIconColor: Colors.purple[400],
                          suffixIcon: InkWell(
                            onTap: () => setState(() {
                              hidePassword = !hidePassword;
                            }),
                            child: hidePassword == true
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          suffixIconColor: Colors.white,
                          hintText: "Senha",
                          hintStyle: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      height: 30,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple[400]),
                        ),
                        onPressed: () {
                          if (email.text.trim() == "test@gmail.com" &&
                              senha.text.trim() == "456") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Campo incorreto")));
                          }
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 30,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Esqueci minha senha",
                            style: TextStyle(
                                color: Colors.lime,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Criar conta",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
