import 'package:flutter/foundation.dart';

class Cook {
  final String? id;
  final String title;
  final String description;
  final String img;
  final ValueNotifier<bool> _isFavorite;

  Cook({
    this.id,
    required this.title,
    required this.description,
    required this.img,
    isFavorite = false,
  }) : _isFavorite = ValueNotifier(isFavorite);

  set isFavorite(bool newValue) {
    _isFavorite.value = newValue;
  }

  bool get isFavorite{
    return _isFavorite.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _isFavorite;
  }

  Cook copyWith({
    String? id,
    String? title,
    String? description,
    String? img,
    bool? isFavorite,
  }) {
    return Cook(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      img: img ?? this.img,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}