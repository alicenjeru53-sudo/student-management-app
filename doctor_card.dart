import 'package:flutter/material.dart';

import 'doctor_model.dart';
import 'booking_screen.dart';



class DoctorCard extends StatelessWidget{


  final DoctorModel doctor;



  const DoctorCard({

    super.key,

    required this.doctor

  });



  @override

  Widget build(BuildContext context){



    return Card(


        elevation:5,


        child:

        ListTile(



            leading:

            CircleAvatar(

                child:

                Icon(Icons.medical_services)

            ),




            title:

            Text(

                doctor.name

            ),




            subtitle:

            Column(

                crossAxisAlignment:

                CrossAxisAlignment.start,


                children:[


                  Text(
                      doctor.specialty
                  ),


                  Text(

                      doctor.available

                          ?

                      "Available 🟢"

                          :

                      "Busy 🔴"

                  )

                ]

            ),




            trailing:

            doctor.available

                ?

            ElevatedButton(

                child:

                Text("Book"),

                onPressed:(){


                    Navigator.push(

                        context,

                        MaterialPageRoute(

                            builder:(context)=>

                                BookingScreen(

                                    doctor:

                                    doctor.name

                                )

                        )

                    );


                  }

            )

                :

            null




        )

    );


  }


}