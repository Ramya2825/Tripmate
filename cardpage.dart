
import 'package:flutter/material.dart';

class TripPlanPage extends StatelessWidget {
  final Map<String, dynamic> trip;
  final int days;
  final int people;
  final int budget;
  final String travelType;
  final String stayType;

  const TripPlanPage({
    super.key,
    required this.trip,
    required this.days,
    required this.people,
    required this.budget,
    required this.travelType,
    required this.stayType,
  });

  @override
  Widget build(BuildContext context) {
    int estimatedCost = trip["cost"] * days;
    int totalBudget = budget * people;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: true,
            pinned: true,
         
            flexibleSpace: FlexibleSpaceBar(
              title: Text(trip['name'],),
              background: Container(
              
                child: Center(
                  child: Image.network(
                    trip['image'],
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

       
SliverToBoxAdapter(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Adventure ✨",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 30,
                        color: Colors.indigo,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "$days Days",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Duration"),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Icons.people,
                        size: 30,
                        color: Colors.indigo,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "$people People",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Travel Group"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ),
),

SliverToBoxAdapter(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Places to Explore",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 15),

        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trip["places"].length,
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                margin: EdgeInsets.only(right: 10),
                child: Card(
                  child: Column(
                    children: [
                     
                        
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          trip["places"][index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  ),
),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),

                  Text(
                    "Your Travel Preferences",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.directions_car),
                            title: Text("Travel"),
                            subtitle: Text(travelType),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.hotel),
                            title: Text("Stay"),
                            subtitle: Text(stayType),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text("Destination"),
                            subtitle: Text(trip["location"]),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Budget Overview 💰",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: Colors.indigo.shade50,
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Estimated cost per person"),
                            SizedBox(height: 5),
                    
                            Text(
                              "₹$estimatedCost",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                    
                           
                    
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.popUntil(
                          context,
                          (route) => route.isFirst,
                        );
                      },
                      icon: Icon(Icons.home),
                      label: Text("Back to Home"),
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }}