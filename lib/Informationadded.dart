import 'package:cricket_app/main.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';

class EditedConfirmation extends StatelessWidget {
  const EditedConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xff3854DC),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerRight,

                    child: Image.asset("assets/cross.png",width: 20,)),
                SizedBox(height: 20,),
                Image.asset("assets/boy.png",width: 320,),
                SizedBox(height: 20,),
                Text("CONGRATULATIONS",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 30,fontWeight: FontWeight.w400),),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text("Your information has been.",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 20,fontWeight: FontWeight.w400),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text("successfully added.",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 20,fontWeight: FontWeight.w400),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Container(
                    height: 40,

                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFFDB),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(

                      child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>btmnavigation()));
                          },
                          child: Text("Home",   style: TextStyle( color: Color(0xff0C0C0C),fontWeight: FontWeight.w400,fontSize: 16),)),
                    ),
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
