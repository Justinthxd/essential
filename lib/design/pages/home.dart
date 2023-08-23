import 'package:essential/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../widget/list_view_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text(
          'Essential',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 22,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white54,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: greenColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: cakeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(width: 35),
            Container(
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text(
                'Records',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListViewDetails(
                    size: size,
                    icon: Icons.percent_rounded,
                    name: 'Sales',
                    description: 'Sinces last week',
                    money: '230k',
                    colorContainer: greenColor,
                  ),
                  ListViewDetails(
                    size: size,
                    icon: Icons.account_circle_outlined,
                    name: 'Customers',
                    description: 'Sinces last week',
                    money: '8.549k',
                    colorContainer: purpleColor,
                  ),
                  ListViewDetails(
                    size: size,
                    icon: Icons.category_rounded,
                    name: 'Products',
                    description: 'Products last week',
                    money: '1.423k',
                    colorContainer: cakeColor,
                  ),
                  ListViewDetails(
                    size: size,
                    icon: Icons.pie_chart_rounded,
                    name: 'Revenue',
                    description: 'Sinces last week',
                    money: '\$ 9745',
                    colorContainer: greenColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: const Color.fromARGB(255, 40, 40, 40),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 45,
          color: Colors.white,
        ),
      ),
    );
  }
}
