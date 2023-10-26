part of 'books_bloc.dart';

@immutable
abstract class BooksState {}

class LoadingState extends BooksState {}

class BooksLoadedState extends BooksState {
  BooksLoadedState(this.books);

  final List<Book> books;
}

class BookLoadedState extends BooksState {
  BookLoadedState(this.book);

  final Book book;
}

class BookNotFoundState extends BooksState {}
