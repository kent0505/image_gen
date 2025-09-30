import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/router.dart';
import 'src/core/themes.dart';
import 'src/features/image/bloc/image_bloc.dart';
import 'src/features/image/data/image_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ImageRepository>(
          create: (context) => ImageRepositoryImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ImageBloc(
              repository: context.read<ImageRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: theme,
          routerConfig: routerConfig,
        ),
      ),
    ),
  );
}
