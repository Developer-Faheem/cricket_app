import 'package:cricket_app/main.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';

class ProfileConfirm extends StatelessWidget {
  const ProfileConfirm({super.key});

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


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text("Your changes have been saved.",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 16,fontWeight: FontWeight.w400),),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>btmnavigation()));
                    },
                    child: Container(
                      height: 40,

                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFFDB),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(

                        child: Text("Home",   style: TextStyle( color: Color(0xff0C0C0C),fontWeight: FontWeight.w400,fontSize: 16),),
                      ),
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
