import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

/// Stylish and modern short video recording button that closely resembles the familiar design seen in popular social media platforms like Instagram.
class RecordButton extends StatefulWidget {
  const RecordButton({
    Key? key,
    this.seconds = 20,
    this.width = 200,
    this.height = 200,
    this.showLabel = false,
    this.labelColor = Colors.blue,
    required this.onPlay,
    required this.onStop,
    required this.onComplete,
    this.fillColor = Colors.green,
    this.trackColor = Colors.black12,
    this.gradients = const [],
    this.strokeCap = StrokeCap.butt,
    this.enable = true,
    this.buttonColor = Colors.red,
    required this.onLongPressStart,
    required this.onLongPressUp,
  }) : super(key: key);

  final int seconds;
  final double width;
  final double height;
  final bool showLabel;
  final bool enable;
  final Color labelColor;
  final Color buttonColor;
  final Color fillColor;
  final Color trackColor;
  final StrokeCap strokeCap;
  final List<Color> gradients;
  final VoidCallback onPlay;
  final Function(int value) onStop;
  final Function(int value) onComplete;
  final VoidCallback onLongPressStart;
  final VoidCallback onLongPressUp;

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  late _RecordController recordController;

  @override
  void initState() {
    super.initState();
    recordController = _RecordController(
      seconds: widget.seconds,
      onComplete: widget.onComplete,
      onPlay: widget.onPlay,
      onStop: widget.onStop,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: false,
      child: Center(
        child: GestureDetector(
          onLongPressStart: (details) {
            recordController.play();
            widget.onLongPressStart.call();
          },
          onLongPressUp: () {
            recordController.stop(manualStop: true);
            widget.onLongPressUp.call();
          },
          onTap: () {},
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: ListenableBuilder(
                listenable: recordController,
                builder: (context, child) {
                  return CustomPaint(
                      painter: _MyPainter(
                        value: recordController.value.toInt(),
                        seconds: widget.seconds,
                        fillColor: widget.fillColor,
                        trackColor: widget.trackColor,
                        showLabel: widget.showLabel,
                        labelColor: widget.labelColor,
                        gradients: widget.gradients,
                        strokeCap: widget.strokeCap,
                        enable: widget.enable,
                        buttonColor: widget.buttonColor,
                      ));
                }),
          ),
        ),
      ),
    );
  }
}

class _RecordController with ChangeNotifier {
  final int seconds;
  VoidCallback onPlay;
  Function(int value) onStop;
  Function(int value) onComplete;

  _RecordController({required this.seconds, required this.onComplete, required this.onStop, required this.onPlay});

  Timer? _timer;
  int _value = 0;
  bool _isActive = false;

  bool get isActive => _isActive;

  int get value => _value;

  void play() {
    if (_timer != null) return;
    _value = 0;
    onPlay();
    _play();
  }

  void _play() {
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      int milliseconds = seconds * 1000;
      if (milliseconds < _value) {
        stop();
      }
      _value = timer.tick;
      notifyListeners();
    });
    _isActive = _timer!.isActive;
    notifyListeners();
  }

  void stop({bool manualStop = false}) {
    _timer?.cancel();
    _timer = null;
    manualStop ? onStop(_value ~/ 1000) : onComplete(_value ~/ 1000);
    _value = 0;
    _isActive = false;
    notifyListeners();
  }
}

class _MyPainter extends CustomPainter {
  _MyPainter({
    required this.value,
    this.trackColor,
    this.strokeCap = StrokeCap.butt,
    this.fillColor,
    this.seconds = 30,
    this.labelColor = Colors.blue,
    this.buttonColor = Colors.red,
    this.showLabel = false,
    this.enable = true,
    this.gradients = const [],
  });

  final int value; // 0 to 10
  final int seconds;
  final Color? trackColor;
  final Color? fillColor;
  final List<Color> gradients;
  final bool showLabel;
  final bool enable;
  final StrokeCap strokeCap;
  final Color labelColor;
  final Color buttonColor;

  @override
  void paint(Canvas canvas, Size size) {
    // Get the center of the canvas
    var bgColor = trackColor ?? Colors.black12;
    var fgColor = fillColor ?? Colors.green;
    var width = size.width;
    var height = size.height;
    final center = Offset(width / 2, height / 2);
    double strokeWidth = width / 10;

    // Draw the gray background seen on the progress indicator
    // This will act as the background layer.

    var innerCirclePaint = Paint();
    if (enable) {
      innerCirclePaint.color = buttonColor;
    } else {
      innerCirclePaint.color = bgColor;
    }
    canvas.drawCircle(
      center,
      (width / 2) - (strokeWidth),
      innerCirclePaint
        ..style = PaintingStyle.fill
        ..strokeWidth = strokeWidth,
    );

    var outerCirclePaint = Paint();
    if (enable) {
      outerCirclePaint.color = bgColor;
    } else {
      outerCirclePaint.color = buttonColor.withOpacity(0.6);
    }
    canvas.drawCircle(
      center,
      (width / 2) - (strokeWidth / 2),
      outerCirclePaint
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    // Create a new layer where we will be painting the
    // actual progress indicator
    canvas.saveLayer(
      Rect.fromCenter(center: center, width: width, height: height),
      Paint(),
    );

    var rect = Rect.fromCircle(
      center: center,
      radius: 360,
    );

    var fillPaint = Paint();

    if (gradients.isNotEmpty) {
      fillPaint.shader = LinearGradient(
        colors: gradients.reversed.toList(),
      ).createShader(rect);
    } else {
      fillPaint.color = fgColor;
    }
    canvas.drawArc(
      Rect.fromCenter(center: center, width: width - strokeWidth, height: height - strokeWidth),
      radians(-90),
      radians(value / (seconds * 1000) * 360),
      false,
      fillPaint
        ..style = PaintingStyle.stroke
        ..strokeCap = strokeCap
        ..strokeWidth = strokeWidth,
    );

    TextSpan span = TextSpan(style: TextStyle(color: labelColor, fontSize: width / 2), text: (value ~/ 1000).toString());
    TextPainter tp = TextPainter(textAlign: TextAlign.center, text: span, textDirection: TextDirection.ltr);
    tp.layout();
    if (showLabel) {
      tp.paint(
        canvas,
        Offset(
          (width - tp.width) * 0.5,
          (height - tp.height) * 0.5,
        ),
      );
    }
    canvas.restore();
  }

  double radians(double degree) {
    return degree * (pi / 180);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}