import 'package:bloc/bloc.dart';

List<int> _dropdownAmount = List.generate(4, (index) => -1);

class CustomDropdownDataCubit extends Cubit<List<int>> {
  CustomDropdownDataCubit() : super(_dropdownAmount);

  int getData(int index) {
    return state[index];
  }

  void updateData(int index, int value) {
    if (index > (_dropdownAmount.length - 1)) {
      return;
    }

    List<int> list = state;

    list[index] = value;

    emit(list);
  }

  void reset() {
    emit(_resetValues());
  }

  List<int> _resetValues() {
    List<int> list = List<int>.filled(state.length, -1);
    return list;
  }
}
