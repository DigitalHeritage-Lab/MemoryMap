// We need to override emit/add to check block status, which requires ignoring
// this diagnostic.
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SafeBloc<Event, State> extends Bloc<Event, State> {
  SafeBloc(super.initialState);

  bool get isAlive => !isClosed;

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  void add(Event event) {
    if (!isClosed) {
      super.add(event);
    }
  }
}
