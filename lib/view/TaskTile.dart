import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
// import  'package:myapp/view/TodoScreen.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.size,
    required this.text,
    this.time,
    this.des,
    required this.press,
  }) : super(key: key);

  final Size size;
  final TextTheme text;

  final String? time, des;
  final Callback? press;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Colors.pink,
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: size.width * 0.1,
              height: double.maxFinite,
              color: Color.fromARGB(255, 214, 142, 166),
              child: Text(
                "$time",
                style: text.headline5!.copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "$des",
                  style: text.headline6,
                ),
              ),
            ),
            GestureDetector(
              onTap: press,
              child: Container(
                alignment: Alignment.center,
                width: size.width * 0.1,
                height: double.maxFinite,
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
