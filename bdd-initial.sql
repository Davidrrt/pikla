/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     28/02/2017 15:55:14                          */
/*==============================================================*/


drop index CLIENT_PK;

drop table CLIENT;

drop index VOITURE_LOCATION_FK;

drop index CLIENT_LOCATION_FK;

drop index LOCATION_PK;

drop table LOCATION;

drop index MANAGER_VOITURE_FK;

drop index MANAGER_PK;

drop table MANAGER;

drop index TARIF_PK;

drop table TARIF;

drop index ASSOCIATION_5_FK;

drop index VOITURE_PK;

drop table VOITURE;

/*==============================================================*/
/* Table: CLIENT                                                */
/*==============================================================*/
create table CLIENT (
   IDCLIENT             SERIAL               not null,
   NOM_CLIENT           VARCHAR(255)         null,
   PRENOM_CLIENT        VARCHAR(48)          null,
   CIN_CLIENT           VARCHAR(255)         null,
   ADRESSE_CLIENT       VARCHAR(255)         null,
   TEL_CLIENT           VARCHAR(255)         null,
   LOGIN                VARCHAR(255)         null,
   PASSWORD             TEXT                 null,
   STATUT               BOOL                 null,
   constraint PK_CLIENT primary key (IDCLIENT)
);

/*==============================================================*/
/* Index: CLIENT_PK                                             */
/*==============================================================*/
create unique index CLIENT_PK on CLIENT (
IDCLIENT
);

/*==============================================================*/
/* Table: LOCATION                                              */
/*==============================================================*/
create table LOCATION (
   IDLOCATION           SERIAL               not null,
   IDVOITURE            INT4                 not null,
   IDCLIENT             INT4                 not null,
   DEPART               VARCHAR(255)         null,
   ARRIVEE              VARCHAR(255)         null,
   DUREE                TIME                 null,
   DATE_LOCATION        DATE                 null,
   constraint PK_LOCATION primary key (IDLOCATION)
);

/*==============================================================*/
/* Index: LOCATION_PK                                           */
/*==============================================================*/
create unique index LOCATION_PK on LOCATION (
IDLOCATION
);

/*==============================================================*/
/* Index: CLIENT_LOCATION_FK                                    */
/*==============================================================*/
create  index CLIENT_LOCATION_FK on LOCATION (
IDCLIENT
);

/*==============================================================*/
/* Index: VOITURE_LOCATION_FK                                   */
/*==============================================================*/
create  index VOITURE_LOCATION_FK on LOCATION (
IDVOITURE
);

/*==============================================================*/
/* Table: MANAGER                                               */
/*==============================================================*/
create table MANAGER (
   IDMANAGER            SERIAL               not null,
   IDVOITURE            INT4                 not null,
   NOM_MANAGER          VARCHAR(80)          null,
   PRENOM_MANAGER       VARCHAR(40)          null,
   CIN_MANAGER          VARCHAR(255)         null,
   LOGIN_MANAGER        VARCHAR(80)          null,
   PASSWORD_MANAGER     VARCHAR(255)         null,
   PERMIS_MATRICULE     VARCHAR(255)         null,
   constraint PK_MANAGER primary key (IDMANAGER)
);

/*==============================================================*/
/* Index: MANAGER_PK                                            */
/*==============================================================*/
create unique index MANAGER_PK on MANAGER (
IDMANAGER
);

/*==============================================================*/
/* Index: MANAGER_VOITURE_FK                                    */
/*==============================================================*/
create  index MANAGER_VOITURE_FK on MANAGER (
IDVOITURE
);

/*==============================================================*/
/* Table: TARIF                                                 */
/*==============================================================*/
create table TARIF (
   IDTARIF              SERIAL               not null,
   TYPE_TARIF           VARCHAR(255)         null,
   PRIX_TARIF_HEURE     INT4                 null,
   constraint PK_TARIF primary key (IDTARIF)
);

/*==============================================================*/
/* Index: TARIF_PK                                              */
/*==============================================================*/
create unique index TARIF_PK on TARIF (
IDTARIF
);

/*==============================================================*/
/* Table: VOITURE                                               */
/*==============================================================*/
create table VOITURE (
   IDVOITURE            SERIAL               not null,
   IDTARIF              INT4                 not null,
   MATRICULE_VOITURE    VARCHAR(255)         null,
   MARQUE_VOITURE       VARCHAR(255)         null,
   MODELE_VOITURE       VARCHAR(255)         null,
   CONSTRUCTEUR_VOITURE VARCHAR(255)         null,
   constraint PK_VOITURE primary key (IDVOITURE)
);

/*==============================================================*/
/* Index: VOITURE_PK                                            */
/*==============================================================*/
create unique index VOITURE_PK on VOITURE (
IDVOITURE
);

/*==============================================================*/
/* Index: ASSOCIATION_5_FK                                      */
/*==============================================================*/
create  index ASSOCIATION_5_FK on VOITURE (
IDTARIF
);

alter table LOCATION
   add constraint FK_LOCATION_CLIENT_LO_CLIENT foreign key (IDCLIENT)
      references CLIENT (IDCLIENT)
      on delete restrict on update restrict;

alter table LOCATION
   add constraint FK_LOCATION_VOITURE_L_VOITURE foreign key (IDVOITURE)
      references VOITURE (IDVOITURE)
      on delete restrict on update restrict;

alter table MANAGER
   add constraint FK_MANAGER_MANAGER_V_VOITURE foreign key (IDVOITURE)
      references VOITURE (IDVOITURE)
      on delete restrict on update restrict;

alter table VOITURE
   add constraint FK_VOITURE_ASSOCIATI_TARIF foreign key (IDTARIF)
      references TARIF (IDTARIF)
      on delete restrict on update restrict;

