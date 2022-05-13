import 'package:get/get.dart';
import 'package:vimnws/Data/Api/ApiClient.dart';
import 'package:vimnws/Helper/Constants.dart';

class NewsHeadlineRepo extends GetxService{
  final ApiClient apiClient;

  NewsHeadlineRepo( { required this.apiClient});
  Future<Response> GetNewsHeadline()async {
    return await apiClient.getData(AppConstants.App_headline_Key);
  }
  
}