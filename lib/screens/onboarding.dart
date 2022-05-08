import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardContent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Row(children: [
                ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: DotIndicator(isActive: index == _pageIndex),
                        )),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(microseconds: 300),
                          curve: Curves.ease);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      Icons.arrow_circle_right,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
          color: isActive
              ? const Color.fromARGB(255, 2, 63, 21)
              : Color.fromARGB(255, 18, 208, 53),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/a.png",
    title: "Enroll in clubs",
    description:
        "With the click of a button u can join any club of your choice",
  ),
  Onboard(
    image: "assets/b.png",
    title: "Upload your achievements",
    description:
        "Now you can post your achievements for everyone to see , like and give their valuable feedbacks",
  ),
  Onboard(
    image: "assets/c.png",
    title: "Get the latest news",
    description:
        "Want to know what's hapenning inside each club? u dont need to go any further, get all the latest news here.",
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      Image.asset(
        image,
        height: 250,
      ),
      const Spacer(),
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color.fromARGB(255, 237, 4, 4),
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      const Spacer(),
    ]);
  }
}
