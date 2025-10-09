class SpecializationModel {
  final int id;
  final String name;

  SpecializationModel({required this.id, required this.name});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      SpecializationModel(id: json['id'], name: json['name']);
}
