import 'dart:math';
import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ColorScreenState();
  }
}

class _ColorScreenState extends State<ColorScreen> {
  final Random _random = Random();
  final int _channelMax = 256;

  Color _backgroundColor = Colors.white;

  Color _generateRandomColor() {
    final red = _random.nextInt(_channelMax);
    final green = _random.nextInt(_channelMax);
    final blue = _random.nextInt(_channelMax);

    // 255 - alpha channel maximum value (always opaque)
    const alpha = 255;

    return Color.fromARGB(alpha, red, green, blue);
  }

  void _changeColor() {
    setState(() {
      _backgroundColor = _generateRandomColor();
    });
  }

  String _toHexString(Color color) {
    return '#'
            '${color.red.toRadixString(16).padLeft(2, '0')}'
            '${color.green.toRadixString(16).padLeft(2, '0')}'
            '${color.blue.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      behavior: HitTestBehavior.opaque,
      child: ColoredBox(
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Hello there",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  shadows: [
                    // white outline
                    Shadow(offset: Offset(-1.5, -1.5), color: Colors.white),
                    Shadow(offset: Offset(1.5, -1.5), color: Colors.white),
                    Shadow(offset: Offset(1.5, 1.5), color: Colors.white),
                    Shadow(offset: Offset(-1.5, 1.5), color: Colors.white),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Text(
                _toHexString(_backgroundColor),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  shadows: [
                    Shadow(offset: Offset(-1, -1), color: Colors.white),
                    Shadow(offset: Offset(1, -1), color: Colors.white),
                    Shadow(offset: Offset(1, 1), color: Colors.white),
                    Shadow(offset: Offset(-1, 1), color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
