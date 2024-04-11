import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FloatingActionButtons extends StatelessWidget {
  FloatingActionButtons({
    required this.actions,
    super.key,
  }) : assert(
    actions.isNotEmpty,
    '''
FloatingActionButtons have to have at least one actions.
Consider removing the widget if you do not have actions to display.
    ''',
  );

  final List<FloatingActionData> actions;

  @override
  Widget build(BuildContext context) {
    if (actions.length == 1) {
      return _buildForSingleAction(context);
    }

    return _buildForFewActions(context);
  }

  Widget _buildForSingleAction(BuildContext context) {
    final action = actions.first;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: FloatingActionButton.extended(
          onPressed: action.onPressed,
        icon: Icon(action.icon),
        label: Text(action.label),
      ),
    );
  }

  Widget _buildForFewActions(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: actions.reversed.map((action) {
          final theme = Theme.of(context);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: FloatingActionButton.extended(
              icon: Icon(action.icon),
              label: Text(action.label),
              onPressed: action.onPressed,
              backgroundColor:
                action == actions.first
                  ? theme.primaryColor
                  : theme.canvasColor,
            ),
          );
        }).toList(),
    );
  }
}

class FloatingActionData extends Equatable {
  const FloatingActionData({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  List<Object?> get props => [icon, label, onPressed];
}
