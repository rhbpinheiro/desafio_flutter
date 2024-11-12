// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
import 'package:desafio_flutter/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../common_widgets/app_name_widget.dart';
import '../../common_widgets/custom_button.dart';
import '../../models/api_response.dart';

class HomePage extends StatefulWidget {
  final ApiResponse apiResponse;
  const HomePage({
    Key? key,
    required this.apiResponse,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formkey = GlobalKey<FormState>();

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
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Espaço entre o topo e o botão
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Resposta',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Id: ${widget.apiResponse.id}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Mensagem: ${widget.apiResponse.message}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            WidgetButton(
              label: 'Voltar',
              onPressed: () {
                Navigator.pop(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 300),
                    child: const LoginPage(),
                  ),
                );
              },
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
