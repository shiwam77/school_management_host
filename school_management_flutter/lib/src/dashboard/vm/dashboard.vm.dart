import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class DashboardVm extends ViewModel {}

final dashboardVmProvider = ViewModelProviderFactory.create((ref) {
  return DashboardVm();
});
