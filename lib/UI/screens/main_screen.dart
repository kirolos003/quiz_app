import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:badges/badges.dart' as badges;

class onBoardingModel {
  String? image;
  String? title;

  onBoardingModel({
    required this.image,
    required this.title,
  });
}

class MainScreen extends StatelessWidget {
  var onBoardingController = PageController();
  bool? isLast = false;

  MainScreen({Key? key}) : super(key: key);
  List<onBoardingModel> boarding = [
    onBoardingModel(image: 'assets/images/Walking the Dog.png', title: "Postive Vibes"),
    onBoardingModel(image: 'assets/images/happy.png', title: "Happy Vibes"),
    onBoardingModel(image: 'assets/images/sad.png', title: "Sad Vibes"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Moody",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Image.asset('assets/images/Group.png'),
          onPressed: () {},
        ),
        actions: [
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 12, end: 12),
            child: IconButton(
              icon: const Icon(Icons.notifications_none_rounded),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Hello, ",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text("Sara Rose"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text(
                  "How are you feeling today ?",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/love.png'),
                      iconSize: 100),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/cool.png'),
                      iconSize: 100),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/happy.png'),
                      iconSize: 100),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/sad.png'),
                      iconSize: 100),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Feature",
                  style: TextStyle(fontSize: 19),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff0c7747)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff0c7747),
                        size: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    buildOnBoardingItem(boarding[index]),
                itemCount: boarding.length,
                physics: const BouncingScrollPhysics(),
                controller: onBoardingController,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: onBoardingController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.green,
                      dotColor: Colors.blueGrey,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      spacing: 3),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Exercise",
                  style: TextStyle(fontSize: 19),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff0c7747)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff0c7747),
                        size: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xfff0ecf6),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(15),
                    child: const Row(
                      children: [
                        Image(image: AssetImage('assets/images/relax.png')),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Relaxation"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xfff2dcde),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(15),
                    child: const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/images/medi.png')),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Meditation"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xfff5f1ed),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(15),
                    child: const Row(
                      children: [
                        Image(image: AssetImage('assets/images/breath.png')),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Breathing"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffe7f0f4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(15),
                    child: const Row(
                      children: [
                        Image(image: AssetImage('assets/images/yoga.png')),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Yoga"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnBoardingItem(onBoardingModel model) => Container(
        decoration: BoxDecoration(
            color: const Color(0xffe3f4ea), borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(25),
        width: double.infinity,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${model.title}',
                      textAlign: TextAlign.start,
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    Text(
                      "Boost your mood with",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "positive vibes",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "10 mins",
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                    ),
                  ],
                ),

              ],
            ),
            const Spacer(),
            Image(
              image: AssetImage('${model.image}'),
            ),
          ],
        ),
      );
}
