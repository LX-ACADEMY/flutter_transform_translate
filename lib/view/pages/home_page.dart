import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset position = const Offset(0, 0);
  Offset downPosition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.translate(
        offset: position,
        child: GestureDetector(
          onTap: () {
            print('asdadsd');
          },
          onHorizontalDragDown: (details) {
            downPosition = details.localPosition;
          },
          onHorizontalDragUpdate: (details) {
            setState(() {
              position = Offset(
                details.globalPosition.dx - downPosition.dx,
                details.globalPosition.dy - downPosition.dy,
              );
            });
          },
          // onVerticalDragUpdate: (details) {
          //   print(details.globalPosition);
          // },
          child: Container(
            height: 100,
            width: 100,
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
