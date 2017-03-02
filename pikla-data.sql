--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO client (idclient, nom_client, prenom_client, cin_client, adresse_client, tel_client, login, password, statut) VALUES (1, 'RANDRIA', 'Arisoa', '1235464654', 'Ampandrana', '2613334215', 'ari@mail.com', 'wawa', true);
INSERT INTO client (idclient, nom_client, prenom_client, cin_client, adresse_client, tel_client, login, password, statut) VALUES (2, 'RASOARINAIVO', 'Andry', '16546546546', 'Ambondrona', '2613248125', 'ls@mail.com', 'wawa1', true);
INSERT INTO client (idclient, nom_client, prenom_client, cin_client, adresse_client, tel_client, login, password, statut) VALUES (3, 'RANDRIANASOLO', 'Raharinosy', '15654684848', 'Analakely', '261341582841', 'rahari@mail.com', 'test1', true);
INSERT INTO client (idclient, nom_client, prenom_client, cin_client, adresse_client, tel_client, login, password, statut) VALUES (4, 'RAKOTOARISOA', 'Harimino', '64548912', 'Sonierana', '2418675552', 'mino@mail.com', 'test', true);


--
-- Name: client_idclient_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_idclient_seq', 4, true);


--
-- Data for Name: formation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO formation (id, theme) VALUES (1, 'jour');
INSERT INTO formation (id, theme) VALUES (2, 'nuit');
INSERT INTO formation (id, theme) VALUES (3, 'wawa');
INSERT INTO formation (id, theme) VALUES (4, 'Hibernate');


--
-- Name: formation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('formation_id_seq', 3, true);


--
-- Data for Name: tarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tarif (idtarif, type_tarif, prix_tarif_heure) VALUES (1, 'A', 20000);
INSERT INTO tarif (idtarif, type_tarif, prix_tarif_heure) VALUES (2, 'B', 40000);
INSERT INTO tarif (idtarif, type_tarif, prix_tarif_heure) VALUES (3, 'C', 30000);
INSERT INTO tarif (idtarif, type_tarif, prix_tarif_heure) VALUES (4, 'D', 50000);


--
-- Data for Name: voiture; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO voiture (idvoiture, idtarif, matricule_voiture, marque_voiture, modele_voiture, constructeur_voiture) VALUES (1, 1, '51 99 TAC', '206', 'berline', 'peugeot');
INSERT INTO voiture (idvoiture, idtarif, matricule_voiture, marque_voiture, modele_voiture, constructeur_voiture) VALUES (2, 2, '48 54 TB', 'saxo', 'citadine', 'citroen');


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: location_idlocation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('location_idlocation_seq', 1, false);


--
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO manager (idmanager, idvoiture, nom_manager, prenom_manager, cin_manager, login_manager, password_manager, permis_matricule) VALUES (1, 1, 'RABENASOLO', 'Rindra', '1245987855', 'rabe@mail.com', 'wawa', '255447');
INSERT INTO manager (idmanager, idvoiture, nom_manager, prenom_manager, cin_manager, login_manager, password_manager, permis_matricule) VALUES (2, 2, 'RANDRIA', 'Arisata', '1234888965', 'arisa@mail.com', 'wawa1', '455756');


--
-- Name: manager_idmanager_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('manager_idmanager_seq', 2, true);


--
-- Name: tarif_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tarif_idtarif_seq', 4, true);


--
-- Name: voiture_idvoiture_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('voiture_idvoiture_seq', 2, true);


--
-- PostgreSQL database dump complete
--

