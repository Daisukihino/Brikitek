import 'package:flutter_application_1/model/mexican_model.dart';

List<MexicanModel> getMexican() {
  List<MexicanModel> mexican = [];
  MexicanModel mexicanModel = MexicanModel();

  mexicanModel.name = "Beef Tacos";
  mexicanModel.image = "images/tacos.png";
  mexicanModel.price = "64.99";
  mexican.add(mexicanModel);
  mexicanModel = MexicanModel();

  mexicanModel.name = "Chicken Burrito";
  mexicanModel.image = "images/tacos.png";
  mexicanModel.price = "84.99";
  mexican.add(mexicanModel);
  mexicanModel = MexicanModel();

  mexicanModel.name = "Nachos";
  mexicanModel.image = "images/tacos.png";
  mexicanModel.price = "59.99";
  mexican.add(mexicanModel);
  mexicanModel = MexicanModel();

  mexicanModel.name = "Quesadilla";
  mexicanModel.image = "images/tacos.png";
  mexicanModel.price = "74.99";
  mexican.add(mexicanModel);

  return mexican;
}
