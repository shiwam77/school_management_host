import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class SubjectGroupVM extends ViewModel {
  final List<String> sectionNames = ['A', 'B', 'C'];
  final List<String> subjectNames = ['Math', 'English', 'Social'];
  final List<String> classes = ['Class 1', 'Class 2', 'Class 3', 'Class 4'];
  String? selectedClass;

  List<String> selectedSections = [];
  List<String> selectedSubject = [];

  @override
  void initState() {
    super.initState();
    selectedClass = classes[0];
  }
}

final subjectGroupVmProvider = ViewModelProviderFactory.create((ref) {
  return SubjectGroupVM();
});
