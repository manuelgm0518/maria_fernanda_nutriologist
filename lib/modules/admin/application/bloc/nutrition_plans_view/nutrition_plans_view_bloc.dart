import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_plans_view_event.dart';
part 'nutrition_plans_view_state.dart';
part 'nutrition_plans_view_bloc.freezed.dart';

class NutritionPlansViewBloc extends Bloc<NutritionPlansViewEvent, NutritionPlansViewState> {
  NutritionPlansViewBloc() : super(_Initial()) {
    on<NutritionPlansViewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
