import 'package:bloc/bloc.dart';

class ErrorMessageCubit extends Cubit<String> {
  ErrorMessageCubit() : super("");

  void setValue(String value) {
    emit(value);

    Future.delayed(const Duration(seconds: 5), () {
      reset();
    });
  }

  void reset() => emit("");
}
