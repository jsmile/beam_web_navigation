class Book {
  const Book(this.id, this.title, this.author);

  final int id;
  final String title;
  final String author;
}

const List<Book> books = [
  Book(1, 'Stranger in a Strange Land', 'Robert A. Heinlein'),
  Book(2, 'Foundation', 'Isaac Asimov'),
  Book(3, 'Fahrenheit 451', 'Ray Bradbury'),
];
