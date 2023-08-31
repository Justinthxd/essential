part of 'folder_bloc.dart';

sealed class FolderState {}

final class FolderInitialState extends FolderState {}

final class FolderLoadidngState extends FolderState {}

final class FolderLoadedState extends FolderState {
  final List<InsightModel> folderName;

  FolderLoadedState(this.folderName);
}
