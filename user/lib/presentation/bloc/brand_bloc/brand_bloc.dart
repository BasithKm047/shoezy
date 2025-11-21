import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shoezy/data/models/brand_model.dart';
import 'package:shoezy/data/repositories/brand_repository.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  BrandRepository repository=BrandRepository();
  BrandBloc() : super(BrandInitial()) {

    on<LoadBrandEvent>((event, emit) async{
       emit(BrandLoadingState());
       try{
        final brands= await repository.getBrands();
        emit(BrandLoadedState(brands));


       }catch(e){
        emit(BrandLoadErrorState(e.toString()));
       }
    });
  }
}
