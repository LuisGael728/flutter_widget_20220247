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
  String _name = 'John'; // Variable para el nombre

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
            AnimatedAlign(
              alignment: _animateAlign ? Alignment.topRight : Alignment.bottomLeft,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 50.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                Image(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  width: 100.0,
                  height: 100.0,
                ),
              ],
            ),
            AnimatedContainer(
              width: _animateAlign ? 200.0 : 100.0,
              height: _animateAlign ? 100.0 : 200.0,
              color: _animateAlign ? Colors.red : Colors.blue,
              alignment: _animateAlign ? Alignment.center : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 75),
            ),
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
            ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 200.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Hello, $_name! How are you?',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Hello ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: '$_name',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  TextSpan(text: '! How are you?'),
                ],
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Hello World!'),
              ),
            ),
            const RotatedBox(
              quarterTurns: 3,
              child: Text('Hello World!'),
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: 0.5,
                child: Image.network(
                  'https://example.com/userAvatar.jpg',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            Opacity(
              opacity: _visible ? 1.0 : 0.0,
              child: const Text("Now you see me, now you don't!"),
            ),

            // Nuevo widget AspectRatio
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              width: double.infinity,
              height: 100.0,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.green,
                ),
              ),
            ),

            // Nuevo widget ElevatedButton
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  onPressed: null,
                  child: const Text('Disabled'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Enabled'),
                ),
              ],
            ),

            // Nuevo widget DecoratedBox
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-0.5, -0.6),
                  radius: 0.15,
                  colors: <Color>[
                    Color(0xFFEEEEEE),
                    Color(0xFF111133),
                  ],
                  stops: <double>[0.9, 1.0],
                ),
              ),
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
  bool _visible = true;
}


