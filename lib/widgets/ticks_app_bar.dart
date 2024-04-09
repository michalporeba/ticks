import 'package:flutter/material.dart';

class TicksAppBar extends StatelessWidget implements PreferredSizeWidget {
  TicksAppBar({
    required this.title,
    this.onBack,
    this.onSearch,
    super.key,
  });

  final String title;
  final VoidCallback? onBack;
  final void Function(String)? onSearch;
  late AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    appBar = AppBar(
      backgroundColor: theme.primaryColor,
      leading: _createBackButton(),
      title: _createTitle(theme),
      actions: [IconButton(
              onPressed:(){},
              icon: const Icon(Icons.settings),),
            ],
      bottom: _createSearch(theme),
    );

    return appBar!;
  }

  Widget? _createBackButton() {
    if (onBack == null) {
      return null;
    }
    return IconButton(
      onPressed: onBack,
      icon: const Icon(Icons.arrow_back),
    );
  }

  Widget _createTitle(ThemeData theme) {
    return Text(
      title,
      style: theme.textTheme.titleLarge,
    );
  }

  PreferredSizeWidget _createSearch(ThemeData theme) {
    if (onSearch == null) {
      return const PreferredSize(
        preferredSize: Size.zero,
        child: Placeholder(),
      );
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
        ),
      ),
    );
  }

  @override
  Size get preferredSize
  => appBar?.preferredSize ?? Size.zero;
}
