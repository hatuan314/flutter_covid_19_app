import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ncoviapp/getx/common/enums/view_state.dart';
import 'package:ncoviapp/models/country/country.dart';

class VietnamState extends Equatable {
  final ViewState viewState;
  final Country country;

  VietnamState({@required this.country, @required this.viewState});

  VietnamState copyWith({ViewState viewState, Country country}) => VietnamState(
        country: country ?? this.country,
        viewState: viewState ?? this.viewState,
      );

  @override
  List<Object> get props => [this.viewState, this.country];
}
