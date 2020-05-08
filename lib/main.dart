import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapplication/simple_bloc_delegate.dart';

import 'blocs/blocs.dart';
import 'repositories/weather_api_client.dart';
import 'repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapplication/widgets/widgets.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(weatherRepository: weatherRepository));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: weatherRepository),
        child: Weather(),
      ),
    );
  }
}
