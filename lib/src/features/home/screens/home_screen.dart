import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/field.dart';
import '../../../core/widgets/main_button.dart';
import '../../image/bloc/image_bloc.dart';
import '../../image/screens/image_screen.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routePath = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final promptController = TextEditingController();

  bool active = false;

  void onChanged(String _) {
    setState(() {
      active = promptController.text.isNotEmpty;
    });
  }

  void onGenerate() {
    context.read<ImageBloc>().add(GenerateImage(prompt: promptController.text));
    context.push(
      ImageScreen.routePath,
      extra: promptController.text,
    );
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const HomeAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(Constants.padding),
        child: Column(
          children: [
            Field(
              controller: promptController,
              hintText: '«Describe what you want to see…»',
              fieldType: FieldType.multiline,
              onChanged: onChanged,
            ),
            const SizedBox(height: 20),
            MainButton(
              title: 'Generate',
              active: active,
              onPressed: onGenerate,
            ),
          ],
        ),
      ),
    );
  }
}
