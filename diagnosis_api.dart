class DiagnosisAPI{


  static Map<String,String> analyze(

      String symptom

      ){



    if(symptom.contains("fever")

        && symptom.contains("headache")){


      return {


        "disease":

        "Possible Malaria",


        "doctor":

        "General Physician"


      };


    }



    else if(symptom.contains("cough")){


      return {


        "disease":

        "Respiratory Infection",


        "doctor":

        "Chest Specialist"


      };


    }



    else if(symptom.contains("stomach")){


      return {


        "disease":

        "Stomach Infection",


        "doctor":

        "Gastroenterologist"


      };


    }



    else{


      return {


        "disease":

        "General Checkup Required",


        "doctor":

        "General Doctor"


      };


    }




  }


}