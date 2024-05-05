import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class SubjectVM extends ViewModel {
  String? selectedMode;

  void setSelectedMode(String? mode) {
    setState(() {
      selectedMode = mode;
    });
  }
}

final subjectVmProvider = ViewModelProviderFactory.create((ref) {
  return SubjectVM();
});
