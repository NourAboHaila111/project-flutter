
import 'package:flutter/material.dart';


Widget defaultButton({
  required double width,
  Color? fontColor,
  required void Function() function,
  required String text,
}) => Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(70, 110, 181, 1),
        Color.fromRGBO(60, 0, 128, 0.6),
      ],
      begin: Alignment.topLeft,
      end: Alignment.topRight,
    ),
    borderRadius: BorderRadius.circular(15.0),
  ),
  width: width,
  child: MaterialButton(
    textColor: fontColor,
    onPressed:function,
    child: Text(text.toUpperCase(),),
  ),
);
//

Widget defaultinsideButton({
  required double width,
  Color? background,
  required void Function() function,
  required String text,

}) => Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(70, 110, 181, 1),
        Color.fromRGBO(60, 0, 128, 0.6),
      ],
      begin: Alignment.topLeft,
      end: Alignment.topRight,
    ),
    borderRadius: BorderRadius.circular(30.0),
  ),
  width: width,
  color: background,
  child: MaterialButton(
    onPressed:function,
    child: Text(text.toUpperCase(),),
  ),
);

Widget defaultTextButton({
  required Function() ? function,
  required String text,
})=>TextButton(
  onPressed: function,
  child:Text(
      text,
      style: TextStyle(
      fontWeight: FontWeight.bold,
        fontSize: 20,
  ),
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  TextInputType? type,
  void Function(String)? onsubmit,
  void Function(String)? onchange,
  bool obscuretext=false,
  required String? Function(String?)? validate,
  required String label,
  String ? labelText,
  required IconData prefix,
  void Function()? prefixpressed,
  IconData? suffix,
  void Function()? suffixpressed,
  void Function()? onTap,
  Color? color,
  bool? filled,
  Color? fillColor,

})=>TextFormField(
  controller:  controller,
  onFieldSubmitted: onsubmit,
  onChanged: onchange,
  obscureText: obscuretext,
  keyboardType: type,
  validator: validate,
  onTap: onTap,
  decoration:InputDecoration(
    labelText:labelText ,
    hintText: label,
    // ignore: unnecessary_null_comparison
    prefixIcon: prefix != null ? IconButton(
      onPressed:prefixpressed,
      icon: Icon(
        prefix,
      ),
    ) :null,
    suffixIcon:suffix != null? IconButton(
      onPressed:suffixpressed,
      icon: Icon(
        suffix,
      ),
    ) :null,
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      // borderSide: BorderSide.none ,
    ),
    fillColor: fillColor,
    filled: filled,
  ),
);

enum stateColor {ERROR,SUCCESS,WARNING}
Color setStateColor(state){
  Color ? color  ;
  switch (state)
  {
    case stateColor.SUCCESS :
      color = Colors.green;
      break;
    case stateColor.ERROR:
      color = Colors.red;
      break;
    case stateColor.WARNING:
      color = Colors.yellow;
      break;
    default:
      color=Colors.white;
  }
  return color ;
}
SnackBar defaultSnackbar({
  required String text,
  required stateColor state
})=>
    SnackBar(
      content:Center(child: Text( text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,)) ,),
      duration: Duration(seconds: 3),
      backgroundColor: setStateColor(state),
      elevation: 8,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );


void navigateAndFinish(context, Widget,)=>
    Navigator.pushAndRemoveUntil
      (
      context,
      MaterialPageRoute(
          builder: (context)=>Widget),
          (route)
      {
        return false;
      },
    );

Widget myDivider () =>  Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 30,
  ),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[400],
  ),
);
//
// Widget buildArticleItem (artical,context) => Padding(
//   padding: const EdgeInsets.all(15.0),
//   child: Row(
//     children: [
//       Container(
//         width: 150,
//         height: 120,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(
//             image:NetworkImage('${artical['urlToImage']}'),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       SizedBox(
//         width: 20,
//       ),
//       Expanded(
//         child: Container(
//           height: 120,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Text(
//                   '${artical['title']}',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style:Theme.of(context).textTheme.bodyText1,
//                 ),
//               ),
//               Text(
//                 '${artical['publishedAt']}' ,
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// );
//
// Widget articalBuillder(list,context,{isSearch=false})=>ConditionalBuilder(
//   condition:list.length>0 ,
//   builder: (context)=>ListView.separated(
//     physics: BouncingScrollPhysics(),
//     itemBuilder:(context, index) =>buildArticleItem(list[index],context)  ,
//     separatorBuilder: (context, index) => myDivider(),
//     itemCount:10 ,
//   ),
//   fallback:(context)=>isSearch?Container():Center(
//     child: CircularProgressIndicator(),
//   ) ,
// );
//
//


void  navigateTo(context,Widget)=> Navigator.push(
  context,
  MaterialPageRoute(
      builder:(context) => Widget
  ),
);

//
// void showToast({
//   required String text,
//   required ToastStates states, 
// })=> Fluttertoast.showToast(
//   msg:text,
//   toastLength: Toast.LENGTH_LONG,
//   gravity: ToastGravity.BOTTOM,
//   timeInSecForIosWeb: 5,
//   backgroundColor:chooseToastColor(states),
//   textColor: Colors.white,
//   fontSize: 16.0,
// );
//
// // //
// enum ToastStates{SUCCESS,ERROR,WARING}
//
//
// Color? chooseToastColor(ToastStates state)
// {
//   Color? color;
//   switch(state){
//     case ToastStates.SUCCESS:
//       color= Colors.green;
//       break;
//     case ToastStates.ERROR:
//       color= Colors.red;
//       break;
//     case ToastStates.WARING:
//       color= Colors.amber;
//       break;
//   }
//   return color;
// }


Widget buildArticalItem(artical,context)=>Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30) ,
          image: DecorationImage(
              image:artical['urlToImage']!=null ? NetworkImage('${artical['urlToImage']}') : NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkRQlBc2mf3iGQ3nWCt46Z5UA15-gGDromOiPz7w5QZw&s'),
              fit:BoxFit.fill
          ),
        ),

      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              //AppCubit.get(context).ismode==true?
              Text(
                '${artical['title']}',
                style:Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${artical['description']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],),
        ),
      ),
    ],
  ),
);


// Widget articalBuilder(list,context,{issearch=false}) => ConditionalBuilder(
//   condition: list.length>0 ,
//   builder: (context) => ListView.separated(
//     physics: BouncingScrollPhysics(),
//     itemBuilder: (context, index) => buildArticalItem(list[index],context),
//     separatorBuilder: (context, index) =>myDivider() ,
//     itemCount: 10,
//   ),
//   fallback: (context) => issearch ?Container():Center(
//     child: CircularProgressIndicator(),
//   ),
// );

Widget reausableMaterialButton({
  required void Function()? function,
  double? width,
  double ?height,
  required String text,
  Color? color,
  required Color? colortext,
}) =>
    Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            text.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: colortext,
              fontSize: 17,
            ),
          ),
        ));
//apikey=a67dcaee15cd4028803d5aaed502617a