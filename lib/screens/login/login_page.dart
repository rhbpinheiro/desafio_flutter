import 'package:desafio_flutter/common_widgets/condition_row.dart';
import 'package:desafio_flutter/common_widgets/custom_button.dart';
import 'package:desafio_flutter/controllers/auth_controller.dart';
import 'package:desafio_flutter/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import '../../common_widgets/app_name_widget.dart';
import '../../common_widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  bool _isPasswordValid = false;
  bool _isMinLengthValid = false;
  bool _hasNumber = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasSpecialChar = false;
  final _authController = AuthController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePassword);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _validatePassword() {
    final password = _passwordController.text;
    setState(() {
      _isMinLengthValid = password.length >= 8;
      _hasNumber = password.contains(RegExp(r'[0-9]'));
      _hasUppercase = password.contains(RegExp(r'[A-Z]'));
      _hasLowercase = password.contains(RegExp(r'[a-z]'));
      _hasSpecialChar = password.contains(RegExp(r'[!@#\$&*~]'));
      _isPasswordValid = _isMinLengthValid &&
          _hasNumber &&
          _hasUppercase &&
          _hasLowercase &&
          _hasSpecialChar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        title: const AppNameWidget(
          greenTitleColor: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Digite uma senha válida',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFromField(
                            passwordController: _passwordController,
                            isPasswordValid: _isPasswordValid,
                          ),
                          const SizedBox(height: 20),
                          // Exibindo as condições abaixo do campo de senha
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ConditionRow(
                                condition: 'Pelo menos 8 caracteres',
                                isValid: _isMinLengthValid,
                                isPassword: _passwordController.text.isEmpty,
                              ),
                              ConditionRow(
                                condition: 'Deve conter um número',
                                isValid: _hasNumber,
                                isPassword: _passwordController.text.isEmpty,
                              ),
                              ConditionRow(
                                condition: 'Deve conter uma letra maiúscula',
                                isValid: _hasUppercase,
                                isPassword: _passwordController.text.isEmpty,
                              ),
                              ConditionRow(
                                condition: 'Deve conter uma letra minúscula',
                                isValid: _hasLowercase,
                                isPassword: _passwordController.text.isEmpty,
                              ),
                              ConditionRow(
                                condition: 'Deve conter um símbolo especial',
                                isValid: _hasSpecialChar,
                                isPassword: _passwordController.text.isEmpty,
                              ),
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isLoading,
              builder: (context, value, child) {
                return WidgetButton(
                  label: 'Entrar',
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (!_formKey.currentState!.validate()) return;
                    isLoading.value = true;
                    final response = await _authController.login(
                      _passwordController.text,
                    );
                    isLoading.value = false;
                    _passwordController.clear();
                    if (response != null) {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                          child: HomePage(apiResponse: response),
                        ),
                      );
                    }
                  },
                  isLoading: value,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
