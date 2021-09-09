import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsList = [
    {
      "title_news": "Berita Kesatu",
      "post_on": "2 Februari 2021",
      "img_url": "https://picsum.photos/200/300",
    },
    {
      "title_news": "Berita Kedua",
      "post_on": "2 Agustus 2021",
      "img_url": "https://picsum.photos/200/300",
    },
    {
      "title_news": "Berita Ketiga",
      "post_on": "2 Maret 2021",
      "img_url": "https://picsum.photos/200/300",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title and user button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 20,
              ),

              // search textfield
              Container(
                padding: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    // dry = Dont repeat yourself
                    CategoryCard(
                      nameCategory: 'Health',
                      cardColor: Colors.green,
                      iconCategory: Icons.health_and_safety,
                    ),

                    CategoryCard(
                      nameCategory: 'Sports',
                      cardColor: Colors.blue,
                      iconCategory: Icons.sports_soccer,
                    ),

                    CategoryCard(
                      nameCategory: 'Education',
                      cardColor: Colors.deepPurple,
                      iconCategory: Icons.school,
                    ),

                    CategoryCard(
                      nameCategory: 'Food',
                      cardColor: Colors.red,
                      iconCategory: Icons.restaurant,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Berita Terkini",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 10,
              ),

              // container, sizedbox, expanded, flexible
              Container(
                width: double.infinity,
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return NewsItemCard(
                      title: newsList[index]["title_news"] ?? "Kosong",
                      postOn: newsList[index]["post_on"] ?? "Kosong",
                      imgUrl: newsList[index]["img_url"] ?? "Kosong",
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewsItemCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String postOn;

  const NewsItemCard({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.postOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black45, spreadRadius: 0.5, blurRadius: 2)
          ]),
      child: Stack(
        children: [
          ClipRRect(
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 200,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(postOn),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData iconCategory;
  final String nameCategory;
  final Color cardColor;

  const CategoryCard({
    Key? key,
    required this.iconCategory,
    required this.nameCategory,
    required this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 5,
            child: Icon(
              iconCategory,
              color: Colors.white,
              size: 60,
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Text(
              nameCategory,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
