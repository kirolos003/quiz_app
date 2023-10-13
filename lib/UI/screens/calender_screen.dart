import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_project/provider/app_provider.dart';

class CalenderScreen extends StatefulWidget {

  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {


  @override
  Widget build(BuildContext context) {
    var topicsController = PageController();
    List<String> topics = [
      'assets/images/care.png',
      'assets/images/cycle.png',
    ];
    AppProvider provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Image(image : AssetImage('assets/images/alice.png')),
      ),
      body : Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30
        ),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), // Search icon at the beginning
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                hintText: "Article, video, Audio amd More , .... "
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: provider.items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  String text = provider.items[index];
                  double textWidth = getTextWidth(text, const TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
                  return GestureDetector(
                    onTap: () {
                      provider.refresh(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: textWidth + 40, // Adding some padding to the text width for better appearance
                      height: 45,
                      decoration: BoxDecoration(
                        color: provider.current == index ? const Color(0xffF4EBFF) : Colors.white54,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Text(
                            text,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: provider.current == index ? const Color(0xff6941C6) : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Hot topics",
                  style: TextStyle(fontSize: 19),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff5925DC)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff5925DC),
                        size: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => buildTopics(topics[index]),
                itemCount: topics.length,
                physics: const BouncingScrollPhysics(),
                controller: topicsController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Get Tips"),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
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
                  const Image(image: AssetImage('assets/images/doctor.png')),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Connect with doctors & get suggestions",
                          maxLines:3,
                          style: TextStyle(
                              fontWeight: FontWeight.w500 ,
                              fontSize: 20
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Connect now and get expert insights " ,
                          maxLines:3,
                          style: TextStyle(
                            fontWeight: FontWeight.w300 ,
                            fontSize: 15
                        ),),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff7F56D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text("View Details"),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text(
                  "Cycle phases and Period",
                  style: TextStyle(fontSize: 19),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff5925DC)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff5925DC),
                        size: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
  Widget buildTopics(String image) => SizedBox(
    width: double.infinity,
    child: Image(image: AssetImage(image),),
  );

  double getTextWidth(String text, TextStyle textStyle) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.width;
  }

}

