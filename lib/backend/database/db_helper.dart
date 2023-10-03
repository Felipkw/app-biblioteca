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

    createTable = """
    CREATE TABLE livros_usuarios(
      id_usuario  INTEGER NOT NULL,
      id_livro    INTEGER NOT NULL,
      FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
      FOREIGN KEY (id_livro) REFERENCES livros(id)
    );""";
    await db.execute(createTable);

    String insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('O Hobbit', 'J.R.R. TOLKIEN', 25.00 ,'Bilbo Bolseiro era um dos mais respeitáveis hobbits de todo o Condado até que, um dia, o mago Gandalf bate à sua porta. A partir de então, toda sua vida pacata e campestre soprando anéis de fumaça com seu belo cachimbo começa a mudar. Ele é convocado a participar de uma aventura por ninguém menos do que Thorin Escudo-de-Carvalho, um príncipe do poderoso povo dos Anãos. Esta jornada fará Bilbo, Gandalf e 13 anãos atravessarem a Terra-média, passando por inúmeros perigos, como os imensos trols, as Montanhas Nevoentas infestadas de gobelins ou a muito antiga e misteriosa Trevamata, até chegarem (se conseguirem) na Montanha Solitária. Lá está um incalculável tesouro, mas há um porém. Deitado em cima dele está Smaug, o Dourado, um dragão malicioso que... bem, você terá que ler para descobrir.', 'https://m.media-amazon.com/images/I/511+-lOOtsL.SY445_SX342.jpg', '385', '2019');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('A volta ao mundo em 80 dias', 'Júlio Verne', 40.00 ,'Phileas Fogg, um inglês rico, metódico e um tanto quanto solitário aposta com seus colegas do clube de jogos que conseguirá dar uma volta ao mundo em apenas 80 dias. Para tal feito, o excêntrico Fogg convida seu fiel empregado Jean Passepartout e juntos viverão muitas aventuras.', 'https://m.media-amazon.com/images/I/71UKvlLXALL.AC_UY218.jpg', '304', '2019');";
    await db.execute(insert);
    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('A cinco passos de você', 'Rachael Lippincott', 45.00, 'Stella Grant gosta de estar no controle. Ela parece ser uma adolescente típica, mas em sua rotina há listas de tarefas e inúmeros remédios que ela deve tomar para controlar a fibrose cística, uma doença crônica que impede que seus pulmões funcionem como deveriam. Suas prioridades são manter seus pais felizes e conseguir um transplante – e uma coisa não existe sem a outra. Mas para ganhar pulmões novos, Stella precisa seguir seu tratamento à risca e eliminar qualquer chance de infecção, o que significa que ela não pode ficar a menos que dois metros de distância – ou seis passos – de outros pacientes com a doença. O primeiro item é fácil para ela, mas o segundo pode se provar mais difícil do que ela esperava. O único controle que Will Newman deseja é o de sua própria vida. Ele não dá a mínima para o novo tratamento experimental para o qual foi selecionado e não aguenta mais a pressão de sua mãe para que melhore. Prestes a completar dezoito anos, ele mal pode esperar para finalmente se livrar das máquinas e hospitais, usando o pouco de vida que ainda lhe resta para conhecer o mundo. Stella e Will são muito diferentes. Ao mesmo tempo, a doença que os une não é a única coisa que têm em comum. Eles têm que ficar a cinco passos um do outro, mas, conforme a conexão entre os dois aumenta, a vontade de burlar a distância física parece insuportável. Um grande amor vale um passo roubado?', 'https://m.media-amazon.com/images/I/81Q11TuUR3L.AC_UY218.jpg', '288', '2019');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Sherlock Holmes - O cão dos Baskerville', 'Arthur Conan Doyle', 30.00, 'Holmes investiga a morte do milionário Sir Charles Baskerville que foi encontrado em um pântano próximo a sua casa. Uma lenda local dizia que ele foi assassinado por um cão que assombrava a região. Será isso mesmo?', 'https://m.media-amazon.com/images/I/61oliHz5jSL.AC_UY218.jpg', '224', '2019');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Para todos os garotos que já amei', 'Jenny Han', 25.00, 'Lara Jean guarda suas cartas de amor em uma caixa azul-petróleo que ganhou da mãe. Não são cartas que ela recebeu de alguém, mas que ela mesma escreveu. Uma para cada garoto que amou — cinco ao todo. São cartas sinceras, sem joguinhos nem fingimentos, repletas de coisas que Lara Jean não diria a ninguém, confissões de seus sentimentos mais profundos. Até que um dia essas cartas secretas são misteriosamente enviadas aos destinatários, e de uma hora para outra a vida amorosa de Lara Jean sai do papel e se transforma em algo que ela não pode mais controlar.', 'https://m.media-amazon.com/images/I/71vGDXuc7uS.SY425.jpg', '320', '2015');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('O sol é para todos', 'Harper Lee', 15.00, 'Um dos maiores clássicos da literatura mundial. O sol é para todos ganhou o Prêmio Pulitzer em 1961 e deu origem a um filme homônimo, vencedor do Oscar de melhor roteiro adaptado, em 1962. Lançado pela primeira vez em 1960, até hoje vende mais de um milhão de cópias por ano em língua inglesa. Uma história atemporal sobre tolerância, perda da inocência e conceito de justiça.', 'https://m.media-amazon.com/images/I/91WKPd60P4L.SY425.jpg', '349', '2006');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('O Ceifador', 'Neal Shusterman', 40.00, 'A humanidade venceu todas as barreiras: fome, doenças, guerras, miséria… Até mesmo a morte. Agora os ceifadores são os únicos que podem pôr fim a uma vida, impedindo que o crescimento populacional vá além do limite e a Terra deixe de comportar a população por toda a eternidade. Citra e Rowan são adolescentes escolhidos como aprendizes de ceifador - um papel que nenhum dos dois quer desempenhar. Para receberem o anel e o manto da Ceifa, os adolescentes precisam dominar a \"arte\" da coleta, ou seja, precisam aprender a matar. Porém, se falharem em sua missão - ou se a cumplicidade no treinamento se tornar algo mais -, podem colocar a própria vida em risco.', 'https://m.media-amazon.com/images/I/91LldWCllgS.AC_UY218.jpg', '448', '2017');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Fortaleza Digital', 'Dan Brown', 35.00, 'Responsável por monitorar as comunicações de todo o planeta e proteger informações do governo dos Estados Unidos, a ultrassecreta NSA, a Agência de Segurança Nacional americana, investiu às escondidas numa arma revolucionária para combater a ação de grupos terroristas na era da informática. Seu trunfo é o supercomputador TRANSLTR, capaz de decifrar em poucos minutos qualquer mensagem encriptada enviada pela Internet. Quando o infalível TRANSLTR é paralisado por um misterioso código, a agência convoca a chefe do Departamento de Criptografia, a matemática Susan Fletcher, para investigar o que está acontecendo. Susan faz uma descoberta aterradora: a NSA se tornou refém do gênio da computação Ensei Tankado. Demitido da agência por discordar da sua política de respeito aos direitos civis, o programador exige que a NSA revele a existência do TRANSLTR à população. Caso contrário, ele divulgará na Internet a fórmula de seu código indecifrável, o Fortaleza Digital. Tankado morre misteriosamente antes de cumprir sua ameaça, dando início a uma corrida desesperada que se desenrola paralelamente nos corredores do submundo do poder, nos arranha-céus de Tóquio e nas ruas de Sevilha. Enquanto Susan usa seu talento como criptógrafa para tentar desvendar o enigma do Fortaleza Digital, seu namorado, o especialista em idiomas David Becker, sai em busca de um anel deixado por Tankado que pode conter a chave do código. Envolvidos numa trama maquiavélica, Susan e David precisam travar uma batalha de vida ou morte para evitar uma tragédia para a segurança nacional americana e impedir que o equilíbrio de forças no mundo mude para sempre.', 'https://m.media-amazon.com/images/I/81JZXzyZUIL.AC_UY218.jpg', '336', '2019');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('A anatomia do estado', 'Murray Rothbard', 19.99, 'O Estado é a organização dos meios políticos; é a sistematização do processo predatório sobre um determinado território. O Estado provê um canal legal, ordenado e sistemático para a predação da propriedade privada; ele garante provisão certa, segura e relativamente “pacífica” para a casta parasítica na sociedade. O Estado nunca foi criado por um “contrato social”; ele sempre nasceu da conquista e da exploração. Um método de nascimento de um Estado pode ser ilustrado como segue: nas montanhas da “Ruritânia” do Sul, um grupo de bandidos se organiza para obter o controle físico do território, e finalmente o chefe do grupo se auto-proclama “Rei do governo soberano e independente da Ruritânia do Sul”; e, se ele e seus homens tiverem a força para manter tal domínio por algum tempo, pasmem!, um novo Estado terá se unido à “família de nações”, e os que antes eram meros bandidos terão se transformado na nobreza legítima do reino.', 'https://m.media-amazon.com/images/I/71-wZmQh-WL.AC_UY218.jpg', '80', '2019');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Razão e Sensibilidade', 'Jane Austen', 24.99, 'Razão e Sensibilidade é um livro em que as irmãs Elinor e Marianne representam uma dualidade, de maneira alternada, ao longo da narrativa...', 'https://m.media-amazon.com/images/I/81Vv52MKZ5L._AC_UY218_.jpg', '400', '2018');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Anne Frank', 'Anne Frank', 10.00, 'O diário de Anne Frank, o depoimento da pequena Anne, morta pelos nazistas após passar anos escondida no sótão de uma casa em Amsterdã.', 'https://m.media-amazon.com/images/I/91tOJgXRfzL._AC_UY218_.jpg', '416', '2014');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('As Aventuras de Tintim: Rumo à Lua', 'Hergé', 8.00, 'Ao regressar do país do Ouro Negro, o capitão Haddock fica sabendo que o professor Girassol partira havia três semanas com um estrangeiro desconhecido.', 'https://m.media-amazon.com/images/I/91E4TXOmtMS._AC_UY218_.jpg', '64', '2007');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Moby Dick', 'Herman Melville', 40.00, 'Publicada em 1851, Moby Dick é considerada a obra prima de Melville e narra a busca por vingança do Capitão Ahab pela baleia branca Moby Dick.', 'https://m.media-amazon.com/images/I/81HHJ7P2jVL._AC_UY218_.jpg', '72', '2020');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Como fazer amigos e influenciar pessoas', 'Dale Carnegie', 17.99, 'Um dos maiores clássicos de todos os tempos, Como fazer amigos e influenciar pessoas é considerado a Bíblia dos relacionamentos interpessoais.', 'https://m.media-amazon.com/images/I/71x-i7sKSvL._AC_UY218_.jpg', '256', '2019');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Orgulho e Preconceito', 'Jane Austen', 45.00, 'Orgulho e preconceito é o livro mais famoso de Jane Austen e possui uma série de personagens inesquecíveis e um enredo memorável.', 'https://m.media-amazon.com/images/I/81o1EY3JblL._AC_UY218_.jpg', '424', '2018');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('1984', 'George Orwell', 19.99, 'Winston, herói de 1984, último romance de George Orwell, vive aprisionado na engrenagem totalitária de uma sociedade completamente dominada pelo Estado.', 'https://m.media-amazon.com/images/I/819js3EQwbL._AC_UY218_.jpg', '416', '2009');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('É assim que começa', 'Collen Hoover', 39.99, 'Lily e o seu ex-marido, Ryle, acabaram de se adaptar numa situação de compartilhamento de guarda quando, de repente, ela se reencontra com seu primeiro amor, Atlas.', 'https://m.media-amazon.com/images/I/81Izv2GRWoL._AC_UY218_.jpg', '336', '2022');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Caraval', 'Stephanie Garber', 40.00, 'Os anos de espera acabaram: a jovem Scarlett Dragna finalmente recebeu o tão esperado convite para participar do Caraval.', 'https://m.media-amazon.com/images/I/81HB-DJUVHL._SY425_.jpg', '352', '2022');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('É assim que acaba', 'Collen Hoover', 45.00, 'Em É assim que acaba, Colleen Hoover nos apresenta Lily, uma jovem que se mudou de uma cidadezinha do Maine para Boston.', 'https://m.media-amazon.com/images/I/91r5G8RxqfL._AC_UY218_.jpg', '368', '2018');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Dois erros, um acerto', 'Chloe Liese', 15.00, 'Quando Jamie Westenberg e Bea Wilmot se conhecem, fica claro que eles não poderiam ser mais diferentes.', 'https://m.media-amazon.com/images/I/81pLpCoHQVL._AC_UY218_.jpg', '336', '2023');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('O morro dos ventos uivantes', 'Emily Brontë', 24.99, 'As brilhantes habilidades narrativas de Emily Brontë são apresentadas de maneira perturbadora nesta obra-prima da literatura universal.', 'https://m.media-amazon.com/images/I/91bW7gS9P2L._AC_UY218_.jpg', '256', '2022');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('A culpa é das estrelas', 'John Green', 17.99, 'Hazel é uma paciente terminal. Ainda que, por um milagre da medicina, seu tumor tenha encolhido bastante.', 'https://m.media-amazon.com/images/I/51M9IbBqxCL._AC_UY218_.jpg', '288', '2014');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Fourth Wing', 'Rebecca Yarros', 38.99, 'Welcome to the brutal and elite world of Basgiath War College, where everyone has an agenda, and every night could be your last.', 'https://m.media-amazon.com/images/I/91N2N6HBQQL._AC_UY218_.jpg', '512', '2023');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Coraline', 'Neil Gaiman', 30.00, 'Certas portas não devem ser abertas. E Coraline descobre isso pouco tempo depois de chegar com os pais à sua nova casa.', 'https://m.media-amazon.com/images/I/91zkcDFU8-L._AC_UY218_.jpg', '224', '2020');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Eu e Esse Meu Coração', 'C. C. Hunter', 40.00, 'Leah MacKenzie, de 17 anos, não tem coração. O que a mantém viva é um coração artificial que ela carrega dentro de uma mochila.', 'https://m.media-amazon.com/images/I/613df-gsfIL._AC_UY218_.jpg', '424', '2018');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Daisy Jones and The Six', 'Taylor Jenkins Reid', 25.00, 'Embalado pelo melhor do rock’n’roll, um romance inesquecível sobre uma banda dos anos 1970, sua apaixonante vocalista e o amor à música.', 'https://m.media-amazon.com/images/I/51zH8sO2fcL._SY445_SX342_.jpg', '360', '2019');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('A Biblioteca da Meia Noite', 'Matt Haig', 20.00, 'Aos 35 anos, Nora Seed é uma mulher cheia de talentos e poucas conquistas. Arrependida das escolhas que fez no passado.', 'https://m.media-amazon.com/images/I/81iqH8dpjuL._AC_UY218_.jpg', '308', '2021');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Estilhaça-me', 'Tahereh Mafi', 30.00, 'Um toque é o bastante. Com apenas um toque, Juliette Ferrars é capaz de fazer um homem adulto se ajoelhar de dor e implorar por misericórdia.', 'https://m.media-amazon.com/images/I/71P-Mok4cqL._AC_UY218_.jpg', '290', '2018');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('As crônicas de Nárnia', 'C. S. Lewis', 60.00, 'Viagens ao fim do mundo, criaturas fantásticas e batalhas épicas entre o bem e o mal - o que mais um leitor poderia querer de um livro?', 'https://m.media-amazon.com/images/I/71yJLhQekBL._AC_UY218_.jpg', '752', '2009');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Harry Potter e a Pedra Filosofal', 'J. K. Rowling', 20.00, 'Harry Potter é um garoto cujos pais, feiticeiros, foram assassinados por um poderosíssimo bruxo quando ele ainda era um bebê. Ele foi levado, então, para a casa dos tios que nada tinham a ver com o sobrenatural.', 'https://m.media-amazon.com/images/I/41897yAI4LL._SY445_SX342_.jpg', '208', '2017');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Cipreste Triste', 'Agatha Christie', 25.00, 'A dona de uma mansão no interior da Inglaterra morre durante o sono, depois de padecer de uma longa doença. Enquanto a família ainda se recupera do golpe, uma jovem aparece morta nas redondezas.', 'https://m.media-amazon.com/images/I/81fTxVMM4XL._AC_UY218_.jpg', '267', '2014');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('A torre da Andorinha - The Witcher', 'Andrzej Sapkowski', 50.00, 'O bruxo segue em direção ao sul, convencido de que Ciri vai se casar em breve com o imperador de Nilfgaard. Os assassinos impiedosos de Nilfgaard já estão seguindo os rastros de Ciri.', 'https://m.media-amazon.com/images/I/51JbQqNfsyS._SY425_.jpg', '450', '2020');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Harry Potter e o Prisioneiro de Azkaban', 'J. K. Rowling', 24.99, 'As aulas estão de volta à Hogwarts e Harry Potter não vê a hora de embarcar no expresso a vapor que o levará de volta à escola de bruxaria.', 'https://m.media-amazon.com/images/I/41kT95iZ81L._SY445_SX342_.jpg', '288', '2017');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Hábitos Atômicos', 'James Clear', 15.00, 'Pequenas mudanças, resultados impressionantes. Não importa quais sejam seus objetivos, Hábitos Atômicos oferece um método eficaz para você se aprimorar ― todos os dias.', 'https://m.media-amazon.com/images/I/81eT2pjx4jL._SY425_.jpg', '320', '2019');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('A Bíblia Sagrada', 'Thomas Nelson Brasil', 40.00, 'Essa Bíblia ACF é para aqueles que preferem uma linguagem mais tradicional ao ler a Palavra. Nesta tradução mais formal.', 'https://m.media-amazon.com/images/I/511up5B+poL._SY445_SX342_.jpg', '1600', '2020');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Corte de asas e ruína', 'Sarah J. Maas', 30.00, 'Seguindo os acontecimentos do volume anterior, acompanhamos a saga de Feyre Archeon, que suportou a fome, o frio e a desesperança.', 'https://m.media-amazon.com/images/I/71yuikaNMhL._AC_UY218_.jpg', '686', '2022');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Heartstopper', 'Alice Oseman', 35.00, 'Charlie Spring e Nick Nelson não têm quase nada em comum. Charlie é um aluno dedicado e bastante inseguro por conta do bullying que sofre no colégio desde que se assumiu gay.', 'https://m.media-amazon.com/images/I/51wx3A+5s6L._SY445_SX342_.jpg', ' 288', '2021');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Todas as suas (im)perfeições', 'Colleen Hoover', 30.00, 'Todas as suas imperfeições narra a história de Quinn e Graham. Eles se conhecem no pior dia de suas vidas.', 'https://m.media-amazon.com/images/I/51is1KDs5zL._SY445_SX342_.jpg', ' 304', '2019');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('As vantagens de ser invisível', 'Stephen Chbosky', 15.00, 'Coleção Azul Radical. Aventuras, desventuras e adrenalina no cotidiano dos meninos. Livro de estreia do roteirista norte-americano Stephen Chbosky.', 'https://m.media-amazon.com/images/I/51k0X0RixSL._SY445_SX342_.jpg', '224', '2007');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Para Aqueles Que Querem Voar', 'Pirkko Vainio', 20.00, 'PARA AQUELES QUE QUEREM VOAR é um livro que nos apresenta as relações entre as pessoas e as diferenças de autoconhecimento.', 'https://image.isu.pub/180830151613-1452488c4d318002d650ca54f71e4a58/jpg/page_1.jpg', '50', '2018');";
    await db.execute(insert);

    insert =
        "INSERT INTO livros(titulo, autor, preco, descricao, url_imagem, numero_paginas, ano_publicado) VALUES('Verity', 'Collen Hoover', 44.99, 'Um casal apaixonado. Uma intrusa. Três mentes doentias. Finalista do prêmio Goodreads como melhor romance de 2019, Verity é o primeiro thriller de Colleen Hoover e deixa os leitores envolvidos do começo ao fim.', 'https://m.media-amazon.com/images/I/91SDZ2eUj+L._SY425_.jpg', '320', '2020');";
    await db.execute(insert);

    onUpgrade(db, 1, version);
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
