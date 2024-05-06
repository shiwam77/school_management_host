import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class ApplyLeaveVM extends ViewModel {}

final applyLeaveVmProvider = ViewModelProviderFactory.create((ref) {
  return ApplyLeaveVM();
});
