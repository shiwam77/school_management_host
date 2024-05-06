import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class LeaveTypeVM extends ViewModel {}

final leaveTypeVmProvider = ViewModelProviderFactory.create((ref) {
  return LeaveTypeVM();
});
