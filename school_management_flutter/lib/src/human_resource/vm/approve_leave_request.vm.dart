import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class ApproveLeaveRequestVM extends ViewModel {}

final approveLeaveRequestVmProvider = ViewModelProviderFactory.create((ref) {
  return ApproveLeaveRequestVM();
});
