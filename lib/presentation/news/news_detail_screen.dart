import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uiwidgets/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class NewsDetailScreen extends StatelessWidget {
  final String description;
  final String imageUrl;
  final String publishedAt;

  const NewsDetailScreen({
    super.key,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 50),
                      ),
                    ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  publishedAt,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                  child: SvgPicture.asset(
                "assets/images/share-1-svgrepo-com.svg",
                width: 60,
              )),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 45,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 72),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/instagram-1-svgrepo-com.svg",
                      width: 50,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/images/twitter-color-svgrepo-com (1).svg",
                      width: 48,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/images/facebook-color-svgrepo-com (1).svg",
                      width: 46,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/images/whatsapp-color-svgrepo-com (2).svg",
                      width: 46,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
