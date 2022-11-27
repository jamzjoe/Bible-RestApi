import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black87, BlendMode.srcOver),
              image: AssetImage(
                'assets/bg.jpg',
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                    onPressed: () {
                      navigate('/bible-api.com');
                    },
                    icon: const Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'bible-api.com',
                      style: TextStyle(color: Colors.white),
                    )),
                OutlinedButton.icon(
                    onPressed: () {
                      navigate('/bible');
                    },
                    icon: const Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Rob Keplin Bible Api',
                      style: TextStyle(color: Colors.white),
                    )),
                OutlinedButton.icon(
                    onPressed: () {
                      navigate('/user_list');
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'User List Laravel - Localhost',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          )),
    );
  }

  void navigate(String routes) {
    Navigator.pushNamed(context, routes);
  }
}
