import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class SectionVM extends ViewModel {}

final sectionVmProvider = ViewModelProviderFactory.create((ref) {
  return SectionVM();
});
