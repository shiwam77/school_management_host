import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class StudentCategoryVM extends ViewModel {}

final studentCategoryVmProvider = ViewModelProviderFactory.create((ref) {
  return StudentCategoryVM();
});
