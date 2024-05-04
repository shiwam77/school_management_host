import 'package:flutter/material.dart';
import 'package:school_management_flutter/src/dashboard/vm/dashboard.vm.dart';
import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';

class DashboardScreen extends StatelessView<DashboardVm> {
  const DashboardScreen({super.key});

  @override
  ViewModelProvider<DashboardVm> get vm => dashboardVmProvider;

  @override
  Widget render(BuildContext context, DashboardVm vm, ref) {
    return Placeholder();
  }
}
