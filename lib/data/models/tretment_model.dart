import 'package:amirtha_ayurveda/data/models/branch_model.dart';
import 'package:amirtha_ayurveda/domain/entities/treatment_entitie.dart';

class TreatmentModel extends Treatment {
  // ignore: use_super_parameters
  TreatmentModel({
    required id,
    required branches,
  }) : super(branches: branches, id: id);

  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    var branchesList = json['branches'] as List;
    List<BranchModel> branchList =
        branchesList.map((i) => BranchModel.fromJson(i)).toList();

    return TreatmentModel(
      id: json['id'] ?? 0,
      branches: branchList,
    );
  }
}
