import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:ticks/app/app.dart';
import 'package:ticks_api/ticks_api.dart';
import 'package:ticks_repository/ticks_repository.dart';

import 'app/app_block_observer.dart';

void bootstrap({required TicksApi ticksApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final ticksRepository = TicksRepository(ticksApi: ticksApi);

  runZonedGuarded(
    () => runApp(App(ticksRepository: ticksRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}