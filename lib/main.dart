import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  bool _animateAlign = false;
  late final AnimationController _builderController = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  bool _first = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _animateAlign = !_animateAlign;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // Widget Row con Iconos 'check'
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 24.0,
                ),
                Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 30.0,
                ),
                Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 36.0,
                ),
              ],
            ),
            // Widget AnimatedAlign
            AnimatedAlign(
              alignment: _animateAlign ? Alignment.topRight : Alignment.bottomLeft,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 50.0),
            ),
            // Widget AnimatedBuilder y Texto explicativo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Widget AnimatedBuilder
                AnimatedBuilder(
                  animation: _builderController,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.green,
                    child: const Center(
                      child: Text('Whee!'),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _builderController.value * 2.0 * 3.1415926535897932,
                      child: child,
                    );
                  },
                ),
                const SizedBox(
                  width: 16.0,
                ),
                // Widget Imagen con NetworkImage
                Image(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  width: 100.0,
                  height: 100.0,
                ),
              ],
            ),
            // Widget AnimatedContainer
            AnimatedContainer(
              width: _animateAlign ? 200.0 : 100.0,
              height: _animateAlign ? 100.0 : 200.0,
              color: _animateAlign ? Colors.red : Colors.blue,
              alignment: _animateAlign ? Alignment.center : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 75),
            ),
            // Widget AnimatedCrossFade
            GestureDetector(
              onTap: () {
                setState(() {
                  _first = !_first;
                });
              },
              child: AnimatedCrossFade(
                duration: const Duration(seconds: 3),
                firstChild: const FlutterLogo(
                    style: FlutterLogoStyle.horizontal, size: 100.0),
                secondChild: const FlutterLogo(
                    style: FlutterLogoStyle.stacked, size: 100.0),
                crossFadeState:
                    _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              ),
            ),
            // Widget AnimatedDefaultTextStyle
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTextStyle = !_selectedTextStyle;
                });
              },
              child: AnimatedDefaultTextStyle(
                duration: const Duration(seconds: 1),
                style: _selectedTextStyle
                    ? Theme.of(context).textTheme.headline6!
                    : Theme.of(context).textTheme.bodyText2!,
                child: const Text('Animated Text'),
              ),
            ),
            // Widget BackdropFilter
            Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Text('0' * 10000),
                Center(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: 200.0,
                        height: 200.0,
                        child: const Text('Hello World'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  bool _selectedTextStyle = true;
}

