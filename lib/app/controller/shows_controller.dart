import 'package:get/get.dart';

import '../../core/service/api.dart';
import '../../core/service/api_response.dart';
import '../../core/service/urls.dart';
import '../model/shows.dart';

class ShowsController extends GetxController {
  int page = 1, limit = 10;
  RxBool isFetchingMore = false.obs;
  bool hasNextPage = true;

  RxList<Shows> shows = <Shows>[].obs;
  RxBool isLoading = true.obs;

  Future<List<Shows>> getShows() async {
    final ApiResponse response =
        await Api.call(endPoint: showsUrl, method: Method.get);

    if (response.status) {
      final List<dynamic> responseData = response.data;

      final List<Shows> showsList = responseData.map((json) {
        return Shows.fromJson(json);
      }).toList();

      return showsList;
    }

    return [];
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    isLoading.value = true;
    shows.value = await getShows();
    isLoading.value = false;
  }
}
