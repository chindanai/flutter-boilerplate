import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainEventSelectedTab>(_onSeleectedTab);
  }

  void _onSeleectedTab(
    MainEventSelectedTab event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(
      selectedIndex: event.selectedIndex,
    ));
  }
}
