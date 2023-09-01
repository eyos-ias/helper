import 'package:flutter/material.dart';
import 'package:helper/Animiya.dart';
import 'package:helper/Asthma.dart';
import 'package:helper/BloodcountScreen.dart';
import 'package:helper/DiabetesScreen.dart';
import 'package:helper/EpilepsyScreen.dart';
import 'package:helper/bloodScreen.dart';
import 'package:helper/heartScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Information Guide'),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            )),
        body: Center(
          child: ButtonLayout(),
        ),
      ),
    );
  }
}

class ButtonLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              text: ' heart failure',
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => heartScreen()),
                );
              },
            ),
            CustomButton(
              text: 'Blood presure',
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => bloodScren()),
                );
              },
            ),
            CustomButton(
              text: 'Animiya',
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Animiya()),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              text: 'Blood count',
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BloodcountScreen()));
              },
            ),
            CustomButton(
              text: 'Epilepsy',
              color: Colors.purple,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EpilepsyScreen()));
              },
            ),
            CustomButton(
              text: 'Diabetes',
              color: Colors.yellow,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DiabetesScreen()));
              },
            ),
            CustomButton(
              text: 'Asthma',
              color: Colors.teal,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Asthma()));
              },
            ),
          ],
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
