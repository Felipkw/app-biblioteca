import '../modules/livro/livro.dart';
import '../modules/usuario/usuario.dart';

class DBList {
  late List<Usuario> usuarios = [];
  late List<Livro> livros = [];

  DBList() {
    Usuario usuario1 = Usuario.cadastro(
        nome: "teste", email: "teste@mail.com", senha: "12345678");
    Usuario usuario2 = Usuario.cadastro(
        nome: "adelson", email: "adelson@mail.com", senha: "12345678");
    Usuario usuario3 = Usuario.cadastro(
        nome: "maria", email: "maria@mail.com", senha: "12345678");

    usuarios.add(usuario1);
    usuarios.add(usuario2);
    usuarios.add(usuario3);

    Livro livro1 = Livro.cadastro(
      titulo: 'O Hobbit',
      autor: 'J.R.R. Tolkien',
      preco: 30.00,
      descricao:
          'Bilbo Bolseiro era um dos mais respeitáveis hobbits de todo o Condado até que, um dia, o mago Gandalf bate à sua porta. A partir de então, toda sua vida pacata e campestre soprando anéis de fumaça com seu belo cachimbo começa a mudar. Ele é convocado a participar de uma aventura por ninguém menos do que Thorin Escudo-de-Carvalho, um príncipe do poderoso povo dos Anãos. Esta jornada fará Bilbo, Gandalf e 13 anãos atravessarem a Terra-média, passando por inúmeros perigos, como os imensos trols, as Montanhas Nevoentas infestadas de gobelins ou a muito antiga e misteriosa Trevamata, até chegarem (se conseguirem) na Montanha Solitária. Lá está um incalculável tesouro, mas há um porém. Deitado em cima dele está Smaug, o Dourado, um dragão malicioso que... bem, você terá que ler para descobrir.',
      urlImagem:
          'https://m.media-amazon.com/images/I/511+-lOOtsL.SY445_SX342.jpg',
      numPaginas: '385',
      anoPublicado: '2019',
    );

    Livro livro2 = Livro.cadastro(
      titulo: 'A volta ao mundo em 80 dias',
      autor: 'Júlio Verne',
      preco: 40.00,
      descricao:
          'Phileas Fogg, um inglês rico, metódico e um tanto quanto solitário aposta com seus colegas do clube de jogos que conseguirá dar uma volta ao mundo em apenas 80 dias. Para tal feito, o excêntrico Fogg convida seu fiel empregado Jean Passepartout e juntos viverão muitas aventuras.',
      urlImagem: 'https://m.media-amazon.com/images/I/71UKvlLXALL.AC_UY218.jpg',
      numPaginas: '304',
      anoPublicado: '2019',
    );

    Livro livro3 = Livro.cadastro(
      titulo: 'A cinco passos de você',
      autor: 'Rachael Lippincott',
      preco: 45.00,
      descricao:
          'Stella Grant gosta de estar no controle. Ela parece ser uma adolescente típica, mas em sua rotina há listas de tarefas e inúmeros remédios que ela deve tomar para controlar a fibrose cística, uma doença crônica que impede que seus pulmões funcionem como deveriam. Suas prioridades são manter seus pais felizes e conseguir um transplante – e uma coisa não existe sem a outra. Mas para ganhar pulmões novos, Stella precisa seguir seu tratamento à risca e eliminar qualquer chance de infecção, o que significa que ela não pode ficar a menos que dois metros de distância – ou seis passos – de outros pacientes com a doença. O primeiro item é fácil para ela, mas o segundo pode se provar mais difícil do que ela esperava. O único controle que Will Newman deseja é o de sua própria vida. Ele não dá a mínima para o novo tratamento experimental para o qual foi selecionado e não aguenta mais a pressão de sua mãe para que melhore. Prestes a completar dezoito anos, ele mal pode esperar para finalmente se livrar das máquinas e hospitais, usando o pouco de vida que ainda lhe resta para conhecer o mundo. Stella e Will são muito diferentes. Ao mesmo tempo, a doença que os une não é a única coisa que têm em comum. Eles têm que ficar a cinco passos um do outro, mas, conforme a conexão entre os dois aumenta, a vontade de burlar a distância física parece insuportável. Um grande amor vale um passo roubado?',
      urlImagem: 'https://m.media-amazon.com/images/I/81Q11TuUR3L.AC_UY218.jpg',
      numPaginas: '288',
      anoPublicado: '2019',
    );

    Livro livro4 = Livro.cadastro(
      titulo: 'Dom Casmurro',
      autor: 'Machado de Assis',
      preco: 20.00,
      descricao:
          'Em Dom Casmurro, o narrador Bento Santiago retoma a infância que passou na Rua de Matacavalos e conta a história do amor e das desventuras que viveu com Capitu, uma das personagens mais enigmáticas e intrigantes da literatura brasileira. Nas páginas deste romance, encontra-se a versão de um homem perturbado pelo ciúme, que revela aos poucos sua psicologia complexa e enreda o leitor em sua narrativa ambígua acerca do acontecimento ou não do adultério da mulher com olhos de ressaca, uma das maiores polêmicas da literatura brasileira.',
      urlImagem: 'https://m.media-amazon.com/images/I/61x1ZHomWUL.AC_UY218.jpg',
      numPaginas: '208',
      anoPublicado: '2019',
    );

    Livro livro5 = Livro.cadastro(
      titulo: 'Sherlock Holmes - O cão dos Baskerville',
      autor: 'Arthur Conan Doyle',
      preco: 30.00,
      descricao:
          'Holmes investiga a morte do milionário Sir Charles Baskerville que foi encontrado em um pântano próximo a sua casa. Uma lenda local dizia que ele foi assassinado por um cão que assombrava a região. Será isso mesmo?',
      urlImagem: 'https://m.media-amazon.com/images/I/61oliHz5jSL.AC_UY218.jpg',
      numPaginas: '224',
      anoPublicado: '2019',
    );

    Livro livro6 = Livro.cadastro(
      titulo: 'Para todos os garotos que já amei',
      autor: 'Jenny Han',
      preco: 25.00,
      descricao:
          'Lara Jean guarda suas cartas de amor em uma caixa azul-petróleo que ganhou da mãe. Não são cartas que ela recebeu de alguém, mas que ela mesma escreveu. Uma para cada garoto que amou — cinco ao todo. São cartas sinceras, sem joguinhos nem fingimentos, repletas de coisas que Lara Jean não diria a ninguém, confissões de seus sentimentos mais profundos. Até que um dia essas cartas secretas são misteriosamente enviadas aos destinatários, e de uma hora para outra a vida amorosa de Lara Jean sai do papel e se transforma em algo que ela não pode mais controlar.',
      urlImagem: 'https://m.media-amazon.com/images/I/71vGDXuc7uS.SY425.jpg',
      numPaginas: '320',
      anoPublicado: '2015',
    );

    Livro livro7 = Livro.cadastro(
      titulo: 'O sol é para todos',
      autor: 'Harper Lee',
      preco: 15.00,
      descricao:
          'Um dos maiores clássicos da literatura mundial. O sol é para todos ganhou o Prêmio Pulitzer em 1961 e deu origem a um filme homônimo, vencedor do Oscar de melhor roteiro adaptado, em 1962. Lançado pela primeira vez em 1960, até hoje vende mais de um milhão de cópias por ano em língua inglesa. Uma história atemporal sobre tolerância, perda da inocência e conceito de justiça.',
      urlImagem: 'https://m.media-amazon.com/images/I/91WKPd60P4L.SY425.jpg',
      numPaginas: '349',
      anoPublicado: '2006',
    );

    Livro livro8 = Livro.cadastro(
      titulo: 'O Ceifador',
      autor: 'Neal Shusterman',
      preco: 40.00,
      descricao:
          'A humanidade venceu todas as barreiras: fome, doenças, guerras, miséria… Até mesmo a morte. Agora os ceifadores são os únicos que podem pôr fim a uma vida, impedindo que o crescimento populacional vá além do limite e a Terra deixe de comportar a população por toda a eternidade. Citra e Rowan são adolescentes escolhidos como aprendizes de ceifador - um papel que nenhum dos dois quer desempenhar. Para receberem o anel e o manto da Ceifa, os adolescentes precisam dominar a "arte" da coleta, ou seja, precisam aprender a matar. Porém, se falharem em sua missão - ou se a cumplicidade no treinamento se tornar algo mais -, podem colocar a própria vida em risco.',
      urlImagem: 'https://m.media-amazon.com/images/I/91LldWCllgS.AC_UY218.jpg',
      numPaginas: '448',
      anoPublicado: '2017',
    );

    Livro livro9 = Livro.cadastro(
      titulo: 'Fortaleza Digital',
      autor: 'Dan Brown',
      preco: 35.00,
      descricao:
          'Responsável por monitorar as comunicações de todo o planeta e proteger informações do governo dos Estados Unidos, a ultrassecreta NSA, a Agência de Segurança Nacional americana, investiu às escondidas numa arma revolucionária para combater a ação de grupos terroristas na era da informática. Seu trunfo é o supercomputador TRANSLTR, capaz de decifrar em poucos minutos qualquer mensagem encriptada enviada pela Internet. Quando o infalível TRANSLTR é paralisado por um misterioso código, a agência convoca a chefe do Departamento de Criptografia, a matemática Susan Fletcher, para investigar o que está acontecendo. Susan faz uma descoberta aterradora: a NSA se tornou refém do gênio da computação Ensei Tankado. Demitido da agência por discordar da sua política de respeito aos direitos civis, o programador exige que a NSA revele a existência do TRANSLTR à população. Caso contrário, ele divulgará na Internet a fórmula de seu código indecifrável, o Fortaleza Digital. Tankado morre misteriosamente antes de cumprir sua ameaça, dando início a uma corrida desesperada que se desenrola paralelamente nos corredores do submundo do poder, nos arranha-céus de Tóquio e nas ruas de Sevilha. Enquanto Susan usa seu talento como criptógrafa para tentar desvendar o enigma do Fortaleza Digital, seu namorado, o especialista em idiomas David Becker, sai em busca de um anel deixado por Tankado que pode conter a chave do código. Envolvidos numa trama maquiavélica, Susan e David precisam travar uma batalha de vida ou morte para evitar uma tragédia para a segurança nacional americana e impedir que o equilíbrio de forças no mundo mude para sempre.',
      urlImagem: 'https://m.media-amazon.com/images/I/81JZXzyZUIL.AC_UY218.jpg',
      numPaginas: '336',
      anoPublicado: '2019',
    );

    Livro livro10 = Livro.cadastro(
      titulo: 'A anatomia do estado',
      autor: 'Murray Rothbard',
      preco: 19.99,
      descricao:
          'O Estado é a “organização dos meios políticos”; é a sistematização do processo predatório sobre um determinado território. O Estado provê um canal legal, ordenado e sistemático para a predação da propriedade privada; ele garante provisão certa, segura e relativamente “pacífica” para a casta parasítica na sociedade. O Estado nunca foi criado por um “contrato social”; ele sempre nasceu da conquista e da exploração. Um método de nascimento de um Estado pode ser ilustrado como segue: nas montanhas da “Ruritânia” do Sul, um grupo de bandidos se organiza para obter o controle físico do território, e finalmente o chefe do grupo se auto-proclama “Rei do governo soberano e independente da Ruritânia do Sul”; e, se ele e seus homens tiverem a força para manter tal domínio por algum tempo, pasmem!, um novo Estado terá se unido à “família de nações”, e os que antes eram meros bandidos terão se transformado na nobreza legítima do reino.',
      urlImagem: 'https://m.media-amazon.com/images/I/71-wZmQh-WL.AC_UY218.jpg',
      numPaginas: '80',
      anoPublicado: '2019',
    );

    Livro livro11 = Livro.cadastro(
      titulo: 'Razão e Sensibilidade',
      autor: 'Jane Austen',
      preco: 24.99,
      descricao:
          'Razão e Sensibilidade é um livro em que as irmãs Elinor e Marianne representam uma dualidade, de maneira alternada, ao longo da narrativa...',
      urlImagem:
          'https://m.media-amazon.com/images/I/81Vv52MKZ5L._AC_UY218_.jpg',
      numPaginas: '400',
      anoPublicado: '2018',
    );

    Livro livro12 = Livro.cadastro(
      titulo: 'Anne Frank',
      autor: 'Anne Frank',
      preco: 10.00,
      descricao:
          'O diário de Anne Frank, o depoimento da pequena Anne, morta pelos nazistas após passar anos escondida no sótão de uma casa em Amsterdã...',
      urlImagem:
          'https://m.media-amazon.com/images/I/91tOJgXRfzL._AC_UY218_.jpg',
      numPaginas: '416',
      anoPublicado: '2014',
    );

    Livro livro13 = Livro.cadastro(
      titulo: 'As Aventuras de Tintim: Rumo à Lua',
      autor: 'Hergé',
      preco: 8.00,
      descricao:
          'Ao regressar do país do Ouro Negro, o capitão Haddock fica sabendo que o professor Girassol partira havia três semanas com um estrangeiro desconhecido...',
      urlImagem:
          'https://m.media-amazon.com/images/I/91E4TXOmtMS._AC_UY218_.jpg',
      numPaginas: '64',
      anoPublicado: '2007',
    );

    Livro livro14 = Livro.cadastro(
      titulo: 'Moby Dick',
      autor: 'Herman Melville',
      preco: 40.00,
      descricao:
          'Publicada em 1851, Moby Dick é considerada a obra prima de Melville e narra a busca por vingança do Capitão Ahab pela baleia branca Moby Dick...',
      urlImagem:
          'https://m.media-amazon.com/images/I/81HHJ7P2jVL._AC_UY218_.jpg',
      numPaginas: '72',
      anoPublicado: '2020',
    );

    Livro livro15 = Livro.cadastro(
      titulo: 'Como fazer amigos e influenciar pessoas',
      autor: 'Dale Carnegie',
      preco: 17.99,
      descricao:
          'Um dos maiores clássicos de todos os tempos, Como fazer amigos e influenciar pessoas é considerado a Bíblia dos relacionamentos interpessoais...',
      urlImagem:
          'https://m.media-amazon.com/images/I/71x-i7sKSvL._AC_UY218.jpg',
      numPaginas: '256',
      anoPublicado: '2019',
    );

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
