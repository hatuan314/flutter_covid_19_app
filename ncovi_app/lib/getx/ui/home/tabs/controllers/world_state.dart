import 'package:equatable/equatable.dart';

import 'package:ncoviapp/getx/common/enums/view_state.dart';
import 'package:ncoviapp/models/model.dart';

class WorldState extends Equatable {
  final ViewState viewState;
  final World world;

  WorldState({this.viewState, this.world});

  WorldState copyWith({ViewState viewState, World world}) => WorldState(
    viewState: viewState ?? this.viewState,
    world: world ?? this.world,
  );

  @override
  List<Object> get props => [this.viewState, this.world];
}