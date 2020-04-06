import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncoviapp/models/model.dart';
import 'package:ncoviapp/service/service.dart';

part './world_event.dart';

part './world_state.dart';

class WorldBloc extends Bloc<WorldEvent, WorldState> {
  Repository _repository = Repository();
  @override
  // TODO: implement initialState
  WorldState get initialState => WorldLoaidingState();

  @override
  Stream<WorldState> mapEventToState(WorldEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetWorldNcovidDataEvent) {
      try {
        var resuilt = await _repository.fetchWorldNcovidData();
        if (resuilt == null) {
          yield WorldNoDataState();
        } else {
          World world = resuilt;
          yield WorldSuccessState(world);
        }
      } catch(e) {
        yield WorldFailureState(e);
      }
    }
  }

}
