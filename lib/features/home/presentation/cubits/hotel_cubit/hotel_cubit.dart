import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/hotel_model.dart';
import 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelState());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchHotels() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      QuerySnapshot snapshot = await _firestore.collection('hotels').get();

      List<HotelModel> hotels =
          snapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            data['id'] = doc.id;
            return HotelModel.fromJson(data);
          }).toList();

      emit(state.copyWith(hotels: hotels, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }

  void selectHotel(HotelModel hotel) {
    emit(state.copyWith(selectedHotel: hotel));
  }
}
