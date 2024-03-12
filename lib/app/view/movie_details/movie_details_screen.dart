import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:movie_show/core/extensions/margin_ext.dart';
import 'package:movie_show/core/screen_utils.dart';
import 'package:movie_show/shared/widgets/app_cached_image.dart';

import '../../../core/constants.dart';
import '../../../shared/utils/appbar_back.dart';
import '../../../shared/utils/colors.dart';
import '../../../shared/widgets/app_btn.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../../shared/widgets/app_text.dart';
import '../../controller/shows_details_controller.dart';
import '../cast_details/cast_details_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.showsId});

  final String showsId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShowsDetailsController(showsId: showsId));

    return Obx(() {
      return Scaffold(
        appBar: AppbarBack(title: controller.showsDetails.name),
        body: controller.isLoading.isTrue
            ? const AppLoader()
            : SafeArea(
                child: ListView(
                children: [
                  CachedImage(
                    imageUrl: controller.showsDetails.image?.original,
                    width: double.infinity,
                    height: 350,
                    radius: 0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 28, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Type: ${controller.showsDetails.type}",
                          color: primaryGreyClr,
                          size: 10,
                        ),
                        16.hBox,
                        AppText(
                          controller.showsDetails.name,
                          color: secondaryClr,
                          size: 20,
                          family: inter700,
                          weight: FontWeight.bold,
                        ),
                        8.hBox,
                        AppText(
                          "Language:-  ${controller.showsDetails.language}",
                          color: primaryGreyClr,
                        ),
                        16.hBox,
                        AppButton(
                          onPressed: () {
                            Screen.open(CastDetailsScreen(
                              showsId: controller.showsId,
                              showName: controller.showsDetails.name.toString(),
                            ));
                          },
                          text: "Show The Cast ",
                          isFilledBtn: false,
                          minHeight: 44,
                        ),
                        24.hBox,
                        const AppText(
                          "Detailed Description",
                          color: primaryBlackClr,
                          size: 16,
                          family: inter500,
                        ),
                        14.hBox,
                        const AppText(
                          "Summary",
                          color: primaryBlackClr,
                          family: inter700,
                          size: 16,
                        ),
                        9.hBox,
                        HtmlWidget(
                          controller.showsDetails.summary.toString(),
                        ),
                        16.hBox,
                      ],
                    ),
                  )
                ],
              )),
      );
    });
  }
}
