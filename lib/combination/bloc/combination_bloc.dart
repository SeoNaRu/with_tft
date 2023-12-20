import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'combination_event.dart';
part 'combination_state.dart';

class CombinationBloc extends Bloc<CombinationEvent, CombinationState> {
  CombinationBloc() : super(CombinationInitial()) {
    on<CombinationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
