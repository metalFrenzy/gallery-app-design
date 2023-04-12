import 'package:flutter/material.dart';

import '../widgets/text_form_field_wrapper.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _userName = '';
  var _email = '';
  var _password = '';
  var _isLogin = true;

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _email.trim(),
        _password.trim(),
        _userName.trim(),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormFieldWrapper(
                child: TextFormField(
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _email = newValue!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 15,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              if (!_isLogin)
                TextFormFieldWrapper(
                  child: TextFormField(
                    key: ValueKey('username'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Username should be at least 4 characters long';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _userName = newValue!;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'User Name',
                      hintStyle: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              TextFormFieldWrapper(
                child: TextFormField(
                  key: ValueKey('pass'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Password should be at least 7 characters';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _password = newValue!;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 15,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              if (widget.isLoading) CircularProgressIndicator(),
              if (!widget.isLoading)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 210, 117, 226),
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 3,
                    padding: const EdgeInsets.all(10),
                    minimumSize: Size(90, 40),
                  ),
                  onPressed: _trySubmit,
                  child: Text(
                    _isLogin ? 'LogIn' : 'SignUp',
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 15,
                    ),
                  ),
                ),
              if (widget.isLoading) CircularProgressIndicator(),
              if (!widget.isLoading)
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(
                    _isLogin ? 'Create New Account' : 'Already have account',
                    style: const TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
