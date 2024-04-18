
import 'package:flutter/material.dart';
import 'package:ticks/features/bootstrap_checklist/bootstrap_checklist_bloc.dart';
import 'package:ticks/widgets/ticks_app_bar.dart';

AppBar createPageAppBar(
    BuildContext context,
    BootstrapChecklistState state,
  ) {
    return createAppBar(
      context: context,
      title: 'Start',
    );
  }
