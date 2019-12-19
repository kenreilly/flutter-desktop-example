import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:color_panel/color_panel.dart';

class Home extends StatefulWidget {

	Home({Key key, this.title}) : super(key: key);

	final String title;

	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

	int _counter = 0;
	
	Color _color = Colors.white;

	void _increment() => setState(() { _counter++; });
	
	void _decrememt() => setState(() { _counter--; });

	void _showPanel() {

		final colorPanel = ColorPanel.instance;
		if (colorPanel.showing) return;

		colorPanel.show(this._onGetColor, showAlpha: false);
	}

	void _onGetColor(Color color) => setState(() { _color = color; });

	@override
	Widget build(BuildContext context) {

		final TextTheme _theme = Theme.of(context).textTheme;
		final TextStyle _style1 = _theme.body1.copyWith(color: _color);
		final TextStyle _style2 = _theme.display1.copyWith(color: _color);

		final String _os = Platform.operatingSystem;
		final String _osVersion = Platform.localHostname;
		final String _numCores = Platform.numberOfProcessors.toString();

		return Scaffold(
			appBar: AppBar(title: Text(widget.title)),
			body: 	Row(
					mainAxisAlignment: MainAxisAlignment.spaceEvenly,
					children: <Widget>[

						Column(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: <Widget>[
								FlatButton.icon(
									label: Text('Set Color'),
									icon: Icon(Icons.color_lens),
									onPressed: _showPanel,
									clipBehavior: Clip.none,
								),
								FlatButton.icon(
									label: Text('Counter +'),
									icon: Icon(Icons.add_circle),
									onPressed: _increment,
									clipBehavior: Clip.none,
								),
								FlatButton.icon(
									label: Text('Counter -'),
									icon: Icon(Icons.remove_circle),
									onPressed: _decrememt,
									clipBehavior: Clip.none
								)
							]
						),
						Column(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: <Widget>[
								Text("OS: " + _os, style: _style1),
								Text('Hostname: ' + _osVersion, style: _style1),
								Text('CPU Cores: ' + _numCores, style: _style1),
								Text('$_counter', style: _style2)
							]
						)
					]
				)
		);
	}
}
