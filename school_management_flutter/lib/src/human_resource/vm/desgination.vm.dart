import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class DesginationVM extends ViewModel {}

final desginationVmProvider = ViewModelProviderFactory.create((ref) {
  return DesginationVM();
});
