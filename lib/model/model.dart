class Model {
  String name;
  String location;
  String review;

  Model(this.name, this.location, this.review);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'review': review,
    };
  }
}
