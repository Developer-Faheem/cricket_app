import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  double height=0;
  double width=0;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3854DC),
        leading:  Padding(
          padding:  EdgeInsets.only(left: width*0.05092686901 ),
          child: Image.asset("assets/arrow.png",width:width* 0.0254634345,),
        ),
        title: const Text("CricSpotter",style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w400,fontSize: 24),),
        centerTitle: true,
        actions: [ Padding(
          padding:  EdgeInsets.only(left: width*0.05092686901 ),
          child: Image.asset("assets/noti.png",width: width*0.07639030352 ,),
        )],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffF7F6F6)
            ),
            child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width* 0.05092686901 , vertical: height*0.02422920831),
              child: Row(
                 children: [
                   Text("Search by Date",style: TextStyle(color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 20),),
                   Spacer(),
                   Image.asset("assets/calendar.png",width:width*0.10185373803,)
                 ],
              ),
            ),
          ),
          SizedBox(height: height*0.02422920831 ,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.05092686901 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select Date",style: TextStyle(color: Color(0xff000000),fontSize: 12,fontWeight: FontWeight.w400),),
                SizedBox(height: height*0.01211460415 ,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xff)
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.68751273171,
                        height: height*0.06057302077,


                      ),
                      Container(
                          width: width*0.20370747606,
                          height: height*0.06057302077,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff000000))
                          ),
                          child: Image.asset("assets/Vector 6.png",width: width*0.0254634345 ,))
                    ],
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
