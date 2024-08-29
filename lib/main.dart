import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SizedBox.shrink(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomButton(
              text: 'Click Me',
              color: Colors.pink,
              onPressed: () {
                print('Button Pressed!');
              },
            ),
            ToggleSwitch(
              initialValue: true,
              onChanged: (value) {
                print('Switch is now: $value');
              },
            )

          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(text ,style: TextStyle(color: Colors.white),),
    );
  }
}

class ToggleSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  ToggleSwitch({required this.initialValue, required this.onChanged});

  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isOn,
      onChanged: (value) {
        setState(() {
          _isOn = value;
        });
        widget.onChanged(value);
      },
    );
  }
}
