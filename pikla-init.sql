--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.5
-- Started on 2017-03-02 14:19:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE pikla;
--
-- TOC entry 2059 (class 1262 OID 67379)
-- Name: pikla; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pikla WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE pikla OWNER TO postgres;

\connect pikla

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 184 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 184
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 67382)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE client (
    idclient integer NOT NULL,
    nom_client character varying(255),
    prenom_client character varying(48),
    cin_client character varying(255),
    adresse_client character varying(255),
    tel_client character varying(255),
    login character varying(255),
    password text,
    statut boolean
);


ALTER TABLE client OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 67380)
-- Name: client_idclient_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_idclient_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client_idclient_seq OWNER TO postgres;

--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 172
-- Name: client_idclient_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_idclient_seq OWNED BY client.idclient;


--
-- TOC entry 183 (class 1259 OID 67463)
-- Name: formation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE formation (
    id integer NOT NULL,
    theme character varying(255)
);


ALTER TABLE formation OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 67461)
-- Name: formation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE formation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE formation_id_seq OWNER TO postgres;

--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 182
-- Name: formation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE formation_id_seq OWNED BY formation.id;


--
-- TOC entry 175 (class 1259 OID 67394)
-- Name: location; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE location (
    idlocation integer NOT NULL,
    idvoiture integer NOT NULL,
    idclient integer NOT NULL,
    depart character varying(255),
    arrivee character varying(255),
    duree time without time zone,
    date_location date
);


ALTER TABLE location OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 67392)
-- Name: location_idlocation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE location_idlocation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE location_idlocation_seq OWNER TO postgres;

--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 174
-- Name: location_idlocation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE location_idlocation_seq OWNED BY location.idlocation;


--
-- TOC entry 177 (class 1259 OID 67408)
-- Name: manager; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE manager (
    idmanager integer NOT NULL,
    idvoiture integer NOT NULL,
    nom_manager character varying(80),
    prenom_manager character varying(40),
    cin_manager character varying(255),
    login_manager character varying(80),
    password_manager character varying(255),
    permis_matricule character varying(255)
);


ALTER TABLE manager OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 67406)
-- Name: manager_idmanager_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE manager_idmanager_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE manager_idmanager_seq OWNER TO postgres;

--
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 176
-- Name: manager_idmanager_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE manager_idmanager_seq OWNED BY manager.idmanager;


--
-- TOC entry 179 (class 1259 OID 67421)
-- Name: tarif; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tarif (
    idtarif integer NOT NULL,
    type_tarif character varying(255),
    prix_tarif_heure integer
);


ALTER TABLE tarif OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 67419)
-- Name: tarif_idtarif_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tarif_idtarif_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tarif_idtarif_seq OWNER TO postgres;

--
-- TOC entry 2067 (class 0 OID 0)
-- Dependencies: 178
-- Name: tarif_idtarif_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tarif_idtarif_seq OWNED BY tarif.idtarif;


--
-- TOC entry 181 (class 1259 OID 67430)
-- Name: voiture; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE voiture (
    idvoiture integer NOT NULL,
    idtarif integer NOT NULL,
    matricule_voiture character varying(255),
    marque_voiture character varying(255),
    modele_voiture character varying(255),
    constructeur_voiture character varying(255)
);


ALTER TABLE voiture OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 67428)
-- Name: voiture_idvoiture_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE voiture_idvoiture_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voiture_idvoiture_seq OWNER TO postgres;

--
-- TOC entry 2068 (class 0 OID 0)
-- Dependencies: 180
-- Name: voiture_idvoiture_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE voiture_idvoiture_seq OWNED BY voiture.idvoiture;


--
-- TOC entry 1915 (class 2604 OID 67385)
-- Name: idclient; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client ALTER COLUMN idclient SET DEFAULT nextval('client_idclient_seq'::regclass);


--
-- TOC entry 1920 (class 2604 OID 67466)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formation ALTER COLUMN id SET DEFAULT nextval('formation_id_seq'::regclass);


--
-- TOC entry 1916 (class 2604 OID 67397)
-- Name: idlocation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY location ALTER COLUMN idlocation SET DEFAULT nextval('location_idlocation_seq'::regclass);


