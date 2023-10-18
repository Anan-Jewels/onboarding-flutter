import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSelectionCubit extends Cubit<Map<String, bool>> {
  ProductSelectionCubit() : super({});

  void select(String id) {
    var currentState = state;
    currentState[id] = true;
    emit(Map.from(currentState));
  }

  void deselect(String id) {
    var currentState = state;
    currentState[id] = false;
   emit(Map.from(currentState));
  }
}
