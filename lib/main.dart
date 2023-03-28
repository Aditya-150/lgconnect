// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ssh2/ssh2.dart';
import 'dart:async';
import 'dart:io';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'LG Connection';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: const Color(0xFFEC4700),
        ),
        body: const LGConnection(),
      ),
    );
  }
}

// Create a Form widget.
class LGConnection extends StatefulWidget {
  const LGConnection({super.key});
  @override
  LGConnectionState createState() {
    return LGConnectionState();
  }
}

class LGConnectionState extends State<LGConnection> {
  Color _field1Color = new Color(0xFF5E5E5E);
  Color _field2Color = new Color(0xFF5E5E5E);
  Color _field3Color = new Color(0xFF5E5E5E);
  Color _field4Color = new Color(0xFF5E5E5E);
  final username = TextEditingController();
  final password = TextEditingController();
  final ipAddress = TextEditingController();
  
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.072,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07),
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() => _field1Color = hasFocus
                          ? const Color(0xFFEC4700)
                          : const Color(0xFF5E5E5E));
                    },
                    child: TextFormField(
                      controller: username,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF787C7D),
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Color(0xFF5E5E5E)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Color(0xFFEC4700)),
                        ),
                        labelText: "Username *",
                        hintText: "lg",
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w500,
                          color: _field1Color,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0142,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07),
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() => _field2Color = hasFocus
                          ? const Color(0xFFEC4700)
                          : const Color(0xFF5E5E5E));
                    },
                    child: TextFormField(
                      controller: password,
                      obscureText: isObscured,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF787C7D),
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Color(0xFF5E5E5E)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Color(0xFFEC4700)),
                        ),
                        labelText: "Password *",
                        hintText: "lg",
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w500,
                          color: _field2Color,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscured
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            color: const Color(0xFF787C7D),
                          ),
                          onPressed: () {
                            setState(() {
                              isObscured = !isObscured;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0142,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07),
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() => _field3Color = hasFocus
                          ? const Color(0xFFEC4700)
                          : const Color(0xFF5E5E5E));
                    },
                    child: TextFormField(
                      controller: ipAddress,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF787C7D),
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Color(0xFF5E5E5E)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Color(0xFFEC4700)),
                        ),
                        labelText: "IP *",
                        hintText: "192.168.27.3",
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w500,
                          color: _field3Color,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0142,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07),
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      setState(() => _field4Color = hasFocus
                          ? const Color(0xFFEC4700)
                          : const Color(0xFF5E5E5E));
                    },
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF787C7D),
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Color(0xFF5E5E5E)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Color(0xFFEC4700)),
                        ),
                        labelText: "Port *",
                        hintText: "22",
                        labelStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontWeight: FontWeight.w500,
                          color: _field4Color,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0284,
                ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          String sshMessage =
              await sshConnection(username.text, password.text, ipAddress.text);
          
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Status'),
              content: Text(sshMessage),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'))
              ],
            ),
          );
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        label: const Text('Connect'),
        icon: const Icon(Icons.connected_tv),
        backgroundColor: const Color(0xFFEC4700),
      ),
    );
  }
}

Future<String> sshConnection(username, password, hostIP) async {
  String result = '';
  String message = '';
  var client = SSHClient(
    host: hostIP,
    port: 22,
    username: username,
    passwordOrKey: password,
  );
  try {
    result = await client.connect() ?? 'Null result';
    if (result == "session_connected") {
      result = await client.execute("ps") ?? 'Null result';
      message = 'Connected';
    } else {
      message = 'Unestablished Connection';
    }
  } on PlatformException catch (e) {
    message = 'Error: ${e.code}\nError Message: ${e.message}';
    result = message;
    print(result);
  }

  return message;
}
