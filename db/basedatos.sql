--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: carpetas_usuarios; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE carpetas_usuarios (
    id bigint NOT NULL,
    carpeta_nom character varying(50) NOT NULL,
    usuarios_id bigint,
    padre_id bigint
);


ALTER TABLE public.carpetas_usuarios OWNER TO gallery;

--
-- Name: carpetas_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: gallery
--

CREATE SEQUENCE carpetas_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carpetas_usuarios_id_seq OWNER TO gallery;

--
-- Name: carpetas_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gallery
--

ALTER SEQUENCE carpetas_usuarios_id_seq OWNED BY carpetas_usuarios.id;


--
-- Name: categorias; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE categorias (
    id bigint NOT NULL,
    nombre_cat character varying(50) NOT NULL,
    padre_id bigint
);


ALTER TABLE public.categorias OWNER TO gallery;

--
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: gallery
--

CREATE SEQUENCE categorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_seq OWNER TO gallery;

--
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gallery
--

ALTER SEQUENCE categorias_id_seq OWNED BY categorias.id;


--
-- Name: ci_sessions; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE ci_sessions (
    session_id character varying(40) DEFAULT '0'::character varying NOT NULL,
    ip_address character varying(45) DEFAULT '0'::character varying NOT NULL,
    user_agent character varying(120) NOT NULL,
    last_activity numeric(10,0) DEFAULT 0 NOT NULL,
    user_data text NOT NULL
);


ALTER TABLE public.ci_sessions OWNER TO gallery;

--
-- Name: comentarios; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE comentarios (
    id bigint NOT NULL,
    usuarios_id bigint,
    imagenes_id bigint,
    texto text NOT NULL
);


ALTER TABLE public.comentarios OWNER TO gallery;

--
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: gallery
--

CREATE SEQUENCE comentarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentarios_id_seq OWNER TO gallery;

--
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gallery
--

ALTER SEQUENCE comentarios_id_seq OWNED BY comentarios.id;


--
-- Name: etiquetas; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE etiquetas (
    id bigint NOT NULL,
    nombre_et character varying(50) NOT NULL
);


ALTER TABLE public.etiquetas OWNER TO gallery;

--
-- Name: etiquetas_id_seq; Type: SEQUENCE; Schema: public; Owner: gallery
--

CREATE SEQUENCE etiquetas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etiquetas_id_seq OWNER TO gallery;

--
-- Name: etiquetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gallery
--

ALTER SEQUENCE etiquetas_id_seq OWNED BY etiquetas.id;


--
-- Name: favoritos; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE favoritos (
    usuarios_id bigint,
    imagenes_id bigint,
    carpeta_id bigint
);


ALTER TABLE public.favoritos OWNER TO gallery;

--
-- Name: fondos; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE fondos (
    id bigint NOT NULL,
    fondo_url character varying(200) NOT NULL,
    usuarios_id bigint
);


ALTER TABLE public.fondos OWNER TO gallery;

--
-- Name: fondos_id_seq; Type: SEQUENCE; Schema: public; Owner: gallery
--

CREATE SEQUENCE fondos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fondos_id_seq OWNER TO gallery;

--
-- Name: fondos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gallery
--

ALTER SEQUENCE fondos_id_seq OWNED BY fondos.id;


--
-- Name: fotos; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE fotos (
    id bigint NOT NULL,
    foto_url character varying(200) NOT NULL,
    usuarios_id bigint
);


ALTER TABLE public.fotos OWNER TO gallery;

--
-- Name: fotos_id_seq; Type: SEQUENCE; Schema: public; Owner: gallery
--

CREATE SEQUENCE fotos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fotos_id_seq OWNER TO gallery;

--
-- Name: fotos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gallery
--

ALTER SEQUENCE fotos_id_seq OWNED BY fotos.id;


--
-- Name: imagenes; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE imagenes (
    id bigint NOT NULL,
    img_url character varying(200) NOT NULL,
    usuarios_id bigint,
    categorias_id bigint,
    descripcion_img text,
    fecha_subida timestamp without time zone DEFAULT now(),
    nsfw boolean DEFAULT false NOT NULL
);


ALTER TABLE public.imagenes OWNER TO gallery;

--
-- Name: imagenes_id_seq; Type: SEQUENCE; Schema: public; Owner: gallery
--

CREATE SEQUENCE imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagenes_id_seq OWNER TO gallery;

--
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gallery
--

ALTER SEQUENCE imagenes_id_seq OWNED BY imagenes.id;


--
-- Name: imgs_etiquetas; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE imgs_etiquetas (
    imagenes_id bigint,
    etiquetas_id bigint
);


ALTER TABLE public.imgs_etiquetas OWNER TO gallery;

--
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE notificaciones (
    id bigint NOT NULL,
    usuarios_id bigint,
    texto character varying(200) NOT NULL,
    notif_url character varying(200) NOT NULL
);


ALTER TABLE public.notificaciones OWNER TO gallery;

--
-- Name: notificaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: gallery
--

CREATE SEQUENCE notificaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificaciones_id_seq OWNER TO gallery;

--
-- Name: notificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gallery
--

ALTER SEQUENCE notificaciones_id_seq OWNED BY notificaciones.id;


--
-- Name: puntuaciones; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE puntuaciones (
    usuarios_id bigint NOT NULL,
    imagenes_id bigint NOT NULL,
    valoracion numeric(1,0) NOT NULL
);


ALTER TABLE public.puntuaciones OWNER TO gallery;

--
-- Name: seguidores; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE seguidores (
    usuarios_id bigint NOT NULL,
    seguidores_id bigint NOT NULL
);


