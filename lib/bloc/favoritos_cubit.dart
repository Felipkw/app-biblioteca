import 'package:app_biblioteca/backend/modules/livro/livro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritosCubit extends Cubit<List<Livro>> {
  List<Livro> _livros;

  FavoritosCubit()
      : _livros = [],
        super([]);

  addFavorite(Livro livro) {
    print('Adicionado: ${livro.titulo}');
    _livros.add(livro);
    emit(_livros);
  }

  removeFavorite(Livro livro) {
    print('Removendo: ${livro.titulo}');
    _livros.remove(livro);
    emit(_livros);
  }

  isFavorite(Livro livro) {
    return _livros.contains(livro);
  }
}
