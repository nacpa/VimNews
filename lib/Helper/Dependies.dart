import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vimnws/Controller/NewsHeadlineController.dart';
import 'package:vimnws/Data/Api/ApiClient.dart';
import 'package:vimnws/Data/Repo/NewsHeadlineRepo.dart';
import 'package:vimnws/Helper/Constants.dart';

Future<void>init()async{
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.App_base_HeadlineUrl));
  Get.lazyPut(() => NewsHeadlineRepo(apiClient: Get.find()));
  Get.lazyPut(() => NewsHeadlineController(newsHeadlineRepo: Get.find()));
  _loadResource();

}

void _loadResource()async{
  await Get.find<NewsHeadlineController>().GetNewsHeadline();
}