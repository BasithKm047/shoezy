part of 'tag_bloc.dart';

@freezed

abstract class TagState with _$TagState {
  const factory TagState.initial() = _Initial;
   const factory TagState.success() = _Success;
  const factory TagState.loading() = _Loading;
  const factory TagState.loaded({required List<TagModel> tags,String ? selectedTags}) = _Loaded;
  const factory TagState.error(String message) = _Error;
}

