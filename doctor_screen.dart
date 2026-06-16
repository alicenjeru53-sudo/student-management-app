import 'package:flutter/material.dart';

import 'firebase_service.dart';

import 'doctor_card.dart';



class DoctorScreen extends StatelessWidget{


  DoctorScreen({super.key});



  final FirebaseService service =
  FirebaseService();




  @override

  Widget build(BuildContext context){


    return Scaffold(



        appBar:

        AppBar(

            title:

            Text(
                "Available Doctors"
            )

        ),





        body:

        StreamBuilder(


            stream:

            service.getDoctors(),


            builder:(context,snapshot){



              if(!snapshot.hasData){

                return Center(

                    child:

                    CircularProgressIndicator()

                );

              }



              var doctors=snapshot.data!;



              return ListView.builder(



                  itemCount:

                  doctors.length,



                  itemBuilder:(context,index){



                    return DoctorCard(

                        doctor:

                        doctors[index]

                    );


                  }


              );



            }


        )


    );


  }

}