import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final AssetImage image;
  final String title;
  const CustomCard({
    Key? key,
    required this.title,
    required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: image, width: 40, height: 45,),
          const SizedBox(height: 15,),
          Text(title, style: const TextStyle(fontSize: 20,),),
        ],
      ),
    );
  }
}
