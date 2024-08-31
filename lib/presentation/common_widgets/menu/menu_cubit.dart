import 'package:bloc/bloc.dart';

class MenuCubit extends Cubit<int> {
  MenuCubit() : super(0);

  int getData() {
    return state;
  }

  void setData(int value) {
    emit(value);
  }

  void reset() {
    emit(0);
  }
}
