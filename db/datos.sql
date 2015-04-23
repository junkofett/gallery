insert into usuarios (nick, pass, email, descripcion_usr, fecha_nac)
  values('tohad', md5('tohad'), 'tohad@gmail.com', 
  '2015 begin in France with the murder of cartoonists, journalists, 
  cops and citizens. Among them the cartoonists Cabu , Charb, Tignous and 
  Wolinski. When I was little, their drawings often lying around in my 
  house, and my parents regularly hung their picture on the door of the 
  fridge, in my room or to share the pleasure of contemplating a thumbnail 
  mixing derision and freedom.

  Following a violence that a deeply complex and global origin, these 
  illustratos and those who accompanied them disappear into a vortex of 
  horror as they have never done anything but speak and draw. If murder is 
  cowardly aggression, humor is defending soft. Assault rifles against pen, 
  the new year starts with a deep melancholy metaphor when humanity is like 
  a separated child mutilating lost on his desert island.

  Positive in nature, and have never really been struck by misfortune, I 
  think that this is the saddest day of my life. Illustrators are murdered 
  for their drawing, beyond the human drama, it is as if a violent bullet 
  scraped my cheek to order me to stick to the tile. Earth its share of 
  drama, and this one goes particularly close to my heart.
  But provocation is part of freedom, it is its prerogative even as it 
  draws attention, never hurt and with a smile. Dear friends, the only 
  reaction to this shocking event must be affection, malice, mockery and 
  poetry, as would have been their victims.

  A big hug to all the victims of injustice and violence regardless of 
  time or place.

  Tohad, with love', to_timestamp('07 11 1981', 'DD MM YYYY')),

  ('mathiaarkoniel', md5('mathiaarkoniel'), 'arkoniel@mathiaarkoniel.com',
  'CONTACT
  If you are interested in commissioning me please email me at 
  arkoniel@mathiaarkoniel.com. 
  Please, do not write notes on DA. Thank you for your understanding.

  COMMISSIONS

  I am always available for commissions, however the waiting list is a little 
  long, so please consider scheduling a commission slot in advance.',
  to_timestamp('10 02 1991', 'DD MM YYYY')),

  ('joshhutchinson', md5('joshhutchinson'), ' info@joshuahutchinson.co.uk',
  'I am currently available for work.', to_timestamp('06 03 1976', 'DD MM YYYY')),

  ('fmacmanus', md5('fmacmanus'), 'finnianm@comcast.net',
  'Finnian MacManus 
  
  United States
  
  Art Center College of Design - Entertainment Design 16
  Contact: finnianm@comcast.net', to_timestamp('02 02 2001', 'DD MM YYYY')),

  ('mrdream', md5('mrdream'), 'mrdream@hotmail.com',
  'Halil URAL

  Turkey

  www.facebook.com/artbyhalilural', to_timestamp('04 01 1997', 'DD MM YYYY')),

  ('sanfranguy', md5('sanfranguy'), 'sanfranguy@gmail.com',
  'United States
  3D Designer in a broad range of industries from ArchViz to Game Environment 
  design, Motion graphics animation and Special Effects. Close to 14 years of 
  experience.

  www.project1media.com', to_timestamp('09 10 1995', 'DD MM YYYY')),

  ('strib', md5('strib'), 'strib@gmail.com',
  NULL, to_timestamp('29 12 1978', 'DD MM YYYY')),

  ('nubiidesign', md5('nubiidesign'), 'info@nubidesign.com',
  NULL, to_timestamp('21 11 1992', 'DD MM YYYY')),

  ('powerkaras', md5('powerkaras'), 'olexander@hotmail.com',
  NULL, to_timestamp('19 06 1994', 'DD MM YYYY')),

  ('noemy96', md5('noemy96'), 'noemy96@gmail.com',
  NULL, to_timestamp('05 09 1996', 'DD MM YYYY')),

  ('quelchii', md5('quelchii'), 'quelchii@gmail.com',
  NULL, to_timestamp('10 05 1995', 'DD MM YYYY')),

  ('wolfskulljack', md5('wolfskulljack'), 'michelleharvey@artist.com',
  NULL, to_timestamp('27 08 1989', 'DD MM YYYY')),

  ('vampirehungerstrike', md5('vampirehungerstrike'),'vampire@hungerstrike.com',
  NULL, to_timestamp('24 07 1987', 'DD MM YYYY')),

  ('dantezx', md5('dantezx'), 'dantezx@gmail.com', NULL,
  to_timestamp('22 01 1988', 'DD MM YYYY')),

  ('m0thart', md5('m0thart'), 'martart@gmail.com', NULL,
  to_timestamp('11 04 1996', 'DD MM YYYY')),

  ('graphicdream', md5('graphicdream'), 'info@graphicdream.com', NULL,
  to_timestamp('02 12 1981', 'DD MM YYYY')),

  ('artofdan70', md5('artofdan70'), 'artofdan70@gmail.com', NULL,
  to_timestamp('03 06 1984', 'DD MM YYYY')),

  ('lavemer', md5('lavemer'), 'lavemer@mixmail.com', NULL,
  to_timestamp('30 09 1970', 'DD MM YYYY'));

--BLOQUE CATEGORIAS
insert into categorias (id, nombre_cat, padre_id)
      values(0, 'ROOT', 0);
insert into categorias (id, nombre_cat, padre_id)
      values(1,'Digital', 0),
            (2,'Tradicional', 0),
            (3,'2D', 1),
            (4,'3D', 1),
            (5,'Paisajes', 3),
            (6,'Paisajes', 4),
            (7,'Personajes', 3),
            (8,'Personajes', 4),
            (9,'Retratos', 7),
            (10,'Retratos', 8),
            (11,'Escena', 3),
            (12,'Escena', 4),
            (13,'Pintura', 2),
            (14,'Escultura', 2),
            (15,'Paisajes', 13),
            (16,'Personajes', 13),
            (17,'Retratos', 16),
            (18,'Lego', 14);

/*create table categorias(
  id            bigserial     constraint pk_categorias primary key,
  nombre_cat    varchar(50)   not null,
  padre_id      bigint        constraint fk_categorias_padre_id
                                  references categorias(id) on delete no action
                                  on update cascade
);*/