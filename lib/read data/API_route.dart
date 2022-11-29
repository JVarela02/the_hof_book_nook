import 'package:the_hof_book_nook/main.dart';
import 'package:the_hof_book_nook/pages/in app/home_page.dart';
import 'package:the_hof_book_nook/pages/in app/txtinput_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIRouter
{

  Future<List<Textbook>> getTextbook(String query) async
  {
    var result = await http.get(Uri.parse("https://www.googleapis.com/books/v1/volumes?q=" + query + "&maxResults=1"));
    var response = json.decode(result.body)['items'] as List<dynamic>;
    print(response[0]);
    // print(response.map((e) => e['volumeInfo']['title']));
    // print(response.map((e) => e['volumeInfo']['authors'][0]));
    // print(response.map((e) => e['volumeInfo']['description']));

    print(response.map((e) => e['volumeInfo']['imageLinks']['smallThumbnail']));
    return response.map((e) => Textbook(e['volumeInfo']['title'] ,
        e['volumeInfo']['authors'][0], 
        e['volumeInfo']['description'],
        e['volumeInfo']['imageLinks']['smallThumbnail'] 
        )).toList();
  }
}

class Textbook
{
  String title;
  String authors;
  String description;
  String image;
  Textbook(this.title, this.authors, this.description, this.image);
}
