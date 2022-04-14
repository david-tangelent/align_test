import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Stack and Align Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double alignX = 0;
  double alignY = 0;
  double nudgeSize = 0.1;

  void _nudgeRight() {
    setState(() {
      alignX = alignX + nudgeSize;
    });
  }

  void _nudgeLeft() {
    setState(() {
      alignX = alignX - nudgeSize;
    });
  }

  void _nudgeCenter() {
    setState(() {
      alignY = 0;
      alignX = 0;
    });
  }

  void _nudgeDown() {
    setState(() {
      alignY = alignY + nudgeSize;
    });
  }

  void _nudgeUp() {
    setState(() {
      alignY = alignY - nudgeSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(alignX, alignY),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${alignX.toStringAsFixed(2)}, ${alignY.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.5, 0.75),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: _nudgeLeft,
                child: const Icon(Icons.arrow_left),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.5, 0.75),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: _nudgeRight,
                child: const Icon(Icons.arrow_right),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.75),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: _nudgeCenter,
                child: const Icon(Icons.home),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.0, 0.55),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: _nudgeUp,
                child: const Icon(Icons.arrow_upward),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.95),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: _nudgeDown,
                child: const Icon(Icons.arrow_downward),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
