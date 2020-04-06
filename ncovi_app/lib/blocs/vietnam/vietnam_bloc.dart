import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncoviapp/models/model.dart';
import 'package:ncoviapp/service/service.dart';

part './vietnam_event.dart';

part './vietname_state.dart';

class VietnamBloc extends Bloc<VietnamEvent, VietnamState> {
  Repository _repository = Repository();

  @override
  // TODO: implement initialState
  VietnamState get initialState => VietnamLoadingState();

  @override
  Stream<VietnamState> mapEventToState(VietnamEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetVietnamNcovidDataEvent) {
      try {
        var resuilt = await _repository.fetchVietnamNcovidData();
        Country ncovid = resuilt;
        if (ncovid == null) {
          yield VietnamNoDataState();
        } else {
          yield VietnamSuccessState(ncovid);
        }
      } catch (e) {
        yield VietnamFailureState(e);
      }
    }
  }
}
