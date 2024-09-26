import 'package:flutter_bloc/flutter_bloc.dart';

class ReserveFieldCardCubit extends Cubit<bool> {
  ReserveFieldCardCubit() : super(false);

  void refresh() {
    emit(!state);
  }
}
