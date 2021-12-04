import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountInitial()) {
    on<CountEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
