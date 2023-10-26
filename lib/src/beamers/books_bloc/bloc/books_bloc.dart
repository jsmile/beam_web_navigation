import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../models/book.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(LoadingState()) {
    on<BooksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  bool _firstTimeBooks = true;

  final List<Map<String, dynamic>> _books = [
    {
      'id': '1',
      'title': 'Stranger in a Strange Land',
      'author': 'Robert A. Heinlein',
    },
    {
      'id': '2',
      'title': 'Foundation',
      'author': 'Isaac Asimov',
    },
    {
      'id': '3',
      'title': 'Fahrenheit 451',
      'author': 'Ray Bradbury',
    },
  ];

  // @override
  Stream<BooksState> mapEventToState(
    BooksEvent event,
  ) async* {
    if (event is LoadBooksEvent) {
      if (_firstTimeBooks) {
        yield LoadingState();
        // emit(LoadingState()) ;
        await Future.delayed(const Duration(milliseconds: 200));
        _firstTimeBooks = false;
      }
      final books = _books.map((book) => Book.fromJson(book)).toList();

      yield BooksLoadedState(books);
    }

    if (event is LoadBookEvent) {
      yield LoadingState();
      await Future.delayed(const Duration(milliseconds: 200));

      try {
        final book =
            _books.firstWhere((book) => book['id'] == event.bookId.toString());

        yield BookLoadedState(Book.fromJson(book));
      } catch (e) {
        yield BookNotFoundState();
      }
    }
  }
}
