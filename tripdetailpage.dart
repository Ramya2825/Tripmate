
import 'package:ecommerce_app/customize.dart';

import 'package:flutter/material.dart';

class Tripdetailpage extends StatelessWidget {
  final Map<String, dynamic> tripDetail;

  const Tripdetailpage({
    super.key,
    required this.tripDetail,
  });

  @override
  Widget build(BuildContext context) {
    final trip = tripDetail;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.network(
                    trip['image'],
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 30,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),

                Positioned(
                  top: 330,
                  left: 30,
                  child: Text(
                    trip['name'],
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 249, 239, 239),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: Color.fromARGB(255, 38, 164, 222),
                  ),
                  SizedBox(width: 3),
                  Text(
                    trip['location'],
                    style: TextStyle(
                      color: Color.fromARGB(255, 89, 89, 89),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 17,
                  ),
                  SizedBox(width: 5),
                  Text(trip['rating'].toString()),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                trip['description'],
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Places to Visit",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Places displayed using GridView
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      trip['places'][index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  );
                },
                childCount: trip['places'].length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 50,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Customizetrippage(
                            tripDetail: trip,
                            days: 2,
                            people: 1,
                          ),
                        ),
                      );
                    },
                    label: Text(
                      "Customize My Trip",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(shadowColor: Color.fromARGB(255, 84, 83, 83),
                      foregroundColor: Colors.black, backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ), 
        ],
      ),
    );
  }
}

