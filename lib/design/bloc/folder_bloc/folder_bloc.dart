import 'package:essential/data/models/insight_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'folder_event.dart';
part 'folder_state.dart';

class FolderBloc extends Bloc<FolderEvent, FolderState> {
  FolderBloc() : super(FolderLoadedState([])) {
    on<FolderEvent>((event, emit) {
      if (event is FolderNameEvent) {
        final currentState = state as FolderLoadedState;

        final name = event.folder;

        final List<InsightModel> folder = [name];

        emit(FolderLoadedState(currentState.folderName + folder));
      }
    });
  }
}
