import 'package:flutter/material.dart';
import 'package:maps_learning/vmap.dart';
import 'package:provider/provider.dart';

import 'selected_item/selected_item_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedItemNotifier(),
      child: const MaterialApp(
        home: VMap(),
      ),
    );
  }
}
