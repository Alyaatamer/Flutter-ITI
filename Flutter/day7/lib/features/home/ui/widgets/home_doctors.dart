import 'package:cached_network_image/cached_network_image.dart';
import 'package:day7/core/style/app_color.dart';
import 'package:day7/features/home/logic/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDoctors extends StatelessWidget {
  const HomeDoctors({Key? key}) : super(key: key);

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
                  'Recommendation Doctors',
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
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Row(
                spacing: 10,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://www.future-doctor.de/wp-content/uploads/2024/08/shutterstock_2480850611.jpg',
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.doctors[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.text100Color,
                        ),
                      ),
                      Text(
                        '${provider.doctors[index].specialization.name} | ${provider.doctors[index].degree}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.bodyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: provider.doctors.length,
            ),
          ],
        );
      },
    );
  }
}
