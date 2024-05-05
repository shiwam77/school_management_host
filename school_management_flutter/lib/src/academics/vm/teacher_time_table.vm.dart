import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class TeacherTimeTableVM extends ViewModel {
  String? selectedTeacher;

  final List<String> teachers = [
    'Ram',
    'Shyam',
    'Gita',
  ];
}

final teacherTimeTableVmProvider = ViewModelProviderFactory.create((ref) {
  return TeacherTimeTableVM();
});
