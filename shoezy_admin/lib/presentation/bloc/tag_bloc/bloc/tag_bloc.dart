import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoezy_admin/data/model/tag/tag_model.dart';
import 'package:shoezy_admin/data/repositories/tag_services.dart';

part 'tag_event.dart';
part 'tag_state.dart';
part 'tag_bloc.freezed.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  final TagServices tagServices;
  TagBloc({required this.tagServices}) : super(TagState.initial()) {
    on<_AddTag>((event, emit) async {
      emit(TagState.loading());
      try {
        await tagServices.addTags(event.tag);
        emit(TagState.success());
      } catch (e) {
        emit(TagState.error(e.toString()));
      }
    });
    on<_FetchTags>((event, emit) async {
      emit(TagState.loading());
      try {
        final tags = await tagServices.getTags();
        emit(TagState.loaded(tags: tags, selectedTags: null));
      } catch (e) {
        emit(TagState.error(e.toString()));
      }
    });

    on<_UpdateTag>((event, emit) async {
      emit(TagState.loading());
      try {
        await tagServices.updateTags(event.tag);

        emit(TagState.success());
      } catch (e) {
        emit(TagState.error(e.toString()));
      }
    });

    on<_DeleteTag>((event, emit) {
      emit(TagState.loading());
      try {
        tagServices.deleteTags(event.id);
        emit(TagState.success());
      } catch (e) {
        emit(TagState.error(e.toString()));
      }
    });
    on<_SearchTag>((event, emit) async {
      emit(TagState.loading());
      try {
        final tags = await tagServices.searchTag(event.query);
        emit(TagState.loaded(tags: tags, selectedTags: null));
      } catch (e) {
        emit(TagState.error(e.toString()));
      }
    });
    on<_SelectedTag>((event, emit) {
      state.maybeWhen(
        orElse: () {},
        loaded: (tags, selectedTags) =>
            emit(TagState.loaded(tags: tags, selectedTags: event.tagName)),
      );
    });
    on<_ClearSelection>((event, emit){
      state.maybeWhen(orElse: () {}, loaded: (tags, selectedTags){
        emit(TagState.loaded(tags: tags, selectedTags: null));
      },);
    });
  }
}
