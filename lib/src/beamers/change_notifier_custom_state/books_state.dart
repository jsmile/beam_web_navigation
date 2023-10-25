import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

class BooksState extends ChangeNotifier with RouteInformationSerializable {
  BooksState([
    bool isBooksListOn = false,
    int? selectedBookId,
  ])  : _isBooksListOn = isBooksListOn,
        _selectedBookId = selectedBookId;

  bool _isBooksListOn;
  bool get isBooksListOn => _isBooksListOn;
  set isBooksListOn(bool isOn) {
    _isBooksListOn = isOn;
    notifyListeners();
  }

  int? _selectedBookId;
  int? get selectedBookId => _selectedBookId;
  set selectedBookId(int? id) {
    _selectedBookId = id;
    notifyListeners();
  }

  void updateWith(bool isBooksListOn, int? selectedBookId) {
    _isBooksListOn = isBooksListOn;
    _selectedBookId = selectedBookId;
    notifyListeners();
  }

  @override
  BooksState fromRouteInformation(RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '/');
    // final uri = Uri.parse(routeInformation.uri.path ?? '/');
    if (uri.pathSegments.isNotEmpty) {
      _isBooksListOn = true;
      if (uri.pathSegments.length > 1) {
        _selectedBookId = int.parse(uri.pathSegments[1]);
      }
    }
    return this;
  }

  @override
  RouteInformation toRouteInformation() {
    String uriString = '';
    if (_isBooksListOn) {
      uriString += '/books';
    }
    if (_selectedBookId != null) {
      uriString += '/$_selectedBookId';
    }
    // final Uri uri = Uri(path: uriString.isEmpty ? '/' : uriString);
    // return RouteInformation(uri: uri);
    return RouteInformation(location: uriString.isEmpty ? '/' : uriString);
  }
}