ALTER TABLE public.seguidores OWNER TO gallery;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE usuarios (
    id bigint NOT NULL,
    nick character varying(50) NOT NULL,
    pass character varying(32) NOT NULL,
    email character varying(100) NOT NULL,
    descripcion_usr text,
    fecha_nac date NOT NULL,
    fecha_reg date DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE public.usuarios OWNER TO gallery;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: gallery
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO gallery;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gallery
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY carpetas_usuarios ALTER COLUMN id SET DEFAULT nextval('carpetas_usuarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY categorias ALTER COLUMN id SET DEFAULT nextval('categorias_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY comentarios ALTER COLUMN id SET DEFAULT nextval('comentarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY etiquetas ALTER COLUMN id SET DEFAULT nextval('etiquetas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY fondos ALTER COLUMN id SET DEFAULT nextval('fondos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY fotos ALTER COLUMN id SET DEFAULT nextval('fotos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY imagenes ALTER COLUMN id SET DEFAULT nextval('imagenes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY notificaciones ALTER COLUMN id SET DEFAULT nextval('notificaciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Data for Name: carpetas_usuarios; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY carpetas_usuarios (id, carpeta_nom, usuarios_id, padre_id) FROM stdin;
\.


--
-- Name: carpetas_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('carpetas_usuarios_id_seq', 1, false);


--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY categorias (id, nombre_cat, padre_id) FROM stdin;
\.


--
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('categorias_id_seq', 1, false);


--
-- Data for Name: ci_sessions; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY ci_sessions (session_id, ip_address, user_agent, last_activity, user_data) FROM stdin;
e2e09f3b5b97110e345b74649915259e	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/41.0.2272.76 Chrome/41.0.2272.76 	1427849240	
ae700bfb1e4ce5967316494456210934	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/41.0.2272.76 Chrome/41.0.2272.76 	1427889218	
d5208d3e5c672d8080440893ffe439cf	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/41.0.2272.76 Chrome/41.0.2272.76 	1427902345	
2c65f2ec63f3ec567f0f0e0507e62e19	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/41.0.2272.76 Chrome/41.0.2272.76 	1427902512	a:4:{s:9:"user_data";s:0:"";s:4:"nick";s:5:"tohad";s:7:"usuario";O:7:"Usuario":7:{s:2:"id";s:1:"1";s:4:"nick";s:5:"tohad";s:4:"pass";s:32:"dac1e9b1809e7785d6c66727a88f5a02";s:5:"email";s:15:"tohad@gmail.com";s:15:"descripcion_usr";s:1556:"2015 begin in France with the murder of cartoonists, journalists, \n  cops and citizens. Among them the cartoonists Cabu , Charb, Tignous and \n  Wolinski. When I was little, their drawings often lying around in my \n  house, and my parents regularly hung their picture on the door of the \n  fridge, in my room or to share the pleasure of contemplating a thumbnail \n  mixing derision and freedom.\n\n  Following a violence that a deeply complex and global origin, these \n  illustratos and those who accompanied them disappear into a vortex of \n  horror as they have never done anything but speak and draw. If murder is \n  cowardly aggression, humor is defending soft. Assault rifles against pen, \n  the new year starts with a deep melancholy metaphor when humanity is like \n  a separated child mutilating lost on his desert island.\n\n  Positive in nature, and have never really been struck by misfortune, I \n  think that this is the saddest day of my life. Illustrators are murdered \n  for their drawing, beyond the human drama, it is as if a violent bullet \n  scraped my cheek to order me to stick to the tile. Earth its share of \n  drama, and this one goes particularly close to my heart.\n  But provocation is part of freedom, it is its prerogative even as it \n  draws attention, never hurt and with a smile. Dear friends, the only \n  reaction to this shocking event must be affection, malice, mockery and \n  poetry, as would have been their victims.\n\n  A big hug to all the victims of injustice and violence regardless of \n  time or place.\n\n  Tohad, with love";s:9:"fecha_nac";s:10:"1981-11-07";s:9:"fecha_reg";s:10:"2015-03-27";}s:2:"id";s:1:"1";}
\.


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY comentarios (id, usuarios_id, imagenes_id, texto) FROM stdin;
\.


--
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('comentarios_id_seq', 1, false);


--
-- Data for Name: etiquetas; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY etiquetas (id, nombre_et) FROM stdin;
\.


--
-- Name: etiquetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('etiquetas_id_seq', 1, false);


--
-- Data for Name: favoritos; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY favoritos (usuarios_id, imagenes_id, carpeta_id) FROM stdin;
\.


--
-- Data for Name: fondos; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY fondos (id, fondo_url, usuarios_id) FROM stdin;
\.


--
-- Name: fondos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('fondos_id_seq', 1, false);


--
-- Data for Name: fotos; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY fotos (id, foto_url, usuarios_id) FROM stdin;
\.


--
-- Name: fotos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('fotos_id_seq', 1, false);


--
-- Data for Name: imagenes; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY imagenes (id, img_url, usuarios_id, categorias_id, descripcion_img, fecha_subida, nsfw) FROM stdin;
3	uploads/tohad/tohadc5830d9470093beaa9734c4dbac70056	1	\N	'again, a new concept art from my free webcomic Neighbors of Chaos '	2015-03-29 22:18:37.293805	f
4	uploads/tohad/tohad8ace050bed68d205e92bc19762df01a6	1	\N	'New illustration for the universe of my webcomic'	2015-03-29 22:19:22.59296	f
6	uploads/tohad/tohad02e63657544dce47955d05796393ad70	1	\N	'Additional concept art for the abandoned water park you will discover in the next chapter from my webcomic Neighbours of Chaos. It''s crazy how long it takes to the bazaar in an image, a measure of time inversely proportional to the number of hours it would take me to tidy my desk.  This weekend I will be exhibiting at the Paris Manga and when you read this news, I''d probably towards the plane to Paris or stuck at the airport because of my too much resemblance to Brad Pitt'	2015-03-29 22:23:04.777529	f
8	uploads/tohad/tohad8a48a6c2228984ef6064f99c168ed692	1	\N	'She loves nature and does not like that mistreats her forest, no it is not Poison Ivy but Pocahontas. Arriving in America, John Smith thought he had finally found the perfect place where he could smoke his pipe quiet. But indigenous led by Pocahontas do not really like the new occupants set foot on their territory in the same way they would on a doormat. Because of indigestion popcorn, John Smith could not go back in time on his boat and was captured by Pocahontas and her tribe of hippies. The end of the story is less dramatic than one might think because John Smith serving styling head to the tribe. '	2015-03-29 22:29:59.441145	f
9	uploads/tohad/tohad77d6a19d32049a555ef1226d77388945	1	\N	'She can do whatever she wants with her hair, this is not Lady Gaga but Rapunzel!  Have beautiful long blond hair is the conformist dream of many little girls, but a nightmare for the Rapunzel''s hairdresser who found  in her hair ecosystem including new forms of parasitic lives. After an extensive review of the princess long hair, because of its outstanding capillary was found: Rapunzel eat a daily bowl of fertilizer with her orange juice.'	2015-03-29 22:30:43.548717	f
10	uploads/tohad/tohade348ede2c8c6b4862c0a37f0c1e23d4f	1	\N	'He has large ears and he dresses like a clown, no it is not the princes Charles but Roger Rabbit.  Despite the fact that he is followed by three different psychiatrists, Roger has still not solved the heavy trauma that haunts him since his teens. Indeed, at the end of his highschool, Roger was the only survivor of a costume party with the theme of the cartoons of the previous century. Because of an outdated banana punch, all party guests died of violent diarrhea in the evening, except Roger and his bunny suit with the mask prevented him from wearing anything by mouth.  Since that day, the man continues to wear his costume, locked in an eternal feast in circles ghosts of his dead comrades. An unsolvable for physicians who follow Roger Rabbit, but a big benefit for the Disney parade where Roger works every night.'	2015-03-29 22:37:32.753735	f
11	uploads/tohad/tohad66ea8e2c042cbbe2c8dcd31c7a94ce12	1	\N	'He''s unbearable, does everything to get noticed and tells pathetic jokes, no it is not Shia Labeouf but Alf the alien!  Alf was the hero of a TV show in 80s based registered deafening laughter and actors pretending to enjoy. Despite a hundred episodes, the fury alien was quickly sent to the dustbin of studio productions. We can now cross Alf host sausage stand in supermarkets.  With his design chewbacca mixed with a butter croissant, Alf is perfect chalenger for the contest of the ugliest creature of all the audiovisual landscape.'	2015-03-29 22:38:12.333558	f
12	uploads/tohad/tohad434d31e1f1c5ae346f94ffd6342a6cdc	1	\N	'They are the result of a strange and frightening scientific operation, no it is not phosphorescent sheeps in Uruguay, but the Powerpuff Girls. Blossom, Bubbles and Buttercup, tired of the experience which submitted Professor Utonium, decided to escape the laboratory through the front door. Result: Professor Utonium reduced to gazpacho and military guards dismembered an average of 17 pieces per person. It is now the turn of the girls to give spanked!'	2015-03-29 22:38:56.770978	f
13	uploads/mathiaarkoniel/mathiaarkoniel99596ac106d3da007dcfa1c2d0d5f541	2	\N	'There are entirely too few male merfolk depicted for my liking, so I decided to draw a quick cell-shaded piece.'	2015-03-29 22:41:13.846574	f
14	uploads/mathiaarkoniel/mathiaarkoniel2acf21c46603e1b2d475a7863e8e3335	2	\N	'This was inspired by Chapter 9 of Cast in Ruin. The Arkon didn''t actually spew flame on Sanabalis'' face/head, but rather his robes. For some reason though, I just couldn''t get this image out of my head.'	2015-03-29 22:41:55.027729	f
16	uploads/mathiaarkoniel/mathiaarkoniel3baa8d4a1dac044c1f8dbfbe0c39b04f	2	\N	'Amrod and Amras.   A quick cel-shaded piece of the twin sons of Feanor. Since canon is contradictory on this, I prefer to go with the version where both twins survive the burning of the ships.  So this scene would take place long after, in Middle-Earth, hence the long faces on Ambarussa. '	2015-03-29 22:43:21.614618	f
27	uploads/joshhutchinson/joshhutchinson570aa144d068ef06c878cb636d233ffa	3	\N	''	2015-03-29 22:53:38.779061	f
15	uploads/mathiaarkoniel/mathiaarkoniel72ec5262455ba6917a978c74fcc67cba	2	\N	'Chronicles of Elantra Speed Painting. I am currently reading the Chronicles of Elantra by Michelle Sagara, and I love it! I especially love the Dragon court (with the Arkon and Sanabalis at the top), Lord Nightshade and Kaylin.   This painting is more figurative than literal. I do not believe any of the dragons would so easily tolerate a human on their heads. But in this case, it represents the fact that Kaylin is doing constantly things that get her the attention of the Dragon court. The Dragon in this painting is the Dragon Emperor, with "Kaylin on his mind". :XD: The colors of the Dragon Emperor are never described to my knowledge, and though I''ve written to Mrs. Michelle Sagara West to ask her whether she could describe to me a bit the Dragon Emperor, she hasn''t replied yet, so the colors of the dragon are not canon.'	2015-03-29 22:42:32.493222	f
23	uploads/mathiaarkoniel/mathiaarkoniel42924f6f44a2b2af62947b4c30b4ee0a	2	\N	'"My Guardian Angel"  This is actually very close to how I always saw the Archangel Michael in my minds eye (minus the little red cloth, of course ;) ). I am not religious at all, so the iconic Saint''s halo around the angel''s head is there for decorative purposes and to balance out the painting color-wise. '	2015-03-29 22:49:03.297437	f
26	uploads/joshhutchinson/joshhutchinson3b836779be563fd5a804097c84706a54	3	\N	''	2015-03-29 22:53:11.19593	f
32	uploads/joshhutchinson/joshhutchinsonf88059ef3d587ac5739b67f4aaabf177	3	\N	''	2015-03-29 22:56:20.611331	f
17	uploads/mathiaarkoniel/mathiaarkoniel797893371ea78bd6a4b627c052de59a5	2	\N	'This piece is a Chronicles of Elantra Fanart.  Kaylin and Lord Diarmat… Yes, I really do ship them, as illogical and impossible as this pairing is. :)  In fiction, I just LOVE characters or pairings that are rare, difficult or even hazardous. One crazy moment, when I reread Cast in Shadow, I swear I saw Kaylin as the “Child of Night” which Makkuron named her to be, and standing by his side as his ''queen''. XD So yeah… My mind can imagine the craziest pairings when it comes to characters I find fascinating, even if they have absolutely nothing to do with each other in canon.'	2015-03-29 22:43:58.665951	f
28	uploads/joshhutchinson/joshhutchinson8e7bb71c70908baf919d8bee427cc57f	3	\N	'Character design based on Japanese Noh theatre'	2015-03-29 22:54:13.268456	f
18	uploads/mathiaarkoniel/mathiaarkoniel2041c4c8e12aa689d694962d974a16ce	2	\N	'This is a commissioned painting.  The new cover for the Deep Within romance-novel by Cathrine Nacht.'	2015-03-29 22:44:36.631282	f
29	uploads/joshhutchinson/joshhutchinson0250d6eb7cb34d304e9a0f7b1b213ae3	3	\N	'The man of Armadon is an intergalactic being who is a hero on his home planet. He is part of a species, which live for millennia and are extremely wise given their age. His kind have no facial features and communicate with their own through telepathy. Now living on Earth, in the city of Armadon, he cannot communicate with the locals, so he tells his story by using his projection abilities. In this scene he is introducing the city he lived in on his home planet as passersby look on in fascination.'	2015-03-29 22:54:55.751026	f
19	uploads/mathiaarkoniel/mathiaarkoniel6d461966d85a1f3dfc885fc9606b7086	2	\N	'This piece was commissioned by Anna P.  Sevan is the original character of Anna Pettersson.'	2015-03-29 22:45:11.055047	f
21	uploads/mathiaarkoniel/mathiaarkonieldb1055ce224b62a44fa72ed9dd488bba	2	\N	'Commissioned by Raythe Reign. A temporary cover for the new "Cursed" yaoi novel, by X. Aratare.'	2015-03-29 22:47:16.317617	f
24	uploads/joshhutchinson/joshhutchinsondb26f83c6de7c0a6ee18b92331465f80	3	\N	'Redesign of an old concept.'	2015-03-29 22:50:52.061232	f
30	uploads/joshhutchinson/joshhutchinsona67901a5120400a2e88ad072b84c031f	3	\N	'Gregory with his two companions Trevor (black) and Sasha (golden)  He is the character from a series of environments depicting his travels across a fantasy world.'	2015-03-29 22:55:29.335825	f
20	uploads/mathiaarkoniel/mathiaarkoniel155b4a6dde9a2c9bda70d73d67be87de	2	\N	'Commissioned by Anna P.  Deva is the original character of Anna Pettersson.'	2015-03-29 22:45:49.9913	f
22	uploads/mathiaarkoniel/mathiaarkoniel504a83ac207d3b37c304a5820571d9aa	2	\N	'Quick portrait of one of my Original Characters: Rahmvar Darkhael, the "Hades" of my Universe.'	2015-03-29 22:47:49.575518	f
25	uploads/joshhutchinson/joshhutchinson0db1b86ffec6acb07419fadcb53f9939	3	\N	'A re-hash of an old illustration. Quite a personal piece.'	2015-03-29 22:51:09.993763	f
31	uploads/joshhutchinson/joshhutchinson5385c3d31900899c5c68704d7938c3a4	3	\N	''	2015-03-29 22:55:59.833935	f
34	uploads//01b4acad4ac4b4ecb8f37104127df112	4	\N	'Another shot of the surface ruins in Project ARK'	2015-03-29 23:12:22.83834	f
35	uploads/fmacmanus/fmacmanus29ad99fc050710b9ee317dbb254844e5	4	\N	'Inspired by my time in India Photoshop + Tablet'	2015-03-29 23:16:27.480962	f
36	uploads/fmacmanus/fmacmanus2a2b68595444ed7ef8831bb20fc0cb31	4	\N	'Landscape, half study, half imagination'	2015-03-29 23:24:33.320659	f
38	uploads/fmacmanus/fmacmanus3a61f25299fe149190b5d4ec45457596	4	\N	'Before the Towers were even conceived of, the governments of the world were undermined by supercorperations, each like a shark gobbling up smaller fish. These corporations grew until no force on earth could control them- they made their own decisions and so they made the world''s decisions. This was the beginning of the end, for just one experiment would set humanity on its downward spiral, towards the Collapse.'	2015-03-29 23:26:02.288825	f
39	uploads/fmacmanus/fmacmanus47fe5bd10af6e808e645d9e03c0965e9	4	\N	'HUNTING THE ALKAZIR by Finnian MacManus  For depthCORE XLV: PRIMAL [link]  “There’s not many a bounty hunter that can bring down a Great Alkazir… The demon rampages through civilizations, absorbing them into the infinite crust of it’s skin. It’s true form lurks behind layers of architecture, landscape and lifeforms, but those layers rip apart just like any other substance… when you apply the correct amount of firepower.”  Photoshop and Tablet, hope you enjoy!'	2015-03-29 23:26:53.067267	f
40	uploads/fmacmanus/fmacmanus6bde9dedb55db602541a389beb9579f0	4	\N	'A project for Desktopography 2013, also something I worked on over summer Concept art for a Petra and Roman inspired environment. Download for a x1600 or go to www.desktopography.net for a full version!'	2015-03-29 23:28:04.004655	f
41	uploads/fmacmanus/fmacmanused193525e94d48044ae36a1103a4f5ca	4	\N	'Journey of the Atreidae serving Intrinsic Nature release 11 (Featured piece)  This is probably one of the most time consuming pieces i''ve ever done... I put alot of work into this so make sure to look at all the detail! Alot of people dont notice the camels and people on the bridge to the temple ;)  This is about technology vs religion, or traditions. I feel that even when the human race has achieved technology that will be able to get us anywhere, let us do anything we want, many will still follow the traditions of their ancestors... the power of religion and tradition will always live on.  Vue, Cinema 4D, Zbrush, Wacom Intuos'	2015-03-29 23:29:51.399212	f
42	uploads/fmacmanus/fmacmanus0a95a0270cb63d4f2f6cdc5becdb591d	4	\N	'Viscom podracer from earlier in the year, for Art Center third term. Trying to render out materials in Photoshop, had a fun time. Always been a huge star wars fan!'	2015-03-29 23:30:31.901927	f
43	uploads/fmacmanus/fmacmanus6dc2f2bf99ee2855c10609806dfe665b	4	\N	'Depicting one of the ancient cities receiving light from the guardians.  Trying to develop my own project while studying for school...  More to come, thanks for viewing!'	2015-03-29 23:31:27.101799	f
44	uploads/mrdream/mrdreamc8b4bdccd298a3ffb3812f92eaa8f33f	5	\N	'this piece brought me the 1st prize (gaming laptop) from an artwork challenge sponsored by a local computer store'	2015-03-29 23:53:35.688966	f
45	uploads/mrdream/mrdream0bb23eedd3783225c153f366426f1bd6	5	\N	''	2015-03-29 23:54:39.378174	f
46	uploads/mrdream/mrdream3c725cdb67a91cb13c8f0a670b7d9423	5	\N	'The advanced/prestigious/experienced version of Dark Queen Guinevere for Applibot''s Legend of the Cryptids game. Here is the 1st card of the set: cryptcrawler.deviantart.com/ar… I really had a ball doing the costuming for this one - particularly the helmet - as well as being able to employ a little more "sauce" in the ladies'' outfits. I was going to go over the top with the queen''s regalia but decided that a vampire queen would probably rely more on force of personality and less on flash and flesh to exact her will.  Copyright Applibot  Armor inspired by this guys wicked craftsmanship: sharpener.deviantart.com/galle… Check him out, order something.  Many thanks for the DD, it really means a lot! Best wishes, Brad'	2015-03-29 23:55:53.957527	f
47	uploads/mrdream/mrdream08b5424459f1b9bbede8d93e1220c10e	5	\N	'Hi all! this is the evolved version for the previous piece. its done for the Galaxy Saga game. thanks for dropping by!'	2015-03-29 23:56:34.678844	f
48	uploads/mrdream/mrdream35dc26704ee067e72c0c3ea850f56de3	5	\N	''	2015-03-29 23:57:09.948582	f
49	uploads/mrdream/mrdream35e8fb346a1d4b59b0ac6ddb8200198f	5	\N	''	2015-03-29 23:57:49.391037	f
50	uploads/mrdream/mrdreamecddda903cd5436d4f4d804d38094deb	5	\N	''	2015-03-29 23:58:24.711536	f
51	uploads/mrdream/mrdream931ad45ec4c70a9110377b5f470c55c6	5	\N	''	2015-03-29 23:59:05.625295	f
52	uploads/mrdream/mrdreamb61254da992aad90c07253c6710e9339	5	\N	''	2015-03-29 23:59:36.515402	f
53	uploads/mrdream/mrdream506bc4db06b9b14538bf07d1ee47d49c	5	\N	''	2015-03-30 00:00:00.12552	f
54	uploads/mrdream/mrdreamb480e189a6762319e04bc585c08007ef	5	\N	''	2015-03-30 00:00:43.600938	f
55	uploads/sanfranguy/sanfranguy2cecbfcf3d56772b27cb0894ea0cb337	6	\N	'ZBrush/C4D/VRay  Roughly 10 hours to create/shade/light/etc Design evolution'	2015-03-31 17:25:42.401031	f
56	uploads/sanfranguy/sanfranguyc8cb337a403603b4950354ca1e22aa36	6	\N	'Exposed, as in without armor. It was my intention to show more the inner workings of the mech.  Perhaps one day I''ll get to making the outside.   Mech took 12 days in Zbrush + C4D.   WIP Image;'	2015-03-31 17:26:33.389116	f
57	uploads/sanfranguy/sanfranguy8218a8b1fd0b4260e1945b6a45670b02	6	\N	'A 3D version of a famous 2D shot [link]. Not matched piece for piece, but close enough.   Modeled in ZBrush mostly - Some C4D.  Rendered with VRayforC4D.   Enjoy.'	2015-03-31 17:27:27.681913	f
58	uploads/sanfranguy/sanfranguy96597953ee431c8dbd9002b6ff426b4d	6	\N	'ZBrush - VRay'	2015-03-31 17:28:35.186626	f
59	uploads/sanfranguy/sanfranguyc3fe9fe393947ff08c79a563f06900e4	6	\N	'ZBrush - KitBashing - VRay  Slight update to previous version, that has been deleted'	2015-03-31 17:29:31.76909	f
60	uploads/sanfranguy/sanfranguy457770fef582a00523ab0ec517b30e04	6	\N	'Two days of extra work on an old SciFi interior. Expanded and re-textured.   Original Sci fi interior took 4 days to build.  Mech took 10 days to build.  C4D + VRay  28 million polys.  Cel render only'	2015-03-31 17:30:22.26025	f
61	uploads/sanfranguy/sanfranguyacbb858e5e4a7420353cfd439e769da4	6	\N	'C4D + Latest VRay Opening frame to my 2014 Demo Reel (coming soon) - Fully animated.  Preview OpenGL animation here;'	2015-03-31 17:31:57.981077	f
63	uploads/strib/stribb1ab591a98daa74acd33cda5df3f6dd7	7	\N	'Judge Dredd...'	2015-03-31 17:39:30.143987	f
69	uploads/strib/strib830b631709dbb8c81bf43c4a35d9b7c5	7	\N	'sad Indy'	2015-03-31 17:44:05.389861	f
74	uploads/nubiidesign/nubiidesigna79f5798a8236a788e717a6ad5cd0638	8	\N	''	2015-03-31 17:51:37.754355	f
80	uploads/nubiidesign/nubiidesign567dbfa73dd27f0f611eac68a14d0df5	8	\N	''	2015-03-31 17:56:46.234238	f
84	uploads/powerkaras/powerkaras926821f2ed5f07891166ae64abc2631b	9	\N	''	2015-03-31 18:10:59.372856	f
93	uploads/noemy96/noemy96e0239d4909cbd729362b865d4a339de2	10	\N	''	2015-03-31 18:20:00.33432	f
98	uploads/graphicdream/graphicdream40d1c9bbdcf14871c3f60690bed6de4f	16	\N	'Adobe Illustrator CS'	2015-03-31 18:28:53.429893	f
104	uploads/graphicdream/graphicdream3c9dd47d89d0dfe60b861359614eb29b	16	\N	'Adobe Illustrator CS changed the file from JPEG to PNG'	2015-03-31 18:33:52.180952	f
62	uploads/sanfranguy/sanfranguya364841709ff97622945ee7e14b7ac06	6	\N	'C4D scene VRay Render ZBrush model'	2015-03-31 17:36:57.972158	f
64	uploads/strib/stribd2337a1ee70b8c19b27148f4a6e9a868	7	\N	'print version'	2015-03-31 17:40:02.146112	f
65	uploads/strib/stribf7968fd130f5df3c2112e5109ad1a23a	7	\N	'just drawing Supergirl'	2015-03-31 17:40:52.02235	f
66	uploads/strib/strib38bbd2a6d70178121b8056056783cdd1	7	\N	'Hardback, from IDW available to pre-order at Amazon'	2015-03-31 17:42:05.673501	f
70	uploads/strib/stribdae9e32706fdc55ab925524dc132b05b	7	\N	'Riddick'	2015-03-31 17:47:01.445022	f
71	uploads/strib/strib382f5e3687d63bc48ad4181adeb453d6	7	\N	'Read Dune, by Frank Herbert  Finished version of this.'	2015-03-31 17:47:39.274844	f
72	uploads/strib/strib25e199bd7f253286b209355b23fbfbb3	7	\N	'Chani...warrior woman of the Fremen people.  Read "Dune," by Frank Herbert. It''s my favorite book.'	2015-03-31 17:48:36.642694	f
75	uploads/nubiidesign/nubiidesign01c573de0ab40ee623e138913c5c559a	8	\N	''	2015-03-31 17:52:01.568813	f
76	uploads/nubiidesign/nubiidesignf9c03d1040768cbd0ee8f255c92d424e	8	\N	''	2015-03-31 17:52:41.214084	f
77	uploads/nubiidesign/nubiidesign9981ecec145fd2fa485009aaf9c02748	8	\N	''	2015-03-31 17:53:38.853648	f
81	uploads/powerkaras/powerkarasba4bbce150b656e06b072d3054e0929d	9	\N	''	2015-03-31 18:09:15.628344	f
82	uploads/powerkaras/powerkarasc041c0535c94d76b226f0cffbe569902	9	\N	''	2015-03-31 18:09:39.079414	f
85	uploads/powerkaras/powerkarascd77450a55fa771286899c0f708b8a25	9	\N	''	2015-03-31 18:11:19.596042	f
86	uploads/powerkaras/powerkaras7825b69a96714a55c425b43c4e81b5ce	9	\N	''	2015-03-31 18:11:43.269381	f
87	uploads/powerkaras/powerkaras6c7986d1cc4416a6f3ff67ca46b8067a	9	\N	''	2015-03-31 18:12:06.382216	f
90	uploads/noemy96/noemy968a596686f269d5aaf0eabbf3815681f8	10	\N	''	2015-03-31 18:18:34.551105	f
94	uploads/noemy96/noemy960825c14903ed0eec061082bc0d498007	10	\N	''	2015-03-31 18:20:20.555186	f
95	uploads/noemy96/noemy96b12b90efc49b08586569818437deede0	10	\N	''	2015-03-31 18:20:41.172186	f
99	uploads/graphicdream/graphicdream458f9f17d5fd5b7ead8359dc51bf8ee1	16	\N	'Adobe Illustrator'	2015-03-31 18:29:24.663225	f
100	uploads/graphicdream/graphicdream0230b36accff728ed9eb1d36991b64f3	16	\N	'Adobe Illustrator CS2 use 3 ref-photos'	2015-03-31 18:30:09.202423	t
101	uploads/graphicdream/graphicdreamc96e6f39cdb7a6a98a15d295ddc88da4	16	\N	'Adobe Illustrator CS2 with mouse use 4 ref-photos'	2015-03-31 18:31:08.909559	t
67	uploads/strib/strib8f7c0e2423f7f35cb20d6275efb276e5	7	\N	''	2015-03-31 17:42:52.132367	f
78	uploads/nubiidesign/nubiidesignedafef9f6f068707c396dea515d5804f	8	\N	''	2015-03-31 17:55:27.253782	f
88	uploads/powerkaras/powerkaras2e84c0129159e797bf57570a23a91a1e	9	\N	''	2015-03-31 18:12:46.559079	f
91	uploads/noemy96/noemy965ea381c5b9363891cb0d7f133e67aa8b	10	\N	''	2015-03-31 18:19:08.638915	f
96	uploads/graphicdream/graphicdreamf9aabbf241054282cdbefd4d0c444ea4	16	\N	'Adobe Illustrator CS2 used 4 ref-pfotos with mouse 1 layer'	2015-03-31 18:25:31.492948	f
102	uploads/graphicdream/graphicdream1d7f87a5bbffb560b57c7b0f87432aea	16	\N	'Adobe Illustrator CS2  used 3 ref-photos'	2015-03-31 18:32:03.332839	t
73	uploads/nubiidesign/nubiidesignf0a4503d821673c1af5bbef3b48bf0a0	8	\N	''	2015-03-31 17:51:11.47089	f
79	uploads/nubiidesign/nubiidesignc7cf356760fdcd7704d2216f1b42a41a	8	\N	''	2015-03-31 17:56:16.470725	f
83	uploads/powerkaras/powerkaras0a9502e01f864ae8689a7219d34359ce	9	\N	''	2015-03-31 18:10:39.274109	f
89	uploads/powerkaras/powerkarasa4ea5fd69527b75c3565101ae5a261dc	9	\N	''	2015-03-31 18:16:31.646439	f
92	uploads/noemy96/noemy9643c83ab56114db05bd2e0dcc9ed2d769	10	\N	''	2015-03-31 18:19:37.59644	f
97	uploads/graphicdream/graphicdream5b80b5e8cd54aa250fe81716c9af2b88	16	\N	'Adobe Illustrator CS2'	2015-03-31 18:27:24.764652	f
103	uploads/graphicdream/graphicdreamc628ed78abcf00885e57b93ee7eb217f	16	\N	'Adobe Illustrator CS2 somebody request me'	2015-03-31 18:32:36.533287	f
105	uploads/quelchii/quelchii6209bda3174ac826d547676edf502446	11	\N	'Finally I finished this mixed media drawing (colored pencil, marker, multiliner, white ink) of Loki (Tom Hiddleston). I''m very happy with the result, but my scanner killed the sky a little bit (it doesn''t like the color blue + stars and adds weird lines, so it looks much better on paper)... I hope that you like it as well! :) That''s the first time that I tried to combine so many reference pictures to create something new. I really like to draw details, but I think that I have to add a point to my "never draw this again list": Asgard (especially the city and the Bifrost / rainbow bridge) Update: I tried to edit/rescue the colours with Photoshop. Looks still much better on paper. I''ll try to edit the sky later... Update2: I replaced the scan with a photo. Sky looks better and skin contrast + colors are more realistic and it looks more like the actual drawing (still not perfect).  Thor 2 spoiler: At the end of Thor 2 Loki is alive, disguised as Odin on the throne of Asgard and the Tesseract is in Asgard, too. So I think this could be a movie poster for Thor 3. That''s why I wanted to add fire and ashfall to the sky at first. This would fit to Ragnarök. :D I really hope that they announce the movie release date soon... By the way: I drew him with short hair, because I prefer it and I don''t want to believe that they have no hairdressers in Asgard! :grump:   I used many reference pictures: screencaps of the movies "Thor, 2011" (short Loki hair), "The Avengers, 2012" (Tesseract/blue cube + armor in deleted scenes) and "Thor The Dark World, 2013" (2x Asgard sky, lower part of Gungnir/golden staff), a Thor 2 movie poster (Odin with Gungnir), a Thor 2 promo picture/still (Asgard) and a photo of Tom Hiddleston as Loki on Comic Con (SDCC 2013)  Tools: Paper DIN A4 (= 210mm x 297mm) 190g/m², - >90% Faber-Castell Polychromos artists'' colour pencils, - Faber-Castell pencils HB (for the "sketch") + Faber-Castell Perfection 7057, - Copic Ciao marker, - Copic Multiliner SP 0.03  and Edding 1800 profipen 0.1, - uni-ball Signo pigment ink um-153 white Time: >40h'	2015-03-31 21:32:15.979161	f
108	uploads/quelchii/quelchii73c216e9e9d489593896a7994a41256f	11	\N	'Colored pencil drawing of Natalie Portman. The movie (Black Swan) was good, I really like that picture and I''m a Natalie Portman fan by the way. ;) That''s why I decided to draw this. But now I really have to add something to my "never-draw-this-again-list": feathers... ... and (as always) my scanner destroyed some parts ... :angry: Update: I corrected the colour tint/cast.  Reference was a promo picture (?) of Natalie Portman as Nina Sayers from the movie "Black Swan" (2010).  Paper DIN A4 (= 29,7cm x 21cm) 190g/m²; Faber-Castell Polychromos artists'' colour pencils, uni-ball Signo pigment ink um-153 white; time: >15h'	2015-03-31 21:34:07.146047	f
109	uploads/quelchii/quelchiib7122d56e3099363b99895198ea63bc0	11	\N	'Finally I finished this drawing of Sherlock Holmes (Benedict Cumberbatch) and John Watson (Martin Freeman), which I started two months ago. Sherlock was easy to draw compared to Watson. I think that I just like to draw cheekbones! :D I''m still not sure, but maybe I''ll add a background ("I see fire..."? ;) ), when I''m in the right mood.   Reference was a promo picture of the BBC TV series "Sherlock".  Paper DIN A4 (= 210mm x 297mm) 190g/m², - >90% Faber-Castell Polychromos artists'' colour pencils, - Copic Ciao marker, - Edding 1800 profipen 0.5, - uni-ball Signo pigment ink um-153 white time: > 15h'	2015-03-31 21:34:39.660738	f
110	uploads/quelchii/quelchiiaff5e2e80dd18e4d5a354b0a6b832aeb	11	\N	'This is a little tutorial (see explanations at the bottom of this description) for my latest traditional mixed media drawing "Loki" (Tom Hiddleston as Loki from the movie The Avengers). I photographed the steps 1-11 with my Canon EOS 600D (EOS Rebel T3i) without flash. I''m sorry for the bad quality, but the light conditions were not very good. Step 12 is the scan.'	2015-03-31 21:35:28.228025	f
111	uploads/quelchii/quelchii3aa301a334c2ec674146c43f8213831d	11	\N	'I finally managed to watch almost every episode of "Game of Thrones". So I really had to draw one of my favourite characters: Tyrion! He''s probably the smallest one (because of that the others call him "imp" or "dwarf"), but he is just awesome and gets the best lines! :D Peter Dinklage is really doing a great job as an actor. I noticed that my scanner always kills very dark graphite drawings, because the dark parts reflect the light a bit... Waaaah!  Reference was a production still (?) of Peter Dinklage as Tyrion Lannister from the TV show "Game of Thrones".  Winsor & Newton Extra Smooth Bristol paper A4 250g/m² (size of the drawing: 14,2cm x 18cm); Faber-Castell pencil 9000 (HB, 4B, 7B), Faber-Castell grip 1345 HB 0.5, Faber-Castell Perfection 7056, uni-ball Signo pigment ink um-153 white; time: ~8h'	2015-03-31 21:36:17.006739	f
112	uploads/quelchii/quelchii5a3f4a72bf7727770d4fab1ad9bc7a2d	11	\N	'My first drawing of 2015 is a small sketch card of Saruman! I''m sorry for the bad photo quality, but I was too lazy to scan it (and let the scanner completely destroy it). ^^;  Reference was a screencap (?) of Christopher Lee as Saruman from the movie "The Lord of the Rings: The Fellowship of the Ring" (2001).  Winsor & Newton Extra Smooth Bristol paper (2,5"x3,5" = 6,35cm x 8,9cm) 250g/m²; Faber-Castell Polychromos artists'' colour pencils, Copic Ciao, Copic Multiliner SP 0.03, uni-ball Signo pigment ink um-153 white; time: ~4,5h'	2015-03-31 21:36:51.225481	f
113	uploads/quelchii/quelchiic8d0e9a46261cea70462c6f6aae9cf3b	11	\N	'Mixed media drawing (colored pencil, marker, gel pen) of Daenerys. Her hair was pretty much fun to draw! At first I didn''t want to draw a background, but then I chose a dark shade of grey, because I wanted to highlight that nice hair. :D  Reference was a production still (?) of Emilia Clarke as Daenerys Targaryen from the TV show "Game of Thrones".  Paper DIN A4 190g/m² (size of the drawing = 15,6cm x 17,6cm); Faber-Castell Polychromos artists'' colour pencils, Copic Ciao marker, uni-ball Signo pigment ink um-153 white; time: > 15h?'	2015-03-31 21:37:34.549638	f
114	uploads/quelchii/quelchii713ca693ff3986c7840cad700fb82cfd	11	\N	'I already started too many drawings, but today I was in the mood to draw a fast portrait of Galadriel from Lord of the Rings. I know it''s rough, but I didn''t want to spend too much time on it, because of my other drawings. It''s the first time that I tried to combine pencil and white gel pen by the way and it works well, but I still prefer to draw with colour/colored pencil or markers! ;)  Reference was a screencap of Galadriel (Cate Blanchett) from the movie "The Hobbit: An Unexpected Journey"  Winsor & Newton Extra Smooth Bristol paper A4 250g/m² (size of the drawing = 17,4cm x 19,6cm), pencils (HB, 2B, 8B), Faber-Castell Perfection 7057, uni-ball Signo pigment ink um-153 white, time: ~4h'	2015-03-31 21:38:16.42154	f
116	uploads/wolfskulljack/wolfskulljack9870eb6ccc5dc21d8483c4fc7f72beea	12	\N	'Traditional inks on A3 paper, digital colouring. Felt like drawing something with blood.  Grrrr'	2015-03-31 21:42:40.72973	f
121	uploads/wolfskulljack/wolfskulljackc47d0376446a2e0f124d52c23f721c32	12	\N	'Marker, graphite and fine liner'	2015-03-31 21:47:38.770373	f
115	uploads/quelchii/quelchii1c69cd2ccf705083e060a36461c692df	11	\N	'My second inverted drawing! I couldn''t resist to draw an inverted Loki picture! :D But this time I waited for good light conditions and took my good camera to take a photo of this drawing... For now my eyes hurt enough and my mind is still a little bit confused about all these negative colours. ^^; So my next drawing will be "normal"...  Reference was a promo picture of Tom Hiddleston as Loki from the movie "The Avengers" (2012). Of course I inverted the colours of this picture (= negative) in Photoshop before I started to draw (I used the normal and the inverted picture for reference). The four colour pencils are just on the photo to show the effect and I used a few more colours for this drawing.  Paper DIN A4 190g/m², Faber-Castell Polychromos artists'' colour pencils, time: maybe 12 hours?'	2015-03-31 21:39:39.501123	f
120	uploads/wolfskulljack/wolfskulljack3819e19394c5f97d0345a66d4f4cab2f	12	\N	'NEW- prints are now available on my Etsy store!  www.etsy.com/uk/shop/WolfSkull…   There is a darkness in you. I like it.'	2015-03-31 21:46:55.006964	f
130	uploads/vampirehungerstrike/vampirehungerstrikee0e99a966e84076fd259a352dfafcebc	13	\N	'7 x 5 inches, oil on hardboard.'	2015-03-31 21:54:14.093407	f
139	uploads/dantezx/dantezx8af199bb0a7e97b607a7ba48b9fffa1e	14	\N	'The Royal Lightning Dragon is a custom re work of the Ninjago Lightning Dragon. For the past few years I''ve been making tiny changes, but recently I''ve had the urge to do something big with the big guy. So I started juggling a few ideas around on what to do with him. At first I was going to redesign his body to be more like the Epic Dragon, but I soon ditched that idea. I wasn''t crazy about the look. The idea that I landed up sticking with was to keep most of the original body (with a few minor improvements in the legs and the tail), and add gold armor plating to make it have a more regal and ornate design. I must say I absolutely loved mixing royal blue and gold, but adding the baby blue as well looks fantastic. Overall I''m very pleased with the end result, and I wanna hear what you guys think about it. Sound off in the comments below.'	2015-03-31 22:25:43.665217	f
149	uploads/m0thart/m0thart38f7d937400c0cd573844e7414dc5c64	15	\N	'Nils Frahm - Says  follow me on facebook: www.facebook.com/pages/Marta-B…  Alessandra Barbieri Lanzarote September 2014'	2015-03-31 22:34:49.856637	f
117	uploads/wolfskulljack/wolfskulljackec1026d14a14f243b0cfaae6c943a111	12	\N	'A commission for the very lovely Hjoldir Hildwulf   Pen and watercolour on A4 watercolour paper. These commissions start at £100 and will be reopen in the near future.'	2015-03-31 21:43:24.440007	f
123	uploads/wolfskulljack/wolfskulljackd77f52f8213f1637ff67a5ce3f807795	12	\N	'You''ve got to go and get for yourself.  A free range commission for a private client on Twitter. Client requested for me to listen to Bamboo Bones by Against Me and to draw what I saw. I really enjoyed this one!   Free range commissions are limited and £55 for an A4 inked piece. Free range-client gives a character, key words or a song and I have my way with if, no preview shots shown but the turn around is fast. Add £15 for paint'	2015-03-31 21:48:59.563999	f
127	uploads/vampirehungerstrike/vampirehungerstrikeb23be1fb5f13394416fe1ec1fef5d8e9	13	\N	'7 x 5 inches, oil on hardboard.'	2015-03-31 21:53:00.206323	f
133	uploads/vampirehungerstrike/vampirehungerstrikeb67cff2d624bd446de4446994a0c8c51	13	\N	'7 x 5 inches, oil on hardboard.'	2015-03-31 21:55:40.526532	f
136	uploads/dantezx/dantezxc03f9d53675a29f2282849c7a4a04fb0	14	\N	'Benny''s Galaxy Explorer is a custom model I made that is truly a labor of love. When I had first gotten Benny''s Spaceship back in November, I really didn''t have any plans on modding it. For me, it was just one of those sets that you really couldn''t take apart because it was just that good. Eventually, I did give in because there were two features on the original model that wasted a ton of space, and I knew I could use it to make something better. When i finally had all the parts I needed, which was three Benny''s Spaceships, and a couple hundred parts of my own, the end result is what you see above. This new version of benny''s Spaceship measures just shy of 29 inches long, 17 inches wide, and 8-3/4 inches high. Before I get into features, I just want to take a moment and say that this is the biggest and heaviest model I have ever designed. Now for features, this thing has it all. Starting from the front tip of the ship, the first compartment holds up to two storage containers for weapons, items, or even a minifigure. The next compartment is a prisoners jail cell, followed by the bridge/command center, then a connecting bridge that runs into the back end of the ship, where a new version of the stinger can be housed for deployment. As for weapons, this has a ton of fire power. Let me just get one thing straight here. i don''t use flick fire missiles. Those little dinky things won''t do here. Instead, if you look at the wings, there are three of the new spring loaded cannons, which fire really hard. So there''s six shots right there, but whats that? you want more fire power? Look no further, because in the back by the engines, there are two of the heavier styled cannons that use a larger projectile for more damage. I was going to add more cannons, but I kinda ran out lol. If I do get more, I''d like to add some around the front of the ship, but overall, this ship is just amazing to look at, but for a child, this is also a GREAT play set! This would make both collectors like me, and smaller children happy, and thats what I love to see the most. Ok, I''ll stop rambling now. tell me what you guys think down in the comments below.'	2015-03-31 22:23:35.625335	f
146	uploads/m0thart/m0thart3f4675bef87c501fb6afe09eaef114e4	15	\N	'follow me on facebook'	2015-03-31 22:33:00.914421	f
152	uploads/m0thart/m0thart9f590b13271d23ac0a3c7ca6b959591c	15	\N	'follow me on facebook'	2015-03-31 22:37:07.586693	f
118	uploads/wolfskulljack/wolfskulljack903efb2e7d7de87272e221002603f98d	12	\N	'NEW!!! New A4 prints on my Etsy store! www.etsy.com/uk/shop/WolfSkull…  Prints can be purchased here society6.com/Arroo  Today''s A3 piece for the Fall of Redd book due in October   Many hours of inking.  A very personal bit of art too   Follow me on Tumblr wolfskulljack.tumblr.com/'	2015-03-31 21:45:18.750678	f
124	uploads/wolfskulljack/wolfskulljack89be768793b8343656794f59bd780e44	12	\N	'An elk in wolf''s clothing.  the original is available to purchase on my Etsy store '	2015-03-31 21:49:44.11746	f
128	uploads/vampirehungerstrike/vampirehungerstrike3a7887dbab7b1f9c7b668339922ba6b3	13	\N	'7 x 5 inches, oil on hardboard.'	2015-03-31 21:53:24.141587	f
134	uploads/vampirehungerstrike/vampirehungerstrikeaa96213b79c6bbb7656e34cb7a3a028f	13	\N	'7 x 5 inches, oil on hardboard'	2015-03-31 21:56:05.102014	f
137	uploads/dantezx/dantezx1ce1978bd277b27791350b45f15df215	14	\N	'Galactic Titan,  November 25, 2013 - March 15, 2015. One of my all time favorite models to build, and both customize. As much as I hated to tear it apart, the parts will be used to make two new mystery projects. I won''t give away too much, but one of them still involves the titan. '	2015-03-31 22:24:34.373122	f
143	uploads/dantezx/dantezxa8f5a1abbbf89b442c6a94983ec893d1	14	\N	'Say hello to the newest addition to the baby dragon line, the Sand Dragon! After doing the Ice Dragon I got quite a good bit of positive feedback from you guys, and I started thinking about making a this a series. Well, I think the answer to that question is obvious enough. The Sand Dragon though is the second addition to the series, and compared to the ice dragon a few changes have been made. While the overall theme is to keep these guys small and somewhat "cute," I wanted to make this one a little bigger than the last. I thought that if I kept them all the same size, that it would soon become repetetive and people would just say it''s a re-coloring of the same thing. So with the Sand Dragon I did the best I could to make it feel like it this dragon really represented that desert and sandy look/feel. Starting off was deciding on the color scheme. Obviously it had to have some sort of tan color, but if you''re familiar with lego, you know that there''s not just one shade of tan. What I did is that I used a dark tan on his outer skin to represent the tough scales while I used a lighter tan on his belly and wings to show that it was a softer portion of skin. Now as for the black, grey, and white parts, those are meant to represent skeletal mass. As for the silver parts, I added them mostly for flair to make it pop. Overall, this little guy was tons of fun to make, but its time to move onto the next one. ^^'	2015-03-31 22:27:57.4425	f
147	uploads/m0thart/m0thart6643dd307f730073cd7f1de37d532fab	15	\N	'follow me on facebook'	2015-03-31 22:33:36.965908	f
153	uploads/m0thart/m0thartaae099d483ba61fc15dcc4748f2b59fe	15	\N	'follow me on facebook'	2015-03-31 22:37:31.83142	f
119	uploads/wolfskulljack/wolfskulljack03de3263881f86bc23e93524b605a17a	12	\N	'A commission for Wolf Beast who kindly purchased the original inks and then paid me to colour.   Commissions are currently fully booked however originals and prints can be bought on my store'	2015-03-31 21:46:03.433453	f
125	uploads/wolfskulljack/wolfskulljack3f1227072d9cb218cedd156a303496ba	12	\N	'Inspired by my latest exhibit at the Manchester Tattoo show last weekend. Pen on A4 watercolour paper, the original is on sale for £50 plus postage'	2015-03-31 21:50:17.36949	f
129	uploads/vampirehungerstrike/vampirehungerstrike7a70e3ec350da1b87ef1096aa065f756	13	\N	'5 x 7 inches, oil on masonite.'	2015-03-31 21:53:49.318188	f
135	uploads/vampirehungerstrike/vampirehungerstrikeefaf7627d708683866afec673a8ad3e2	13	\N	''	2015-03-31 21:56:26.967934	f
138	uploads/dantezx/dantezx3aa7652ae8608ae1e8b90c1e07061260	14	\N	'I had to make sure that I had at least one picture of the Progenitor in an attack pose. I''ll be sure to take a few more pictures before I send this guy home.'	2015-03-31 22:25:09.151628	f
144	uploads/dantezx/dantezxe44811b40671485240595ae3462baec1	14	\N	'As the title says, this is a new beta testing map for Lego Cretasia. Unlike the last map, this one will focus more on strategic combat elements, along with managing neutral creep camps, and resource harvesting. The way the Monster camps are set up keeps you on your toes, because your opponent can quickly jump in and kill you if you''re not watching. Items are also a new inclusion this time around. There are multiple ways you can obtain items in the game. You can purchase them with gold, step on a blue panel roulette space, or loot one of the many treasure chests being guarded by the monsters. Overall, I love the new look, and I''m considering using this layout for maybe a map in the future.'	2015-03-31 22:28:32.657707	f
148	uploads/m0thart/m0thart2b22122d27dc682d674ca651b3615183	15	\N	'follow me on facebook'	2015-03-31 22:34:11.558747	f
154	uploads/m0thart/m0thart359c7300c0099ff526b51e01919de425	15	\N	'follow me on facebook'	2015-03-31 22:37:55.621603	f
122	uploads/wolfskulljack/wolfskulljacka25ebc247c054bfbb25d950205776df2	12	\N	''	2015-03-31 21:48:12.112204	f
126	uploads/vampirehungerstrike/vampirehungerstrike03ff2d72dc5cd0f10f638455fcee1c99	13	\N	'10 x 8 inches, oil on hardboard.'	2015-03-31 21:52:38.799912	f
132	uploads/vampirehungerstrike/vampirehungerstrike7206107b83771af0110f8343cb36e2a5	13	\N	'7 x 5 inches, oil on hardboard.'	2015-03-31 21:55:15.894423	f
141	uploads/dantezx/dantezx7491ef0e715eafacfd06388a34742066	14	\N	'The Ninjago Mech Dragon was a set I recently picked up a little bit ago after spotting at my toysrus on clearance. So naturally I grabbed one, and brought it home. After spending an hour building it with a friend of mine, I quite surprised with how much I liked the final product. The last dragon I had gotten; the golden dragon, was in my opinion a little too small, and the epic dragon was just big mess that landed turning into a overhaul project. But the mech dragon doesn''t have any major flaws. It does have a few minor kinks, such as the saw blades being a stupid gimic, and there could have been more articulation in the tail segment, and the wings, but other than that, the set is really good. One of the things I loved to do the most was to prop it up on its rear legs, and while it was up it never wanted to tip over. The sad end to this though is that I landed up scrapping it for parts, which i desperately needed at the time. Like I said earlier, I picked this up on clearance at toysrus, so if you''re stil on the fence about this set, maybe my little review will help your decision.'	2015-03-31 22:26:44.420584	f
145	uploads/m0thart/m0thart55553d21ad3554ecb9cb01f62b9f835a	15	\N	'follow me on facebook'	2015-03-31 22:32:29.171653	f
151	uploads/m0thart/m0thartb41b8e54637a7c7ec51a5d414e305c5f	15	\N	'follow me on facebook'	2015-03-31 22:36:45.003118	f
5	uploads/tohad/tohadfc5a2945c5784a6321952b10be22fb63	1	\N	' New concept art for mywebcomic. And if there''s one thing I remember after this drawing is that draw windows is a task far from fun.  Fortunately I do hypnosis sessions to learn to draw in my sleep. Yet the result is not very conclusive because from my neighbors, I get up at night to perform strange tribal dances in the lobby of my building, but I do not despair of being able to tame my subconscious soon!'	2015-03-29 22:20:05.55901	f
7	uploads/tohad/tohade2c6d196577aaf04569bfc21332cbcb1	1	\N	'Last week, I initiated a crowdfunding project on a site similar to Kickstarter to raise funds to print a collection of my illustrations of Badass Cartoons here : www.ulule.com/badass-cartoons/ As the entire body of work is being self-published, the funds raised on Ulule will finance a high quality print version of Badass Cartoons.  The goal is to print a beautiful bound hardcopy of the book filled with lovely, colorful pages dedicated to the psychopaths who make up Badass.  The work is in comic book form (17x24 cm) containing more than 100 pages comprising illustrations of the Badasses, their descriptions in English and French (professionally translated and corrected !), as well as a few previously unpublished surprises ! For a $26, you will receive Badass Cartoons by mail, shipping cost included, all around the world !  The book will be ready to send to the printer as soon as the $9100 goal is reached.  Copies will be ready as soon as possible after the end of the Ulule campaign in order to get them sent out by the end of October, beginning of November.   By participating in the publishing of Badass Cartoons, you are contributing to the preservation of the independence of the author and supporting the free distribution of his illustrations on the internet without the numerous restrictions placed on traditionally published works. Whether by contribution or by sharing the project page, all support is appreciated! Thank ! I would be happy to answer your questions !'	2015-03-29 22:27:50.960839	f
33	uploads/joshhutchinson/joshhutchinsond5a90f83de26a997c0f73ef726c3ca08	3	\N	'Aobhal descends from the skies of Hell once a month when he rips the heads off of those who have been judged by Satan. Once your head is claimed, you will be forever trapped on his serpent body as you are tormented by the most grotesque and frightful nightmares you can imagine. Aobhal is only one form of punishment in Hell.'	2015-03-29 22:56:57.658941	f
37	uploads/fmacmanus/fmacmanus2736f5ecea10c0718d6c12841caec095	4	\N	' ''He who controls the spice controls the universe.'' Redesign of Dune  One of the Bene-Gesserit spice production plants- in their attempt to seize control of Arrakis, the Bene Gesserit designed many different spice production plants to ease their efforts and gain control over the guild navigators. I have an exterior view of this that I will publish soon, showing the function of the station.'	2015-03-29 23:25:21.807008	f
68	uploads/strib/strib83897f906473ccc9bdb01205201f2c3c	7	\N	'Decided to go ahead and color this.'	2015-03-31 17:43:34.541814	f
106	uploads/quelchii/quelchii094953ce46c87b192d22849013e21658	11	\N	'Traditional drawing of Iron Man. I''m very happy with the armor. The new Avengers 2 trailer is just amazing by the way! I can''t wait to see the movie! excited   Reference was a promo picture (poster) of Robert Downey Jr. as Tony Stark / Iron Man from the movie "Avengers: Age of Ultron" (2015).  Paper DIN A4 190g/m²; Faber-Castell Polychromos artists'' colour pencils, Copic Ciao markers, uni-ball Signo pigment ink um-153 white; time: ~20h'	2015-03-31 21:32:54.93004	f
131	uploads/vampirehungerstrike/vampirehungerstriked81e7fb7ed4d3ec63d9e37cbd981afd7	13	\N	'7 x 5 inches, oil on hardboard. Reference from Lexa Crush'	2015-03-31 21:54:52.829422	f
140	uploads/dantezx/dantezx666b235fc4c2c179c1ff86535d7751c2	14	\N	'This new version of the Golem adds some new details compared it''s predecessor. The reason I even made a third iteration of the Golem was to basically give it a fresh new look. Compared to the old version, I remodeled the main arm cannon, and redesigned all of the armored sections. The color scheme has also been changed to a more retro style. You''ll see the reason for why I did this later. But as far as features go, all of the previous weapons and accessories are still there, just with a new look.'	2015-03-31 22:26:16.443999	f
150	uploads/m0thart/m0thartd930983654c3344c3c4c274d24b49604	15	\N	'follow me on facebook'	2015-03-31 22:35:28.191218	f
155	uploads/artofdan70/artofdan701233e2cc5690962e73c536cfa8b2f789	17	\N	'thx... Kristi'	2015-04-01 02:18:08.240291	t
156	uploads/artofdan70/artofdan70585005b0a4efe2e1d0db9df0169cd422	17	\N	'thx... Rubia'	2015-04-01 02:19:15.914935	t
157	uploads/lavemer/lavemer0856b6230ae4461e7ab1186137459d86	18	\N	''	2015-04-01 02:24:02.846123	f
158	uploads/lavemer/lavemer4edde40835cd95971a238c23b1a10f2f	18	\N	''	2015-04-01 02:24:47.801013	f
159	uploads/lavemer/lavemer871940080368ad4bfac09adedd0058cc	18	\N	''	2015-04-01 02:25:29.277053	f
160	uploads/lavemer/lavemer0eb17595ee158ef215e2e121204f74f3	18	\N	''	2015-04-01 02:26:16.7662	f
161	uploads/lavemer/lavemerc2594ba87bb21655a02dfbbe7965d669	18	\N	''	2015-04-01 02:27:07.430631	f
162	uploads/lavemer/lavemer17c3d33eba1485dfe310c1cd1162a780	18	\N	''	2015-04-01 02:27:50.415207	f
163	uploads/zarnala/zarnalabbf5961d6ae7182504b4cbbd5ecda516	19	\N	'a male shaigan, original alien species by me'	2015-04-01 02:36:09.770074	f
164	uploads/zarnala/zarnalaf50c2f3b5abebbc11caec8e1a524d966	19	\N	'alien species called Kist Ra''om  alternative color design '	2015-04-01 02:39:49.723401	f
165	uploads/zarnala/zarnala259f0e7fff83bf00b650eb3518398510	19	\N	'The Sovereign - female royal robe'	2015-04-01 02:40:26.793772	f
166	uploads/zarnala/zarnalac7dcb097a1a81cf1477976596bca5da5	19	\N	'Darth Maul aka Mr.Red.'	2015-04-01 02:41:36.955395	f
167	uploads/zarnala/zarnalae2983208f780df873efe246dfadfb00b	19	\N	'algrnaas.tumblr.com'	2015-04-01 02:42:27.493762	f
168	uploads/zarnala/zarnalaccb7d983c642208932102ea90e9bfeb6	19	\N	'Anthro Collection II'	2015-04-01 02:43:49.6755	f
169	uploads/zarnala/zarnalac42c79b027c961ebee15e4cfbaac6e07	19	\N	'50 Styles of Suits sketch collection'	2015-04-01 02:44:35.132526	f
170	uploads/zarnala/zarnala427c8ebcac0245e1f075eafc31d09fc8	19	\N	'alien species called Kist Ra''om  alternative color design '	2015-04-01 02:45:29.222909	f
171	uploads/zarnala/zarnala90764681dea2325b0f708ac5e15aabd3	19	\N	'alien species called Noremok'	2015-04-01 02:46:17.567336	f
172	uploads/zarnala/zarnalae229e2e80699d3c8e1427eb8bc840224	19	\N	'my version of the Pink Panther, a billionaire who obsessives with the famous diamond   The Pink Panther © Blake Edwards'	2015-04-01 02:47:15.83167	f
107	uploads/quelchii/quelchiid97c74baf09608939638803fb1708bc5	11	\N	'Another mixed media drawing. For this attempt I took one of the worst (= too many details) references from my reference folder. This one was already in my "trash subfolder", because it would have been a nightmare to draw with just colour pencils. Scared  Reference was a movie poster (Thor The Dark World, 2013) of Chris Hemsworth as Thor.  Paper DIN A4 (= 297mm x 210mm) 190 g/m², - ca. >85%: Faber-Castell Polychromos artists'' colour pencils - somewhere under the colored pencil layers: Copic Ciao (C-2, C-3, C-5, C-7, E50) - and for some highlights (e.g. rain): uni-ball Signo pigment ink um-153 white, time: 30h+?'	2015-03-31 21:33:31.486036	f
142	uploads/dantezx/dantezx8709e05eb15846b30c8e70a23e1709f0	14	\N	'The Baby Nether Dragon is the third addition to my custom baby dragon series. Instead of focusing on a specific element I decided to make a dragon that had the more evil vibe to it. Since this new dragon didn''t have any special gimmic I want to experiment with the body design a little bit by making him much bigger than the others, but not too big to the point at which he doesn''t look like a baby anymore. While I love the new body modifications I made, such as the extra scales going down the neck and tail end, and the larger wings. My favorite part here is the new head module. The head mold used here is a completely new design. After experimenting with the current head mold I wasn''t able to fit as many teeth in as I wanted. So with a little magic, and a few fresh bags of mixel parts, I finally got the look I wanted. Overall, the Nether Dragon was a blast to make, and looks great alongside my other dragons. Tell me what you guys think in the comments below.'	2015-03-31 22:27:17.028781	f
\.


--
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('imagenes_id_seq', 172, true);


--
-- Data for Name: imgs_etiquetas; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY imgs_etiquetas (imagenes_id, etiquetas_id) FROM stdin;
\.


--
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY notificaciones (id, usuarios_id, texto, notif_url) FROM stdin;
\.


--
-- Name: notificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('notificaciones_id_seq', 1, false);


--
-- Data for Name: puntuaciones; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY puntuaciones (usuarios_id, imagenes_id, valoracion) FROM stdin;
\.


--
-- Data for Name: seguidores; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY seguidores (usuarios_id, seguidores_id) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY usuarios (id, nick, pass, email, descripcion_usr, fecha_nac, fecha_reg) FROM stdin;
1	tohad	dac1e9b1809e7785d6c66727a88f5a02	tohad@gmail.com	'2015 begin in France with the murder of cartoonists, journalists, \n  cops and citizens. Among them the cartoonists Cabu , Charb, Tignous and \n  Wolinski. When I was little, their drawings often lying around in my \n  house, and my parents regularly hung their picture on the door of the \n  fridge, in my room or to share the pleasure of contemplating a thumbnail \n  mixing derision and freedom.\n\n  Following a violence that a deeply complex and global origin, these \n  illustratos and those who accompanied them disappear into a vortex of \n  horror as they have never done anything but speak and draw. If murder is \n  cowardly aggression, humor is defending soft. Assault rifles against pen, \n  the new year starts with a deep melancholy metaphor when humanity is like \n  a separated child mutilating lost on his desert island.\n\n  Positive in nature, and have never really been struck by misfortune, I \n  think that this is the saddest day of my life. Illustrators are murdered \n  for their drawing, beyond the human drama, it is as if a violent bullet \n  scraped my cheek to order me to stick to the tile. Earth its share of \n  drama, and this one goes particularly close to my heart.\n  But provocation is part of freedom, it is its prerogative even as it \n  draws attention, never hurt and with a smile. Dear friends, the only \n  reaction to this shocking event must be affection, malice, mockery and \n  poetry, as would have been their victims.\n\n  A big hug to all the victims of injustice and violence regardless of \n  time or place.\n\n  Tohad, with love'	1981-11-07	2015-03-27
2	mathiaarkoniel	2a59fced3fb9716bf12787f90df990fd	arkoniel@mathiaarkoniel.com	'CONTACT\n  If you are interested in commissioning me please email me at \n  arkoniel@mathiaarkoniel.com. \n  Please, do not write notes on DA. Thank you for your understanding.\n\n  COMMISSIONS\n\n  I am always available for commissions, however the waiting list is a little \n  long, so please consider scheduling a commission slot in advance.'	1991-02-10	2015-03-27
3	joshhutchinson	4a8af14aa2029a4b97d494e4f9b4a979	 info@joshuahutchinson.co.uk	'I am currently available for work.'	1976-03-06	2015-03-27
4	fmacmanus	1667e07115f19547af098aed7c060473	finnianm@comcast.net	'Finnian MacManus \n  \n  United States\n  \n  Art Center College of Design - Entertainment Design 16\n  Contact: finnianm@comcast.net'	2001-02-02	2015-03-27
5	mrdream	d79e0865cac30776e45d9c9fcee9d324	mrdream@hotmail.com	'Halil URAL\n\n  Turkey\n\n  www.facebook.com/artbyhalilural'	1997-01-04	2015-03-27
6	sanfranguy	d69c8d9778d69a1daa76bc6a2fedbe1e	sanfranguy@gmail.com	'United States\n  3D Designer in a broad range of industries from ArchViz to Game Environment \n  design, Motion graphics animation and Special Effects. Close to 14 years of \n  experience.\n\n  www.project1media.com'	1995-10-09	2015-03-27
7	strib	dd76dd6b71e4ee0d55b8a4d6b006cc37	strib@gmail.com	NULL	1978-12-29	2015-03-27
8	nubiidesign	84b506438f5e0288bc902191db3c6666	info@nubidesign.com	NULL	1992-11-21	2015-03-27
9	powerkaras	e3f8dbc1813fa7ff4eb90154fcfa6352	olexander@hotmail.com	NULL	1994-06-19	2015-03-27
10	noemy96	d863c6749036e3f0af362274d76c7bee	noemy96@gmail.com	NULL	1996-09-05	2015-03-27
11	quelchii	cbf7130009de54aa5eb115e1d8c96020	quelchii@gmail.com	NULL	1995-05-10	2015-03-27
12	wolfskulljack	06b2a0224fec12e60ded4f6f11a534be	michelleharvey@artist.com	NULL	1989-08-27	2015-03-27
13	vampirehungerstrike	87113a3b83bbd0b09ba5ed2b0fdbd7a9	vampire@hungerstrike.com	NULL	1987-07-24	2015-03-27
14	dantezx	4f6a6ed8f051dac7c2522bd20ab6cc6c	dantezx@gmail.com	NULL	1988-01-22	2015-03-27
15	m0thart	15df88f7c7782c34ada4cbf2105ec4f1	martart@gmail.com	NULL	1996-04-11	2015-03-27
16	graphicdream	5f692cd0c0e38117be8b4c6a4a28b8f9	info@graphicdream.com	NULL	1981-12-02	2015-03-27
17	artofdan70	85d233d21dd319d09beb757684a21aa6	artofdan70@gmail.com	NULL	1984-06-03	2015-03-27
18	lavemer	316a2fb1dc3ea02be09453239aee94bf	lavemer@mixmail.com	NULL	1970-09-30	2015-03-27
19	zarnala	9480711c4299823bbf14ae87422a036d	zarnala@gmail.com	NULL	1981-10-18	2015-04-01
\.


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('usuarios_id_seq', 19, true);


--
-- Name: pk_carpetas_usuarios; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY carpetas_usuarios
    ADD CONSTRAINT pk_carpetas_usuarios PRIMARY KEY (id);


--
-- Name: pk_categorias; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY categorias
    ADD CONSTRAINT pk_categorias PRIMARY KEY (id);


--
-- Name: pk_ci_sessions; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY ci_sessions
    ADD CONSTRAINT pk_ci_sessions PRIMARY KEY (session_id);


--
-- Name: pk_comentarios; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY comentarios
    ADD CONSTRAINT pk_comentarios PRIMARY KEY (id);


--
-- Name: pk_etiquetas; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY etiquetas
    ADD CONSTRAINT pk_etiquetas PRIMARY KEY (id);


--
-- Name: pk_fondos; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY fondos
    ADD CONSTRAINT pk_fondos PRIMARY KEY (id);


--
-- Name: pk_fotos; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY fotos
    ADD CONSTRAINT pk_fotos PRIMARY KEY (id);


--
-- Name: pk_imagenes; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY imagenes
    ADD CONSTRAINT pk_imagenes PRIMARY KEY (id);


--
-- Name: pk_notificaciones; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY notificaciones
    ADD CONSTRAINT pk_notificaciones PRIMARY KEY (id);


--
-- Name: pk_puntuaciones; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY puntuaciones
    ADD CONSTRAINT pk_puntuaciones PRIMARY KEY (usuarios_id, imagenes_id);


--
-- Name: pk_seguidores; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY seguidores
    ADD CONSTRAINT pk_seguidores PRIMARY KEY (usuarios_id, seguidores_id);


--
-- Name: pk_usuarios; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);


--
-- Name: uq_usuarios_nick; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT uq_usuarios_nick UNIQUE (nick);


--
-- Name: last_activity_idx; Type: INDEX; Schema: public; Owner: gallery; Tablespace: 
--

CREATE INDEX last_activity_idx ON ci_sessions USING btree (last_activity);


--
-- Name: fk_carpetas_usuarios_padre_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY carpetas_usuarios
    ADD CONSTRAINT fk_carpetas_usuarios_padre_id FOREIGN KEY (padre_id) REFERENCES carpetas_usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_carpetas_usuarios_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY carpetas_usuarios
    ADD CONSTRAINT fk_carpetas_usuarios_usuarios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_categorias_padre_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY categorias
    ADD CONSTRAINT fk_categorias_padre_id FOREIGN KEY (padre_id) REFERENCES categorias(id) ON UPDATE CASCADE;


--
-- Name: fk_comentarios_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY comentarios
    ADD CONSTRAINT fk_comentarios_usuarios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_favoritos_carpeta_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY favoritos
    ADD CONSTRAINT fk_favoritos_carpeta_id FOREIGN KEY (carpeta_id) REFERENCES carpetas_usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_favoritos_imagenes_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY favoritos
    ADD CONSTRAINT fk_favoritos_imagenes_id FOREIGN KEY (imagenes_id) REFERENCES imagenes(id) ON UPDATE CASCADE;


--
-- Name: fk_favoritos_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY favoritos
    ADD CONSTRAINT fk_favoritos_usuarios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_fotos_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY fotos
    ADD CONSTRAINT fk_fotos_usuarios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_fotos_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY fondos
    ADD CONSTRAINT fk_fotos_usuarios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_imagenes_categorias_is; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY imagenes
    ADD CONSTRAINT fk_imagenes_categorias_is FOREIGN KEY (categorias_id) REFERENCES categorias(id) ON UPDATE CASCADE;


--
-- Name: fk_imagenes_imagenes_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY comentarios
    ADD CONSTRAINT fk_imagenes_imagenes_id FOREIGN KEY (imagenes_id) REFERENCES imagenes(id) ON UPDATE CASCADE;


--
-- Name: fk_imagenes_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY imagenes
    ADD CONSTRAINT fk_imagenes_usuarios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_imgs_etiquetas_etiquetas_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY imgs_etiquetas
    ADD CONSTRAINT fk_imgs_etiquetas_etiquetas_id FOREIGN KEY (etiquetas_id) REFERENCES etiquetas(id) ON UPDATE CASCADE;


--
-- Name: fk_imgs_etiquetas_imagenes_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY imgs_etiquetas
    ADD CONSTRAINT fk_imgs_etiquetas_imagenes_id FOREIGN KEY (imagenes_id) REFERENCES imagenes(id) ON UPDATE CASCADE;


--
-- Name: fk_notificaciones_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY notificaciones
    ADD CONSTRAINT fk_notificaciones_usuarios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_puntuaciones_imagenes_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY puntuaciones
    ADD CONSTRAINT fk_puntuaciones_imagenes_id FOREIGN KEY (imagenes_id) REFERENCES imagenes(id) ON UPDATE CASCADE;


--
-- Name: fk_puntuaciones_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY puntuaciones
    ADD CONSTRAINT fk_puntuaciones_usuarios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_seguidores_seguidores_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY seguidores
    ADD CONSTRAINT fk_seguidores_seguidores_id FOREIGN KEY (seguidores_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_seguidores_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY seguidores
    ADD CONSTRAINT fk_seguidores_usuarios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

