import 'package:flutter/material.dart';

class CardStaticsWidget extends StatelessWidget {
  final IconData iconData;
  final int number;
  final Color iconColor;
  const CardStaticsWidget({
    super.key,
    required this.iconData,
    required this.number,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: ColoredBox(
                color: iconColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    iconData,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 26),
            Text(
              number.toString(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
