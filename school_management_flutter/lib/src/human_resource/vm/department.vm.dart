import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class DepartmentVM extends ViewModel {}

final departmentVmProvider = ViewModelProviderFactory.create((ref) {
  return DepartmentVM();
});
