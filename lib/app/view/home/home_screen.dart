import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_show/core/extensions/margin_ext.dart';
import 'package:movie_show/core/extensions/string_ext.dart';
import 'package:movie_show/core/screen_utils.dart';
import 'package:movie_show/shared/utils/hex_color_code.dart';
import 'package:movie_show/shared/widgets/app_text.dart';

import '../../../core/constants.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/widgets/app_cached_image.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../controller/shows_controller.dart';
import '../movie_details/movie_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShowsController());
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Movie App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.hBox,
            const AppText(
              "Shows",
              family: inter700,
              color: primaryClr,
              weight: FontWeight.bold,
              size: 22,
            ),
            16.hBox,
            Expanded(child: Obx(() {
              if (controller.isLoading.isTrue) return const AppLoader();
              final shows = controller.shows;
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.9),
                  itemCount: shows.length,
                  itemBuilder: (context, index) {
                    return CategoryContainer(
                      imageUrl: shows[index].image?.original,
                      categoryName: shows[index].name,
                      rating: shows[index].rating?.average.toString(),
                      onTap: () {
                        Screen.open(MovieDetailsScreen(
                          showsId: shows[index].id.toString(),
                        ));
                      },
                    );
                  });
            }))
          ],
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.imageUrl,
    required this.categoryName,
    required this.onTap,
    this.rating,
  });

  final String? imageUrl, categoryName, rating;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        child: Container(
          decoration: BoxDecoration(
              color: HexColor("#3c948c"),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              border: Border.all(color: inputBorderClr, width: 0.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 1.4,
                child: CachedImage(
                  width: double.infinity,
                  imageUrl: imageUrl,
                  radius: 0,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: AppText(
                      categoryName!.upperFirst,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      color: HexColor("#e0edeb"),
                      family: inter600,
                      size: 12,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Icon(
                        Icons.favorite,
                        color: HexColor("#e0edeb"),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star_outlined,
                            size: 26,
                            color: HexColor("#e0edeb"),
                          ),
                          3.wBox,
                          AppText(
                            rating,
                            color: HexColor("#e0edeb"),
                          )
                        ],
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
