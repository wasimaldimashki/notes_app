import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ViewMode { list, grid }

class ViewCubit extends HydratedCubit<ViewMode> {
  ViewCubit() : super(ViewMode.list);

  void toggleView() {
    emit(state == ViewMode.list ? ViewMode.grid : ViewMode.list);
  }

  @override
  ViewMode? fromJson(Map<String, dynamic> json) {
    return ViewMode.values[json['viewMode'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ViewMode state) {
    return {'viewMode': state.index};
  }
}
