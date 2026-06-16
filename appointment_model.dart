class AppointmentModel{


  final String id;
  final String doctor;
  final String patient;
  final String status;
  final String date;


  AppointmentModel({

    required this.id,
    required this.doctor,
    required this.patient,
    required this.status,
    required this.date

  });


  factory AppointmentModel.fromMap(
      Map<String,dynamic> data,
      String id
      ){

    return AppointmentModel(

        id:id,

        doctor:data["doctor"] ?? "",

        patient:data["patient"] ?? "",

        status:data["status"] ?? "",

        date:data["date"] ?? ""

    );

  }


}