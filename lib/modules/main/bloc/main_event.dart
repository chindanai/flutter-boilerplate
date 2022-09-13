part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class MainEventSelectedTab extends MainEvent {
  final int selectedIndex;

  const MainEventSelectedTab(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
