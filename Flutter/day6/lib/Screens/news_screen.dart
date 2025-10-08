import 'package:day6/Provider/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';



class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider()..getHeadlines(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: Text('News')),
          body: Consumer<NewsProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return Column(
                    spacing: 10,
                    children: [
                      CachedNetworkImage(
                        imageUrl: provider.articles[index].image ?? '',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          return Container(
                            color: Colors.grey,
                            child: Icon(Icons.error),
                          );
                        },
                      ),
                      Text(
                        provider.articles[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        provider.articles[index].description ?? '',
                        style: TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 12);
                },
                itemCount: provider.articles.length,
              );
            },
          ),
        );
      },
    );
  }
}