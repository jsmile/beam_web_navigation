import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int id;
  final String title;
  final String author;

  const Book({
    required this.id,
    required this.title,
    required this.author,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  Book.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        title = json['title'],
        author = json['author'];

  @override
  String toString() => 'Book(id: $id, title: $title, author: $author)';
}
