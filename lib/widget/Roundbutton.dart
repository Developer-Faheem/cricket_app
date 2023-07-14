import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final  String title;
  final  VoidCallback onTap;
  final Color color;




  RoundButton({Key? key ,required this.title,required this.onTap,required this.color}) : super(key: key);
  double height=0;
  double width=0;

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
      height: height*0.06057302077,

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height*0.01211460415 /2 + width*0.0254634345 /2),
        ),
        child: Center(

          child: Text(title,   style: TextStyle(fontSize: height*0.02180628747 /2 +    width* 0.04583418211/2, color: Colors.white),),
        ),
      ),
    );
  }
}
