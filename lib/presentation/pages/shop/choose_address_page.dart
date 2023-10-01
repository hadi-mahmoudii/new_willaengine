import 'package:flutter/material.dart';
import 'package:persian_date_null_saftey/persian_date.dart';
import 'package:sizer/sizer.dart';
import 'package:willaengine/utils/constant/color.dart';
import 'package:willaengine/utils/widgets/global_header_widget.dart';
class ChooseAddressPage extends StatelessWidget {
  const ChooseAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalHeaderWidget(title: "انتخاب آدرس" , title2: "CHOOSING AN ADDRESS" ,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Row(children: [
                Container(

                  child: Text('title' ,style: TextStyle(fontSize: 11.sp),) ,
                  decoration: BoxDecoration(border: Border(left: BorderSide(color: AppColors.grey3))),
                  padding: EdgeInsets.only(left: 10),
                ),
                SizedBox(width: 3.w,),

                Text("city" , style: TextStyle(fontSize: 9.sp),)
              ],)
            ],),
          );
        },)
        ],),
      ),
    );
  }
}
