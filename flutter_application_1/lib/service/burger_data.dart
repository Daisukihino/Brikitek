import 'package:flutter_application_1/model/burger_model.dart';

List<BurgerModel> getBurger(){
  List<BurgerModel> burger = [];
  BurgerModel burgerModel = new BurgerModel();

  burgerModel.name = "Cheese Burger";
  burgerModel.image = "images/burger1.png";
  burgerModel.price = "49.99";
  burger.add(burgerModel);
  burgerModel =  new BurgerModel();

burgerModel.name = "Margherita Burger";
  burgerModel.image = "images/burger2.png";
  burgerModel.price = "59.99";
  burger.add(burgerModel);
  burgerModel =  new BurgerModel();

  burgerModel.name = "Margherita Burger";
  burgerModel.image = "images/burger2.png";
  burgerModel.price = "59.99";
  burger.add(burgerModel);
  burgerModel =  new BurgerModel();

  burgerModel.name = "Margherita Burger";
  burgerModel.image = "images/burger2.png";
  burgerModel.price = "59.99";
  burger.add(burgerModel);
  burgerModel =  new BurgerModel();


  return burger;
}