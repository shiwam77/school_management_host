import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class ClassVM extends ViewModel {
  final List<String> sectionNames = ['A', 'B', 'C'];
  List<String> selectedSections = [];
}

final classVmProvider = ViewModelProviderFactory.create((ref) {
  return ClassVM();
});
