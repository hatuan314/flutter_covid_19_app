part of 'world_bloc.dart';

abstract class WorldState extends Equatable {
  const WorldState();
}

class WorldLoaidingState extends WorldState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WorldNoDataState extends WorldState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class WorldSuccessState extends WorldState {
  final World world;

  WorldSuccessState(this.world);

  @override
  // TODO: implement props
  List<Object> get props => [this.world];
}

class WorldFailureState extends WorldState {
  final String error;

  WorldFailureState(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [this.error];

  @override
  String toString() => "WorldFailureState {error: $error}";

}
