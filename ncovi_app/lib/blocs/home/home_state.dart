part of "home_bloc.dart";

abstract class HomeState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class HomeInitialState extends HomeState {
  List<Object> get props => null;
}

class HomeOnChangeTabState extends HomeState {
  final int selectIndex;

  HomeOnChangeTabState(this.selectIndex);
  List<Object> get props => [this.selectIndex];
}