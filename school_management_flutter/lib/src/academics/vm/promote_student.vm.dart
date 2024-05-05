import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class PromoteStudentVM extends ViewModel {
  final List<String> sectionNames = ['A', 'B', 'C'];
  final List<String> subjectNames = ['Math', 'English', 'Social'];
  final List<String> classes = ['Class 1', 'Class 2', 'Class 3', 'Class 4'];
  final List<String> session = [
    '2017 - 2018',
    '2018 - 2019',
    '2020 - 2021',
    '2021 - 2022',
    '2022 - 2023',
    '2023 - 2024'
  ];
  String? selectedClass;
  String? selectedSection;
  String? selectedSession;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedClass = classes[0];
    selectedSection = sectionNames[0];
    selectedSession = session[0];
  }
}

final promoteStudentVmProvider = ViewModelProviderFactory.create((ref) {
  return PromoteStudentVM();
});
