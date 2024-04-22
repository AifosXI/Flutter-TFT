import 'dart:ui';

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(100),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Caitlyn_full.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF56496b)),
              borderRadius: BorderRadius.circular(12),
              color: const Color(0x4256496b),
            ),
            child:SizedBox(
                height: 170,
                width: (MediaQuery.of(context).size.width - 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: DefaultTextStyle(
                      style: const TextStyle(color: Colors.white),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFF56496b)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset('assets/images/avatar.png', fit: BoxFit.cover),
                                  ),
                                )
                            ),
                            const Text('John Doe', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontFamily: "GillSansMT"),),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            )
        ),
        Positioned(
            top: 10,
            right: 10,
            child: TextButton(
              onPressed: (() => print('Settings pressed')),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF56496b)
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.settings_outlined, color: Colors.white, size: 16),
              ),
            )
        )
      ],
    );
  }
}