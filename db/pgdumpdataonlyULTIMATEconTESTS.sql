--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY roles (rol_id, nom_rol) FROM stdin;
1	admin
2	reg_user
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
15	m0thart	15df88f7c7782c34ada4cbf2105ec4f1	martart@gmail.com	\N	1996-04-11	2015-06-12	reg_user
16	graphicdream	5f692cd0c0e38117be8b4c6a4a28b8f9	info@graphicdream.com	\N	1981-12-02	2015-06-12	reg_user
17	artofdan70	85d233d21dd319d09beb757684a21aa6	artofdan70@gmail.com	\N	1984-06-03	2015-06-12	reg_user
18	lavemer	316a2fb1dc3ea02be09453239aee94bf	lavemer@mixmail.com	\N	1970-09-30	2015-06-12	reg_user
19	patrickbrown	b0d55687094833156eeab95d83d6cfcb	patrick@brown.com	\N	1992-06-13	2015-06-12	reg_user
20	admin	21232f297a57a5a743894a0e4a801fc3	admin@admin.com	\N	1984-07-08	2015-06-15	admin
21	davidrapoza	022e3a8238eef1adc732b34934d78096	dr@ozaoza.com	\N	1990-02-11	2015-06-19	reg_user
\.


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

SELECT pg_catalog.setval('categorias_id_seq', 19, false);


--
-- Data for Name: ci_sessions; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY ci_sessions (session_id, ip_address, user_agent, last_activity, user_data) FROM stdin;
b7a01be68604523381058f51dc8e5846	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/43.0.2357.81 Chrome/43.0.2357.81 	1434821205	a:3:{s:9:"user_data";s:0:"";s:4:"nick";s:10:"sanfranguy";s:2:"id";s:1:"6";}
\.


