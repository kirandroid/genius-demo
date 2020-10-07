import 'package:flutter/material.dart';
import 'package:genius_demo/core/utils/text_style.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';

class IAmAwesomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.background,
        brightness: context.theme.brightness,
        iconTheme: IconThemeData(color: context.theme.textColor),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "🎉🎉🎉",
              style: TextStyle(fontSize: 60),
            ),
            const SizedBox(height: 20),
            Text(
              "I am Awesome!",
              style: StyleText.montMedium
                  .copyWith(color: context.theme.textColor, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
