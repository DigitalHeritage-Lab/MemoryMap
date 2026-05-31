import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SafeCubit<State> extends Cubit<State> {
  SafeCubit(super.initialState);

  bool get isAlive => !isClosed;

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
