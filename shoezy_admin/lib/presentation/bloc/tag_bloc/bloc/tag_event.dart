part of 'tag_bloc.dart';

@freezed
abstract class TagEvent with _$TagEvent {
  const factory TagEvent.addTag(TagModel tag) = _AddTag;
  const factory TagEvent.fetchTags() = _FetchTags;
  const factory TagEvent.updateTag(TagModel tag) = _UpdateTag;
  const factory TagEvent.deleteTag(String id) = _DeleteTag;
  const factory TagEvent.searchTag(String query) = _SearchTag;
  const factory TagEvent.clearSelection() = _ClearSelection;
  const factory TagEvent.clearTags() = _ClearTags;
  const factory TagEvent.selectedTag(TagModel tag) = _SelectedTag;

}

