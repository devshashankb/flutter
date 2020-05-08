import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapplication/models/models.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

// Event :  Fetch Event Request
class FetchWeather extends WeatherEvent {
  final String city;

  const FetchWeather({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

//TODO: Event : Refresh Event Request
class RefreshWeather extends WeatherEvent {
  final String city;

  const RefreshWeather({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}
