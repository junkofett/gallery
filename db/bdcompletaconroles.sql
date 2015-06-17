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
    texto text NOT NULL,
    fecha_com timestamp without time zone DEFAULT now()
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
    nombre_et character varying(24) NOT NULL
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
    titulo character varying(100),
    img_url text NOT NULL,
    thumb_url text NOT NULL,
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
    notif_url character varying(200) NOT NULL,
    vista boolean DEFAULT false,
    fecha_notif timestamp without time zone DEFAULT now()
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
-- Name: roles; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE roles (
    rol_id bigint NOT NULL,
    nom_rol character varying(20) NOT NULL
);


ALTER TABLE public.roles OWNER TO gallery;

--
-- Name: roles_rol_id_seq; Type: SEQUENCE; Schema: public; Owner: gallery
--

CREATE SEQUENCE roles_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_rol_id_seq OWNER TO gallery;

--
-- Name: roles_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gallery
--

ALTER SEQUENCE roles_rol_id_seq OWNED BY roles.rol_id;


--
-- Name: seguidores; Type: TABLE; Schema: public; Owner: gallery; Tablespace: 
--

CREATE TABLE seguidores (
    usuarios_id bigint NOT NULL,
    seguidos_id bigint NOT NULL
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
    fecha_reg date DEFAULT ('now'::text)::date NOT NULL,
    nom_rol character varying(20) DEFAULT 'reg_user'::character varying
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
-- Name: rol_id; Type: DEFAULT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY roles ALTER COLUMN rol_id SET DEFAULT nextval('roles_rol_id_seq'::regclass);


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
1	Digital	\N
2	Tradicional	\N
3	2D	1
4	3D	1
5	Paisajes	3
6	Paisajes	4
7	Personajes	3
8	Personajes	4
9	Retratos	7
10	Retratos	8
11	Escena	3
12	Escena	4
13	Pintura	2
14	Escultura	2
15	Paisajes	13
16	Personajes	13
17	Retratos	16
18	Lego	14
\.


--
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('categorias_id_seq', 1, false);


--
-- Data for Name: ci_sessions; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY ci_sessions (session_id, ip_address, user_agent, last_activity, user_data) FROM stdin;
42ea30a150256de645b5c8ae2415300a	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/43.0.2357.81 Chrome/43.0.2357.81 	1434411559	a:3:{s:9:"user_data";s:0:"";s:4:"nick";s:5:"admin";s:2:"id";s:2:"20";}
\.


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY comentarios (id, usuarios_id, imagenes_id, texto, fecha_com) FROM stdin;
1	1	25	muy chulo	2015-06-12 23:33:21.050123
\.


--
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('comentarios_id_seq', 1, true);


--
-- Data for Name: etiquetas; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY etiquetas (id, nombre_et) FROM stdin;
1	aliens
2	terror
3	alien
4	alienaliens
5	alienvspredator
6	predator
7	sigourneyweaver
8	xenomorph
9	marvel
10	guardiansofthegalaxy
11	starlord
12	action
13	adventure
14	dog
15	drake
16	game
17	jump
18	leap
19	nathan
20	uncharted
21	videogame
22	assassinscreed
23	videogames
24	unity
25	spiritual
26	soul
27	futurecity
28	futuristiccity
29	neonlights
30	ship
31	spaceship
32	transport
33	asiancity
34	spaceman
35	hitech
36	desert
37	dusk
38	fantasy
39	mountain
40	nightsky
41	orange
42	red
43	star
44	enemy
45	evergreentrees
46	fantasylandscape
47	meadow
48	plains
49	studioghibli
50	castleonhill
51	steamgame
52	elderly
53	oldman
54	space
55	spirit
56	spirituality
57	stars
58	joshhutchinson
59	ancienttree
60	bluebell
61	flower
62	forest
63	ghibli
64	grass
65	grave
66	hayaomiyazaki
67	astronaut
68	nasa
69	conceptart
70	monserts
71	gameart
72	doctorwho
73	thedoctor
74	lordoftherings
75	gandalf
76	hobbiton
77	startrek
78	spock
79	kirk
80	robot
81	scifi
82	steampunk
83	nature
84	future
85	mecha
86	machinarium
87	architecture
88	mechanic
89	mechanical
90	monkey
\.


--
-- Name: etiquetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('etiquetas_id_seq', 90, true);


--
-- Data for Name: favoritos; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY favoritos (usuarios_id, imagenes_id, carpeta_id) FROM stdin;
1	25	\N
19	18	\N
19	19	\N
19	21	\N
19	24	\N
1	24	\N
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

COPY imagenes (id, titulo, img_url, thumb_url, usuarios_id, categorias_id, descripcion_img, fecha_subida, nsfw) FROM stdin;
1	Aliens	uploads/patrickbrown/patrickbrown-aliense9d07429.jpg	uploads/patrickbrown/patrickbrown-aliense9d07429_thumb.jpg	19	11	Ever since it was made official that Sigourney Weaver was coming back for a new Alien movie by Neill Blomkamp, I got really excited and decided to watch Aliens again. That scene at the end where Ripley comes out of the elevator and goes down into the nest to save Newt, it struck me, I forgot how good this movie was. It inspired me to create this, I really wanted to capture the colours and lighting that go on around that scene. The cool blue tones that clash with the warm colours just work so nicely together in that scene, and I've never tried anything like that before so I learnt a lot.  I tried my best to get Ripley's likeness, I hope it worked. I was trying to go for the "scared out of my mind" look, rather than the "macho hardcore saviour" look, I thought it would stay true to the movie. Man I can't wait to see Ripley back in action, apparently they're kicking off from Aliens, as if 3-4 never happened. I love that idea and I think it's a smart bold move. Can't wait!	2015-06-12 14:09:37.615266	f
2	Get To Da Choppa!	uploads/patrickbrown/patrickbrown-gettodachoppa!709fee13.jpg	uploads/patrickbrown/patrickbrown-gettodachoppa!709fee13_thumb.jpg	19	7	One of my favourite movies, The Predator. I was just messing around drawing in my sketchbook when I came up with this, liked how it was going so I ended up going all the way with it	2015-06-12 14:10:35.48539	f
3	Guardians of The Galaxy	uploads/patrickbrown/patrickbrown-guardiansofthegalaxy6100cba6.jpg	uploads/patrickbrown/patrickbrown-guardiansofthegalaxy6100cba6_thumb.jpg	19	11	Wow I'm glad to finally have this done and be able to share it with you all. I've spent the past month or more working on this, I've just been so excited to see the movie I really wanted to put that energy into a piece of art. I drew each character separately, keeping in mind where I wanted to place them, then did all the rest in Photoshop. Well except for the line work, lately I've started using Manga Studio for the outlines, oh man does it make a difference, the lines come out 100x smoother and cleaner with that program, and it can easily shift between both Photoshop and Manga with the same file, I love it. 	2015-06-12 14:11:51.120019	f
4	Uncharted 4	uploads/patrickbrown/patrickbrown-uncharted42f860659.jpg	uploads/patrickbrown/patrickbrown-uncharted42f860659_thumb.jpg	19	7	And here's one to start the new year, staring Nathan Drake in Uncharted 4. I created this based mainly off of the 15-minute gameplay trailer, it helped a lot in terms of knowing what was in the game and how Drake actually looks.  My New Years resolution is to spend more time on details, so I'm trying to add a lot more to my characters overall look, I've seen a lot of extremely talented people here on DA and noticed the best images all focus on great detail, so I'm very inspired to aim for that level.  I cannot wait for this game, Uncharted is one of my most favorite games series yet, so I really wanted to do something special for it.	2015-06-12 14:12:52.48339	f
5	Assassins Creed Unity	uploads/patrickbrown/patrickbrown-assassinscreedunity08264afa.jpg	uploads/patrickbrown/patrickbrown-assassinscreedunity08264afa_thumb.jpg	19	7	This is a french gaming magazine I was commissioned by and was lucky enough to create this for their first issue of the magazine.	2015-06-12 14:14:15.380927	f
6	Soul Ascending	uploads/joshhutchinson/joshhutchinson-soulascendinge7e6c559.jpg	uploads/joshhutchinson/joshhutchinson-soulascendinge7e6c559_thumb.jpg	3	5		2015-06-12 14:28:46.917259	f
7	Now Boarding!	uploads/joshhutchinson/joshhutchinson-nowboarding!a1486167.jpg	uploads/joshhutchinson/joshhutchinson-nowboarding!a1486167_thumb.jpg	3	5	Hello everyone! I'm back with a new image I created during my internship at Atomhawk. Had a lot of fun creating this!	2015-06-12 14:30:09.972231	f
8	The Man of Armadon	uploads/joshhutchinson/joshhutchinson-themanofarmadonfada307c.jpg	uploads/joshhutchinson/joshhutchinson-themanofarmadonfada307c_thumb.jpg	3	11	The man of Armadon is an intergalactic being who is a hero on his home planet. He is part of a species, which live for millennia and are extremely wise given their age. His kind have no facial features and communicate with their own through telepathy. Now living on Earth, in the city of Armadon, he cannot communicate with the locals, so he tells his story by using his projection abilities. In this scene he is introducing the city he lived in on his home planet as passersby look on in fascination.	2015-06-12 14:31:39.633822	f
9	Starry Mountain	uploads/joshhutchinson/joshhutchinson-starrymountaind7066883.jpg	uploads/joshhutchinson/joshhutchinson-starrymountaind7066883_thumb.jpg	3	5	New environment piece!	2015-06-12 14:32:28.150019	f
10	ENEMY title artwork	uploads/joshhutchinson/joshhutchinson-enemytitleartwork23c06fa9.jpg	uploads/joshhutchinson/joshhutchinson-enemytitleartwork23c06fa9_thumb.jpg	3	5	Artwork I did for the game 'ENEMY' out today on Steam! Check it out!	2015-06-12 14:33:44.094519	f
11	A Spirit Living a Human Life	uploads/joshhutchinson/joshhutchinson-aspiritlivingahumanlife3aac6910.jpg	uploads/joshhutchinson/joshhutchinson-aspiritlivingahumanlife3aac6910_thumb.jpg	3	9	A re-hash of an old illustration. Quite a personal piece.	2015-06-12 14:34:45.494991	f
12	Ancient Tree	uploads/joshhutchinson/joshhutchinson-ancienttree9d8c648d.jpg	uploads/joshhutchinson/joshhutchinson-ancienttree9d8c648d_thumb.jpg	3	5	First piece of 2015. I'm going to be doing a lot of Studio Ghibli style stuff this year. I hope to work for them at some point in my career.	2015-06-12 14:36:56.346049	f
13	Astronaut Wally Schirra, and cramped Gemini craft	uploads/strib/strib-astronautwallyschirra,andcrampedgeminicrafte48a9e27.jpg	uploads/strib/strib-astronautwallyschirra,andcrampedgeminicrafte48a9e27_thumb.jpg	7	9	One of the original seven, and later part of Gemini and Apollo.	2015-06-12 14:42:29.187314	f
14	Lukah Land 1	uploads/strib/strib-lukahland1f0807c49.jpg	uploads/strib/strib-lukahland1f0807c49_thumb.jpg	7	11	Game concept art for Fearless Studios	2015-06-12 14:43:58.90981	f
15	Anti-hero	uploads/strib/strib-anti-hero772f4fc4.jpg	uploads/strib/strib-anti-hero772f4fc4_thumb.jpg	7	7	Game character for Fearless Studios	2015-06-12 14:44:52.08189	f
16	The Doctor	uploads/strib/strib-thedoctor03bf77e9.jpg	uploads/strib/strib-thedoctor03bf77e9_thumb.jpg	7	9	...larger, and with text	2015-06-12 14:45:46.533951	f
19	original trek	uploads/strib/strib-originaltrek7a104046.jpg	uploads/strib/strib-originaltrek7a104046_thumb.jpg	7	9	So, I added this a while back...before IDW bought it. Then, I figured I should take it down until the time was right. Well, it's been posted on Chris Ryall's blog...so, I figure it's OK now.  The original 3D model I used for reference is by a very talented artist named Bill Thomas.	2015-06-12 14:53:11.54412	f
20	Robotica	uploads/sanfranguy/sanfranguy-roboticad5cad679.jpg	uploads/sanfranguy/sanfranguy-roboticad5cad679_thumb.jpg	6	8	Literally 5 minutes in Zbrush with a poser character.   Polygroups generated by UV Group tiles.  Panel loops extruded based on polygroups.  Displacement map.  Done.	2015-06-12 16:12:24.336546	f
17	hobbithole Gandalf	uploads/strib/strib-hobbitholegandalf0490b984.jpg	uploads/strib/strib-hobbitholegandalf0490b984_thumb.jpg	7	9	Ok...what more can I add to this world that we haven't already seen masterfully represented by Peter Jackson's films? Seriously...why bother!? Well, here's how it started. I've been fairly obsessed with the use of line in my artwork over the last few years. This was after the mixed (ok, maybe I'm being generous) reception the CGI comic covers I did for DC came out. I was always a traditional artist before I entered the world of 3D animation and games. More specifically, I was a painter. So, as things usually come back around...I've decided to start relying less on line and get back to my roots. The recent iPad paintings I've been doing helped me come to this. As for Gandalf here...I just wanted to do something that isn't represented well in my portfolio. Fantasy. I guess this is Gandalf sometime before LOTR, but after The Hobbit.   Also...thanks to this gentleman for looking like a real wizard and providing great reference to be a jumping off point for my Gandalf....	2015-06-12 14:48:47.589691	f
18	Remorseful Indy	uploads/strib/strib-remorsefulindy4dc5df9e.jpg	uploads/strib/strib-remorsefulindy4dc5df9e_thumb.jpg	7	9	sad Indy	2015-06-12 14:49:59.40192	f
21	Steampunk - Hummingbird	uploads/sanfranguy/sanfranguy-steampunk-hummingbird2f0f6593.jpg	uploads/sanfranguy/sanfranguy-steampunk-hummingbird2f0f6593_thumb.jpg	6	12	ZBrush/C4D/VRay  Roughly 10 hours to create/shade/light/etc Design evolution	2015-06-12 16:14:19.251117	f
22	Mech Prototype - Exposed	uploads/sanfranguy/sanfranguy-mechprototype-exposed2c34ebc5.jpg	uploads/sanfranguy/sanfranguy-mechprototype-exposed2c34ebc5_thumb.jpg	6	8	Exposed, as in without armor. It was my intention to show more the inner workings of the mech.  Perhaps one day I'll get to making the outside.   Mech took 12 days in Zbrush + C4D.   WIP Image; 	2015-06-12 16:15:31.932673	f
23	Machinarium CGI	uploads/sanfranguy/sanfranguy-machinariumcgi23f81658.jpg	uploads/sanfranguy/sanfranguy-machinariumcgi23f81658_thumb.jpg	6	12	A 3D version of a famous 2D shot [link]. Not matched piece for piece, but close enough.   Modeled in ZBrush mostly - Some C4D.  Rendered with VRayforC4D.   Enjoy.  P.S Wireframe [link] Snow version (for kicks) [link] 14 million polys. Overkill, but then why not.	2015-06-12 16:18:38.991316	f
24	ModernThreeStory2	uploads/sanfranguy/sanfranguy-modernthreestory2b3d17258.jpg	uploads/sanfranguy/sanfranguy-modernthreestory2b3d17258_thumb.jpg	6	6	ZBrush for the house. C4D + VRay for everything else.	2015-06-12 16:19:46.261576	f
25	LabMonkey	uploads/sanfranguy/sanfranguy-labmonkeyccb46e60.jpg	uploads/sanfranguy/sanfranguy-labmonkeyccb46e60_thumb.jpg	6	12	ZBrush - C4D - VRay	2015-06-12 16:21:51.968108	f
\.


--
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('imagenes_id_seq', 25, true);


--
-- Data for Name: imgs_etiquetas; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY imgs_etiquetas (imagenes_id, etiquetas_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
2	6
3	9
3	10
3	11
4	12
4	13
4	14
4	15
4	16
4	17
4	18
4	19
4	20
4	21
5	22
5	23
5	24
6	25
6	26
7	27
7	28
7	29
7	30
7	31
7	32
7	33
8	27
8	29
8	34
8	35
9	36
9	37
9	38
9	39
9	40
9	41
9	42
9	43
10	44
10	45
10	46
10	47
10	48
10	49
10	50
10	51
11	52
11	53
11	54
11	55
11	25
11	56
11	57
11	58
12	59
12	60
12	61
12	62
12	63
12	64
12	65
12	66
13	67
13	68
13	54
14	69
14	70
14	71
16	72
16	73
17	74
17	75
17	76
19	77
19	78
19	79
20	80
20	81
21	82
21	80
21	83
22	84
22	85
23	86
23	21
24	87
25	85
25	88
25	89
25	90
\.


--
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY notificaciones (id, usuarios_id, texto, notif_url, vista, fecha_notif) FROM stdin;
3	3	El usuario patrickbrown sigue tus publicaciones	/usuarios/perfil/patrickbrown	f	2015-06-14 21:10:37.586643
4	6	El usuario tohad sigue tus publicaciones	/usuarios/perfil/tohad	f	2015-06-15 17:40:50.082433
5	7	El usuario tohad sigue tus publicaciones	/usuarios/perfil/tohad	f	2015-06-15 17:56:19.555791
\.


--
-- Name: notificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('notificaciones_id_seq', 5, true);


--
-- Data for Name: puntuaciones; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY puntuaciones (usuarios_id, imagenes_id, valoracion) FROM stdin;
19	5	3
1	25	3
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY roles (rol_id, nom_rol) FROM stdin;
1	admin
2	reg_user
\.


--
-- Name: roles_rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('roles_rol_id_seq', 2, true);


--
-- Data for Name: seguidores; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY seguidores (usuarios_id, seguidos_id) FROM stdin;
19	6
19	7
19	3
1	6
1	7
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY usuarios (id, nick, pass, email, descripcion_usr, fecha_nac, fecha_reg, nom_rol) FROM stdin;
1	tohad	dac1e9b1809e7785d6c66727a88f5a02	tohad@gmail.com	2015 begin in France with the murder of cartoonists, journalists, \n  cops and citizens. Among them the cartoonists Cabu , Charb, Tignous and \n  Wolinski. When I was little, their drawings often lying around in my \n  house, and my parents regularly hung their picture on the door of the \n  fridge, in my room or to share the pleasure of contemplating a thumbnail \n  mixing derision and freedom.\n\n  Following a violence that a deeply complex and global origin, these \n  illustratos and those who accompanied them disappear into a vortex of \n  horror as they have never done anything but speak and draw. If murder is \n  cowardly aggression, humor is defending soft. Assault rifles against pen, \n  the new year starts with a deep melancholy metaphor when humanity is like \n  a separated child mutilating lost on his desert island.\n\n  Positive in nature, and have never really been struck by misfortune, I \n  think that this is the saddest day of my life. Illustrators are murdered \n  for their drawing, beyond the human drama, it is as if a violent bullet \n  scraped my cheek to order me to stick to the tile. Earth its share of \n  drama, and this one goes particularly close to my heart.\n  But provocation is part of freedom, it is its prerogative even as it \n  draws attention, never hurt and with a smile. Dear friends, the only \n  reaction to this shocking event must be affection, malice, mockery and \n  poetry, as would have been their victims.\n\n  A big hug to all the victims of injustice and violence regardless of \n  time or place.\n\n  Tohad, with love	1981-11-07	2015-06-12	reg_user
2	mathiaarkoniel	2a59fced3fb9716bf12787f90df990fd	arkoniel@mathiaarkoniel.com	CONTACT\n  If you are interested in commissioning me please email me at \n  arkoniel@mathiaarkoniel.com. \n  Please, do not write notes on DA. Thank you for your understanding.\n\n  COMMISSIONS\n\n  I am always available for commissions, however the waiting list is a little \n  long, so please consider scheduling a commission slot in advance.	1991-02-10	2015-06-12	reg_user
3	joshhutchinson	4a8af14aa2029a4b97d494e4f9b4a979	 info@joshuahutchinson.co.uk	I am currently available for work.	1976-03-06	2015-06-12	reg_user
4	fmacmanus	1667e07115f19547af098aed7c060473	finnianm@comcast.net	Finnian MacManus \n  \n  United States\n  \n  Art Center College of Design - Entertainment Design 16\n  Contact: finnianm@comcast.net	2001-02-02	2015-06-12	reg_user
5	mrdream	d79e0865cac30776e45d9c9fcee9d324	mrdream@hotmail.com	Halil URAL\n\n  Turkey\n\n  www.facebook.com/artbyhalilural	1997-01-04	2015-06-12	reg_user
6	sanfranguy	d69c8d9778d69a1daa76bc6a2fedbe1e	sanfranguy@gmail.com	United States\n  3D Designer in a broad range of industries from ArchViz to Game Environment \n  design, Motion graphics animation and Special Effects. Close to 14 years of \n  experience.\n\n  www.project1media.com	1995-10-09	2015-06-12	reg_user
7	strib	dd76dd6b71e4ee0d55b8a4d6b006cc37	strib@gmail.com	\N	1978-12-29	2015-06-12	reg_user
8	nubiidesign	84b506438f5e0288bc902191db3c6666	info@nubidesign.com	\N	1992-11-21	2015-06-12	reg_user
9	powerkaras	e3f8dbc1813fa7ff4eb90154fcfa6352	olexander@hotmail.com	\N	1994-06-19	2015-06-12	reg_user
10	noemy96	d863c6749036e3f0af362274d76c7bee	noemy96@gmail.com	\N	1996-09-05	2015-06-12	reg_user
11	quelchii	cbf7130009de54aa5eb115e1d8c96020	quelchii@gmail.com	\N	1995-05-10	2015-06-12	reg_user
12	wolfskulljack	06b2a0224fec12e60ded4f6f11a534be	michelleharvey@artist.com	\N	1989-08-27	2015-06-12	reg_user
13	vampirehungerstrike	87113a3b83bbd0b09ba5ed2b0fdbd7a9	vampire@hungerstrike.com	\N	1987-07-24	2015-06-12	reg_user
14	dantezx	4f6a6ed8f051dac7c2522bd20ab6cc6c	dantezx@gmail.com	\N	1988-01-22	2015-06-12	reg_user
15	m0thart	15df88f7c7782c34ada4cbf2105ec4f1	martart@gmail.com	\N	1996-04-11	2015-06-12	reg_user
16	graphicdream	5f692cd0c0e38117be8b4c6a4a28b8f9	info@graphicdream.com	\N	1981-12-02	2015-06-12	reg_user
17	artofdan70	85d233d21dd319d09beb757684a21aa6	artofdan70@gmail.com	\N	1984-06-03	2015-06-12	reg_user
18	lavemer	316a2fb1dc3ea02be09453239aee94bf	lavemer@mixmail.com	\N	1970-09-30	2015-06-12	reg_user
19	patrickbrown	b0d55687094833156eeab95d83d6cfcb	patrick@brown.com	\N	1992-06-13	2015-06-12	reg_user
20	admin	21232f297a57a5a743894a0e4a801fc3	admin@admin.com	\N	1984-07-08	2015-06-15	admin
\.


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('usuarios_id_seq', 20, true);


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
-- Name: pk_roles; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (rol_id);


--
-- Name: pk_seguidores; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY seguidores
    ADD CONSTRAINT pk_seguidores PRIMARY KEY (usuarios_id, seguidos_id);


--
-- Name: pk_usuarios; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (id);


--
-- Name: uq_etiqetas_nombre_et; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY etiquetas
    ADD CONSTRAINT uq_etiqetas_nombre_et UNIQUE (nombre_et);


--
-- Name: uq_roles_nom_rol; Type: CONSTRAINT; Schema: public; Owner: gallery; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT uq_roles_nom_rol UNIQUE (nom_rol);


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
-- Name: fk_seguidores_seguidos_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY seguidores
    ADD CONSTRAINT fk_seguidores_seguidos_id FOREIGN KEY (seguidos_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_seguidores_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY seguidores
    ADD CONSTRAINT fk_seguidores_usuarios_id FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE;


--
-- Name: fk_usuarios_nom_rol; Type: FK CONSTRAINT; Schema: public; Owner: gallery
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT fk_usuarios_nom_rol FOREIGN KEY (nom_rol) REFERENCES roles(nom_rol) ON UPDATE CASCADE;


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

