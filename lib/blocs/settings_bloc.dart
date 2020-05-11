import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapplication/blocs/blocs.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  final SettingsState initialState =
      SettingsState(temperatureUnits: TemperatureUnits.celsius);

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is TemperatureUnitsToggled) {
      yield SettingsState(
        temperatureUnits: state.temperatureUnits == TemperatureUnits.celsius
            ? TemperatureUnits.fahrenheit
            : TemperatureUnits.celsius,
      );
    }
  }
}
