import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Work Navigation page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/m7Page');
              },
              child: const Text('Module 7 Home Work'),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/m8Page');
              },
              child: const Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}
