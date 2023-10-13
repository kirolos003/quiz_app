import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ExerciseModel {
  String? image;
  String? title;

  ExerciseModel({
    required this.image,
    required this.title,
  });
}

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Image(image: AssetImage('assets/images/jade.png')),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Jade",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Ready to Workout ?",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Spacer(),
                  badges.Badge(
                    position: badges.BadgePosition.topEnd(top: 12, end: 12),
                    child: IconButton(
                      icon: const Icon(Icons.notifications_none_rounded),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: const Color(0xffe9eaed),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.heart_broken_sharp,
                                    color: Color(0xff717BBC),
                                  ),
                                  Text(
                                    "Heart Rate",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Text("81 BPM",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 40,
                            width: 1,
                            color: const Color(0xffaba8a8),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.list,
                                    color: Color(0xff717BBC),
                                  ),
                                  Text(
                                    "To-do",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Text("32,5 %",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 40,
                            width: 1,
                            color: const Color(0xffaba8a8),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.water_drop_outlined,
                                    color: Color(0xff717BBC),
                                  ),
                                  Text(
                                    "Calo",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Text("1000 Cal",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Workout Programs"),
                ],
              ),
               Expanded(
                 child: DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        TabBar(tabs: const [
                          Tab(text: "All Type",),
                          Tab(text: "Full Body",),
                          Tab(text: "Upper",),
                          Tab(text: "Lower",),
                        ],
                        controller : _tabController,
                        labelColor: Colors.blueGrey,
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              TabScreen1(), // Content for Tab 1
                              TabScreen2(), // Content for Tab 2
                              TabScreen3(), // Content for Tab 3
                              TabScreen4(), // Content for Tab 4
                            ],
                          ),
                        ),
                      ],
                    ),
              ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget exerciseBuild(ExerciseModel model) => Container(
  margin: const EdgeInsets.symmetric(
      vertical: 20
  ),
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: const Color(0xffe9eaed),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const Text("3 days" , style: TextStyle(
                  fontWeight: FontWeight.w500 ,
                  fontSize: 20
              ),)),
          const SizedBox(
            height: 10,
          ),
          Text("${model.title}"),
          const SizedBox(
            height: 10,
          ),
          const Text("Improve mental focus" , style: TextStyle(
              fontWeight: FontWeight.w300 ,
              fontSize: 15
          ),),
          const SizedBox(
            height: 10,
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
      Image(image: AssetImage('${model.image}'))
    ],
  ),
);

class TabScreen1 extends StatelessWidget{
  List<ExerciseModel> exercises = [
    ExerciseModel(image: 'assets/images/mor_yoga.png', title: "Morning Yoga"),
    ExerciseModel(image: 'assets/images/plank.png', title: "Plank Exercise"),
    ExerciseModel(image: 'assets/images/mor_yoga.png', title: "Hip Hop Exercise"),
  ];

  TabScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context , index) => exerciseBuild(exercises[index]),
        itemCount: exercises.length,

    );
  }
}

class TabScreen2 extends StatelessWidget{
  List<ExerciseModel> exercises = [
    ExerciseModel(image: 'assets/images/plank.png', title: "Plank Exercise"),
    ExerciseModel(image: 'assets/images/mor_yoga.png', title: "Morning Yoga"),
    ExerciseModel(image: 'assets/images/mor_yoga.png', title: "Hip Hop Exercise"),
  ];

  TabScreen2({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context , index) => exerciseBuild(exercises[index]),
      itemCount: exercises.length,
    );
  }
}

class TabScreen3 extends StatelessWidget{
  List<ExerciseModel> exercises = [
    ExerciseModel(image: 'assets/images/mor_yoga.png', title: "Hip Hop Exercise"),
    ExerciseModel(image: 'assets/images/plank.png', title: "Plank Exercise"),
    ExerciseModel(image: 'assets/images/mor_yoga.png', title: "Morning Yoga"),
  ];

  TabScreen3({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context , index) => exerciseBuild(exercises[index]),
      itemCount: exercises.length,
    );
  }
}

class TabScreen4 extends StatelessWidget{
  List<ExerciseModel> exercises = [
    ExerciseModel(image: 'assets/images/mor_yoga.png', title: "Hip Hop Exercise"),
    ExerciseModel(image: 'assets/images/plank.png', title: "Plank Exercise"),
    ExerciseModel(image: 'assets/images/mor_yoga.png', title: "Morning Yoga"),
  ];

  TabScreen4({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context , index) => exerciseBuild(exercises[index]),
      itemCount: exercises.length,
    );
  }
}



