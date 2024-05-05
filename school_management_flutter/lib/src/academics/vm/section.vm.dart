import 'package:statemanagement_riverpod_mvvm/riverpod_mvvm.dart';
import 'package:flutter/material.dart';

class SectionVM extends ViewModel {}

final sectionVmProvider = ViewModelProviderFactory.create((ref) {
  return SectionVM();
});
