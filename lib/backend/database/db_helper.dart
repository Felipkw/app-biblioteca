import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    String path = join(await getDatabasesPath(), "livraria.db");

    Database database = await openDatabase(path,
        version: 2, onCreate: _onCreate, onUpgrade: onUpgrade);

    return database;
  }

  Future<FutureOr<void>> _onCreate(Database db, int version) async {
    String createTable = """
    CREATE TABLE livros(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
	    titulo TEXT NOT NULL,
      autor TEXT NOT NULL,
  	  preco REAL NOT NULL,
  	  descricao TEXT NOT NULL,
  	  url_imagem TEXT NOT NULL,
      numero_paginas TEXT NOT NULL,
      ano_publicado TEXT NOT NULL
    );""";
    await db.execute(createTable);

    List<String> inserts = [
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('O Hobbit', 'J.R.R. TOLKIEN', 25.00 ,'Bilbo Bolseiro era um dos mais respeitáveis hobbits de todo o Condado até que, um dia, o mago Gandalf bate à sua porta. A partir de então, toda sua vida pacata e campestre soprando anéis de fumaça com seu belo cachimbo começa a mudar. Ele é convocado a participar de uma aventura por ninguém menos do que Thorin Escudo-de-Carvalho, um príncipe do poderoso povo dos Anãos. Esta jornada fará Bilbo, Gandalf e 13 anãos atravessarem a Terra-média, passando por inúmeros perigos, como os imensos trols, as Montanhas Nevoentas infestadas de gobelins ou a muito antiga e misteriosa Trevamata, até chegarem (se conseguirem) na Montanha Solitária. Lá está um incalculável tesouro, mas há um porém. Deitado em cima dele está Smaug, o Dourado, um dragão malicioso que... bem, você terá que ler para descobrir.', 'https://m.media-amazon.com/images/I/511+-lOOtsL.SY445_SX342.jpg', '385', '2019');",

        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('A volta ao mundo em 80 dias', 'Júlio Verne', 40.00, 'Phileas Fogg, um inglês rico, metódico e um tanto quanto solitário aposta com seus colegas do clube de jogos que conseguirá dar uma volta ao mundo em apenas 80 dias. Para tal feito, o excêntrico Fogg convida seu fiel empregado Jean Passepartout e juntos viverão muitas aventuras.', 'https://m.media-amazon.com/images/I/71UKvlLXALL.AC_UY218.jpg', 304, 2019);",

        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('A cinco passos de você', 'Rachael Lippincott', 45.00, 'Stella Grant gosta de estar no controle. Ela parece ser uma adolescente típica, mas em sua rotina há listas de tarefas e inúmeros remédios que ela deve tomar para controlar a fibrose cística, uma doença crônica que impede que seus pulmões funcionem como deveriam. Suas prioridades são manter seus pais felizes e conseguir um transplante – e uma coisa não existe sem a outra. Mas para ganhar pulmões novos, Stella precisa seguir seu tratamento à risca e eliminar qualquer chance de infecção, o que significa que ela não pode ficar a menos que dois metros de distância – ou seis passos – de outros pacientes com a doença. O primeiro item é fácil para ela, mas o segundo pode se provar mais difícil do que ela esperava. O único controle que Will Newman deseja é o de sua própria vida. Ele não dá a mínima para o novo tratamento experimental para o qual foi selecionado e não aguenta mais a pressão de sua mãe para que melhore. Prestes a completar dezoito anos, ele mal pode esperar para finalmente se livrar das máquinas e hospitais, usando o pouco de vida que ainda lhe resta para conhecer o mundo. Stella e Will são muito diferentes. Ao mesmo tempo, a doença que os une não é a única coisa que têm em comum. Eles têm que ficar a cinco passos um do outro, mas, conforme a conexão entre os dois aumenta, a vontade de burlar a distância física parece insuportável. Um grande amor vale um passo roubado?', 'https://m.media-amazon.com/images/I/81Q11TuUR3L.AC_UY218.jpg', 288, 2019);",

        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Dom Casmurro', 'Machado de Assis', 20.00, 'Em Dom Casmurro, o narrador Bento Santiago retoma a infância que passou na Rua de Matacavalos e conta a história do amor e das desventuras que viveu com Capitu, uma das personagens mais enigmáticas e intrigantes da literatura brasileira. Nas páginas deste romance, encontra-se a versão de um homem perturbado pelo ciúme, que revela aos poucos sua psicologia complexa e enreda o leitor em sua narrativa ambígua acerca do acontecimento ou não do adultério da mulher com olhos de ressaca, uma das maiores polêmicas da literatura brasileira.', 'https://m.media-amazon.com/images/I/61x1ZHomWUL.AC_UY218.jpg', 208, 2019);",
  
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Sherlock Holmes - O cão dos Baskerville', 'Arthur Conan Doyle', 30.00, 'Holmes investiga a morte do milionário Sir Charles Baskerville que foi encontrado em um pântano próximo a sua casa. Uma lenda local dizia que ele foi assassinado por um cão que assombrava a região. Será isso mesmo?', 'https://m.media-amazon.com/images/I/61oliHz5jSL.AC_UY218.jpg', 224, 2019);",

        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Para todos os garotos que já amei', 'Jenny Han', 25.00, 'Lara Jean guarda suas cartas de amor em uma caixa azul-petróleo que ganhou da mãe. Não são cartas que ela recebeu de alguém, mas que ela mesma escreveu. Uma para cada garoto que amou — cinco ao todo. São cartas sinceras, sem joguinhos nem fingimentos, repletas de coisas que Lara Jean não diria a ninguém, confissões de seus sentimentos mais profundos. Até que um dia essas cartas secretas são misteriosamente enviadas aos destinatários, e de uma hora para outra a vida amorosa de Lara Jean sai do papel e se transforma em algo que ela não pode mais controlar.', 'https://m.media-amazon.com/images/I/71vGDXuc7uS.SY425.jpg', 320, 2015);",


        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('O Sol é para todos', 'Harper Lee', 15.00, 'Um dos maiores clássicos da literatura mundial. O sol é para todos ganhou o Prêmio Pulitzer em 1961 e deu origem a um filme homônimo, vencedor do Oscar de melhor roteiro adaptado, em 1962. Lançado pela primeira vez em 1960, até hoje vende mais de um milhão de cópias por ano em língua inglesa. Uma história atemporal sobre tolerância, perda da inocência e conceito de justiça.', 'https://m.media-amazon.com/images/I/91WKPd60P4L.SY425.jpg', 349, 2006);",

        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('O Ceifador', 'Neal Shusterman', 40.00, 'A humanidade venceu todas as barreiras: fome, doenças, guerras, miséria… Até mesmo a morte. Agora os ceifadores são os únicos que podem pôr fim a uma vida, impedindo que o crescimento populacional vá além do limite e a Terra deixe de comportar a população por toda a eternidade. Citra e Rowan são adolescentes escolhidos como aprendizes de ceifador - um papel que nenhum dos dois quer desempenhar. Para receberem o anel e o manto da Ceifa, os adolescentes precisam dominar a \"arte\" da coleta, ou seja, precisam aprender a matar. Porém, se falharem em sua missão - ou se a cumplicidade no treinamento se tornar algo mais -, podem colocar a própria vida em risco.', 'https://m.media-amazon.com/images/I/91LldWCllgS.AC_UY218.jpg', 448, 2017);",

        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Fortaleza Digital', 'Dan Brown', 35.00, 'Responsável por monitorar as comunicações de todo o planeta e proteger informações do governo dos Estados Unidos, a ultrassecreta NSA, a Agência de Segurança Nacional americana, investiu às escondidas numa arma revolucionária para combater a ação de grupos terroristas na era da informática. Seu trunfo é o supercomputador TRANSLTR, capaz de decifrar em poucos minutos qualquer mensagem encriptada enviada pela Internet. Quando o infalível TRANSLTR é paralisado por um misterioso código, a agência convoca a chefe do Departamento de Criptografia, a matemática Susan Fletcher, para investigar o que está acontecendo. Susan faz uma descoberta aterradora: a NSA se tornou refém do gênio da computação Ensei Tankado. Demitido da agência por discordar da sua política de respeito aos direitos civis, o programador exige que a NSA revele a existência do TRANSLTR à população. Caso contrário, ele divulgará na Internet a fórmula de seu código indecifrável, o Fortaleza Digital. Tankado morre misteriosamente antes de cumprir sua ameaça, dando início a uma corrida desesperada que se desenrola paralelamente nos corredores do submundo do poder, nos arranha-céus de Tóquio e nas ruas de Sevilha. Envolvidos numa trama maquiavélica, Susan e David precisam travar uma batalha de vida ou morte para evitar uma tragédia para a segurança nacional americana e impedir que o equilíbrio de forças no mundo mude para sempre.', 'https://m.media-amazon.com/images/I/81JZXzyZUIL.AC_UY218.jpg', 336, 2019);",

        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('A anatomia do estado', 'Murray Rothbard', 19.99, 'O Estado é a “organização dos meios políticos”; é a sistematização do processo predatório sobre um determinado território. O Estado provê um canal legal, ordenado e sistemático para a predação da propriedade privada; ele garante provisão certa, segura e relativamente “pacífica” para a casta parasítica na sociedade. O Estado nunca foi criado por um “contrato social”; ele sempre nasceu da conquista e da exploração. Um método de nascimento de um Estado pode ser ilustrado como segue: nas montanhas da “Ruritânia” do Sul, um grupo de bandidos se organiza para obter o controle físico do território, e finalmente o chefe do grupo se auto-proclama “Rei do governo soberano e independente da Ruritânia do Sul”; e, se ele e seus homens tiverem a força para manter tal domínio por algum tempo, pasmem!, um novo Estado terá se unido à “família de nações”, e os que antes eram meros bandidos terão se transformado na nobreza legítima do reino.', 'https://m.media-amazon.com/images/I/71-wZmQh-WL.AC_UY218.jpg', 80, 2019);",
    ];

    for (var insert in inserts) {
      await db.execute(insert);
    }

    onUpgrade(db, 1, version);

    // createTable = """
    // CREATE TABLE usuarios(
    //   id INTEGER PRIMARY KEY AUTOINCREMENT,
    //   nome TEXT NOT NULL,
    //   email TEXT NOT NULL UNIQUE,
    //   senha TEXT NOT NULL,
    //   url_foto TEXT
    // );""";

    // await db.execute(createTable);

    // createTable = """
    //   CREATE TABLE livros_usuarios(
    //   id_usuario  INTEGER NOT NULL,
    //   id_livro    INTEGER NOT NULL,
    //   FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    //   FOREIGN KEY (id_livro) REFERENCES livros(id)
    // );
    // """;
    // await db.execute(createTable);
  }

  Future<FutureOr<void>> onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      String sql = """
        CREATE TABLE usuarios(
  	      id INTEGER PRIMARY KEY AUTOINCREMENT,
	        nome TEXT NOT NULL,
  	      email TEXT NOT NULL UNIQUE,
  	      senha TEXT NOT NULL,
  	      url_foto TEXT
        );""";

      await db.execute(sql);

      String insert =
          "INSERT INTO usuarios(nome, email, senha) VALUES('teste', 'teste@mail.com', '12345678');";
      await db.execute(insert);

      insert =
          "INSERT INTO usuarios(nome, email, senha) VALUES('adelson', 'adelson@mail.com', '12345678');";
      await db.execute(insert);
    }
  }
}
