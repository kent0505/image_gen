import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../data/image_repository.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository _repository;

  ImageBloc({required ImageRepository repository})
      : _repository = repository,
        super(ImageInitial()) {
    on<ImageEvent>(
      (event, emit) => switch (event) {
        GenerateImage() => _generateImage(event, emit),
      },
    );
  }

  void _generateImage(
    GenerateImage event,
    Emitter<ImageState> emit,
  ) async {
    emit(ImageLoading());
    try {
      final url = await _repository.generate(event.prompt);

      emit(ImageGenerated(url: url));
    } catch (e) {
      logger(e);
      emit(ImageError(error: e.toString()));
    }
  }
}
