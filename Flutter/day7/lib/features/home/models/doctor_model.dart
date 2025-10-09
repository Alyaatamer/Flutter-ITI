import 'package:day7/features/home/models/specialization_model.dart';

class DoctorModel {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final SpecializationModel specialization;
  final num appointPrice;
  final String startTime;
  final String endTime;

  DoctorModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    email: json['email'],
    gender: json['gender'],
    address: json['address'],
    description: json['description'],
    degree: json['degree'],
    specialization: SpecializationModel.fromJson(json['specialization']),
    appointPrice: json['appoint_price'],
    startTime: json['start_time'],
    endTime: json['end_time'],
  );
}
