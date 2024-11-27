import 'dart:math';

import 'package:flutter/material.dart';

class CoinTossScreen extends StatefulWidget {
  const CoinTossScreen({super.key});

  @override
  State<CoinTossScreen> createState() => _CoinTossScreenState();
}

class _CoinTossScreenState extends State<CoinTossScreen> with TickerProviderStateMixin {
  var ishead = true;
  bool isAnimating = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isAnimating = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toinCoss() {
    setState(() {
      isAnimating = true;
    });

    _animationController.forward(from: 0).then((_) {
      final random = Random();
      var toss = random.nextInt(2);
      setState(() {
        ishead = toss == 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Coin Toss', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 10),
                  opacity: isAnimating ? 1.0 : 0.0,
                  child: RotationTransition(
                    turns: _animation,
                    child: const Icon(
                      Icons.monetization_on,
                      size: 150.0,
                      color: Colors.black,),
                  ),
                ),
                if (!isAnimating)
                  if (ishead)
                    Column(
                      children: [
                        Image.asset('lib/images/head.png'),
                        const Text('Heads',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                if (!isAnimating)
                  if (!ishead)
                    Column(
                      children: [
                        Image.asset('lib/images/tail.png'),
                        const Text('Tails',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                const SizedBox(height: 50),
                if(!isAnimating)
                  ElevatedButton(
                    onPressed: isAnimating ? null : toinCoss,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      backgroundColor: Colors.yellow,
                    ),
                    child: const Text('Toss Coin',
                        style: TextStyle(color: Colors.black, fontSize: 16.0)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}