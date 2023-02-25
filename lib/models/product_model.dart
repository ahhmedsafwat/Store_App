class ProductsModel {
  // the model that will analyze all the incoming data from the api AKA:json form
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModle rating;

  // set the variables for the constructor
  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  // returns object of the products model
  factory ProductsModel.fromJson(jsonData) {
    return ProductsModel(
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        category: jsonData['category'],
        image: jsonData['image'],
        // giving the rating modle the rating map form the api so it can go to the ratignmodel class to get decoded
        rating: RatingModle.fromJson(jsonData['rating']));
  }
}

// gets the data from the rating prameter from the productsmodel
class RatingModle {
  final dynamic rate;
  final dynamic count;

  RatingModle({
    required this.rate,
    required this.count,
  });

  factory RatingModle.fromJson(jsonData) {
    return RatingModle(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
