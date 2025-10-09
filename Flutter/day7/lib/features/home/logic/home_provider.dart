import 'package:day7/core/local_storage/shared_preferences_helper.dart';
import 'package:day7/core/networking/api_constants.dart';
import 'package:day7/core/networking/dio_factory.dart';
import 'package:day7/features/home/models/doctor_model.dart';
import 'package:day7/features/home/models/specialization_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<SpecializationModel> specializations = [];
  void getAllSpecializations() async {
    final token = SharedPreferencesHelper.getString('token')!;
    final response = await DioFactory.getData(
      ApiConstants.specializations,
      token,
    );
    final specializationsData = response.data['data'] as List;
    for (var specializationJson in specializationsData) {
      final specialization = SpecializationModel.fromJson(specializationJson);
      specializations.add(specialization);
    }
    notifyListeners();
  }

  List<DoctorModel> doctors = [];
  void getDoctor() async {
    final token = SharedPreferencesHelper.getString('token');
    final response = await DioFactory.getData(ApiConstants.doctors, token!);

    doctors = (response.data['data'] as List)
        .map((e) => DoctorModel.fromJson(e))
        .toList();
    notifyListeners();
    print(doctors.length);
  }
}
