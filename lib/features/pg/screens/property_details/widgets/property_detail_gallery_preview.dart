import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renteasy_app/commons/widgets/texts/section_heading.dart';
import 'package:renteasy_app/features/pg/screens/gallery/gallery.dart';
import 'package:renteasy_app/utilities/constants/colors.dart';
import 'package:renteasy_app/utilities/constants/image_string.dart';

class PropertyDetailGalleryPreview extends StatelessWidget {
  const PropertyDetailGalleryPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> previews = [
      images.propertyLivingRoom,
      images.propertyKitchen,
      images.propertyBedroom,
    ];

    return Column(
      children: [
        RSectionHeading(
          title: 'Gallery',
          buttonTitle: 'View All',
          onPressed: () => Get.to(() => const GalleryScreen()),
        ),
        const SizedBox(height: 10.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: previews.map((img) {
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: GestureDetector(
                  onTap: () => Get.to(() => const GalleryScreen()),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      img,
                      width: 110,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 110,
                        height: 100,
                        color: const Color(0xFFEFF2FE),
                        child: const Icon(Icons.image, color: AppColors.button),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
