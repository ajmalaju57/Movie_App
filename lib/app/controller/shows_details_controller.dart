import 'package:get/get.dart';

import '../../core/service/api.dart';
import '../../core/service/urls.dart';
import '../model/show_details.dart';

class ShowsDetailsController extends GetxController {
  RxBool isLoading = true.obs;
  ShowsDetails showsDetails = ShowsDetails();
  String showsId;
  ShowsDetailsController({required this.showsId});

  getShowDetails() async {
    final response =
        await Api.call(endPoint: "$showsUrl/$showsId", method: Method.get);
    if (response.status) {
      showsDetails = ShowsDetails.fromJson(response.data);
    }
    isLoading.toggle();
  }


  @override
  void onInit() {
    super.onInit();
    getShowDetails();
  }
}
