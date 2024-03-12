import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_show/shared/widgets/app_loader.dart';

import '../../../core/constants.dart';
import '../../../shared/utils/appbar_back.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/utils/hex_color_code.dart';
import '../../../shared/widgets/app_cached_image.dart';
import '../../../shared/widgets/app_text.dart';
import '../../controller/cast_controller.dart';

class CastDetailsScreen extends StatelessWidget {
  const CastDetailsScreen(
      {super.key, required this.showsId, required this.showName});
  final String showsId, showName;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CastController(showsId: showsId));
    return Scaffold(
        appBar: AppbarBack(title: showName),
        body: Obx(() {
          if (controller.isLoading.isTrue) return const AppLoader();
          final castData = controller.castList;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 90, top: 18),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.9),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CategoryContainer(
                    imageUrl: castData[index].person?.image?.original,
                    categoryName: castData[index].person?.name,
                    as: castData[index].character?.name,
                    onTap: () {},
                  );
                }),
          );
        }));
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.imageUrl,
    required this.categoryName,
    required this.onTap,
    this.as,
  });

  final String? imageUrl, categoryName, as;
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
                      categoryName,
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
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "as ",
                        style: const TextStyle(
                            color: Colors.black, fontFamily: inter400),
                        children: [
                          TextSpan(
                            text: as,
                            style: TextStyle(
                                color: HexColor("#e0edeb"),
                                fontFamily: inter400,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
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
