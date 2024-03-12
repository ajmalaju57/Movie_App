import 'package:get/get.dart';

import '../../core/service/api.dart';
import '../../core/service/api_response.dart';
import '../../core/service/urls.dart';
import '../model/cast.dart';

class CastController extends GetxController {
  int page = 1, limit = 10;
  RxBool isFetchingMore = false.obs;
  bool hasNextPage = true;

  RxList<Cast> castList = <Cast>[].obs;
  RxBool isLoading = true.obs;

  String showsId;
  CastController({required this.showsId});

  Future<List<Cast>> getCast() async {
    final ApiResponse response =
        await Api.call(endPoint: "$showsUrl/$showsId/cast", method: Method.get);

    if (response.status) {
      final List<dynamic> responseData = response.data;

      final List<Cast> showsList = responseData.map((json) {
        return Cast.fromJson(json);
      }).toList();

      return showsList;
    }

    return [];
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    isLoading.value = true;
    castList.value = await getCast();
    isLoading.value = false;
  }
}
