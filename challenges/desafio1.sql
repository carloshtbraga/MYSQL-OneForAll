DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE artistas(    
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  artista_name VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(100) NOT NULL,
  artista_id INT NOT NULL,
  album_ano_lancado INT(4) NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE musicas(
  musica_id INT PRIMARY KEY AUTO_INCREMENT,
  musica_name VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  musica_duration INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

CREATE TABLE planos(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  plano_name VARCHAR(100) NOT NULL,
  plano_price DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE usuarios(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_name VARCHAR(100) NOT NULL,
  usuario_age INT NOT NULL,
  plano_id INT NOT NULL,
  data_assinatura DATETIME NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

CREATE TABLE seguidores(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;



CREATE TABLE historico(
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
  data_reproducao DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (usuario_id, musica_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (musica_id) REFERENCES musicas(musica_id)
) engine = InnoDB;

INSERT INTO artistas (artista_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO albuns (album_name, artista_id, album_ano_lancado)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space',2 , 1982),
  ('Falso Brilhante',3 ,1998),
  ('Vento de Maio',3, 2001 ),
  ('QVVJFA?', 4, 2003), 
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

INSERT INTO musicas (musica_name, album_id, musica_duration)
VALUES
  ('BREAK MY SOUL', 1, 279),
  ('VIRGOS GROOVE', 1, 369),
  ('ALIEN SUPERSTAR', 1, 116),
  ('Dont Stop Me Now',2 ,203),
  ("Under Pressure", 3, 152),
  ("Como Nossos Pais", 4, 105),
  ("O Medo de Amar é o Medo de Ser Livre", 5, 207),
  ("Samba em Paris", 6, 267),
  ("The Bard's Song", 7, 244),
  ("Feeling Good", 8, 100);

INSERT INTO planos (plano_name, plano_price)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);
  

INSERT INTO usuarios (usuario_name, usuario_age, plano_id, data_assinatura)
VALUES
  ('Barbara Liskov',	82,	1, '2019-10-20'),
  ('Robert Cecil Martin',	58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler',	46,	2,'2017-01-17'),
  ('Sandi Metz',	58, 2, '2018-04-29'),
  ('Paulo Freire',	19,	3, '2018-02-14'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander',	85,	4, '2019-06-05'),
  ('Judith Butler',	45,	4, '2020-05-13'),
  ('Jorge Amado',	58,	4, '2017-02-17');

INSERT INTO seguidores (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);

  INSERT INTO historico (data_reproducao, musica_id, usuario_id)
VALUES
  ("2022-02-28 10:45:55", 8, 1),
  ("2020-05-02 05:30:35", 2, 1),
  ("2020-03-06 11:22:33", 10, 1),
  ("2022-08-05 08:05:17", 10, 2),
  ("2020-01-02 07:40:33", 7, 2),
  ("2020-11-13 16:55:13", 10, 3),
  ("2020-12-05 18:38:30", 2, 3),
  ("2021-08-15 17:10:10", 8, 4),
  ("2022-01-09 01:44:33", 8, 5),
  ("2020-08-06 15:23:43", 5, 5),
  ("2017-01-24 00:31:17", 7, 6),
  ("2017-10-12 12:35:20", 1, 6),
  ("2011-12-15 22:30:49", 4, 7),
  ("2012-03-17 14:56:41", 4, 8),
  ("2022-02-24 21:14:22", 9, 9),
  ("2015-12-13 08:30:22", 3, 10);