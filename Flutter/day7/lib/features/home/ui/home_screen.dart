import 'package:day7/features/home/logic/home_provider.dart';
import 'package:day7/features/home/ui/widgets/home_banner.dart';
import 'package:day7/features/home/ui/widgets/home_doctors.dart';
import 'package:day7/features/home/ui/widgets/home_header.dart';
import 'package:day7/features/home/ui/widgets/home_specializations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider()
        ..getAllSpecializations()
        ..getDoctor(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                spacing: 16,
                children: [
                  HomeHeader(),
                  HomeBanner(),
                  HomeSpecializations(),
                  HomeDoctors(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
