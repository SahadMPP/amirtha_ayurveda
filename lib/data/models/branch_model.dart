import 'package:amirtha_ayurveda/domain/entities/branch_entitie.dart';

class BranchModel extends Branch {

  // ignore: use_super_parameters
  BranchModel({
    required id,
    required name,
    required patientsCount,
    required location,
    required phone,
    required mail,
    required address,
    required gst,
    required isActive,
  }) :super(address: address,gst:gst ,id: id,isActive: isActive,location: location,mail:mail ,name: name,patientsCount: patientsCount,phone: phone);



  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      patientsCount: json['patients_count'] ?? 0,
      location: json['location'] ?? '',
      phone: json['phone'] ?? '',
      mail: json['mail'] ?? '',
      address: json['address'] ?? '',
      gst: json['gst'] ?? '',
      isActive: json['is_active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'patients_count': patientsCount,
      'location': location,
      'phone': phone,
      'mail': mail,
      'address': address,
      'gst': gst,
      'is_active': isActive,
    };
  }
}