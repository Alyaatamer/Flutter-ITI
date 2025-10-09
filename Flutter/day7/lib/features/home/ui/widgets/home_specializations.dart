import 'package:day7/core/style/app_color.dart';
import 'package:day7/features/home/logic/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSpecializations extends StatelessWidget {
  const HomeSpecializations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Column(
          spacing: 12,
          children: [
            Row(
              children: [
                Text(
                  'Doctor Speciality',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.text100Color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                TextButton(onPressed: () {}, child: Text('See All')),
              ],
            ),
            SizedBox(
              height: 72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.category),
                      ),
                      Text(provider.specializations[index].name),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 16),
                itemCount: provider.specializations.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
