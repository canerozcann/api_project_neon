import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/presentation/app_router/app_router.gr.dart';
import 'package:uiwidgets/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.router.push(const NewsRoute());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 217, 0, 223),
            ),
            child: const Center(
              child: Text(
                "Click here for news",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              context.router.push(const AddNewPersonRoute());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 217, 0, 223),
            ),
            child: const Center(
              child: Text(
                "Add a new person",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              context.router.push(const AnimationRoute());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 217, 0, 223),
            ),
            child: const Center(
              child: Text(
                "Click here for Screen Animation",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              context.router.push(const HeroRoute());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 217, 0, 223),
            ),
            child: const Center(
              child: Text(
                "Hero",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
