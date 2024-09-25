import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon4/page.3.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'main.dart';


class Page2 extends StatefulWidget {
  final Data data;
  const Page2({super.key, required this.data});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        actions: const [
          Icon(
            CupertinoIcons.heart_fill,
            color: Color.fromARGB(255, 255, 17, 0),
          ),
          Icon(CupertinoIcons.heart_fill, color: Colors.white),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.data.path!),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.data.name!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          fontSize: 23),
                    ),
                    const Expanded(child: Text("")),
                    Text(
                      widget.data.star!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'images/salmon.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("Salmon"),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/rice.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("Sushi Rice"),
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'images/pepsi.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("Pepsi"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.data.price!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                fontStyle: FontStyle.italic),
                          ),
                          const Expanded(
                              child: Text(
                            "",
                          )),
                          const Text(
                            "- 1 +",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Text(
                            "About Sushi",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          Expanded(
                            child: Text(""),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 100, // Set the height for the scrollable area
                        width: double.infinity,
                        child: const SingleChildScrollView(
                          child: Text(
                            "Sushi (すし, 寿司, 鮨, 鮓, pronounced [sɯɕiꜜ] or [sɯꜜɕi]) is a Japanese dish of prepared vinegared rice (鮨飯, sushi-meshi), usually with some sugar and salt, plus a variety of ingredients (ねた, neta), such as vegetables, and any meat, but most commonly seafood (often raw but can be cooked).",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.data.price!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 23,
                            fontStyle: FontStyle.italic),
                      ),
                      const Text(
                        "Total price",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const Expanded(child: Text("")),
                  ZoomTapAnimation(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Page3()));
                    },
                    child: Container(
                      height: 43,
                      width: 130,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Text(
                        "Place Order",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
