import 'package:bloc/bloc.dart';

List<bool> _dropdownAmount = List.generate(4, (index) => false);

class CustomDropdownOpenCubit extends Cubit<List<bool>> {
  CustomDropdownOpenCubit() : super(_dropdownAmount);

  void open(int value) {
    List<bool> list = _resetValues();
    list[value] = true;
    emit(list);
  }

  void reset() {
    List<bool> list = _resetValues();
    emit(list);
  }

  List<bool> _resetValues() {
    List<bool> list = List<bool>.filled(state.length, false);
    return list;
  }
}
