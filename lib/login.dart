import 'package:flutter/material.dart';
import 'package:flutter_task_one/CheckBox.dart';
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isObscured = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _password;
  String? _passwordError;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _passwordError = null;
        _password = _password;
      });
    }
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null; // Password is valid
  }

  @override
  Widget build(BuildContext context) {
    return passwordField();
  }
  Padding LoginButton(){
    return Padding(
      padding: const EdgeInsets.only( left: 10),
      child: Center(
        child: ElevatedButton(
          onPressed: _submitForm,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF43A047),
            textStyle: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold),
            padding: const EdgeInsets.symmetric(
              horizontal: 90, // Horizontal padding
              vertical: 15, // Vertical padding
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(50), // Button shape
            ),
          ),
          child: const Text('Log in'),
        ),
      ),
    );
  }

  Column passwordField() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 40)],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  obscureText: !_isObscured,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.lock),
                    ),
                    suffixIcon: Container(
                      width: 100,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const VerticalDivider(
                              color: Colors.black,
                              thickness: 0.1,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint("password");
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                                child: Icon(
                                  _isObscured ? Icons.visibility : Icons.visibility_off,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: passwordValidator,
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                if (_passwordError != null)
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _passwordError!,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
    botText(),
    LoginButton(),
    ],
    );
  }

  Row botText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Transform.scale(
                  scale:0.8,
                  child: const CheckBox()),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 1),
              child: Text("Remember me",
                style:TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70,10,20,10),
              child: GestureDetector(
                onTap: (){
                },
                child: const Text("Forgot Password",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: Colors.green
                  ),),
              ),
            )
          ],
          ),
        ),
      ],
    );
  }


}
