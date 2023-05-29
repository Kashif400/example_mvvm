import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback pressed;
  final String title;
  final bool loading;
  const RoundButton(
      {super.key,
      required this.pressed,
      required this.title,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(title)),
      ),
    );
  }
}
