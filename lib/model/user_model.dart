class UserModel {
  late String? userId , name , email , pic;

  UserModel({this.userId , this.email , this.name , this.pic});

  UserModel.fromJson(Map<dynamic,dynamic>map){
    // ignore: unnecessary_null_comparison
    if(map == null){
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name= map['name'];
    pic = map['pic'];
  }

  toJson(){
    return {
      'userId' : userId,
      'email' : email,
      'name' : name,
      'pic' : pic
    };
  }
  
}