--
-- TOC entry 1917 (class 2604 OID 67411)
-- Name: idmanager; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manager ALTER COLUMN idmanager SET DEFAULT nextval('manager_idmanager_seq'::regclass);


--
-- TOC entry 1918 (class 2604 OID 67424)
-- Name: idtarif; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarif ALTER COLUMN idtarif SET DEFAULT nextval('tarif_idtarif_seq'::regclass);


--
-- TOC entry 1919 (class 2604 OID 67433)
-- Name: idvoiture; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY voiture ALTER COLUMN idvoiture SET DEFAULT nextval('voiture_idvoiture_seq'::regclass);


--
-- TOC entry 1941 (class 2606 OID 67468)
-- Name: formation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY formation
    ADD CONSTRAINT formation_pkey PRIMARY KEY (id);


--
-- TOC entry 1923 (class 2606 OID 67390)
-- Name: pk_client; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT pk_client PRIMARY KEY (idclient);


--
-- TOC entry 1927 (class 2606 OID 67402)
-- Name: pk_location; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT pk_location PRIMARY KEY (idlocation);


--
-- TOC entry 1932 (class 2606 OID 67416)
-- Name: pk_manager; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY manager
    ADD CONSTRAINT pk_manager PRIMARY KEY (idmanager);


--
-- TOC entry 1934 (class 2606 OID 67426)
-- Name: pk_tarif; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tarif
    ADD CONSTRAINT pk_tarif PRIMARY KEY (idtarif);


--
-- TOC entry 1938 (class 2606 OID 67438)
-- Name: pk_voiture; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY voiture
    ADD CONSTRAINT pk_voiture PRIMARY KEY (idvoiture);


--
-- TOC entry 1936 (class 1259 OID 67440)
-- Name: association_5_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX association_5_fk ON voiture USING btree (idtarif);


--
-- TOC entry 1924 (class 1259 OID 67404)
-- Name: client_location_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX client_location_fk ON location USING btree (idclient);


--
-- TOC entry 1921 (class 1259 OID 67391)
-- Name: client_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX client_pk ON client USING btree (idclient);


--
-- TOC entry 1925 (class 1259 OID 67403)
-- Name: location_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX location_pk ON location USING btree (idlocation);


--
-- TOC entry 1929 (class 1259 OID 67417)
-- Name: manager_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX manager_pk ON manager USING btree (idmanager);


--
-- TOC entry 1930 (class 1259 OID 67418)
-- Name: manager_voiture_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX manager_voiture_fk ON manager USING btree (idvoiture);


--
-- TOC entry 1935 (class 1259 OID 67427)
-- Name: tarif_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tarif_pk ON tarif USING btree (idtarif);


--
-- TOC entry 1928 (class 1259 OID 67405)
-- Name: voiture_location_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX voiture_location_fk ON location USING btree (idvoiture);


--
-- TOC entry 1939 (class 1259 OID 67439)
-- Name: voiture_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX voiture_pk ON voiture USING btree (idvoiture);


--
-- TOC entry 1942 (class 2606 OID 67441)
-- Name: fk_location_client_lo_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY location
    ADD CONSTRAINT fk_location_client_lo_client FOREIGN KEY (idclient) REFERENCES client(idclient) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1943 (class 2606 OID 67446)
-- Name: fk_location_voiture_l_voiture; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY location
    ADD CONSTRAINT fk_location_voiture_l_voiture FOREIGN KEY (idvoiture) REFERENCES voiture(idvoiture) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1944 (class 2606 OID 67451)
-- Name: fk_manager_manager_v_voiture; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manager
    ADD CONSTRAINT fk_manager_manager_v_voiture FOREIGN KEY (idvoiture) REFERENCES voiture(idvoiture) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1945 (class 2606 OID 67456)
-- Name: fk_voiture_associati_tarif; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY voiture
    ADD CONSTRAINT fk_voiture_associati_tarif FOREIGN KEY (idtarif) REFERENCES tarif(idtarif) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-03-02 14:19:36

--
-- PostgreSQL database dump complete
--

