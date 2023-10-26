part of 'books_bloc.dart';

// @immutable
sealed class BooksEvent {}

class LoadBooksEvent extends BooksEvent {}

class LoadBookEvent extends BooksEvent {
  LoadBookEvent(this.bookId);

  final int bookId;
}
