import 'package:flutter/material.dart';

class FolderItem extends StatelessWidget {
  const FolderItem({
    super.key,
    required this.icon,
    required this.name,
    required this.description,
    required this.money,
    required this.colorContainer,
  });

  final IconData icon;
  final String name;
  final String description;
  final String money;
  final Color colorContainer;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white10,
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: colorContainer,
            ),
            child: Icon(
              icon,
              size: 30,
              color: Colors.black54,
            ),
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            money,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
