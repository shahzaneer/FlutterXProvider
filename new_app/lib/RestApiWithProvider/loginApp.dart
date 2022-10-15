import 'package:flutter/material.dart';
import 'package:new_app/RestApiWithProvider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: Builder(builder: (BuildContext context) {
        final authProvider = Provider.of<AuthProvider>(context);
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Login Bro"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    obscureText: false,
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                InkWell(
                  onTap: () {
                    authProvider.login(
                        email.text.toString(), password.text.toString());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: 50.0,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.amber,
                    ),
                    child: Center(
                      child: authProvider.isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("Login" , style: TextStyle(fontSize: 20.0),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
