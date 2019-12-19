import 'package:example_flutter/home.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

void main() {

	debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
	runApp(new MyApp());
}

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

		return MaterialApp(
			title: 'Flutter Desktop Example',
			theme: ThemeData(
				primarySwatch: Colors.indigo,
				fontFamily: 'Roboto',
			),
			darkTheme: ThemeData.dark(),
			home: Home(title: 'Flutter Desktop Example'),
		);
    }
}