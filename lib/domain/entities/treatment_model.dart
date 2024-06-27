import 'package:amirtha_ayurveda/domain/entities/branch_model.dart';

class Treatment {
  int id;
  List<Branch> branches;

  Treatment({
    required this.id,
    required this.branches,
  });

  factory Treatment.fromJson(Map<String, dynamic> json) {
    var branchesList = json['branches'] as List;
    List<Branch> branchList = branchesList.map((i) => Branch.fromJson(i)).toList();

    return Treatment(
      id: json['id'] ?? 0,
      branches: branchList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'branches': branches.map((branch) => branch.toJson()).toList(),
    };
  }
}
