import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_some/model/articles.dart';
import 'package:flutter_app_some/network/api_request.dart';
import 'package:flutter_app_some/screens/news_web_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class HomeScreen extends ConsumerWidget {
  final TabController _tabController;
  final List<Tab> tabs;

  HomeScreen(this._tabController, this.tabs);

  @override
  Widget build(BuildContext context, watch) {
    return TabBarView(
      controller: _tabController,
      children: tabs.map((tab) {
        return watch(newsProvider(tab.text)).when(
            data: (data){
             return Main(data);
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('$err')));
     }).toList(),
    );
  }
}


class Main extends StatelessWidget {
  final List<Articles> articles;
  Main(this.articles);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16/9,
                enlargeCenterPage: true,
                viewportFraction: 0.9
              ),
              items: articles.map((item) {
                return Builder(
     builder: (context) => GestureDetector(
       onTap: (){
         Navigator.push(context,
             MaterialPageRoute(builder: (context) => NewsDetail(item.url),));
       },
       child: Stack(
         children: [
           ClipRRect(
               borderRadius: BorderRadius.circular(10.0),
               child: Image.network(
                 item == null ? 'http://bit.do/fQr6g' :  item.urlToImage,
                 fit: BoxFit.cover,),
           ),
           Column(
               children: [
                 Container(
              color: Color(0xAA333639),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(item.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
          )
               ],
           )
         ],
       ),
     ),
     );
    }).toList(),
            ),
          ),
  Padding(
   padding: const EdgeInsets.only(left: 8),
    child: Text('Trending News', style: TextStyle(
    fontSize: 26,
    ),
    ),
  ),
       Divider(thickness: 2,),
Expanded(
  child:ListView.builder(
itemCount: articles.length,
    itemBuilder: (context, index) => ListTile(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => NewsDetail(articles[index].url),));
      },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            articles[index].urlToImage, fit: BoxFit.cover,
            height: 80,
            width: 80,
          ),
        ),
        title: Text(articles[index].title,
        ),
        subtitle: Text(articles[index].publishedAt,
          style: TextStyle(fontStyle: FontStyle.italic),)
    ),
  ),
)



        ],
      ),
    );
  }
}

