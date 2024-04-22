import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tft/models/champions.dart';
import 'package:flutter_tft/models/items.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ItemsList extends StatefulWidget {
  ItemsList({super.key});

  final Future<List<Items>> items = Items(name: '', icon: '', composition: [], effect: '').getAllItems();

  @override
  State<ItemsList> createState() => _ItemsList();

}

class _ItemsList extends State<ItemsList> with AutomaticKeepAliveClientMixin
{
  late Future<List<Items>> items;

  @override
  void initState() {
    super.initState();
    items = Items(name: '', icon: '', composition: [], effect: '').getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DefaultTextStyle(
            style: TextStyle(color: Color(0xFF56496B), fontWeight: FontWeight.w700, fontSize: 16, fontFamily: 'GillSansMT'),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 170,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Item/Effet')],
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('Composition')],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          DefaultTextStyle(
              style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'GillSansMT'),
              child: FutureBuilder(
                  future: items,
                  builder: (context, snapshot)
                  {
                    if(snapshot.hasError) {
                      return const Text('Une erreur est survenue, veuillez réessayer.');
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final items = snapshot.data!;
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF56496B),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: 170,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child: Image.network(items[index].icon),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(items[index].name),
                                            const SizedBox(height: 10),
                                            SizedBox(width: 170, child: HtmlWidget(items[index].effect, textStyle: const TextStyle(fontStyle: FontStyle.italic),),),
                                            const SizedBox(height: 10)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 170,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            for(int j = 0; j < items[index].composition.length; j++) Row(
                                              children: [
                                                SizedBox(
                                                  width: 50,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(12),
                                                    child: Image.network(items[index].composition[j]),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              const SizedBox(height: 20)
                            ],);
                        }
                    );
                  }
              )),
        ],
      ));
  }

  @override
  bool get wantKeepAlive => true;
}