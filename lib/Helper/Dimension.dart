import 'package:get/get.dart';

class Dimension{

  static double? Screenheight= Get.context?.height; //813

  static double? ScreenWidth= Get.context?.width;   //393

  static double? hight10=Dimension.Screenheight!/81.3;
  static  double? width10=Dimension.ScreenWidth!/39.3;




}



class Dim{
  static double Hight= Get.height;
  static double Width=Get.width;
  static double  Hight10=Hight/81.3;
  static double  Width10=Width/39.3;
  static double  Hight20=Hight10*2;
  static double  Width20=Width10/39.3*2;
  static double  Hight30=Hight10 + Hight20;
  static double  Width30=Width10+Width20;
}