part of 'image_bloc.dart';

@immutable
sealed class ImageState {}

final class ImageInitial extends ImageState {}

final class ImageLoading extends ImageState {}

final class ImageGenerated extends ImageState {
  ImageGenerated({required this.url});

  final String url;
}

final class ImageError extends ImageState {
  ImageError({required this.error});

  final String error;
}
