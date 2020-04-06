import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './home_event.dart';
part './home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  // TODO: implement initialState
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    // TODO: implement mapEventToState
    if(event is OnTabChangeEvent) {
      if(event.selectIndex == 1)
        yield HomeOnChangeTabState(1);
      else if (event.selectIndex == 2)
        yield HomeOnChangeTabState(2);
      else
        yield HomeOnChangeTabState(0);
    }
  }

}