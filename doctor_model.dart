class DoctorModel{


  final String id;
  final String name;
  final String specialty;
  final bool available;



  DoctorModel({

    required this.id,
    required this.name,
    required this.specialty,
    required this.available

  });



  factory DoctorModel.fromMap(
      Map<String,dynamic> data,
      String id

      ){

    return DoctorModel(

        id:id,

        name:data["name"],

        specialty:data["specialty"],

        available:data["available"]

    );

  }



  Map<String,dynamic> toMap(){

    return{

      "name":name,

      "specialty":specialty,

      "available":available

    };

  }


}