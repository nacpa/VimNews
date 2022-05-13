import 'package:get/get.dart';
import 'package:vimnws/Data/Repo/NewsHeadlineRepo.dart';
import 'package:vimnws/Models/ArticleModel.dart';

class NewsHeadlineController extends GetxController{
  final NewsHeadlineRepo newsHeadlineRepo;

  NewsHeadlineController({ required this.newsHeadlineRepo});
  
  List<dynamic> _NewsHeadline=[];
  List<dynamic> get NewsHeadline=>_NewsHeadline;
  
  
  
  Future<void> GetNewsHeadline()async {
    Response response= await newsHeadlineRepo.GetNewsHeadline();
    if(response.statusCode==200){
      _NewsHeadline=[];
      _NewsHeadline.addAll(News.fromJson(response.body).articles!);
      // print(_NewsHeadline[1].urlToImage);
      update();
    }else{}
  }
  
  
}