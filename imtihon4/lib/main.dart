import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page2.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Page1(),
  ));
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Data> list = [
    Data(
      path: "images/s1.png",
      name: "Original Sushi",
      price: "\$ 26.00",
      star: "✨4.8",
    ),
    Data(
      path: "images/s2.png",
      name: "Salmon Roll",
      price: "\$ 22.50",
      star: "✨4.7",
    ),
    Data(
      path: "images/s3.png",
      name: "Tuna Sashimi",
      price: "\$ 30.00",
      star: "✨4.9",
    ),
  ];
  List<Data> list2 = [
    Data(
      path: "images/s4.png",
      name: "California Roll",
      price: "\$ 18.00",
      star: "✨4.6",
    ),
    Data(
      path: "images/s5.png",
      name: "Dragon Roll",
      price: "\$ 25.00",
      star: "✨4.8",
    ),
    Data(
      path: "images/s6.png",
      name: "Spicy Tuna Roll",
      price: "\$ 23.50",
      star: "✨4.7",
    ),
  ];

  Widget Design(Data data) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Page2(data: data)));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          height: 190,
          width: 135,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 10,
                top: 5,
                child: Text(
                  data.star!,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              Positioned(
                bottom: 2,
                left: 5,
                child: Text(
                  data.price!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 13.5,
                  child: Icon(
                    CupertinoIcons.shopping_cart,
                    size: 14.5,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 25,
                left: 10,
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(data.path!))),
                ),
              ),
              Positioned(
                bottom: 40,
                child: Text(
                  data.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: CarouselCLass(),
          ),
          TextFieldVariable,
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Popular Food",
                  style: TextStyle(
                    fontSize: 17.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(child: Text("")),
                Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // Shu joyini chat gpt da qildim
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: list.map((data) => Design(data)).toList(),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: list2.map((data) => Design(data)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Data {
  String? path;
  String? name;
  String? price;
  String? star;
  Data({this.path, this.name, this.price, this.star});
}

final TextFieldVariable = Padding(
  padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
  child: TextField(
    decoration: InputDecoration(
      hintText: "Search your food ...",
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: Colors.black87,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),
  ),
);

final appBar = AppBar(
  centerTitle: true,
  backgroundColor: Colors.white,
  title: const Column(
    children: [
      Text(
        "Location",
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on_sharp,
            size: 17,
            color: Colors.red,
          ),
          Text(
            "Uzbekistan",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ],
  ),
  leading:
      const Icon(Icons.confirmation_number_outlined, color: Colors.black87),
  actions: const [
    Icon(Icons.notifications_active_outlined, color: Colors.black87),
    Text("    "),
  ],
);

class CarouselCLass extends StatelessWidget {
  const CarouselCLass({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        child: CarouselSlider(
          items: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: const DecorationImage(
                    image: AssetImage("images/sale1.png"), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Get special discount",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "up to 85%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Colors.grey.shade200),
                      child: const Center(
                        child: Text(
                          "Claim voucher",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: const DecorationImage(
                    image: AssetImage("images/sale2.png"), fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Get special discount",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      "up to 30%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Colors.grey.shade200),
                      child: const Center(
                        child: Text(
                          "Claim voucher",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),
      ),
    );
  }
}
