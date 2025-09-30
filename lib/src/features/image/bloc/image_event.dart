part of 'image_bloc.dart';

@immutable
sealed class ImageEvent {}

final class GenerateImage extends ImageEvent {
  GenerateImage({required this.prompt});

  final String prompt;
}
