import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/main_button.dart';

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Failed to generate image',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: AppFonts.w500,
            ),
          ),
          const SizedBox(height: 20),
          MainButton(
            title: 'Retry',
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
