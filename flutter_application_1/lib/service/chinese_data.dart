import 'package:flutter_application_1/model/chinese_model.dart';

List<ChineseModel> getChinese() {
  List<ChineseModel> chinese = [];
  ChineseModel chineseModel = ChineseModel();

  chineseModel.name = "Chow Mein";
  chineseModel.image = "images/chinese.png";
  chineseModel.price = "69.99";
  chinese.add(chineseModel);
  chineseModel = ChineseModel();

  chineseModel.name = "Sweet and Sour";
  chineseModel.image = "images/chinese.png";
  chineseModel.price = "79.99";
  chinese.add(chineseModel);
  chineseModel = ChineseModel();

  chineseModel.name = "Fried Rice";
  chineseModel.image = "images/chinese.png";
  chineseModel.price = "54.99";
  chinese.add(chineseModel);
  chineseModel = ChineseModel();

  chineseModel.name = "Dim Sum";
  chineseModel.image = "images/chinese.png";
  chineseModel.price = "89.99";
  chinese.add(chineseModel);

  return chinese;
}
