import 'package:ecommerce_app/tripdetailpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 
  @override
  Widget build(BuildContext context) {

    final searchController = TextEditingController();
    List<Map<String, dynamic>> tripData = [
      {
        "name": "Ooty",
        "location": "Tamil Nadu",
        "image": "https://images.unsplash.com/photo-1500534623283-312aade485b7",
        "rating": 4.5,
        "category": "Nature",
        "description": "A beautiful hill station with gardens, lakes, tea estates and peaceful views.",
         "places": [
      "Ooty Lake",
      "Botanical Garden",
      "Doddabetta Peak",
      "Tea Factory",
      "Rose Garden",
      
    ],
    "cost":2500,
      },
      {
        "name": "Pondicherry",
        "location": "Tamil Nadu",
        "image": "https://thumbs.dreamstime.com/b/rock-beach-pondicherry-puducherry-also-known-as-promenade-gandhi-exceptional-place-where-shore-densely-populated-262974031.jpg",
        "rating": 4.7,
        "category": "Beach",
        "description": "A peaceful beach destination famous for French streets, cafes and beautiful sunsets.",
         "places": [
      "Rock Beach",
      "White Town",
      "Paradise Beach",
      "Auroville",
      "Promenade",
    ],
    "cost":3500,
      },
      {
        "name": "Kodaikanal",
        "location": "Tamil Nadu",
        "image": "https://images.unsplash.com/photo-1597074866923-dc0589150358",
        "rating": 4.7,
        "category": "Nature",
        "description": "A peaceful hill station with beautiful lakes, waterfalls and forest views.",
           "places": [
      "Kodaikanal Lake",
      "Coaker's Walk",
      "Pillar Rocks",
      "Bryant Park",
      "Silver Cascade",
    ],
    "cost":3300,

      },
      {
        "name": "Goa",
        "location": "Goa",
        "image": "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2",
        "rating": 4.9,
        "category": "Beach",
        "description": "A popular beach destination with beaches, food, nightlife and adventure activities.",
         "places": [
      "Baga Beach",
      "Calangute Beach",
      "Fort Aguada",
      "Anjuna",
      "Candolim",
    ],
    "cost":5000,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              backgroundColor: Colors.indigo,foregroundColor: Colors.white,

              title: Text(
                "Tripmate",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              actions: [
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                  
                  },
                  icon: Icon(
                   Icons.favorite_border,
                  ),
                ),
                SizedBox(width: 10),
                IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
              ],
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Plan your trip.\nYour way. ✈️",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(10),

                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Destination',
                      icon: Icon(Icons.search_outlined),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: PageView(
                  children: [
                    Image.network(
                      "https://thumbs.dreamstime.com/b/coastal-landscape-inspirational-quotes-text-travel-best-education-anyone-could-have-310125006.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.network(
                      "https://tse2.mm.bing.net/th/id/OIP.4JrjOBuk8ZBY0LMe-6gtwwHaEK?r=0&pid=Api&h=220&P=0",
                      fit: BoxFit.fill,
                    ),
                    Image.network(
                      "https://dynamic.tourtravelworld.com/blog_images/how-to-plan-a-perfect-3-day-goa-trip-on-a-budget-20250920100924.jpg",
                      fit: BoxFit.fill,
                    ),
                    Image.network(
                      "https://www.touryatras.com/wp-content/uploads/2026/03/why-pondicherry-is-indias-most-relaxing-coastal-escape.jpg",
                      fit: BoxFit.fill,
                    ),
                  ],
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
                          builder: (context) =>
                              Tripdetailpage(tripDetail: tripData.first),
                        ),
                      );
                    },
                    icon: Icon(Icons.flight_takeoff),
                    label: Text(
                      "Plan My Trip",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(shadowColor: const Color.fromARGB(255, 84, 83, 83),
                      foregroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Popular Destination",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 4,
                  (context, index) {
                    final trip = tripData[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Tripdetailpage(tripDetail: trip),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(trip['image'], fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    trip['name'],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    trip['location'],
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 17,
                                        ),
                                        SizedBox(width: 5),
                                        Text(trip["rating"].toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
