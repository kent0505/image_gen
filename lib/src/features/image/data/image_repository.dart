import 'dart:math';

import '../../../core/utils.dart';

abstract interface class ImageRepository {
  const ImageRepository();

  Future<String> generate(String prompt);
}

final class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl();

  @override
  Future<String> generate(String prompt) async {
    await Future.delayed(const Duration(seconds: 2));

    final random = Random();

    if (random.nextBool()) {
      throw Exception('Failed to generate image');
    }

    return 'https://images.unsplash.com/photo-1611859266238-4b98091d9d9b?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmlzc2FuJTIwZ3RyfGVufDB8fDB8fHww?cacheBust=${getTimestamp()}';
  }
}
