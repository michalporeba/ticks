import 'package:flutter/material.dart';

AppBar createAppBar({
  required BuildContext context,
  String title = '',
  void Function(String)? onSearch,
}) {
  final theme = Theme.of(context);
  return AppBar(
    backgroundColor: theme.primaryColor,
    title: _createTitle(theme, title),
    actions: [IconButton(
      onPressed: () {},
      icon: const Icon(Icons.settings),),
    ],
    bottom: _createSearch(theme, onSearch),
  );
}

Widget _createTitle(ThemeData theme, String title) {
  return Text(
    title,
    style: theme.textTheme.titleLarge,
  );
}

PreferredSizeWidget? _createSearch(
    ThemeData theme,
    void Function(String)? onSearch,
) {
  if (onSearch == null) {
    return null;
  }

  return PreferredSize(
    preferredSize: const Size.fromHeight(64),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Container(
            margin: const EdgeInsets.all(4),
            child: const Icon(Icons.filter_alt_outlined),
          ),
        ),
        onChanged: (query) => onSearch(query),
      ),
    ),
  );
}
