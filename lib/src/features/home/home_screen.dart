import 'dart:convert';
import 'package:first_app/src/features/home/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  final Widget child;

  const HomeScreen({required this.child, super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text('Home', style: TextStyle(color: Colors.white),)),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(LucideIcons.message_square_plus),
      ),
      body: child
      );
    }
  }

class DetailsPane extends StatelessWidget {
  const DetailsPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/kung_fu_panda.jpg",
          height: 250,
          fit: BoxFit.cover, // Or BoxFit.contain, depending on your needs
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Spicy Salmon Bowl",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const Text(
                "\$ 16.50",
                style: TextStyle(
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 16,),
              const Text(
                "Salmon, mango, edamame, red cabbage, scallions, tobiko furikake, sriracha aioli",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16,),
              const Text(
                "Quantity",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 16,),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(50),
                      right: Radius.circular(50),
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.remove),
                    const Text("1"),
                    const Icon(Icons.add),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
