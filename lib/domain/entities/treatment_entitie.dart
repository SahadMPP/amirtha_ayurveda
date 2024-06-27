import 'package:amirtha_ayurveda/data/models/branch_model.dart';

class Treatment {
  int id;
  List<BranchModel> branches;

  Treatment({
    required this.id,
    required this.branches,
  });

  factory Treatment.fromJson(Map<String, dynamic> json) {
    var branchesList = json['branches'] as List;
    List<BranchModel> branchList = branchesList.map((i) => BranchModel.fromJson(i)).toList();

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
