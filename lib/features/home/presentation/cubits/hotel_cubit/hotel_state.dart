import '../../../../../core/models/hotel_model.dart';

class HotelState {
  final List<HotelModel> hotels;
  final bool loading;
  final String? error;
  final HotelModel? selectedHotel;

  HotelState({
    this.hotels = const [],
    this.loading = false,
    this.error,
    this.selectedHotel,
  });

  HotelState copyWith({
    List<HotelModel>? hotels, 
    bool? loading,
    String? error,
    HotelModel? selectedHotel,
  }) {
    return HotelState(
      hotels: hotels ?? this.hotels,
      loading: loading ?? this.loading,
      error: error,
      selectedHotel: selectedHotel ?? this.selectedHotel,
    );
  }
}
