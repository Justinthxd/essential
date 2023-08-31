part of 'folder_bloc.dart';

sealed class FolderEvent {}

final class FolderNameEvent extends FolderEvent {
  final InsightModel folder;

  FolderNameEvent(this.folder);
}
