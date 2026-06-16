class UserModel{


  String id;

  String name;

  String email;

  String role;



  UserModel({

    required this.id,

    required this.name,

    required this.email,

    required this.role

  });



  Map<String,dynamic> toMap(){


    return {


      "id":id,

      "name":name,

      "email":email,

      "role":role


    };


  }



}