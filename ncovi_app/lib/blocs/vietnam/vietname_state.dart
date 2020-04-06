part of 'vietnam_bloc.dart';

abstract class VietnamState extends Equatable {
  const VietnamState();
}

class VietnamLoadingState extends VietnamState {
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class VietnamNoDataState extends VietnamState {
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class VietnamSuccessState extends VietnamState {
  final Country ncovid;

  VietnamSuccessState(this.ncovid);
  @override
  // TODO: implement props
  List<Object> get props => [this.ncovid];

}

class VietnamFailureState extends VietnamState {
  final String error;

  VietnamFailureState(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [this.error];

  @override
  String toString() => "VietnamFailureState {error: $error}";

}