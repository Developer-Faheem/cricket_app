import 'package:cricket_app/auth/LOGIN.dart';
import 'package:cricket_app/auth/Sign%20in.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Startup extends StatelessWidget {
   Startup({super.key});
  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFF0F2),
        body: Column(
          children: [
            Center(child: Padding(
              padding:  EdgeInsets.only(top: height*0.09691683324),
              child: Image.asset("assets/Startup.png",width:width*0.50926869016,),
            )),
            SizedBox(height: height* 0.01211460415,),
            Center(child: Text("CricSpotter",style: TextStyle(color: Color(0xff3854DC),fontSize: 25.sp,fontWeight: FontWeight.w400),)),
            Padding(
              padding:  EdgeInsets.only(top: height*0.20594827064,left: width* 0.12731717254  ,right: width* 0.12731717254  ),
              child: Row(children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                  },
                  child: Container(
                    width: width*0.3310246486,
                  height: height*0.08480222908,
                    decoration: BoxDecoration(
                      color: Color(0xff3854DC),
                      borderRadius: BorderRadius.circular(height* 0.00242292083/2 + width*0.0050926869/2),
                    ),
                    child: Center(child: Text("SIGN UP",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w400,fontSize: 12.sp),)),
                  ),
                ),
                SizedBox(width: width*0.05092686901 ,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                  child: Container(
                    width: width*0.3310246486,
                    height: height*0.08480222908,
                    decoration: BoxDecoration(
                      color: Color(0xff3854DC),
                      borderRadius: BorderRadius.circular(height* 0.00242292083/2 + width*0.0050926869/2),
                    ),
                    child: Center(child: Text("LOGIN",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12.sp,fontWeight: FontWeight.w400),)),
                  ),
                ),
              ],),
            )

          ],
        ),
      ),
    );
  }
}
