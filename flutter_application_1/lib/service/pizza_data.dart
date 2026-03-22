import 'package:flutter_application_1/model/pizza_model.dart';

List<PizzaModel> getPizza(){
  List<PizzaModel> pizza = [];
  PizzaModel pizzaModel = new PizzaModel();

  pizzaModel.name = "Cheese Pizza";
  pizzaModel.image = "images/pizza1.png";
  pizzaModel.price = "49.99";
  pizza.add(pizzaModel);
  pizzaModel =  new PizzaModel();

pizzaModel.name = "Margherita pizza";
  pizzaModel.image = "images/pizza2.png";
  pizzaModel.price = "59.99";
  pizza.add(pizzaModel);
  pizzaModel =  new PizzaModel();

  pizzaModel.name = "Margherita pizza";
  pizzaModel.image = "images/pizza2.png";
  pizzaModel.price = "59.99";
  pizza.add(pizzaModel);
  pizzaModel =  new PizzaModel();

  pizzaModel.name = "Margherita pizza";
  pizzaModel.image = "images/pizza2.png";
  pizzaModel.price = "59.99";
  pizza.add(pizzaModel);
  pizzaModel =  new PizzaModel();


  return pizza;
}