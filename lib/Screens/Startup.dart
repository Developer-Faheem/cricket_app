import 'package:cricket_app/auth/LOGIN.dart';
import 'package:cricket_app/auth/Sign%20in.dart';
import 'package:flutter/material.dart';

class Startup extends StatelessWidget {
  const Startup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFF0F2),
        body: Column(
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Image.asset("assets/Startup.png",width: 200,),
            )),
            SizedBox(height: 10,),
            Center(child: Text("CricSpotter",style: TextStyle(color: Color(0xff3854DC),fontSize: 36,fontWeight: FontWeight.w400),)),
            Padding(
              padding: const EdgeInsets.only(top: 170,left: 50,right: 50),
              child: Row(children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                  },
                  child: Container(
                    width: 130,
                  height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xff3854DC),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(child: Text("SIGN UP",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w400,fontSize: 16),)),
                  ),
                ),
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                  child: Container(
                    width: 130,
                  height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xff3854DC),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(child: Text("LOGIN",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 16,fontWeight: FontWeight.w400),)),
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
