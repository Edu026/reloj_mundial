import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Stopwatch _stopwatch;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _toggleTimer() {
    setState(() {
      if (_stopwatch.isRunning) {
        _stopwatch.stop();
      } else {
        _stopwatch.start();
        // Inicia el Timer si el cronómetro se inicia
        Timer.periodic(Duration(milliseconds: 1), (timer) {
          if (mounted) {
            setState(() {});
          }
        });
      }
      _isRunning = !_isRunning;
    });
  }

  void _resetTimer() {
    setState(() {
      _stopwatch.reset();
      _isRunning = false;
    });
  }

  String _formatTime(Duration duration) {
    return '${duration.inHours.toString().padLeft(2, '0')}:'
        '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(duration.inSeconds % 60).toString().padLeft(2, '0')}.'
        '${(duration.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Stopwatch App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _formatTime(_stopwatch.elapsed),
              style: TextStyle(fontSize: 48.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                  onPressed: _toggleTimer,
                  color: _isRunning ? Colors.orange : Colors.green,
                  iconSize: 48.0,
                ),
                SizedBox(width: 20.0),
                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: _resetTimer,
                  color: Colors.red,
                  iconSize: 48.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
