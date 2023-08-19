import '../modules/livro/livro.dart';
import '../modules/usuario/usuario.dart';

class DBList {
  late List<Usuario> usuarios = [];
  late List<Livro> livros = [];

  DBList() {
    Usuario usuario1 = Usuario(
        id: 1, nome: "teste", email: "teste@mail.com", senha: "12345678");
    Usuario usuario2 = Usuario(
        id: 2, nome: "adelson", email: "adelson@mail.com", senha: "12345678");
    Usuario usuario3 = Usuario(
        id: 3, nome: "maria", email: "maria@mail.com", senha: "12345678");

    usuarios.add(usuario1);
    usuarios.add(usuario2);
    usuarios.add(usuario3);

    Livro livro1 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/511+-lOOtsL._SY344_BO1,204,203,200_.jpg',
        titulo: 'O Hobbit',
        valor: 30.00);

    Livro livro2 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/41s5nOT9DqL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'O Manifesto Comunista',
        valor: 10.00);
    Livro livro3 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/511VQoE7CXL._SY346_.jpg',
        titulo: 'Orgulho e Preconceito',
        valor: 30.00);
    Livro livro4 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/51olydUbI6L._SX346_BO1,204,203,200_.jpg',
        titulo: 'One Piece: vol 1',
        valor: 50.00);

    Livro livro5 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/51EZZWkTECL._SX331_BO1,204,203,200_.jpg',
        titulo: 'O Silmarillon',
        valor: 40.00);
    Livro livro6 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/41afCn3PQUL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'O Pequeno Princípe',
        valor: 20.00);
    Livro livro7 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/516VOgxwg2L._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'A garota do lago',
        valor: 15.00);

    Livro livro8 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/51xJXGttg8L._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'Evangélion',
        valor: 10.00);
    Livro livro9 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/51rgk+G0qKL._SY344_BO1,204,203,200_.jpg',
        titulo: 'One Piece: vol 2',
        valor: 40.00);
    Livro livro10 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/41897yAI4LL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'Harry Potter e a Pedra Filosofal',
        valor: 30.00);
    Livro livro11 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/51olydUbI6L._SX346_BO1,204,203,200_.jpg',
        titulo: 'One Piece',
        valor: 50.00);

    Livro livro12 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/51rgk+G0qKL._SY344_BO1,204,203,200_.jpg',
        titulo: 'One Piece: vol 2',
        valor: 40.00);
    Livro livro13 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/511+-lOOtsL._SY344_BO1,204,203,200_.jpg',
        titulo: 'O Hobbit',
        valor: 30.00);

    Livro livro14 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/41s5nOT9DqL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        titulo: 'O Manifesto Comunista',
        valor: 10.00);
    Livro livro15 = Livro(
        urlImagem:
            'https://m.media-amazon.com/images/I/511VQoE7CXL._SY346_.jpg',
        titulo: 'Orgulho e Preconceito',
        valor: 30.00);

    livros.add(livro1);
    livros.add(livro2);
    livros.add(livro3);
    livros.add(livro4);
    livros.add(livro5);
    livros.add(livro6);
    livros.add(livro7);
    livros.add(livro8);
    livros.add(livro9);
    livros.add(livro10);
    livros.add(livro11);
    livros.add(livro12);
    livros.add(livro13);
    livros.add(livro14);
    livros.add(livro15);
  }
}
