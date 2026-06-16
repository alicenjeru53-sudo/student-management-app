import 'package:flutter/material.dart';

import 'firebase_service.dart';



class BookingScreen extends StatelessWidget{


  final String doctor;



  BookingScreen({

    super.key,

    required this.doctor

  });



  final FirebaseService service =
  FirebaseService();




  Future<void> book()async{


    await service.saveAppointment({


      "doctor":doctor,


      "date":

      DateTime.now().toString(),


      "status":

      "Pending"


    });


  }





  @override

  Widget build(BuildContext context){



    return Scaffold(


        appBar:

        AppBar(

            title:

            Text("Booking")

        ),



        body:

        Center(


            child:

            ElevatedButton(



                child:

                Text(
                    "Confirm Appointment"
                ),



                onPressed:(){

                  book();


                  ScaffoldMessenger.of(context)

                      .showSnackBar(

                      SnackBar(

                          content:

                          Text(
                              "Appointment Saved"
                          )

                      )

                  );


                }



            )


        )


    );


  }

}