import 'package:flutter/material.dart';

import '../localization/string_hardcoded.dart';
import '../common_widgets/empty_placeholder_widget.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EmptyPlaceholderWidget(
        message: '404 - Page not found!'.hardcoded,
      ),
    );
  }
}
