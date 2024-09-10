import 'package:bloc/bloc.dart';

class ViewTestCubit extends Cubit<bool> {
  ViewTestCubit() : super(true);

  void setTesting() {
    emit(true);
  }

  void setNotTesting() {
    emit(false);
  }

  bool isTesting() {
    return state;
  }
}
