class UserState {
  String? user;
  String? tab;
  String? image;
  int? carousel;

  UserState(
    this.user,
    this.tab,
    this.image,
    this.carousel
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user': user,
      'tab': tab,
      'image': image,
      'carousel': carousel
    };
    return map;
  }

  UserState.fromMap(Map<String, dynamic> map) {
    user = map['user'];
    tab = map['tab'];
    image = map['image'];
    carousel = map['carousel'];
  }
}