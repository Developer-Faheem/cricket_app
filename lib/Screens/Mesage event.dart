import 'package:cricket_app/main.dart';
import 'package:cricket_app/widget/Roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Message extends StatelessWidget {
  Message({super.key});
  double height=0;
  double width=0;

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xff3854DC),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901 , vertical: height*0.02422920831),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerRight,

                    child: Image.asset("assets/cross.png",width:width* 0.05092686901,)),
                SizedBox(height: height*0.02422920831,),
                Image.asset("assets/boy.png",width: width*0.81482990425,),
                SizedBox(height: height*0.02422920831,),
                Text("CONGRATULATIONS",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 20.sp,fontWeight: FontWeight.w400),),
                SizedBox(height: height* 0.01211460415 ,),
                Text("The event has been created.",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 12.sp,fontWeight: FontWeight.w400),),
                Padding(
                  padding: EdgeInsets.only(top: height*0.18171906233),
                  child: Container(
                    height: height*0.04845841662 ,

                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFFDB),
                      borderRadius: BorderRadius.circular(height*0.00605730207/2 + width*0.01273171725/2),
                    ),
                    child: Center(

                      child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>btmnavigation()));
                          },
                          child: Text("Home",   style: TextStyle( color: Color(0xff0C0C0C),fontWeight: FontWeight.w400,fontSize: 16.sp),)),
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
