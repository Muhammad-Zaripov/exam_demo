import 'package:exam_4_oy_demo/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../../../core/extensions/screen_size.dart';
import '../../../../core/models/hotel_model.dart';
import '../../../../core/utils/app_colors.dart';

class YandexMapWidget extends StatefulWidget {
  final HotelModel hotel;
  const YandexMapWidget({super.key, required this.hotel});

  @override
  State<YandexMapWidget> createState() => _YandexMapWidgetState();
}

class _YandexMapWidgetState extends State<YandexMapWidget> {
  @override
  Widget build(BuildContext context) {
    final double h = ScreenSize.heightFactor(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.recomendedHotelColor,
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      height: 200 * h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: YandexMap(
                  key: ValueKey(widget.hotel.id),
                  onMapCreated: (controller) {
                    controller.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: Point(
                            latitude: widget.hotel.latitude.toDouble(),
                            longitude: widget.hotel.longitude.toDouble(),
                          ),
                          zoom: 0,
                        ),
                      ),
                    );
                  },
                  mapObjects: [
                    PlacemarkMapObject(
                      mapId: MapObjectId('hotel_marker_${widget.hotel.id}'),
                      point: Point(
                        latitude: widget.hotel.latitude.toDouble(),
                        longitude: widget.hotel.longitude.toDouble(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.location),
                SizedBox(width: 6),
                Text(
                  widget.hotel.location,
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: AppColors.textFieldDarkIconsColor,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'View Details',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                color: AppColors.primaryBlueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
