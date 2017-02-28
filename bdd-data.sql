
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
-- Data for Name: tarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tarif (idtarif, type_tarif, prix_tarif_heure) VALUES (1, 'A', 20000);
INSERT INTO tarif (idtarif, type_tarif, prix_tarif_heure) VALUES (2, 'B', 40000);
INSERT INTO tarif (idtarif, type_tarif, prix_tarif_heure) VALUES (3, 'C', 30000);
INSERT INTO tarif (idtarif, type_tarif, prix_tarif_heure) VALUES (4, 'D', 50000);


--
-- Name: tarif_idtarif_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tarif_idtarif_seq', 4, true);


--
-- Data for Name: voiture; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO voiture (idvoiture, idtarif, matricule_voiture, marque_voiture, modele_voiture, constructeur_voiture) VALUES (1, 1, '51 99 TAC', '206', 'berline', 'peugeot');
INSERT INTO voiture (idvoiture, idtarif, matricule_voiture, marque_voiture, modele_voiture, constructeur_voiture) VALUES (2, 2, '48 54 TB', 'saxo', 'citadine', 'citroen');


--
-- Name: voiture_idvoiture_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('voiture_idvoiture_seq', 2, true);


--
-- Name: pk_client; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT pk_client PRIMARY KEY (idclient);


--
-- Name: pk_location; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT pk_location PRIMARY KEY (idlocation);


--
-- Name: pk_manager; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY manager
    ADD CONSTRAINT pk_manager PRIMARY KEY (idmanager);


--
-- Name: pk_tarif; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tarif
    ADD CONSTRAINT pk_tarif PRIMARY KEY (idtarif);


--
-- Name: pk_voiture; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY voiture
    ADD CONSTRAINT pk_voiture PRIMARY KEY (idvoiture);


--
-- Name: association_5_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association_5_fk ON voiture USING btree (idtarif);


--
-- Name: client_location_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX client_location_fk ON location USING btree (idclient);


--
-- Name: client_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX client_pk ON client USING btree (idclient);


--
-- Name: location_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX location_pk ON location USING btree (idlocation);


--
-- Name: manager_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX manager_pk ON manager USING btree (idmanager);


--
-- Name: manager_voiture_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX manager_voiture_fk ON manager USING btree (idvoiture);


--
-- Name: tarif_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tarif_pk ON tarif USING btree (idtarif);


--
-- Name: voiture_location_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX voiture_location_fk ON location USING btree (idvoiture);


--
-- Name: voiture_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX voiture_pk ON voiture USING btree (idvoiture);


--
-- Name: fk_location_client_lo_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY location
    ADD CONSTRAINT fk_location_client_lo_client FOREIGN KEY (idclient) REFERENCES client(idclient) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_location_voiture_l_voiture; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY location
    ADD CONSTRAINT fk_location_voiture_l_voiture FOREIGN KEY (idvoiture) REFERENCES voiture(idvoiture) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_manager_manager_v_voiture; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manager
    ADD CONSTRAINT fk_manager_manager_v_voiture FOREIGN KEY (idvoiture) REFERENCES voiture(idvoiture) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: fk_voiture_associati_tarif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY voiture
    ADD CONSTRAINT fk_voiture_associati_tarif FOREIGN KEY (idtarif) REFERENCES tarif(idtarif) ON UPDATE RESTRICT ON DELETE RESTRICT;


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