--
-- Data for Name: imagenes; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY imagenes (id, titulo, img_url, thumb_url, usuarios_id, categorias_id, descripcion_img, fecha_subida, nsfw) FROM stdin;
4	Uncharted 4	uploads/patrickbrown/patrickbrown-uncharted42f860659.jpg	uploads/patrickbrown/patrickbrown-uncharted42f860659_thumb.jpg	19	7	And here's one to start the new year, staring Nathan Drake in Uncharted 4. I created this based mainly off of the 15-minute gameplay trailer, it helped a lot in terms of knowing what was in the game and how Drake actually looks.  My New Years resolution is to spend more time on details, so I'm trying to add a lot more to my characters overall look, I've seen a lot of extremely talented people here on DA and noticed the best images all focus on great detail, so I'm very inspired to aim for that level.  I cannot wait for this game, Uncharted is one of my most favorite games series yet, so I really wanted to do something special for it.	2015-06-17 03:56:50	f
5	Assassins Creed Unity	uploads/patrickbrown/patrickbrown-assassinscreedunity08264afa.jpg	uploads/patrickbrown/patrickbrown-assassinscreedunity08264afa_thumb.jpg	19	7	This is a french gaming magazine I was commissioned by and was lucky enough to create this for their first issue of the magazine.	2015-06-14 20:45:41	f
8	The Man of Armadon	uploads/joshhutchinson/joshhutchinson-themanofarmadonfada307c.jpg	uploads/joshhutchinson/joshhutchinson-themanofarmadonfada307c_thumb.jpg	3	11	The man of Armadon is an intergalactic being who is a hero on his home planet. He is part of a species, which live for millennia and are extremely wise given their age. His kind have no facial features and communicate with their own through telepathy. Now living on Earth, in the city of Armadon, he cannot communicate with the locals, so he tells his story by using his projection abilities. In this scene he is introducing the city he lived in on his home planet as passersby look on in fascination.	2015-06-19 07:00:33	f
9	Starry Mountain	uploads/joshhutchinson/joshhutchinson-starrymountaind7066883.jpg	uploads/joshhutchinson/joshhutchinson-starrymountaind7066883_thumb.jpg	3	5	New environment piece!	2015-06-15 13:34:15	f
10	ENEMY title artwork	uploads/joshhutchinson/joshhutchinson-enemytitleartwork23c06fa9.jpg	uploads/joshhutchinson/joshhutchinson-enemytitleartwork23c06fa9_thumb.jpg	3	5	Artwork I did for the game 'ENEMY' out today on Steam! Check it out!	2015-06-12 12:55:56	f
11	A Spirit Living a Human Life	uploads/joshhutchinson/joshhutchinson-aspiritlivingahumanlife3aac6910.jpg	uploads/joshhutchinson/joshhutchinson-aspiritlivingahumanlife3aac6910_thumb.jpg	3	9	A re-hash of an old illustration. Quite a personal piece.	2015-06-12 04:11:09	f
12	Ancient Tree	uploads/joshhutchinson/joshhutchinson-ancienttree9d8c648d.jpg	uploads/joshhutchinson/joshhutchinson-ancienttree9d8c648d_thumb.jpg	3	5	First piece of 2015. I'm going to be doing a lot of Studio Ghibli style stuff this year. I hope to work for them at some point in my career.	2015-06-14 23:44:23	f
13	Astronaut Wally Schirra, and cramped Gemini craft	uploads/strib/strib-astronautwallyschirra,andcrampedgeminicrafte48a9e27.jpg	uploads/strib/strib-astronautwallyschirra,andcrampedgeminicrafte48a9e27_thumb.jpg	7	9	One of the original seven, and later part of Gemini and Apollo.	2015-06-13 11:02:56	f
14	Lukah Land 1	uploads/strib/strib-lukahland1f0807c49.jpg	uploads/strib/strib-lukahland1f0807c49_thumb.jpg	7	11	Game concept art for Fearless Studios	2015-06-15 21:44:55	f
15	Anti-hero	uploads/strib/strib-anti-hero772f4fc4.jpg	uploads/strib/strib-anti-hero772f4fc4_thumb.jpg	7	7	Game character for Fearless Studios	2015-06-05 18:35:49	f
16	The Doctor	uploads/strib/strib-thedoctor03bf77e9.jpg	uploads/strib/strib-thedoctor03bf77e9_thumb.jpg	7	9	...larger, and with text	2015-06-06 16:13:46	f
2	Get To Da Choppa!	uploads/patrickbrown/patrickbrown-gettodachoppa!709fee13.jpg	uploads/patrickbrown/patrickbrown-gettodachoppa!709fee13_thumb.jpg	19	7	One of my favourite movies, The Predator. I was just messing around drawing in my sketchbook when I came up with this, liked how it was going so I ended up going all the way with it	2015-06-18 12:42:14	f
6	Soul Ascending	uploads/joshhutchinson/joshhutchinson-soulascendinge7e6c559.jpg	uploads/joshhutchinson/joshhutchinson-soulascendinge7e6c559_thumb.jpg	3	5		2015-06-12 04:30:01	f
19	original trek	uploads/strib/strib-originaltrek7a104046.jpg	uploads/strib/strib-originaltrek7a104046_thumb.jpg	7	9	So, I added this a while back...before IDW bought it. Then, I figured I should take it down until the time was right. Well, it's been posted on Chris Ryall's blog...so, I figure it's OK now.  The original 3D model I used for reference is by a very talented artist named Bill Thomas.	2015-06-18 07:03:30	f
3	Guardians of The Galaxy	uploads/patrickbrown/patrickbrown-guardiansofthegalaxy6100cba6.jpg	uploads/patrickbrown/patrickbrown-guardiansofthegalaxy6100cba6_thumb.jpg	19	11	Wow I'm glad to finally have this done and be able to share it with you all. I've spent the past month or more working on this, I've just been so excited to see the movie I really wanted to put that energy into a piece of art. I drew each character separately, keeping in mind where I wanted to place them, then did all the rest in Photoshop. Well except for the line work, lately I've started using Manga Studio for the outlines, oh man does it make a difference, the lines come out 100x smoother and cleaner with that program, and it can easily shift between both Photoshop and Manga with the same file, I love it. 	2015-06-18 20:14:15	f
7	Now Boarding!	uploads/joshhutchinson/joshhutchinson-nowboarding!a1486167.jpg	uploads/joshhutchinson/joshhutchinson-nowboarding!a1486167_thumb.jpg	3	5	Hello everyone! I'm back with a new image I created during my internship at Atomhawk. Had a lot of fun creating this!	2015-06-12 00:01:06	f
20	Robotica	uploads/sanfranguy/sanfranguy-roboticad5cad679.jpg	uploads/sanfranguy/sanfranguy-roboticad5cad679_thumb.jpg	6	8	Literally 5 minutes in Zbrush with a poser character.   Polygroups generated by UV Group tiles.  Panel loops extruded based on polygroups.  Displacement map.  Done.	2015-06-07 23:44:31	f
23	Machinarium CGI	uploads/sanfranguy/sanfranguy-machinariumcgi23f81658.jpg	uploads/sanfranguy/sanfranguy-machinariumcgi23f81658_thumb.jpg	6	12	A 3D version of a famous 2D shot [link]. Not matched piece for piece, but close enough.   Modeled in ZBrush mostly - Some C4D.  Rendered with VRayforC4D.   Enjoy.  P.S Wireframe [link] Snow version (for kicks) [link] 14 million polys. Overkill, but then why not.	2015-06-17 13:16:35	f
29	Deep	uploads/tohad/tohad-deepf22e85e2.jpg	uploads/tohad/tohad-deepf22e85e2_thumb.jpg	1	3	Another early concept	2015-06-17 08:11:13	f
31	Trapjaw	uploads/davidrapoza/davidrapoza-trapjaw988b9d9f.jpg	uploads/davidrapoza/davidrapoza-trapjaw988b9d9f_thumb.jpg	21	9	Trapjaw of Masters of the Universe!	2015-06-08 20:02:04	f
32	Skeletor	uploads/davidrapoza/davidrapoza-skeletor369a52d7.jpg	uploads/davidrapoza/davidrapoza-skeletor369a52d7_thumb.jpg	21	9	Skeletor of Masters of the Universe!	2015-06-12 18:33:46	f
33	Evil-Lyn	uploads/davidrapoza/davidrapoza-evil-lyn2ab6aa8f.jpg	uploads/davidrapoza/davidrapoza-evil-lyn2ab6aa8f_thumb.jpg	21	9	Evil-Lyn of Masters of the Universe!	2015-06-10 00:53:30	f
36	Kingfisher (drawing)	uploads/quelchii/quelchii-kingfisher(drawing)8208c82f.jpg	uploads/quelchii/quelchii-kingfisher(drawing)8208c82f_thumb.jpg	11	13	Traditional drawing of the common kingfisher (Alcedo atthis). Some details and lighting effects of this cute little bird were a bit difficult to draw, so I rushed this drawing at the end... 	2015-06-08 02:54:38	f
37	Loki (marker drawing)	uploads/quelchii/quelchii-loki(markerdrawing)e694c74f.jpg	uploads/quelchii/quelchii-loki(markerdrawing)e694c74f_thumb.jpg	11	13	After my first attempt to draw with Copic markers on watercolour paper I decided to do a portrait as well (of course it's my "test object" Loki).	2015-06-07 00:28:56	f
38	Star-Lord (drawing)	uploads/quelchii/quelchii-star-lord(drawing)0b360f34.jpg	uploads/quelchii/quelchii-star-lord(drawing)0b360f34_thumb.jpg	11	17	Traditional drawing of Chris Pratt as Peter Quill / Star-Lord (Guardians of the Galaxy) with a raccoon.	2015-06-16 07:01:00	f
18	Remorseful Indy	uploads/strib/strib-remorsefulindy4dc5df9e.jpg	uploads/strib/strib-remorsefulindy4dc5df9e_thumb.jpg	7	9	sad Indy	2015-06-07 05:04:25	f
21	Steampunk - Hummingbird	uploads/sanfranguy/sanfranguy-steampunk-hummingbird2f0f6593.jpg	uploads/sanfranguy/sanfranguy-steampunk-hummingbird2f0f6593_thumb.jpg	6	12	ZBrush/C4D/VRay  Roughly 10 hours to create/shade/light/etc Design evolution	2015-06-18 10:21:19	f
24	ModernThreeStory2	uploads/sanfranguy/sanfranguy-modernthreestory2b3d17258.jpg	uploads/sanfranguy/sanfranguy-modernthreestory2b3d17258_thumb.jpg	6	6	ZBrush for the house. C4D + VRay for everything else.	2015-06-11 09:42:13	f
25	LabMonkey	uploads/sanfranguy/sanfranguy-labmonkeyccb46e60.jpg	uploads/sanfranguy/sanfranguy-labmonkeyccb46e60_thumb.jpg	6	12	ZBrush - C4D - VRay	2015-06-13 11:01:03	f
30	Mer-Man	uploads/davidrapoza/davidrapoza-mer-manade67361.jpg	uploads/davidrapoza/davidrapoza-mer-manade67361_thumb.jpg	21	9	Mer-Man of Masters of the Universe!	2015-06-17 23:17:24	f
22	Mech Prototype - Exposed	uploads/sanfranguy/sanfranguy-mechprototype-exposed2c34ebc5.jpg	uploads/sanfranguy/sanfranguy-mechprototype-exposed2c34ebc5_thumb.jpg	6	8	Exposed, as in without armor. It was my intention to show more the inner workings of the mech.  Perhaps one day I'll get to making the outside.   Mech took 12 days in Zbrush + C4D.   WIP Image; 	2015-06-18 20:39:31	f
26	Game Boy Master	uploads/tohad/tohad-gameboymastera249e3c5.jpg	uploads/tohad/tohad-gameboymastera249e3c5_thumb.jpg	1	11	Pour en revenir à l'illustration, le personnage jouant à la Gameboy se nomme Rufio et vous aurez l'occasion de mieux le découvrir lors des prochaines pages de ma BD.	2015-06-10 00:49:24	f
27	Under the bridge	uploads/tohad/tohad-underthebridge1bc65f43.jpg	uploads/tohad/tohad-underthebridge1bc65f43_thumb.jpg	1	5	New illustration for the universe of my webcomic	2015-06-10 10:05:42	f
28	The room of the Leviathan	uploads/tohad/tohad-theroomoftheleviathan2061a49a.jpg	uploads/tohad/tohad-theroomoftheleviathan2061a49a_thumb.jpg	1	5	Here inside the first floor of this old shack in my comic for those who wondered what it contained. It is not better to be allergic to dust because I'm sure we can find large mites as Yorkshire terriers in some corners.	2015-06-07 13:25:37	f
34	Michelangelo	uploads/davidrapoza/davidrapoza-michelangelo72e2762d.jpg	uploads/davidrapoza/davidrapoza-michelangelo72e2762d_thumb.jpg	21	9	Michelangelo of TMNT!	2015-06-06 21:10:06	f
35	Hummingbird (drawing)	uploads/quelchii/quelchii-hummingbird(drawing)33c90a6a.jpg	uploads/quelchii/quelchii-hummingbird(drawing)33c90a6a_thumb.jpg	11	13	Traditional drawing of a hummingbird (Green-crowned brilliant - Heliodoxa jacula). It was fun to draw all these iridescent feathers (too bad my scanner messed up the colours and the contrast a bit...)! It could be a bit better, but I gave up drawing all these feathers properly after a while	2015-06-05 20:25:02	f
1	Aliens	uploads/patrickbrown/patrickbrown-aliense9d07429.jpg	uploads/patrickbrown/patrickbrown-aliense9d07429_thumb.jpg	19	11	Ever since it was made official that Sigourney Weaver was coming back for a new Alien movie by Neill Blomkamp, I got really excited and decided to watch Aliens again. That scene at the end where Ripley comes out of the elevator and goes down into the nest to save Newt, it struck me, I forgot how good this movie was. It inspired me to create this, I really wanted to capture the colours and lighting that go on around that scene. The cool blue tones that clash with the warm colours just work so nicely together in that scene, and I've never tried anything like that before so I learnt a lot.  I tried my best to get Ripley's likeness, I hope it worked. I was trying to go for the "scared out of my mind" look, rather than the "macho hardcore saviour" look, I thought it would stay true to the movie. Man I can't wait to see Ripley back in action, apparently they're kicking off from Aliens, as if 3-4 never happened. I love that idea and I think it's a smart bold move. Can't wait!	2015-06-07 05:12:00	f
17	hobbithole Gandalf	uploads/strib/strib-hobbitholegandalf0490b984.jpg	uploads/strib/strib-hobbitholegandalf0490b984_thumb.jpg	7	9	Ok...what more can I add to this world that we haven't already seen masterfully represented by Peter Jackson's films? Seriously...why bother!? Well, here's how it started. I've been fairly obsessed with the use of line in my artwork over the last few years. This was after the mixed (ok, maybe I'm being generous) reception the CGI comic covers I did for DC came out. I was always a traditional artist before I entered the world of 3D animation and games. More specifically, I was a painter. So, as things usually come back around...I've decided to start relying less on line and get back to my roots. The recent iPad paintings I've been doing helped me come to this. As for Gandalf here...I just wanted to do something that isn't represented well in my portfolio. Fantasy. I guess this is Gandalf sometime before LOTR, but after The Hobbit.   Also...thanks to this gentleman for looking like a real wizard and providing great reference to be a jumping off point for my Gandalf....	2015-06-06 05:52:31	f
\.


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY comentarios (id, usuarios_id, imagenes_id, texto, fecha_com) FROM stdin;
1	1	25	wow muy chulo!!	2015-06-19 04:00:39.987383
2	1	18	me encanta la 4	2015-06-19 04:02:07.557608
3	21	26	can't wait for next art!	2015-06-19 04:26:50.236322
4	21	16	f*k dis docta	2015-06-19 04:27:07.306328
5	21	1	DAT fog <3	2015-06-19 04:27:52.275776
6	3	37	totally awesome	2015-06-19 17:27:47.905561
\.


--
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('comentarios_id_seq', 6, true);


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
91	urban
92	retro
93	gameboy
94	bridge
95	hang
96	merman
97	heman
98	trapjaw
99	skeletor
100	evillin
101	tmnt
102	birds
103	loki
104	markers
105	test
\.


--
-- Name: etiquetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('etiquetas_id_seq', 105, true);


--
-- Data for Name: favoritos; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY favoritos (usuarios_id, imagenes_id, carpeta_id) FROM stdin;
1	25	\N
1	23	\N
1	16	\N
1	11	\N
1	10	\N
1	9	\N
1	4	\N
1	22	\N
1	19	\N
21	18	\N
21	16	\N
21	14	\N
21	13	\N
21	11	\N
11	33	\N
11	32	\N
11	29	\N
11	25	\N
11	22	\N
11	18	\N
11	17	\N
11	19	\N
3	20	\N
3	25	\N
3	14	\N
3	6	\N
3	1	\N
3	22	\N
3	19	\N
3	12	\N
3	29	\N
3	11	\N
3	24	\N
3	27	\N
6	35	\N
6	17	\N
6	34	\N
6	37	\N
6	1	\N
6	18	\N
6	33	\N
6	24	\N
6	11	\N
6	32	\N
6	6	\N
6	12	\N
6	9	\N
6	29	\N
6	38	\N
6	14	\N
6	30	\N
6	21	\N
6	8	\N
6	2	\N
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
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('imagenes_id_seq', 38, true);


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
26	91
26	92
26	93
27	91
27	94
29	13
29	95
30	96
30	97
31	98
31	97
32	99
32	97
32	38
33	100
33	97
33	38
34	101
35	83
35	102
36	83
36	102
37	9
37	103
37	104
38	9
38	10
38	11
8	105
12	105
2	105
23	105
11	105
1	105
32	105
38	105
16	105
9	105
13	105
21	105
\.


--
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY notificaciones (id, usuarios_id, texto, notif_url, vista, fecha_notif) FROM stdin;
6	7	El usuario quelchii sigue tus publicaciones	/usuarios/perfil/quelchii	f	2015-06-19 04:47:13.517729
10	11	El usuario joshhutchinson sigue tus publicaciones	/usuarios/perfil/joshhutchinson	f	2015-06-19 17:28:14.18253
9	3	El usuario quelchii sigue tus publicaciones	/usuarios/perfil/quelchii	t	2015-06-19 04:48:33.23535
11	21	El usuario joshhutchinson sigue tus publicaciones	/usuarios/perfil/joshhutchinson	f	2015-06-19 17:29:35.121985
12	11	El usuario davidrapoza sigue tus publicaciones	/usuarios/perfil/davidrapoza	f	2015-06-19 17:30:03.347533
8	6	El usuario quelchii sigue tus publicaciones	/usuarios/perfil/quelchii	t	2015-06-19 04:47:42.865269
7	1	El usuario quelchii sigue tus publicaciones	/usuarios/perfil/quelchii	t	2015-06-19 04:47:32.496334
\.


--
-- Name: notificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('notificaciones_id_seq', 12, true);


--
-- Data for Name: puntuaciones; Type: TABLE DATA; Schema: public; Owner: gallery
--

COPY puntuaciones (usuarios_id, imagenes_id, valoracion) FROM stdin;
1	25	5
1	23	2
1	21	4
1	11	5
1	4	4
1	5	1
1	6	4
1	16	3
21	34	4
21	32	4
21	30	4
21	26	3
21	25	4
21	23	5
21	24	3
21	18	4
21	13	4
21	11	4
21	12	3
11	33	4
11	29	2
11	25	4
11	22	4
11	18	5
11	17	3
11	28	3
11	2	1
11	9	3
3	38	4
3	37	5
3	36	1
3	35	2
3	20	4
3	6	5
3	1	5
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
11	7
11	1
11	6
11	3
3	11
3	21
21	11
\.


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gallery
--

SELECT pg_catalog.setval('usuarios_id_seq', 21, true);


--
-- PostgreSQL database dump complete
--

