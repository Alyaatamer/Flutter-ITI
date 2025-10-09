import 'package:day7/core/style/app_color.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Omar!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text100Color,
                ),
              ),
              Text(
                'How Are you Today?',
                style: TextStyle(fontSize: 12, color: AppColors.text80Color),
              ),
            ],
          ),
        ),
        Image.asset('assets/images/notification.png'),
      ],
    );
  }
}
