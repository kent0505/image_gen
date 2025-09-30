import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/appbar.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/main_button.dart';
import '../bloc/image_bloc.dart';
import '../widgets/image_error_widget.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.prompt});

  static const routePath = '/ImageScreen';

  final String prompt;

  @override
  Widget build(BuildContext context) {
    void onGenerate() {
      context.read<ImageBloc>().add(GenerateImage(prompt: prompt));
    }

    return Scaffold(
      appBar: const Appbar(title: 'Image'),
      body: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state is ImageLoading) {
            return const LoadingWidget();
          }

          if (state is ImageGenerated) {
            return Stack(
              children: [
                ImageWidget(url: state.url),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MainButton(
                      title: 'Retry',
                      horizontal: Constants.padding,
                      onPressed: onGenerate,
                    ),
                    const SizedBox(height: 10),
                    MainButton(
                      title: 'New prompt',
                      horizontal: Constants.padding,
                      onPressed: () {
                        context.pop();
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            );
          }

          if (state is ImageError) {
            return ImageErrorWidget(onRetry: onGenerate);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
