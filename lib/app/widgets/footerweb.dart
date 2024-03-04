import 'package:flutter/material.dart';

class FooterWeb extends StatelessWidget {
  const FooterWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Set width to full screen
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      color: Color(0xFF003D38),
      child: Center(
        // Center the content horizontally
        child: Text(
          "©Copyright SmartLib, All Rights Reserved",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
