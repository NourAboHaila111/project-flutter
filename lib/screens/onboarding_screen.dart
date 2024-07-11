import 'package:flutter/material.dart';
import 'package:petopia/screens/home/home.dart';
import 'package:petopia/shared/components/components.dart';
import 'package:petopia/shared/network/local/Cach_Helper.dart';
import 'package:petopia/shared/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  final String? image;
  final String title;
  final String body;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget
{
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardControler=PageController();

  List<BoardingModel> boarding=[
    BoardingModel(
      image:'images/onBoarding1.png' ,
      title:'Personalize Your Preferences ' ,
      body: 'Customize your ideal pet by setting species, age, size, and temperament.',
    ),
    BoardingModel(
      image:'images/onBoarding2.png' ,
      title:'Discover Tailored Matches' ,
      body: 'Browse profiles, photos, and descriptions to find pets that match your criteria.',

    ),
    BoardingModel(
      image:'images/onBoarding3.png' ,
      title:'Connect and Adopt' ,
      body: 'Message owners or shelters, arrange a meet-and-greet, and make the decision to adopt your new furry friend.',

    ),
  ];
  bool isLast=false;
  void submit() {
    CachHelper.SaveData(key: 'OnBoarding1', value: true).then((value) {
      if (!value) {
        navigateAndFinish(context, HomeScreen(),);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed:()
            {
              submit();
            },
            child: Text(
                'SKIP'
            ),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardControler,
                onPageChanged: (int index)
                {
                  if(index==boarding.length-1)
                  {
                    setState(() {
                      isLast=true;
                    });
                  }
                  else
                  {
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height:30,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardControler,
                  effect: ExpandingDotsEffect(
                    //dotColor:Colors.grey ,
                      spacing:6 ,
                      dotHeight:10 ,
                      dotWidth: 10,
                      expansionFactor:4 ,
                      activeDotColor:defaultColor
                  ),
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast)
                    {
                      submit();
                    }
                    else
                    {
                      boardControler.nextPage(
                        duration: Duration(
                          seconds: 1,
                        ),
                        curve: Curves.decelerate,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                  backgroundColor: defaultColor,
                  elevation: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model)=>Column(
    children: [
      Expanded(
        child: Image(image:
        AssetImage(
          '${model.image}',
        ),
          width:double.infinity,
        ),
      ),
      SizedBox(
        height:10,
      ),
      Text(
        '${model.title}',

        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: defaultColor,
        ),


      ),
      SizedBox(
        height: 30,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),


      ),
      SizedBox(
        height: 30,
      ),


    ],
  );
}
