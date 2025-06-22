import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class AdaptyScreen extends StatefulWidget {
  const AdaptyScreen({super.key});

  @override
  State<AdaptyScreen> createState() => _AdaptyScreenState();
}

class _AdaptyScreenState extends State<AdaptyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [Text("Buraya devam edilecek")],
      ),
    );
  }
}
