import '../../../../../core/models/hotel_model.dart';

class HotelState {
  final List<HotelModel> hotels;
  final bool loading;
  final String? error;

  HotelState({this.hotels = const [], this.loading = false, this.error});

  HotelState copyWith({
    List<HotelModel>? hotels,
    bool? loading,
    String? error,
  }) {
    return HotelState(
      hotels: hotels ?? this.hotels,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}
