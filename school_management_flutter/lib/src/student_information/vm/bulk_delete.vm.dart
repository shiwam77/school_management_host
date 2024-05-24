import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class BulkDeleteVM extends ViewModel {
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
  String? selectedMode;

  void setSelectedMode(String? mode) {
    setState(() {
      selectedMode = mode;
    });
  }
}

final bulkDeleteVmProvider = ViewModelProviderFactory.create((ref) {
  return BulkDeleteVM();
});
