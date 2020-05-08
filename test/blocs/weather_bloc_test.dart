import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weatherapplication/blocs/blocs.dart';
import 'package:weatherapplication/models/models.dart';
import 'package:weatherapplication/repositories/repositories.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  MockWeatherRepository mockWeatherRepository;
  Weather weather = Weather(
      minTemp: 0.0,
      maxTemp: 10.0,
      temp: 9.0,
      formattedCondition: 'Light Cloud',
      locationId: 2379574,
      location: 'Chicago',
      lastUpdated: DateTime.now());

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
  });

  test('emits [WeatherLoading, WeatherLoaded] when successful', () async {
    when(mockWeatherRepository.getWeather(any))
        .thenAnswer((_) async => weather);
    final bloc = WeatherBloc(weatherRepository: mockWeatherRepository);
    bloc.add(FetchWeather(city: 'Chicago'));
    await emitsExactly(
        bloc, [WeatherLoading(), WeatherLoaded(weather: weather)]);
  });

  test('emits [WeatherLoading, WeatherError] when unsuccessful', () async {
    when(mockWeatherRepository.getWeather(any))
        .thenAnswer((_) async => weather);
    final bloc = WeatherBloc(weatherRepository: mockWeatherRepository);
    bloc.add(FetchWeather(city: 'Chicago'));
    await emitsExactly(
        bloc, [WeatherLoading(), WeatherLoaded(weather: weather)]);
  });
}
