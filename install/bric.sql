--
-- Selected TOC Entries:
--
\connect - postgres
--
-- TOC Entry ID 2 (OID 57421)
--
-- Name: seq_grp Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_grp" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 4 (OID 57421)
--
-- Name: seq_grp Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_grp" from PUBLIC;
GRANT ALL on "seq_grp" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_grp" to "nobody";

--
-- TOC Entry ID 302 (OID 57440)
--
-- Name: grp Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "grp" (
	"id" numeric(10,0) DEFAULT nextval('seq_grp'::text) NOT NULL,
	"parent_id" numeric(10,0),
	"class__id" numeric(10,0) NOT NULL,
	"name" character varying(64),
	"description" character varying(256),
	"secret" numeric(1,0) DEFAULT 1 NOT NULL,
	"permanent" numeric(1,0) DEFAULT 0 NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_grp__secret" CHECK (((secret = '0'::"numeric") OR (secret = '1'::"numeric"))),
	CONSTRAINT "ck_grp__permanent" CHECK (((permanent = '0'::"numeric") OR (permanent = '1'::"numeric"))),
	CONSTRAINT "ck_grp__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_grp__id" Primary Key ("id")
);

--
-- TOC Entry ID 303 (OID 57440)
--
-- Name: grp Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "grp" from PUBLIC;
GRANT ALL on "grp" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "grp" to "nobody";

--
-- TOC Entry ID 5 (OID 57476)
--
-- Name: seq_media_type Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_media_type" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 7 (OID 57476)
--
-- Name: seq_media_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_media_type" from PUBLIC;
GRANT ALL on "seq_media_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_media_type" to "nobody";

--
-- TOC Entry ID 8 (OID 57495)
--
-- Name: seq_media_type_ext Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_media_type_ext" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 10 (OID 57495)
--
-- Name: seq_media_type_ext Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_media_type_ext" from PUBLIC;
GRANT ALL on "seq_media_type_ext" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_media_type_ext" to "nobody";

--
-- TOC Entry ID 304 (OID 57514)
--
-- Name: media_type Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "media_type" (
	"id" numeric(10,0) DEFAULT nextval('seq_media_type'::text) NOT NULL,
	"name" character varying(128) NOT NULL,
	"description" character varying(256),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_media_type__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_media_type__id" Primary Key ("id")
);

--
-- TOC Entry ID 305 (OID 57514)
--
-- Name: media_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "media_type" from PUBLIC;
GRANT ALL on "media_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "media_type" to "nobody";

--
-- TOC Entry ID 306 (OID 57533)
--
-- Name: media_type_ext Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "media_type_ext" (
	"id" numeric(10,0) DEFAULT nextval('seq_media_type_ext'::text) NOT NULL,
	"media_type__id" numeric(10,0) NOT NULL,
	"extension" character varying(10) NOT NULL,
	Constraint "pk_media_type_ext__id" Primary Key ("id")
);

--
-- TOC Entry ID 307 (OID 57533)
--
-- Name: media_type_ext Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "media_type_ext" from PUBLIC;
GRANT ALL on "media_type_ext" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "media_type_ext" to "nobody";

--
-- TOC Entry ID 308 (OID 57558)
--
-- Name: alerted Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "alerted" (
	"id" numeric(10,0) DEFAULT nextval('seq_alerted'::text) NOT NULL,
	"usr__id" numeric(10,0) NOT NULL,
	"alert__id" numeric(10,0) NOT NULL,
	"ack_time" timestamp with time zone,
	Constraint "pk_alerted__id" Primary Key ("id")
);

--
-- TOC Entry ID 309 (OID 57558)
--
-- Name: alerted Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "alerted" from PUBLIC;
GRANT ALL on "alerted" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "alerted" to "nobody";

--
-- TOC Entry ID 310 (OID 57575)
--
-- Name: alerted__contact_value Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "alerted__contact_value" (
	"alerted__id" numeric(10,0) NOT NULL,
	"contact__id" numeric(10,0) NOT NULL,
	"contact_value__value" character varying(256) NOT NULL,
	"sent_time" timestamp with time zone,
	Constraint "pk_alerted__contact_value" Primary Key ("alerted__id", "contact__id", "contact_value__value")
);

--
-- TOC Entry ID 311 (OID 57575)
--
-- Name: alerted__contact_value Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "alerted__contact_value" from PUBLIC;
GRANT ALL on "alerted__contact_value" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "alerted__contact_value" to "nobody";

--
-- TOC Entry ID 11 (OID 57591)
--
-- Name: seq_alerted Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_alerted" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 13 (OID 57591)
--
-- Name: seq_alerted Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_alerted" from PUBLIC;
GRANT ALL on "seq_alerted" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_alerted" to "nobody";

--
-- TOC Entry ID 312 (OID 57631)
--
-- Name: alert_type_rule Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "alert_type_rule" (
	"id" numeric(10,0) DEFAULT nextval('seq_alert_type_rule'::text) NOT NULL,
	"alert_type__id" numeric(10,0) NOT NULL,
	"attr" character varying(64) NOT NULL,
	"operator" character(2) NOT NULL,
	"value" character varying(256) NOT NULL,
	Constraint "pk_alert_type_rule__id" Primary Key ("id")
);

--
-- TOC Entry ID 313 (OID 57631)
--
-- Name: alert_type_rule Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "alert_type_rule" from PUBLIC;
GRANT ALL on "alert_type_rule" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "alert_type_rule" to "nobody";

--
-- TOC Entry ID 14 (OID 57649)
--
-- Name: seq_alert_type_rule Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_alert_type_rule" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 16 (OID 57649)
--
-- Name: seq_alert_type_rule Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_alert_type_rule" from PUBLIC;
GRANT ALL on "seq_alert_type_rule" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_alert_type_rule" to "nobody";

--
-- TOC Entry ID 314 (OID 57677)
--
-- Name: alert Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "alert" (
	"id" numeric(10,0) DEFAULT nextval('seq_alert'::text) NOT NULL,
	"alert_type__id" numeric(10,0) NOT NULL,
	"event__id" numeric(10,0) NOT NULL,
	"subject" character varying(128),
	"message" character varying(512),
	"timestamp" timestamp with time zone DEFAULT "timestamp"('now'::text) NOT NULL,
	Constraint "pk_alert__id" Primary Key ("id")
);

--
-- TOC Entry ID 315 (OID 57677)
--
-- Name: alert Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "alert" from PUBLIC;
GRANT ALL on "alert" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "alert" to "nobody";

--
-- TOC Entry ID 17 (OID 57697)
--
-- Name: seq_alert Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_alert" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 19 (OID 57697)
--
-- Name: seq_alert Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_alert" from PUBLIC;
GRANT ALL on "seq_alert" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_alert" to "nobody";

--
-- TOC Entry ID 316 (OID 57725)
--
-- Name: alert_type Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "alert_type" (
	"id" numeric(10,0) DEFAULT nextval('seq_alert_type'::text) NOT NULL,
	"event_type__id" numeric(10,0) NOT NULL,
	"usr__id" numeric(10,0) NOT NULL,
	"name" character varying(64) NOT NULL,
	"subject" character varying(128),
	"message" character varying(512),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	"del" numeric(1,0) DEFAULT 0 NOT NULL,
	CONSTRAINT "ck_alert_type__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	CONSTRAINT "ck_alert_type__del" CHECK (((del = '1'::"numeric") OR (del = '0'::"numeric"))),
	Constraint "pk_alert_type__id" Primary Key ("id")
);

--
-- TOC Entry ID 317 (OID 57725)
--
-- Name: alert_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "alert_type" from PUBLIC;
GRANT ALL on "alert_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "alert_type" to "nobody";

--
-- TOC Entry ID 318 (OID 57750)
--
-- Name: alert_type__grp__contact Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "alert_type__grp__contact" (
	"alert_type__id" numeric(10,0) NOT NULL,
	"contact__id" numeric(10,0) NOT NULL,
	"grp__id" numeric(10,0) NOT NULL,
	Constraint "pk_alert_type__grp__contact" Primary Key ("alert_type__id", "contact__id", "grp__id")
);

--
-- TOC Entry ID 319 (OID 57750)
--
-- Name: alert_type__grp__contact Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "alert_type__grp__contact" from PUBLIC;
GRANT ALL on "alert_type__grp__contact" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "alert_type__grp__contact" to "nobody";

--
-- TOC Entry ID 320 (OID 57765)
--
-- Name: alert_type__usr__contact Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "alert_type__usr__contact" (
	"alert_type__id" numeric(10,0) NOT NULL,
	"contact__id" numeric(10,0) NOT NULL,
	"usr__id" numeric(10,0) NOT NULL,
	Constraint "pk_alert_type__usr__contact" Primary Key ("alert_type__id", "usr__id", "contact__id")
);

--
-- TOC Entry ID 321 (OID 57765)
--
-- Name: alert_type__usr__contact Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "alert_type__usr__contact" from PUBLIC;
GRANT ALL on "alert_type__usr__contact" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "alert_type__usr__contact" to "nobody";

--
-- TOC Entry ID 20 (OID 57780)
--
-- Name: seq_alert_type Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_alert_type" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 22 (OID 57780)
--
-- Name: seq_alert_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_alert_type" from PUBLIC;
GRANT ALL on "seq_alert_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_alert_type" to "nobody";

--
-- TOC Entry ID 23 (OID 57829)
--
-- Name: seq_attr_grp Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_grp" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 25 (OID 57829)
--
-- Name: seq_attr_grp Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_grp" from PUBLIC;
GRANT ALL on "seq_attr_grp" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_grp" to "nobody";

--
-- TOC Entry ID 26 (OID 57848)
--
-- Name: seq_attr_grp_val Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_grp_val" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 28 (OID 57848)
--
-- Name: seq_attr_grp_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_grp_val" from PUBLIC;
GRANT ALL on "seq_attr_grp_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_grp_val" to "nobody";

--
-- TOC Entry ID 29 (OID 57867)
--
-- Name: seq_attr_grp_meta Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_grp_meta" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 31 (OID 57867)
--
-- Name: seq_attr_grp_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_grp_meta" from PUBLIC;
GRANT ALL on "seq_attr_grp_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_grp_meta" to "nobody";

--
-- TOC Entry ID 322 (OID 57886)
--
-- Name: attr_grp Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_grp" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_grp'::text) NOT NULL,
	"subsys" character varying(256) NOT NULL,
	"name" character varying(256) NOT NULL,
	"sql_type" character varying(30) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_grp__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_grp__id" Primary Key ("id")
);

--
-- TOC Entry ID 323 (OID 57886)
--
-- Name: attr_grp Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_grp" from PUBLIC;
GRANT ALL on "attr_grp" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_grp" to "nobody";

--
-- TOC Entry ID 324 (OID 57906)
--
-- Name: attr_grp_val Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_grp_val" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_grp_val'::text) NOT NULL,
	"object__id" numeric(10,0) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"serial" numeric(1,0) DEFAULT 0,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_grp_val__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_grp_val__id" Primary Key ("id")
);

--
-- TOC Entry ID 325 (OID 57906)
--
-- Name: attr_grp_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_grp_val" from PUBLIC;
GRANT ALL on "attr_grp_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_grp_val" to "nobody";

--
-- TOC Entry ID 326 (OID 57945)
--
-- Name: attr_grp_meta Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_grp_meta" (
	"id" numeric(10,0) DEFAULT nextval('seq_grp_meta'::text) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"name" character varying(256) NOT NULL,
	"value" character varying(2048),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_grp_meta__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_grp_meta__id" Primary Key ("id")
);

--
-- TOC Entry ID 327 (OID 57945)
--
-- Name: attr_grp_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_grp_meta" from PUBLIC;
GRANT ALL on "attr_grp_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_grp_meta" to "nobody";

--
-- TOC Entry ID 328 (OID 58007)
--
-- Name: grp_priv Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "grp_priv" (
	"id" numeric(10,0) DEFAULT nextval('seq_priv'::text) NOT NULL,
	"grp__id" numeric(10,0) NOT NULL,
	"value" numeric(3,0) NOT NULL,
	"mtime" timestamp with time zone DEFAULT "timestamp"('now'::text) NOT NULL,
	CONSTRAINT "ck_grp_priv__value" CHECK (((value >= '1'::"numeric") AND (value <= '255'::"numeric"))),
	Constraint "pk_grp_priv__id" Primary Key ("id")
);

--
-- TOC Entry ID 329 (OID 58007)
--
-- Name: grp_priv Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "grp_priv" from PUBLIC;
GRANT ALL on "grp_priv" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "grp_priv" to "nobody";

--
-- TOC Entry ID 330 (OID 58026)
--
-- Name: grp_priv__grp_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "grp_priv__grp_member" (
	"grp_priv__id" numeric(10,0) NOT NULL,
	"grp__id" numeric(10,0) NOT NULL,
	Constraint "pk_grp_priv__grp_member" Primary Key ("grp_priv__id", "grp__id")
);

--
-- TOC Entry ID 331 (OID 58026)
--
-- Name: grp_priv__grp_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "grp_priv__grp_member" from PUBLIC;
GRANT ALL on "grp_priv__grp_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "grp_priv__grp_member" to "nobody";

--
-- TOC Entry ID 32 (OID 58040)
--
-- Name: seq_priv Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_priv" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 34 (OID 58040)
--
-- Name: seq_priv Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_priv" from PUBLIC;
GRANT ALL on "seq_priv" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_priv" to "nobody";

--
-- TOC Entry ID 35 (OID 58068)
--
-- Name: seq_pref Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_pref" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 37 (OID 58068)
--
-- Name: seq_pref Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_pref" from PUBLIC;
GRANT ALL on "seq_pref" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_pref" to "nobody";

--
-- TOC Entry ID 38 (OID 58087)
--
-- Name: seq_pref_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_pref_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 40 (OID 58087)
--
-- Name: seq_pref_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_pref_member" from PUBLIC;
GRANT ALL on "seq_pref_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_pref_member" to "nobody";

--
-- TOC Entry ID 332 (OID 58106)
--
-- Name: pref Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "pref" (
	"id" numeric(10,0) DEFAULT nextval('seq_pref'::text) NOT NULL,
	"name" character varying(64) NOT NULL,
	"description" character varying(256),
	"value" character varying(256),
	"def" character varying(256),
	Constraint "pk_pref__id" Primary Key ("id")
);

--
-- TOC Entry ID 333 (OID 58106)
--
-- Name: pref Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "pref" from PUBLIC;
GRANT ALL on "pref" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "pref" to "nobody";

--
-- TOC Entry ID 334 (OID 58124)
--
-- Name: pref_opt Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "pref_opt" (
	"pref__id" numeric(10,0) NOT NULL,
	"value" character varying(256) NOT NULL,
	"description" character varying(256),
	Constraint "pk_pref_opt__pref__id__value" Primary Key ("pref__id", "value")
);

--
-- TOC Entry ID 335 (OID 58124)
--
-- Name: pref_opt Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "pref_opt" from PUBLIC;
GRANT ALL on "pref_opt" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "pref_opt" to "nobody";

--
-- TOC Entry ID 336 (OID 58139)
--
-- Name: pref_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "pref_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_pref_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_pref_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 337 (OID 58139)
--
-- Name: pref_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "pref_member" from PUBLIC;
GRANT ALL on "pref_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "pref_member" to "nobody";

--
-- TOC Entry ID 41 (OID 58167)
--
-- Name: seq_class Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_class" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 43 (OID 58167)
--
-- Name: seq_class Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_class" from PUBLIC;
GRANT ALL on "seq_class" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_class" to "nobody";

--
-- TOC Entry ID 338 (OID 58186)
--
-- Name: class Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "class" (
	"id" numeric(10,0) DEFAULT nextval('seq_class'::text) NOT NULL,
	"key_name" character varying(32) NOT NULL,
	"pkg_name" character varying(128) NOT NULL,
	"disp_name" character varying(128) NOT NULL,
	"plural_name" character varying(128) NOT NULL,
	"description" character varying(256),
	"distributor" numeric(1,0) DEFAULT 0 NOT NULL,
	CONSTRAINT "ck_class__key_name" CHECK ((lower((key_name)::text) = (key_name)::text)),
	CONSTRAINT "ck_class__distributor" CHECK (((distributor = '1'::"numeric") OR (distributor = '0'::"numeric"))),
	Constraint "pk_class__id" Primary Key ("id")
);

--
-- TOC Entry ID 339 (OID 58186)
--
-- Name: class Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "class" from PUBLIC;
GRANT ALL on "class" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "class" to "nobody";

--
-- TOC Entry ID 44 (OID 58218)
--
-- Name: seq_event_type Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_event_type" start 1 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 46 (OID 58218)
--
-- Name: seq_event_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_event_type" from PUBLIC;
GRANT ALL on "seq_event_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_event_type" to "nobody";

--
-- TOC Entry ID 47 (OID 58237)
--
-- Name: seq_event_type_attr Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_event_type_attr" start 1 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 49 (OID 58237)
--
-- Name: seq_event_type_attr Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_event_type_attr" from PUBLIC;
GRANT ALL on "seq_event_type_attr" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_event_type_attr" to "nobody";

--
-- TOC Entry ID 340 (OID 58256)
--
-- Name: event_type Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "event_type" (
	"id" numeric(10,0) DEFAULT nextval('seq_event_type'::text) NOT NULL,
	"key_name" character varying(64) NOT NULL,
	"name" character varying(64) NOT NULL,
	"description" character varying(256) NOT NULL,
	"class__id" numeric(10,0) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_event_type__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_event_type__id" Primary Key ("id")
);

--
-- TOC Entry ID 341 (OID 58256)
--
-- Name: event_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "event_type" from PUBLIC;
GRANT ALL on "event_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "event_type" to "nobody";

--
-- TOC Entry ID 342 (OID 58277)
--
-- Name: event_type_attr Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "event_type_attr" (
	"id" numeric(10,0) DEFAULT nextval('seq_event_type_attr'::text) NOT NULL,
	"event_type__id" numeric(10,0) NOT NULL,
	"name" character varying(64) NOT NULL,
	Constraint "pk_event_type_attr__id" Primary Key ("id")
);

--
-- TOC Entry ID 343 (OID 58277)
--
-- Name: event_type_attr Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "event_type_attr" from PUBLIC;
GRANT ALL on "event_type_attr" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "event_type_attr" to "nobody";

--
-- TOC Entry ID 50 (OID 58305)
--
-- Name: seq_event Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_event" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 52 (OID 58305)
--
-- Name: seq_event Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_event" from PUBLIC;
GRANT ALL on "seq_event" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_event" to "nobody";

--
-- TOC Entry ID 344 (OID 58324)
--
-- Name: event Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "event" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_person'::text) NOT NULL,
	"event_type__id" numeric(10,0) NOT NULL,
	"usr__id" numeric(10,0) NOT NULL,
	"obj_id" numeric(10,0) NOT NULL,
	"timestamp" timestamp with time zone DEFAULT "timestamp"('now'::text) NOT NULL,
	Constraint "pk_event__id" Primary Key ("id")
);

--
-- TOC Entry ID 345 (OID 58324)
--
-- Name: event Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "event" from PUBLIC;
GRANT ALL on "event" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "event" to "nobody";

--
-- TOC Entry ID 346 (OID 58343)
--
-- Name: event_attr Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "event_attr" (
	"event__id" numeric(10,0) NOT NULL,
	"event_type_attr__id" numeric(10,0) NOT NULL,
	"value" character varying(128)
);

--
-- TOC Entry ID 347 (OID 58343)
--
-- Name: event_attr Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "event_attr" from PUBLIC;
GRANT ALL on "event_attr" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "event_attr" to "nobody";

--
-- TOC Entry ID 53 (OID 58370)
--
-- Name: seq_contrib_type_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_contrib_type_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 55 (OID 58370)
--
-- Name: seq_contrib_type_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_contrib_type_member" from PUBLIC;
GRANT ALL on "seq_contrib_type_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_contrib_type_member" to "nobody";

--
-- TOC Entry ID 348 (OID 58389)
--
-- Name: contrib_type_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "contrib_type_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_contrib_type_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_contrib_type_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 349 (OID 58389)
--
-- Name: contrib_type_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "contrib_type_member" from PUBLIC;
GRANT ALL on "contrib_type_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "contrib_type_member" to "nobody";

--
-- TOC Entry ID 350 (OID 58411)
--
-- Name: alert_type_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "alert_type_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_alert_type_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_alert_type_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 351 (OID 58411)
--
-- Name: alert_type_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "alert_type_member" from PUBLIC;
GRANT ALL on "alert_type_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "alert_type_member" to "nobody";

--
-- TOC Entry ID 56 (OID 58427)
--
-- Name: seq_alert_type_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_alert_type_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 58 (OID 58427)
--
-- Name: seq_alert_type_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_alert_type_member" from PUBLIC;
GRANT ALL on "seq_alert_type_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_alert_type_member" to "nobody";

--
-- TOC Entry ID 352 (OID 58452)
--
-- Name: user_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "user_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_user_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_user_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 353 (OID 58452)
--
-- Name: user_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "user_member" from PUBLIC;
GRANT ALL on "user_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "user_member" to "nobody";

--
-- TOC Entry ID 59 (OID 58468)
--
-- Name: seq_user_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_user_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 61 (OID 58468)
--
-- Name: seq_user_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_user_member" from PUBLIC;
GRANT ALL on "seq_user_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_user_member" to "nobody";

--
-- TOC Entry ID 354 (OID 58493)
--
-- Name: source_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "source_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_source_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_source_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 355 (OID 58493)
--
-- Name: source_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "source_member" from PUBLIC;
GRANT ALL on "source_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "source_member" to "nobody";

--
-- TOC Entry ID 62 (OID 58509)
--
-- Name: seq_source_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_source_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 64 (OID 58509)
--
-- Name: seq_source_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_source_member" from PUBLIC;
GRANT ALL on "seq_source_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_source_member" to "nobody";

--
-- TOC Entry ID 356 (OID 58534)
--
-- Name: org_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "org_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_org_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_org_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 357 (OID 58534)
--
-- Name: org_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "org_member" from PUBLIC;
GRANT ALL on "org_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "org_member" to "nobody";

--
-- TOC Entry ID 65 (OID 58550)
--
-- Name: seq_org_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_org_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 67 (OID 58550)
--
-- Name: seq_org_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_org_member" from PUBLIC;
GRANT ALL on "seq_org_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_org_member" to "nobody";

--
-- TOC Entry ID 68 (OID 58575)
--
-- Name: seq_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 70 (OID 58575)
--
-- Name: seq_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_member" from PUBLIC;
GRANT ALL on "seq_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_member" to "nobody";

--
-- TOC Entry ID 358 (OID 58594)
--
-- Name: member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "member" (
	"id" numeric(10,0) DEFAULT nextval('seq_member'::text) NOT NULL,
	"grp__id" numeric(10,0) NOT NULL,
	"class__id" numeric(10,0) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_member__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 359 (OID 58594)
--
-- Name: member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "member" from PUBLIC;
GRANT ALL on "member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "member" to "nobody";

--
-- TOC Entry ID 360 (OID 58619)
--
-- Name: story_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "story_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_story_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_story_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 361 (OID 58619)
--
-- Name: story_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "story_member" from PUBLIC;
GRANT ALL on "story_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "story_member" to "nobody";

--
-- TOC Entry ID 71 (OID 58635)
--
-- Name: seq_story_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_story_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 73 (OID 58635)
--
-- Name: seq_story_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_story_member" from PUBLIC;
GRANT ALL on "seq_story_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_story_member" to "nobody";

--
-- TOC Entry ID 74 (OID 58660)
--
-- Name: seq_grp_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_grp_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 76 (OID 58660)
--
-- Name: seq_grp_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_grp_member" from PUBLIC;
GRANT ALL on "seq_grp_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_grp_member" to "nobody";

--
-- TOC Entry ID 362 (OID 58679)
--
-- Name: grp_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "grp_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_grp_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_grp_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 363 (OID 58679)
--
-- Name: grp_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "grp_member" from PUBLIC;
GRANT ALL on "grp_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "grp_member" to "nobody";

--
-- TOC Entry ID 77 (OID 58701)
--
-- Name: seq_attr_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 79 (OID 58701)
--
-- Name: seq_attr_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_member" from PUBLIC;
GRANT ALL on "seq_attr_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_member" to "nobody";

--
-- TOC Entry ID 80 (OID 58720)
--
-- Name: seq_attr_member_val Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_member_val" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 82 (OID 58720)
--
-- Name: seq_attr_member_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_member_val" from PUBLIC;
GRANT ALL on "seq_attr_member_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_member_val" to "nobody";

--
-- TOC Entry ID 83 (OID 58739)
--
-- Name: seq_attr_member_meta Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_member_meta" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 85 (OID 58739)
--
-- Name: seq_attr_member_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_member_meta" from PUBLIC;
GRANT ALL on "seq_attr_member_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_member_meta" to "nobody";

--
-- TOC Entry ID 364 (OID 58758)
--
-- Name: attr_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_member" (
	"id" numeric(10,0) NOT NULL,
	"subsys" character varying(256) NOT NULL,
	"name" character varying(256) NOT NULL,
	"sql_type" character varying(30) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_member__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 365 (OID 58758)
--
-- Name: attr_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_member" from PUBLIC;
GRANT ALL on "attr_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_member" to "nobody";

--
-- TOC Entry ID 366 (OID 58777)
--
-- Name: attr_member_val Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_member_val" (
	"id" numeric(10,0) NOT NULL,
	"object__id" numeric(10,0) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"serial" numeric(1,0) DEFAULT 0,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_member_val__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_member_val__id" Primary Key ("id")
);

--
-- TOC Entry ID 367 (OID 58777)
--
-- Name: attr_member_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_member_val" from PUBLIC;
GRANT ALL on "attr_member_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_member_val" to "nobody";

--
-- TOC Entry ID 368 (OID 58815)
--
-- Name: attr_member_meta Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_member_meta" (
	"id" numeric(10,0) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"name" character varying(256) NOT NULL,
	"value" character varying(2048),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_member_meta__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_member_meta__id" Primary Key ("id")
);

--
-- TOC Entry ID 369 (OID 58815)
--
-- Name: attr_member_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_member_meta" from PUBLIC;
GRANT ALL on "attr_member_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_member_meta" to "nobody";

--
-- TOC Entry ID 86 (OID 58876)
--
-- Name: seq_resource Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_resource" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 88 (OID 58876)
--
-- Name: seq_resource Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_resource" from PUBLIC;
GRANT ALL on "seq_resource" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_resource" to "nobody";

--
-- TOC Entry ID 370 (OID 58895)
--
-- Name: media__resource Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "media__resource" (
	"resource__id" numeric(10,0) NOT NULL,
	"media__id" numeric(10,0) NOT NULL,
	Constraint "pk_media__resource" Primary Key ("media__id", "resource__id")
);

--
-- TOC Entry ID 371 (OID 58895)
--
-- Name: media__resource Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "media__resource" from PUBLIC;
GRANT ALL on "media__resource" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "media__resource" to "nobody";

--
-- TOC Entry ID 372 (OID 58909)
--
-- Name: resource Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "resource" (
	"id" numeric(10,0) DEFAULT nextval('seq_resource'::text) NOT NULL,
	"parent_id" numeric(10,0),
	"media_type__id" numeric(10,0) NOT NULL,
	"path" character varying(256) NOT NULL,
	"uri" character varying(256) NOT NULL,
	"size" numeric(10,0) NOT NULL,
	"mod_time" timestamp with time zone NOT NULL,
	"is_dir" numeric(1,0) NOT NULL,
	Constraint "pk_resource__id" Primary Key ("id")
);

--
-- TOC Entry ID 373 (OID 58909)
--
-- Name: resource Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "resource" from PUBLIC;
GRANT ALL on "resource" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "resource" to "nobody";

--
-- TOC Entry ID 374 (OID 58930)
--
-- Name: story__resource Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "story__resource" (
	"story__id" numeric(10,0) NOT NULL,
	"resource__id" numeric(10,0) NOT NULL,
	Constraint "pk_story__resource" Primary Key ("story__id", "resource__id")
);

--
-- TOC Entry ID 375 (OID 58930)
--
-- Name: story__resource Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "story__resource" from PUBLIC;
GRANT ALL on "story__resource" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "story__resource" to "nobody";

--
-- TOC Entry ID 376 (OID 58971)
--
-- Name: server Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "server" (
	"id" numeric(10,0) DEFAULT nextval('seq_server'::text) NOT NULL,
	"server_type__id" numeric(10,0) NOT NULL,
	"host_name" character varying(128) NOT NULL,
	"os" character(5) NOT NULL,
	"doc_root" character varying(128) NOT NULL,
	"login" character varying(64),
	"password" character varying(64),
	"cookie" character varying(512),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_server__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_server__id" Primary Key ("id")
);

--
-- TOC Entry ID 377 (OID 58971)
--
-- Name: server Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "server" from PUBLIC;
GRANT ALL on "server" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "server" to "nobody";

--
-- TOC Entry ID 89 (OID 58995)
--
-- Name: seq_server Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_server" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 91 (OID 58995)
--
-- Name: seq_server Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_server" from PUBLIC;
GRANT ALL on "seq_server" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_server" to "nobody";

--
-- TOC Entry ID 92 (OID 59023)
--
-- Name: seq_action_type Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_action_type" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 94 (OID 59023)
--
-- Name: seq_action_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_action_type" from PUBLIC;
GRANT ALL on "seq_action_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_action_type" to "nobody";

--
-- TOC Entry ID 378 (OID 59042)
--
-- Name: action_type Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "action_type" (
	"id" numeric(10,0) DEFAULT nextval('seq_action_type'::text) NOT NULL,
	"name" character varying(64) NOT NULL,
	"description" character varying(256),
	"active" numeric(1,0) DEFAULT 0 NOT NULL,
	CONSTRAINT "ck_action_type__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_action_type__id" Primary Key ("id")
);

--
-- TOC Entry ID 379 (OID 59042)
--
-- Name: action_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "action_type" from PUBLIC;
GRANT ALL on "action_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "action_type" to "nobody";

--
-- TOC Entry ID 380 (OID 59061)
--
-- Name: action_type__media_type Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "action_type__media_type" (
	"action_type__id" numeric(10,0) NOT NULL,
	"media_type__id" numeric(10,0) NOT NULL,
	Constraint "pk_action__media_type" Primary Key ("action_type__id", "media_type__id")
);

--
-- TOC Entry ID 381 (OID 59061)
--
-- Name: action_type__media_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "action_type__media_type" from PUBLIC;
GRANT ALL on "action_type__media_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "action_type__media_type" to "nobody";

--
-- TOC Entry ID 95 (OID 59084)
--
-- Name: seq_job Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_job" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 97 (OID 59084)
--
-- Name: seq_job Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_job" from PUBLIC;
GRANT ALL on "seq_job" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_job" to "nobody";

--
-- TOC Entry ID 98 (OID 59103)
--
-- Name: seq_job_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_job_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 100 (OID 59103)
--
-- Name: seq_job_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_job_member" from PUBLIC;
GRANT ALL on "seq_job_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_job_member" to "nobody";

--
-- TOC Entry ID 382 (OID 59122)
--
-- Name: job Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "job" (
	"id" numeric(10,0) DEFAULT nextval('seq_job'::text) NOT NULL,
	"name" character varying(64) NOT NULL,
	"usr__id" numeric(10,0) NOT NULL,
	"sched_time" timestamp with time zone DEFAULT "timestamp"('now'::text) NOT NULL,
	"comp_time" timestamp with time zone,
	"expire" numeric(1,0) DEFAULT 0 NOT NULL,
	"tries" numeric(2,0) DEFAULT 0 NOT NULL,
	"pending" numeric(1,0) DEFAULT 0 NOT NULL,
	CONSTRAINT "ck_job__expire" CHECK (((expire = '1'::"numeric") OR (expire = '0'::"numeric"))),
	CONSTRAINT "ck_job__tries" CHECK (((tries >= '0'::"numeric") AND (tries <= '10'::"numeric"))),
	CONSTRAINT "ck_job__pending" CHECK (((pending = '1'::"numeric") OR (pending = '0'::"numeric"))),
	Constraint "pk_job__id" Primary Key ("id")
);

--
-- TOC Entry ID 383 (OID 59122)
--
-- Name: job Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "job" from PUBLIC;
GRANT ALL on "job" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "job" to "nobody";

--
-- TOC Entry ID 384 (OID 59150)
--
-- Name: job__resource Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "job__resource" (
	"job__id" numeric(10,0) NOT NULL,
	"resource__id" numeric(10,0) NOT NULL,
	Constraint "pk_job__resource" Primary Key ("job__id", "resource__id")
);

--
-- TOC Entry ID 385 (OID 59150)
--
-- Name: job__resource Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "job__resource" from PUBLIC;
GRANT ALL on "job__resource" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "job__resource" to "nobody";

--
-- TOC Entry ID 386 (OID 59164)
--
-- Name: job__server_type Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "job__server_type" (
	"job__id" numeric(10,0) NOT NULL,
	"server_type__id" numeric(10,0) NOT NULL,
	Constraint "pk_job__server_type" Primary Key ("job__id", "server_type__id")
);

--
-- TOC Entry ID 387 (OID 59164)
--
-- Name: job__server_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "job__server_type" from PUBLIC;
GRANT ALL on "job__server_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "job__server_type" to "nobody";

--
-- TOC Entry ID 388 (OID 59178)
--
-- Name: job_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "job_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_job_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_job_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 389 (OID 59178)
--
-- Name: job_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "job_member" from PUBLIC;
GRANT ALL on "job_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "job_member" to "nobody";

--
-- TOC Entry ID 101 (OID 59224)
--
-- Name: seq_action Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_action" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 103 (OID 59224)
--
-- Name: seq_action Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_action" from PUBLIC;
GRANT ALL on "seq_action" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_action" to "nobody";

--
-- TOC Entry ID 104 (OID 59243)
--
-- Name: seq_attr_action Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_action" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 106 (OID 59243)
--
-- Name: seq_attr_action Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_action" from PUBLIC;
GRANT ALL on "seq_attr_action" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_action" to "nobody";

--
-- TOC Entry ID 107 (OID 59262)
--
-- Name: seq_attr_action_val Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_action_val" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 109 (OID 59262)
--
-- Name: seq_attr_action_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_action_val" from PUBLIC;
GRANT ALL on "seq_attr_action_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_action_val" to "nobody";

--
-- TOC Entry ID 110 (OID 59281)
--
-- Name: seq_attr_action_meta Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_action_meta" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 112 (OID 59281)
--
-- Name: seq_attr_action_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_action_meta" from PUBLIC;
GRANT ALL on "seq_attr_action_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_action_meta" to "nobody";

--
-- TOC Entry ID 390 (OID 59300)
--
-- Name: action Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "action" (
	"id" numeric(10,0) DEFAULT nextval('seq_action'::text) NOT NULL,
	"ord" numeric(3,0) NOT NULL,
	"server_type__id" numeric(10,0) NOT NULL,
	"action_type__id" numeric(10,0) NOT NULL,
	Constraint "pk_action__id" Primary Key ("id")
);

--
-- TOC Entry ID 391 (OID 59300)
--
-- Name: action Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "action" from PUBLIC;
GRANT ALL on "action" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "action" to "nobody";

--
-- TOC Entry ID 392 (OID 59317)
--
-- Name: attr_action Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_action" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_action'::text) NOT NULL,
	"subsys" character varying(256) NOT NULL,
	"name" character varying(256) NOT NULL,
	"sql_type" character varying(30) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_action__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_action__id" Primary Key ("id")
);

--
-- TOC Entry ID 393 (OID 59317)
--
-- Name: attr_action Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_action" from PUBLIC;
GRANT ALL on "attr_action" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_action" to "nobody";

--
-- TOC Entry ID 394 (OID 59337)
--
-- Name: attr_action_val Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_action_val" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_action_val'::text) NOT NULL,
	"object__id" numeric(10,0) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"serial" numeric(1,0) DEFAULT 0,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_action_val__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_action_val__id" Primary Key ("id")
);

--
-- TOC Entry ID 395 (OID 59337)
--
-- Name: attr_action_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_action_val" from PUBLIC;
GRANT ALL on "attr_action_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_action_val" to "nobody";

--
-- TOC Entry ID 396 (OID 59376)
--
-- Name: attr_action_meta Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_action_meta" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_action_meta'::text) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"name" character varying(256) NOT NULL,
	"value" character varying(2048),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_action_meta__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_action_meta__id" Primary Key ("id")
);

--
-- TOC Entry ID 397 (OID 59376)
--
-- Name: attr_action_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_action_meta" from PUBLIC;
GRANT ALL on "attr_action_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_action_meta" to "nobody";

--
-- TOC Entry ID 398 (OID 59444)
--
-- Name: server_type Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "server_type" (
	"id" numeric(10,0) DEFAULT nextval('seq_server_type'::text) NOT NULL,
	"class__id" numeric(10,0) NOT NULL,
	"name" character varying(64) NOT NULL,
	"description" character varying(256),
	"copyable" numeric(1,0) DEFAULT 0 NOT NULL,
	"publish" numeric(1,0) DEFAULT 1 NOT NULL,
	"preview" numeric(1,0) DEFAULT 0 NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_server_type__copyable" CHECK (((copyable = '1'::"numeric") OR (copyable = '0'::"numeric"))),
	CONSTRAINT "ck_server_type__publish" CHECK (((publish = '1'::"numeric") OR (publish = '0'::"numeric"))),
	CONSTRAINT "ck_server_type__preview" CHECK (((preview = '1'::"numeric") OR (preview = '0'::"numeric"))),
	CONSTRAINT "ck_server_type__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_server_type__id" Primary Key ("id")
);

--
-- TOC Entry ID 399 (OID 59444)
--
-- Name: server_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "server_type" from PUBLIC;
GRANT ALL on "server_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "server_type" to "nobody";

--
-- TOC Entry ID 400 (OID 59473)
--
-- Name: server_type__output_channel Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "server_type__output_channel" (
	"server_type__id" numeric(10,0) NOT NULL,
	"output_channel__id" numeric(10,0) NOT NULL,
	Constraint "pk_server_type__output_channel" Primary Key ("server_type__id", "output_channel__id")
);

--
-- TOC Entry ID 401 (OID 59473)
--
-- Name: server_type__output_channel Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "server_type__output_channel" from PUBLIC;
GRANT ALL on "server_type__output_channel" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "server_type__output_channel" to "nobody";

--
-- TOC Entry ID 402 (OID 59487)
--
-- Name: dest_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "dest_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_dest_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_dest_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 403 (OID 59487)
--
-- Name: dest_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "dest_member" from PUBLIC;
GRANT ALL on "dest_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "dest_member" to "nobody";

--
-- TOC Entry ID 113 (OID 59503)
--
-- Name: seq_server_type Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_server_type" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 115 (OID 59503)
--
-- Name: seq_server_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_server_type" from PUBLIC;
GRANT ALL on "seq_server_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_server_type" to "nobody";

--
-- TOC Entry ID 116 (OID 59522)
--
-- Name: seq_dest_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_dest_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 118 (OID 59522)
--
-- Name: seq_dest_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_dest_member" from PUBLIC;
GRANT ALL on "seq_dest_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_dest_member" to "nobody";

--
-- TOC Entry ID 119 (OID 59559)
--
-- Name: seq_at_data Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_at_data" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 121 (OID 59559)
--
-- Name: seq_at_data Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_at_data" from PUBLIC;
GRANT ALL on "seq_at_data" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_at_data" to "nobody";

--
-- TOC Entry ID 122 (OID 59578)
--
-- Name: seq_attr_at_data Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_at_data" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 124 (OID 59578)
--
-- Name: seq_attr_at_data Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_at_data" from PUBLIC;
GRANT ALL on "seq_attr_at_data" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_at_data" to "nobody";

--
-- TOC Entry ID 125 (OID 59597)
--
-- Name: seq_attr_at_data_val Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_at_data_val" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 127 (OID 59597)
--
-- Name: seq_attr_at_data_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_at_data_val" from PUBLIC;
GRANT ALL on "seq_attr_at_data_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_at_data_val" to "nobody";

--
-- TOC Entry ID 128 (OID 59616)
--
-- Name: seq_attr_at_data_meta Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_at_data_meta" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 130 (OID 59616)
--
-- Name: seq_attr_at_data_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_at_data_meta" from PUBLIC;
GRANT ALL on "seq_attr_at_data_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_at_data_meta" to "nobody";

--
-- TOC Entry ID 404 (OID 59635)
--
-- Name: at_data Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "at_data" (
	"id" numeric(10,0) DEFAULT nextval('seq_element'::text) NOT NULL,
	"element__id" numeric(10,0) NOT NULL,
	"name" character varying(32),
	"description" character varying(256),
	"place" numeric(10,0) NOT NULL,
	"required" numeric(1,0) DEFAULT 0 NOT NULL,
	"quantifier" character varying(2),
	"autopopulated" numeric(1,0) DEFAULT 0 NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	"map_type__id" numeric(10,0),
	"publishable" numeric(1,0) DEFAULT 0 NOT NULL,
	"max_length" numeric(10,0),
	"sql_type" character varying(30),
	CONSTRAINT "ck_at_data__required" CHECK (((required = '0'::"numeric") OR (required = '1'::"numeric"))),
	CONSTRAINT "ck_at_data__autopopulated" CHECK (((autopopulated = '0'::"numeric") OR (autopopulated = '1'::"numeric"))),
	CONSTRAINT "ck_at_data__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	CONSTRAINT "ck_at_data__publishable" CHECK (((publishable = '0'::"numeric") OR (publishable = '1'::"numeric"))),
	Constraint "pk_at_data__id" Primary Key ("id")
);

--
-- TOC Entry ID 405 (OID 59635)
--
-- Name: at_data Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "at_data" from PUBLIC;
GRANT ALL on "at_data" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "at_data" to "nobody";

--
-- TOC Entry ID 406 (OID 59669)
--
-- Name: attr_at_data Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_at_data" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_at_data'::text) NOT NULL,
	"subsys" character varying(256) NOT NULL,
	"name" character varying(256) NOT NULL,
	"sql_type" character varying(30) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_at_data__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_at_data__id" Primary Key ("id")
);

--
-- TOC Entry ID 407 (OID 59669)
--
-- Name: attr_at_data Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_at_data" from PUBLIC;
GRANT ALL on "attr_at_data" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_at_data" to "nobody";

--
-- TOC Entry ID 408 (OID 59689)
--
-- Name: attr_at_data_val Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_at_data_val" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_at_data_val'::text) NOT NULL,
	"object__id" numeric(10,0) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"serial" numeric(1,0) DEFAULT 0,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_at_data_val__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_at_data_val__id" Primary Key ("id")
);

--
-- TOC Entry ID 409 (OID 59689)
--
-- Name: attr_at_data_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_at_data_val" from PUBLIC;
GRANT ALL on "attr_at_data_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_at_data_val" to "nobody";

--
-- TOC Entry ID 410 (OID 59728)
--
-- Name: attr_at_data_meta Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_at_data_meta" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_at_data_meta'::text) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"name" character varying(256) NOT NULL,
	"value" character varying(2048),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_at_data_meta__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_at_data_meta__id" Primary Key ("id")
);

--
-- TOC Entry ID 411 (OID 59728)
--
-- Name: attr_at_data_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_at_data_meta" from PUBLIC;
GRANT ALL on "attr_at_data_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_at_data_meta" to "nobody";

--
-- TOC Entry ID 131 (OID 59799)
--
-- Name: seq_element Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_element" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 133 (OID 59799)
--
-- Name: seq_element Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_element" from PUBLIC;
GRANT ALL on "seq_element" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_element" to "nobody";

--
-- TOC Entry ID 134 (OID 59818)
--
-- Name: seq_element__output_channel Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_element__output_channel" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 136 (OID 59818)
--
-- Name: seq_element__output_channel Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_element__output_channel" from PUBLIC;
GRANT ALL on "seq_element__output_channel" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_element__output_channel" to "nobody";

--
-- TOC Entry ID 137 (OID 59837)
--
-- Name: seq_element_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_element_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 139 (OID 59837)
--
-- Name: seq_element_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_element_member" from PUBLIC;
GRANT ALL on "seq_element_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_element_member" to "nobody";

--
-- TOC Entry ID 140 (OID 59856)
--
-- Name: seq_attr_element Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_element" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 142 (OID 59856)
--
-- Name: seq_attr_element Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_element" from PUBLIC;
GRANT ALL on "seq_attr_element" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_element" to "nobody";

--
-- TOC Entry ID 143 (OID 59875)
--
-- Name: seq_attr_element_val Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_element_val" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 145 (OID 59875)
--
-- Name: seq_attr_element_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_element_val" from PUBLIC;
GRANT ALL on "seq_attr_element_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_element_val" to "nobody";

--
-- TOC Entry ID 146 (OID 59894)
--
-- Name: seq_attr_element_meta Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_element_meta" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 148 (OID 59894)
--
-- Name: seq_attr_element_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_element_meta" from PUBLIC;
GRANT ALL on "seq_attr_element_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_element_meta" to "nobody";

--
-- TOC Entry ID 412 (OID 59913)
--
-- Name: element Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "element" (
	"id" numeric(10,0) DEFAULT nextval('seq_element'::text) NOT NULL,
	"name" character varying(64) NOT NULL,
	"description" character varying(256),
	"burner" integer DEFAULT 1 NOT NULL,
	"reference" numeric(1,0) DEFAULT 0 NOT NULL,
	"type__id" numeric(10,0) NOT NULL,
	"at_grp__id" numeric(10,0),
	"primary_oc__id" numeric(10,0),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_element__reference" CHECK (((reference = '0'::"numeric") OR (reference = '1'::"numeric"))),
	CONSTRAINT "ck_element__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_element__id" Primary Key ("id")
);

--
-- TOC Entry ID 413 (OID 59913)
--
-- Name: element Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "element" from PUBLIC;
GRANT ALL on "element" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "element" to "nobody";

--
-- TOC Entry ID 414 (OID 59940)
--
-- Name: element__output_channel Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "element__output_channel" (
	"id" numeric(10,0) DEFAULT nextval('seq_element__output_channel'::text) NOT NULL,
	"element__id" numeric(10,0) NOT NULL,
	"output_channel__id" numeric(10,0) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_at__oc__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_at__oc__id" Primary Key ("id")
);

--
-- TOC Entry ID 415 (OID 59940)
--
-- Name: element__output_channel Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "element__output_channel" from PUBLIC;
GRANT ALL on "element__output_channel" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "element__output_channel" to "nobody";

--
-- TOC Entry ID 416 (OID 59959)
--
-- Name: element_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "element_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_element_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_element_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 417 (OID 59959)
--
-- Name: element_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "element_member" from PUBLIC;
GRANT ALL on "element_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "element_member" to "nobody";

--
-- TOC Entry ID 418 (OID 59975)
--
-- Name: attr_element Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_element" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_element'::text) NOT NULL,
	"subsys" character varying(256) NOT NULL,
	"name" character varying(256) NOT NULL,
	"sql_type" character varying(30) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_element__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_element__id" Primary Key ("id")
);

--
-- TOC Entry ID 419 (OID 59975)
--
-- Name: attr_element Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_element" from PUBLIC;
GRANT ALL on "attr_element" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_element" to "nobody";

--
-- TOC Entry ID 420 (OID 59995)
--
-- Name: attr_element_val Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_element_val" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_element_val'::text) NOT NULL,
	"object__id" numeric(10,0) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"serial" numeric(1,0) DEFAULT 0,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_element_val__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_element_val__id" Primary Key ("id")
);

--
-- TOC Entry ID 421 (OID 59995)
--
-- Name: attr_element_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_element_val" from PUBLIC;
GRANT ALL on "attr_element_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_element_val" to "nobody";

--
-- TOC Entry ID 422 (OID 60034)
--
-- Name: attr_element_meta Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_element_meta" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_element_meta'::text) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"name" character varying(256) NOT NULL,
	"value" character varying(2048),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_element_meta__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_element_meta__id" Primary Key ("id")
);

--
-- TOC Entry ID 423 (OID 60034)
--
-- Name: attr_element_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_element_meta" from PUBLIC;
GRANT ALL on "attr_element_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_element_meta" to "nobody";

--
-- TOC Entry ID 149 (OID 60123)
--
-- Name: seq_at_type Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_at_type" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 151 (OID 60123)
--
-- Name: seq_at_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_at_type" from PUBLIC;
GRANT ALL on "seq_at_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_at_type" to "nobody";

--
-- TOC Entry ID 152 (OID 60142)
--
-- Name: seq_element_type_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_element_type_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 154 (OID 60142)
--
-- Name: seq_element_type_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_element_type_member" from PUBLIC;
GRANT ALL on "seq_element_type_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_element_type_member" to "nobody";

--
-- TOC Entry ID 424 (OID 60161)
--
-- Name: at_type Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "at_type" (
	"id" numeric(10,0) DEFAULT nextval('seq_at_type'::text) NOT NULL,
	"name" character varying(64) NOT NULL,
	"description" character varying(256),
	"top_level" numeric(1,0) DEFAULT 0 NOT NULL,
	"paginated" numeric(1,0) DEFAULT 0 NOT NULL,
	"fixed_url" numeric(1,0) DEFAULT 0 NOT NULL,
	"related_story" numeric(1,0) DEFAULT 0 NOT NULL,
	"related_media" numeric(1,0) DEFAULT 0 NOT NULL,
	"media" numeric(1,0) DEFAULT 0 NOT NULL,
	"biz_class__id" numeric(10,0) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_at_type__top_level" CHECK (((top_level = '0'::"numeric") OR (top_level = '1'::"numeric"))),
	CONSTRAINT "ck_at_type__paginated" CHECK (((paginated = '0'::"numeric") OR (paginated = '1'::"numeric"))),
	CONSTRAINT "ck_at_type__fixed_url" CHECK (((fixed_url = '0'::"numeric") OR (fixed_url = '1'::"numeric"))),
	CONSTRAINT "ck_at_type__related_story" CHECK (((related_story = '0'::"numeric") OR (related_story = '1'::"numeric"))),
	CONSTRAINT "ck_at_type__related_media" CHECK (((related_media = '0'::"numeric") OR (related_media = '1'::"numeric"))),
	CONSTRAINT "ck_at_type__media" CHECK (((media = '0'::"numeric") OR (media = '1'::"numeric"))),
	CONSTRAINT "ck_at_type__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_at_type__id" Primary Key ("id")
);

--
-- TOC Entry ID 425 (OID 60161)
--
-- Name: at_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "at_type" from PUBLIC;
GRANT ALL on "at_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "at_type" to "nobody";

--
-- TOC Entry ID 426 (OID 60199)
--
-- Name: element_type_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "element_type_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_element_type_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_element_type_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 427 (OID 60199)
--
-- Name: element_type_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "element_type_member" from PUBLIC;
GRANT ALL on "element_type_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "element_type_member" to "nobody";

--
-- TOC Entry ID 428 (OID 60227)
--
-- Name: contact Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "contact" (
	"id" numeric(10,0) DEFAULT nextval('seq_contact'::text) NOT NULL,
	"type" character varying(64) NOT NULL,
	"description" character varying(256),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	"alertable" numeric(1,0) DEFAULT 0 NOT NULL,
	CONSTRAINT "ck_contact__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	CONSTRAINT "ck_contact__alertable" CHECK (((alertable = '1'::"numeric") OR (alertable = '0'::"numeric"))),
	Constraint "pk_contact__id" Primary Key ("id")
);

--
-- TOC Entry ID 429 (OID 60227)
--
-- Name: contact Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "contact" from PUBLIC;
GRANT ALL on "contact" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "contact" to "nobody";

--
-- TOC Entry ID 430 (OID 60249)
--
-- Name: contact_value Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "contact_value" (
	"id" numeric(10,0) DEFAULT nextval('seq_contact_value'::text) NOT NULL,
	"contact__id" numeric(10,0) NOT NULL,
	"value" character varying(256) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_contact_value__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_contact_value__id" Primary Key ("id")
);

--
-- TOC Entry ID 431 (OID 60249)
--
-- Name: contact_value Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "contact_value" from PUBLIC;
GRANT ALL on "contact_value" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "contact_value" to "nobody";

--
-- TOC Entry ID 432 (OID 60268)
--
-- Name: person__contact_value Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "person__contact_value" (
	"person__id" numeric(10,0) NOT NULL,
	"contact_value__id" numeric(10,0) NOT NULL,
	Constraint "pk_person__contact_value" Primary Key ("person__id", "contact_value__id")
);

--
-- TOC Entry ID 433 (OID 60268)
--
-- Name: person__contact_value Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "person__contact_value" from PUBLIC;
GRANT ALL on "person__contact_value" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "person__contact_value" to "nobody";

--
-- TOC Entry ID 155 (OID 60297)
--
-- Name: seq_contact Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_contact" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 157 (OID 60297)
--
-- Name: seq_contact Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_contact" from PUBLIC;
GRANT ALL on "seq_contact" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_contact" to "nobody";

--
-- TOC Entry ID 158 (OID 60316)
--
-- Name: seq_contact_value Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_contact_value" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 160 (OID 60316)
--
-- Name: seq_contact_value Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_contact_value" from PUBLIC;
GRANT ALL on "seq_contact_value" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_contact_value" to "nobody";

--
-- TOC Entry ID 434 (OID 60335)
--
-- Name: person Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "person" (
	"id" numeric(10,0) DEFAULT nextval('seq_person'::text) NOT NULL,
	"prefix" character varying(32),
	"lname" character varying(64),
	"fname" character varying(64),
	"mname" character varying(64),
	"suffix" character varying(32),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_person__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_person__id" Primary Key ("id")
);

--
-- TOC Entry ID 435 (OID 60335)
--
-- Name: person Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "person" from PUBLIC;
GRANT ALL on "person" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "person" to "nobody";

--
-- TOC Entry ID 436 (OID 60357)
--
-- Name: person_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "person_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_person_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_person_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 437 (OID 60357)
--
-- Name: person_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "person_member" from PUBLIC;
GRANT ALL on "person_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "person_member" to "nobody";

--
-- TOC Entry ID 161 (OID 60388)
--
-- Name: seq_person Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_person" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 163 (OID 60388)
--
-- Name: seq_person Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_person" from PUBLIC;
GRANT ALL on "seq_person" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_person" to "nobody";

--
-- TOC Entry ID 164 (OID 60407)
--
-- Name: seq_person_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_person_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 166 (OID 60407)
--
-- Name: seq_person_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_person_member" from PUBLIC;
GRANT ALL on "seq_person_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_person_member" to "nobody";

--
-- TOC Entry ID 167 (OID 60426)
--
-- Name: seq_category Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_category" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 169 (OID 60426)
--
-- Name: seq_category Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_category" from PUBLIC;
GRANT ALL on "seq_category" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_category" to "nobody";

--
-- TOC Entry ID 170 (OID 60445)
--
-- Name: seq_category_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_category_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 172 (OID 60445)
--
-- Name: seq_category_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_category_member" from PUBLIC;
GRANT ALL on "seq_category_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_category_member" to "nobody";

--
-- TOC Entry ID 173 (OID 60464)
--
-- Name: seq_attr_category Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_category" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 175 (OID 60464)
--
-- Name: seq_attr_category Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_category" from PUBLIC;
GRANT ALL on "seq_attr_category" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_category" to "nobody";

--
-- TOC Entry ID 176 (OID 60483)
--
-- Name: seq_attr_category_val Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_category_val" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 178 (OID 60483)
--
-- Name: seq_attr_category_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_category_val" from PUBLIC;
GRANT ALL on "seq_attr_category_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_category_val" to "nobody";

--
-- TOC Entry ID 179 (OID 60502)
--
-- Name: seq_attr_category_meta Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_category_meta" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 181 (OID 60502)
--
-- Name: seq_attr_category_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_category_meta" from PUBLIC;
GRANT ALL on "seq_attr_category_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_category_meta" to "nobody";

--
-- TOC Entry ID 438 (OID 60521)
--
-- Name: category Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "category" (
	"id" numeric(10,0) DEFAULT nextval('seq_category'::text) NOT NULL,
	"directory" character varying(128) NOT NULL,
	"category_grp_id" numeric(10,0),
	"keyword_grp_id" numeric(10,0),
	"asset_grp_id" numeric(10,0),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_category__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_category__id" Primary Key ("id")
);

--
-- TOC Entry ID 439 (OID 60521)
--
-- Name: category Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "category" from PUBLIC;
GRANT ALL on "category" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "category" to "nobody";

--
-- TOC Entry ID 440 (OID 60542)
--
-- Name: category_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "category_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_category_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_category_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 441 (OID 60542)
--
-- Name: category_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "category_member" from PUBLIC;
GRANT ALL on "category_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "category_member" to "nobody";

--
-- TOC Entry ID 442 (OID 60558)
--
-- Name: attr_category Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_category" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_category'::text) NOT NULL,
	"subsys" character varying(256) NOT NULL,
	"name" character varying(256) NOT NULL,
	"sql_type" character varying(30) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_category__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_category__id" Primary Key ("id")
);

--
-- TOC Entry ID 443 (OID 60558)
--
-- Name: attr_category Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_category" from PUBLIC;
GRANT ALL on "attr_category" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_category" to "nobody";

--
-- TOC Entry ID 444 (OID 60578)
--
-- Name: attr_category_val Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_category_val" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_category_val'::text) NOT NULL,
	"object__id" numeric(10,0) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"serial" numeric(1,0) DEFAULT 0,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_category_val__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_category_val__id" Primary Key ("id")
);

--
-- TOC Entry ID 445 (OID 60578)
--
-- Name: attr_category_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_category_val" from PUBLIC;
GRANT ALL on "attr_category_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_category_val" to "nobody";

--
-- TOC Entry ID 446 (OID 60617)
--
-- Name: attr_category_meta Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_category_meta" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_category_meta'::text) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"name" character varying(256) NOT NULL,
	"value" character varying(2048),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_category_meta__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_category_meta__id" Primary Key ("id")
);

--
-- TOC Entry ID 447 (OID 60617)
--
-- Name: attr_category_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_category_meta" from PUBLIC;
GRANT ALL on "attr_category_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_category_meta" to "nobody";

--
-- TOC Entry ID 182 (OID 60697)
--
-- Name: seq_keyword Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_keyword" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 184 (OID 60697)
--
-- Name: seq_keyword Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_keyword" from PUBLIC;
GRANT ALL on "seq_keyword" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_keyword" to "nobody";

--
-- TOC Entry ID 185 (OID 60716)
--
-- Name: seq_keyword_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_keyword_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 187 (OID 60716)
--
-- Name: seq_keyword_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_keyword_member" from PUBLIC;
GRANT ALL on "seq_keyword_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_keyword_member" to "nobody";

--
-- TOC Entry ID 448 (OID 60735)
--
-- Name: keyword Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "keyword" (
	"id" numeric(10,0) DEFAULT nextval('seq_keyword'::text) NOT NULL,
	"name" character varying(256) NOT NULL,
	"screen_name" character varying(256) NOT NULL,
	"sort_name" character varying(256) NOT NULL,
	"meaning" character varying(512),
	"prefered" numeric(1,0) DEFAULT 1 NOT NULL,
	"synonym_grp_id" numeric(10,0),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_keyword__prefered" CHECK (((prefered = '0'::"numeric") OR (prefered = '1'::"numeric"))),
	CONSTRAINT "ck_keyword__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_keyword__id" Primary Key ("id")
);

--
-- TOC Entry ID 449 (OID 60735)
--
-- Name: keyword Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "keyword" from PUBLIC;
GRANT ALL on "keyword" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "keyword" to "nobody";

--
-- TOC Entry ID 450 (OID 60760)
--
-- Name: keyword_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "keyword_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_keyword_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_keyword_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 451 (OID 60760)
--
-- Name: keyword_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "keyword_member" from PUBLIC;
GRANT ALL on "keyword_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "keyword_member" to "nobody";

--
-- TOC Entry ID 188 (OID 60794)
--
-- Name: seq_workflow Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_workflow" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 190 (OID 60794)
--
-- Name: seq_workflow Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_workflow" from PUBLIC;
GRANT ALL on "seq_workflow" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_workflow" to "nobody";

--
-- TOC Entry ID 191 (OID 60813)
--
-- Name: seq_workflow_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_workflow_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 193 (OID 60813)
--
-- Name: seq_workflow_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_workflow_member" from PUBLIC;
GRANT ALL on "seq_workflow_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_workflow_member" to "nobody";

--
-- TOC Entry ID 452 (OID 60832)
--
-- Name: workflow Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "workflow" (
	"id" numeric(10,0) DEFAULT nextval('seq_workflow'::text) NOT NULL,
	"name" character varying(64) NOT NULL,
	"description" character varying(256) NOT NULL,
	"all_desk_grp_id" numeric(10,0) NOT NULL,
	"req_desk_grp_id" numeric(10,0) NOT NULL,
	"head_desk_id" numeric(10,0) NOT NULL,
	"type" numeric(1,0) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_workflow__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_workflow__id" Primary Key ("id")
);

--
-- TOC Entry ID 453 (OID 60832)
--
-- Name: workflow Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "workflow" from PUBLIC;
GRANT ALL on "workflow" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "workflow" to "nobody";

--
-- TOC Entry ID 454 (OID 60855)
--
-- Name: workflow_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "workflow_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_workflow_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_workflow_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 455 (OID 60855)
--
-- Name: workflow_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "workflow_member" from PUBLIC;
GRANT ALL on "workflow_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "workflow_member" to "nobody";

--
-- TOC Entry ID 194 (OID 60880)
--
-- Name: seq_desk Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_desk" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 196 (OID 60880)
--
-- Name: seq_desk Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_desk" from PUBLIC;
GRANT ALL on "seq_desk" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_desk" to "nobody";

--
-- TOC Entry ID 197 (OID 60899)
--
-- Name: seq_desk_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_desk_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 199 (OID 60899)
--
-- Name: seq_desk_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_desk_member" from PUBLIC;
GRANT ALL on "seq_desk_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_desk_member" to "nobody";

--
-- TOC Entry ID 456 (OID 60918)
--
-- Name: desk Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "desk" (
	"id" numeric(10,0) DEFAULT nextval('seq_desk'::text) NOT NULL,
	"name" character varying(64) NOT NULL,
	"description" character varying(256),
	"pre_chk_rules" numeric(10,0),
	"post_chk_rules" numeric(10,0),
	"asset_grp" numeric(10,0),
	"publish" numeric(1,0) DEFAULT 0 NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_desk__publish" CHECK (((publish = '0'::"numeric") OR (publish = '1'::"numeric"))),
	CONSTRAINT "ck_desk__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_desk__id" Primary Key ("id")
);

--
-- TOC Entry ID 457 (OID 60918)
--
-- Name: desk Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "desk" from PUBLIC;
GRANT ALL on "desk" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "desk" to "nobody";

--
-- TOC Entry ID 458 (OID 60943)
--
-- Name: desk_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "desk_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_desk_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_desk_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 459 (OID 60943)
--
-- Name: desk_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "desk_member" from PUBLIC;
GRANT ALL on "desk_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "desk_member" to "nobody";

--
-- TOC Entry ID 460 (OID 60977)
--
-- Name: usr Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "usr" (
	"id" numeric(10,0) NOT NULL,
	"login" character varying(128) NOT NULL,
	"password" character(32) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_usr__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_usr__id" Primary Key ("id")
);

--
-- TOC Entry ID 461 (OID 60977)
--
-- Name: usr Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "usr" from PUBLIC;
GRANT ALL on "usr" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "usr" to "nobody";

--
-- TOC Entry ID 838 (OID 60995)
--
-- Name: "login_avail" (character varying,numeric,numeric) Type: FUNCTION Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE FUNCTION "login_avail" (character varying,numeric,numeric) RETURNS boolean AS 'SELECT CASE WHEN
                      (SELECT 1
                       FROM   usr
                       WHERE  $2 = 1
                              AND id <> $3
                              AND LOWER(login) = $1
                              AND active = 1) > 0
                 THEN false ELSE true END' LANGUAGE 'sql' WITH ( isstrict );

--
--  Entry manually added to overcome circular dpendancy of preceeding
--	entries TABLE, ACL and FUNCTION concerning "usr"
--


ALTER TABLE "usr" ADD
	CONSTRAINT "ck_usr__login" CHECK (login_avail((lower((login)::text))::"varchar", active, id));

--
-- TOC Entry ID 462 (OID 61000)
--
-- Name: org Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "org" (
	"id" numeric(10,0) DEFAULT nextval('seq_org'::text) NOT NULL,
	"name" character varying(64) NOT NULL,
	"long_name" character varying(128),
	"personal" numeric(1,0) DEFAULT 0 NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_org__personal" CHECK (((personal = '1'::"numeric") OR (personal = '0'::"numeric"))),
	CONSTRAINT "ck_org__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_org__id" Primary Key ("id")
);

--
-- TOC Entry ID 463 (OID 61000)
--
-- Name: org Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "org" from PUBLIC;
GRANT ALL on "org" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "org" to "nobody";

--
-- TOC Entry ID 200 (OID 61025)
--
-- Name: seq_org Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_org" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 202 (OID 61025)
--
-- Name: seq_org Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_org" from PUBLIC;
GRANT ALL on "seq_org" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_org" to "nobody";

--
-- TOC Entry ID 203 (OID 61044)
--
-- Name: seq_formatting Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_formatting" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 205 (OID 61044)
--
-- Name: seq_formatting Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_formatting" from PUBLIC;
GRANT ALL on "seq_formatting" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_formatting" to "nobody";

--
-- TOC Entry ID 206 (OID 61063)
--
-- Name: seq_formatting_instance Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_formatting_instance" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 208 (OID 61063)
--
-- Name: seq_formatting_instance Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_formatting_instance" from PUBLIC;
GRANT ALL on "seq_formatting_instance" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_formatting_instance" to "nobody";

--
-- TOC Entry ID 209 (OID 61082)
--
-- Name: seq_formatting_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_formatting_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 211 (OID 61082)
--
-- Name: seq_formatting_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_formatting_member" from PUBLIC;
GRANT ALL on "seq_formatting_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_formatting_member" to "nobody";

--
-- TOC Entry ID 212 (OID 61101)
--
-- Name: seq_attr_formatting Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_formatting" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 214 (OID 61101)
--
-- Name: seq_attr_formatting Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_formatting" from PUBLIC;
GRANT ALL on "seq_attr_formatting" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_formatting" to "nobody";

--
-- TOC Entry ID 215 (OID 61120)
--
-- Name: seq_attr_formatting_val Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_formatting_val" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 217 (OID 61120)
--
-- Name: seq_attr_formatting_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_formatting_val" from PUBLIC;
GRANT ALL on "seq_attr_formatting_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_formatting_val" to "nobody";

--
-- TOC Entry ID 218 (OID 61139)
--
-- Name: seq_attr_formatting_meta Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_formatting_meta" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 220 (OID 61139)
--
-- Name: seq_attr_formatting_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_formatting_meta" from PUBLIC;
GRANT ALL on "seq_attr_formatting_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_formatting_meta" to "nobody";

--
-- TOC Entry ID 464 (OID 61158)
--
-- Name: formatting Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "formatting" (
	"id" numeric(10,0) DEFAULT nextval('seq_formatting'::text) NOT NULL,
	"name" character varying(256),
	"description" character varying(1024),
	"priority" numeric(1,0) DEFAULT 3 NOT NULL,
	"usr__id" numeric(10,0),
	"output_channel__id" numeric(10,0) NOT NULL,
	"element__id" numeric(10,0),
	"category__id" numeric(10,0),
	"file_name" character varying(256),
	"current_version" numeric(10,0) NOT NULL,
	"workflow__id" numeric(10,0),
	"deploy_status" numeric(1,0) DEFAULT 0 NOT NULL,
	"deploy_date" timestamp with time zone,
	"expire_date" timestamp with time zone,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_story__priority" CHECK (((priority >= '1'::"numeric") AND (priority <= '5'::"numeric"))),
	CONSTRAINT "ck_media__deploy_status" CHECK (((deploy_status = '0'::"numeric") OR (deploy_status = '1'::"numeric"))),
	CONSTRAINT "ck_formatting__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_formatting__id" Primary Key ("id")
);

--
-- TOC Entry ID 465 (OID 61158)
--
-- Name: formatting Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "formatting" from PUBLIC;
GRANT ALL on "formatting" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "formatting" to "nobody";

--
-- TOC Entry ID 466 (OID 61192)
--
-- Name: formatting_instance Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "formatting_instance" (
	"id" numeric(10,0) DEFAULT nextval('seq_formatting_instance'::text) NOT NULL,
	"formatting__id" numeric(10,0) NOT NULL,
	"version" numeric(10,0),
	"usr__id" numeric(10,0) NOT NULL,
	"data" text,
	"checked_out" numeric(1,0) DEFAULT 0 NOT NULL,
	CONSTRAINT "ck_formatting_instance__active" CHECK (((checked_out = '0'::"numeric") OR (checked_out = '1'::"numeric"))),
	Constraint "pk_formatting_instance__id" Primary Key ("id")
);

--
-- TOC Entry ID 467 (OID 61192)
--
-- Name: formatting_instance Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "formatting_instance" from PUBLIC;
GRANT ALL on "formatting_instance" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "formatting_instance" to "nobody";

--
-- TOC Entry ID 468 (OID 61228)
--
-- Name: formatting_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "formatting_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_formatting_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_formatting_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 469 (OID 61228)
--
-- Name: formatting_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "formatting_member" from PUBLIC;
GRANT ALL on "formatting_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "formatting_member" to "nobody";

--
-- TOC Entry ID 470 (OID 61244)
--
-- Name: attr_formatting Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_formatting" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_formatting'::text) NOT NULL,
	"subsys" character varying(256) NOT NULL,
	"name" character varying(256) NOT NULL,
	"sql_type" character varying(30) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_formatting__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_formatting__id" Primary Key ("id")
);

--
-- TOC Entry ID 471 (OID 61244)
--
-- Name: attr_formatting Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_formatting" from PUBLIC;
GRANT ALL on "attr_formatting" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_formatting" to "nobody";

--
-- TOC Entry ID 472 (OID 61264)
--
-- Name: attr_formatting_val Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_formatting_val" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_formatting_val'::text) NOT NULL,
	"object__id" numeric(10,0) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"serial" numeric(1,0) DEFAULT 0,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_formatting_val__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_formatting_val__id" Primary Key ("id")
);

--
-- TOC Entry ID 473 (OID 61264)
--
-- Name: attr_formatting_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_formatting_val" from PUBLIC;
GRANT ALL on "attr_formatting_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_formatting_val" to "nobody";

--
-- TOC Entry ID 474 (OID 61303)
--
-- Name: attr_formatting_meta Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_formatting_meta" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_formatting_meta'::text) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"name" character varying(256) NOT NULL,
	"value" character varying(2048),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_formatting_meta__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_formatting_meta__id" Primary Key ("id")
);

--
-- TOC Entry ID 475 (OID 61303)
--
-- Name: attr_formatting_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_formatting_meta" from PUBLIC;
GRANT ALL on "attr_formatting_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_formatting_meta" to "nobody";

--
-- TOC Entry ID 221 (OID 61398)
--
-- Name: seq_story Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_story" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 223 (OID 61398)
--
-- Name: seq_story Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_story" from PUBLIC;
GRANT ALL on "seq_story" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_story" to "nobody";

--
-- TOC Entry ID 224 (OID 61417)
--
-- Name: seq_story_instance Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_story_instance" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 226 (OID 61417)
--
-- Name: seq_story_instance Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_story_instance" from PUBLIC;
GRANT ALL on "seq_story_instance" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_story_instance" to "nobody";

--
-- TOC Entry ID 227 (OID 61436)
--
-- Name: seq_story__category Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_story__category" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 229 (OID 61436)
--
-- Name: seq_story__category Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_story__category" from PUBLIC;
GRANT ALL on "seq_story__category" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_story__category" to "nobody";

--
-- TOC Entry ID 230 (OID 61455)
--
-- Name: seq_story__contributor Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_story__contributor" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 232 (OID 61455)
--
-- Name: seq_story__contributor Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_story__contributor" from PUBLIC;
GRANT ALL on "seq_story__contributor" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_story__contributor" to "nobody";

--
-- TOC Entry ID 233 (OID 61474)
--
-- Name: seq_attr_story Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_story" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 235 (OID 61474)
--
-- Name: seq_attr_story Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_story" from PUBLIC;
GRANT ALL on "seq_attr_story" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_story" to "nobody";

--
-- TOC Entry ID 236 (OID 61493)
--
-- Name: seq_attr_story_val Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_story_val" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 238 (OID 61493)
--
-- Name: seq_attr_story_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_story_val" from PUBLIC;
GRANT ALL on "seq_attr_story_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_story_val" to "nobody";

--
-- TOC Entry ID 239 (OID 61512)
--
-- Name: seq_attr_story_meta Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_story_meta" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 241 (OID 61512)
--
-- Name: seq_attr_story_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_story_meta" from PUBLIC;
GRANT ALL on "seq_attr_story_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_story_meta" to "nobody";

--
-- TOC Entry ID 476 (OID 61531)
--
-- Name: story Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "story" (
	"id" numeric(10,0) DEFAULT nextval('seq_story'::text) NOT NULL,
	"priority" numeric(1,0) DEFAULT 3 NOT NULL,
	"source__id" numeric(10,0) NOT NULL,
	"usr__id" numeric(10,0),
	"element__id" numeric(10,0) NOT NULL,
	"keyword_grp__id" numeric(10,0),
	"primary_uri" character varying(128),
	"publish_date" timestamp with time zone,
	"expire_date" timestamp with time zone,
	"cover_date" timestamp with time zone,
	"current_version" numeric(10,0) NOT NULL,
	"workflow__id" numeric(10,0),
	"publish_status" numeric(1,0) DEFAULT 0 NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_story__priority" CHECK (((priority >= '1'::"numeric") AND (priority <= '5'::"numeric"))),
	CONSTRAINT "ck_story__publish_status" CHECK (((publish_status = '0'::"numeric") OR (publish_status = '1'::"numeric"))),
	CONSTRAINT "ck_story__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_story__id" Primary Key ("id")
);

--
-- TOC Entry ID 477 (OID 61531)
--
-- Name: story Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "story" from PUBLIC;
GRANT ALL on "story" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "story" to "nobody";

--
-- TOC Entry ID 478 (OID 61564)
--
-- Name: story_instance Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "story_instance" (
	"id" numeric(10,0) DEFAULT nextval('seq_story_instance'::text) NOT NULL,
	"name" character varying(256),
	"description" character varying(1024),
	"story__id" numeric(10,0) NOT NULL,
	"version" numeric(10,0),
	"usr__id" numeric(10,0) NOT NULL,
	"slug" character varying(64),
	"checked_out" numeric(1,0) DEFAULT 0 NOT NULL,
	CONSTRAINT "ck_story_instance__checked_out" CHECK (((checked_out = '0'::"numeric") OR (checked_out = '1'::"numeric"))),
	Constraint "pk_story_instance__id" Primary Key ("id")
);

--
-- TOC Entry ID 479 (OID 61564)
--
-- Name: story_instance Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "story_instance" from PUBLIC;
GRANT ALL on "story_instance" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "story_instance" to "nobody";

--
-- TOC Entry ID 480 (OID 61587)
--
-- Name: story__category Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "story__category" (
	"id" numeric(10,0) DEFAULT nextval('seq__story_category'::text) NOT NULL,
	"story_instance__id" numeric(10,0) NOT NULL,
	"category__id" numeric(10,0) NOT NULL,
	"main" numeric(1,0) DEFAULT 0 NOT NULL,
	CONSTRAINT "ck_story__category__main" CHECK (((main = '0'::"numeric") OR (main = '1'::"numeric"))),
	Constraint "pk_story_category__id" Primary Key ("id")
);

--
-- TOC Entry ID 481 (OID 61587)
--
-- Name: story__category Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "story__category" from PUBLIC;
GRANT ALL on "story__category" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "story__category" to "nobody";

--
-- TOC Entry ID 482 (OID 61606)
--
-- Name: story__contributor Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "story__contributor" (
	"id" numeric(10,0) DEFAULT nextval('seq_story__contributor'::text) NOT NULL,
	"story_instance__id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	"place" numeric(3,0) NOT NULL,
	"role" character varying(256),
	Constraint "pk_story_category_id" Primary Key ("id")
);

--
-- TOC Entry ID 483 (OID 61606)
--
-- Name: story__contributor Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "story__contributor" from PUBLIC;
GRANT ALL on "story__contributor" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "story__contributor" to "nobody";

--
-- TOC Entry ID 484 (OID 61624)
--
-- Name: attr_story Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_story" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_story'::text) NOT NULL,
	"subsys" character varying(256) NOT NULL,
	"name" character varying(256) NOT NULL,
	"sql_type" character varying(30) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_story__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_story__id" Primary Key ("id")
);

--
-- TOC Entry ID 485 (OID 61624)
--
-- Name: attr_story Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_story" from PUBLIC;
GRANT ALL on "attr_story" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_story" to "nobody";

--
-- TOC Entry ID 486 (OID 61644)
--
-- Name: attr_story_val Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_story_val" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_story_val'::text) NOT NULL,
	"object__id" numeric(10,0) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"serial" numeric(1,0) DEFAULT 0,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_story_val__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_story_val__id" Primary Key ("id")
);

--
-- TOC Entry ID 487 (OID 61644)
--
-- Name: attr_story_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_story_val" from PUBLIC;
GRANT ALL on "attr_story_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_story_val" to "nobody";

--
-- TOC Entry ID 488 (OID 61683)
--
-- Name: attr_story_meta Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_story_meta" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_story_meta'::text) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"name" character varying(256) NOT NULL,
	"value" character varying(2048),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_story_meta__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_story_meta__id" Primary Key ("id")
);

--
-- TOC Entry ID 489 (OID 61683)
--
-- Name: attr_story_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_story_meta" from PUBLIC;
GRANT ALL on "attr_story_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_story_meta" to "nobody";

--
-- TOC Entry ID 242 (OID 61787)
--
-- Name: seq_media Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_media" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 244 (OID 61787)
--
-- Name: seq_media Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_media" from PUBLIC;
GRANT ALL on "seq_media" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_media" to "nobody";

--
-- TOC Entry ID 245 (OID 61806)
--
-- Name: seq_media_instance Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_media_instance" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 247 (OID 61806)
--
-- Name: seq_media_instance Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_media_instance" from PUBLIC;
GRANT ALL on "seq_media_instance" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_media_instance" to "nobody";

--
-- TOC Entry ID 248 (OID 61825)
--
-- Name: seq_media__contributor Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_media__contributor" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 250 (OID 61825)
--
-- Name: seq_media__contributor Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_media__contributor" from PUBLIC;
GRANT ALL on "seq_media__contributor" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_media__contributor" to "nobody";

--
-- TOC Entry ID 251 (OID 61844)
--
-- Name: seq_media_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_media_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 253 (OID 61844)
--
-- Name: seq_media_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_media_member" from PUBLIC;
GRANT ALL on "seq_media_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_media_member" to "nobody";

--
-- TOC Entry ID 254 (OID 61863)
--
-- Name: seq_image_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_image_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 256 (OID 61863)
--
-- Name: seq_image_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_image_member" from PUBLIC;
GRANT ALL on "seq_image_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_image_member" to "nobody";

--
-- TOC Entry ID 257 (OID 61882)
--
-- Name: seq_media_fields Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_media_fields" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 259 (OID 61882)
--
-- Name: seq_media_fields Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_media_fields" from PUBLIC;
GRANT ALL on "seq_media_fields" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_media_fields" to "nobody";

--
-- TOC Entry ID 260 (OID 61901)
--
-- Name: seq_attr_media Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_media" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 262 (OID 61901)
--
-- Name: seq_attr_media Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_media" from PUBLIC;
GRANT ALL on "seq_attr_media" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_media" to "nobody";

--
-- TOC Entry ID 263 (OID 61920)
--
-- Name: seq_attr_media_val Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_media_val" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 265 (OID 61920)
--
-- Name: seq_attr_media_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_media_val" from PUBLIC;
GRANT ALL on "seq_attr_media_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_media_val" to "nobody";

--
-- TOC Entry ID 266 (OID 61939)
--
-- Name: seq_attr_media_meta Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_attr_media_meta" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 268 (OID 61939)
--
-- Name: seq_attr_media_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_attr_media_meta" from PUBLIC;
GRANT ALL on "seq_attr_media_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_attr_media_meta" to "nobody";

--
-- TOC Entry ID 490 (OID 61958)
--
-- Name: media Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "media" (
	"id" numeric(10,0) DEFAULT nextval('seq_media'::text) NOT NULL,
	"element__id" numeric(10,0) NOT NULL,
	"priority" numeric(1,0) DEFAULT 3 NOT NULL,
	"source__id" numeric(10,0) NOT NULL,
	"current_version" numeric(10,0),
	"usr__id" numeric(10,0),
	"keyword_grp__id" numeric(10,0),
	"publish_date" timestamp with time zone,
	"expire_date" timestamp with time zone,
	"cover_date" timestamp with time zone,
	"workflow__id" numeric(10,0),
	"publish_status" numeric(1,0) DEFAULT 0 NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_media__priority" CHECK (((priority >= '1'::"numeric") AND (priority <= '5'::"numeric"))),
	CONSTRAINT "ck_media__publish_status" CHECK (((publish_status = '0'::"numeric") OR (publish_status = '1'::"numeric"))),
	CONSTRAINT "ck_media__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_media__id" Primary Key ("id")
);

--
-- TOC Entry ID 491 (OID 61958)
--
-- Name: media Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "media" from PUBLIC;
GRANT ALL on "media" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "media" to "nobody";

--
-- TOC Entry ID 492 (OID 61990)
--
-- Name: media_instance Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "media_instance" (
	"id" numeric(10,0) DEFAULT nextval('seq_media_instance'::text) NOT NULL,
	"name" character varying(256),
	"description" character varying(1024),
	"media__id" numeric(10,0) NOT NULL,
	"usr__id" numeric(10,0) NOT NULL,
	"version" numeric(10,0),
	"category__id" numeric(10,0) NOT NULL,
	"media_type__id" numeric(10,0),
	"file_size" numeric(10,0),
	"file_name" character varying(256),
	"location" character varying(256),
	"uri" character varying(256),
	"checked_out" numeric(1,0) DEFAULT 0 NOT NULL,
	CONSTRAINT "ck_media_instance__checked_out" CHECK (((checked_out = '0'::"numeric") OR (checked_out = '1'::"numeric"))),
	Constraint "pk_media_instance__id" Primary Key ("id")
);

--
-- TOC Entry ID 493 (OID 61990)
--
-- Name: media_instance Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "media_instance" from PUBLIC;
GRANT ALL on "media_instance" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "media_instance" to "nobody";

--
-- TOC Entry ID 494 (OID 62033)
--
-- Name: media_fields Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "media_fields" (
	"id" numeric(10,0) DEFAULT nextval('seq_media_fields'::text) NOT NULL,
	"biz_pkg" numeric(10,0) NOT NULL,
	"name" character varying(32) NOT NULL,
	"function_name" character varying(256) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_media_fields__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_media_fields__id" Primary Key ("id")
);

--
-- TOC Entry ID 495 (OID 62033)
--
-- Name: media_fields Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "media_fields" from PUBLIC;
GRANT ALL on "media_fields" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "media_fields" to "nobody";

--
-- TOC Entry ID 496 (OID 62053)
--
-- Name: media__contributor Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "media__contributor" (
	"id" numeric(10,0) DEFAULT nextval('seq_media__contributor'::text) NOT NULL,
	"media_instance__id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	"place" numeric(3,0) NOT NULL,
	"role" character varying(256),
	Constraint "pk_media_category_id" Primary Key ("id")
);

--
-- TOC Entry ID 497 (OID 62053)
--
-- Name: media__contributor Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "media__contributor" from PUBLIC;
GRANT ALL on "media__contributor" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "media__contributor" to "nobody";

--
-- TOC Entry ID 498 (OID 62071)
--
-- Name: media_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "media_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_media_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_media_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 499 (OID 62071)
--
-- Name: media_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "media_member" from PUBLIC;
GRANT ALL on "media_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "media_member" to "nobody";

--
-- TOC Entry ID 500 (OID 62087)
--
-- Name: image_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "image_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_image_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_image_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 501 (OID 62087)
--
-- Name: image_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "image_member" from PUBLIC;
GRANT ALL on "image_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "image_member" to "nobody";

--
-- TOC Entry ID 502 (OID 62103)
--
-- Name: attr_media Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_media" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_media'::text) NOT NULL,
	"subsys" character varying(256) NOT NULL,
	"name" character varying(256) NOT NULL,
	"sql_type" character varying(30) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_media__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_media__id" Primary Key ("id")
);

--
-- TOC Entry ID 503 (OID 62103)
--
-- Name: attr_media Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_media" from PUBLIC;
GRANT ALL on "attr_media" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_media" to "nobody";

--
-- TOC Entry ID 504 (OID 62123)
--
-- Name: attr_media_val Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_media_val" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_media_val'::text) NOT NULL,
	"object__id" numeric(10,0) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"serial" numeric(1,0) DEFAULT 0,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_media_val__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_media_val__id" Primary Key ("id")
);

--
-- TOC Entry ID 505 (OID 62123)
--
-- Name: attr_media_val Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_media_val" from PUBLIC;
GRANT ALL on "attr_media_val" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_media_val" to "nobody";

--
-- TOC Entry ID 506 (OID 62162)
--
-- Name: attr_media_meta Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "attr_media_meta" (
	"id" numeric(10,0) DEFAULT nextval('seq_attr_media_meta'::text) NOT NULL,
	"attr__id" numeric(10,0) NOT NULL,
	"name" character varying(256) NOT NULL,
	"value" character varying(2048),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_attr_media_meta__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_attr_media_meta__id" Primary Key ("id")
);

--
-- TOC Entry ID 507 (OID 62162)
--
-- Name: attr_media_meta Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "attr_media_meta" from PUBLIC;
GRANT ALL on "attr_media_meta" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "attr_media_meta" to "nobody";

--
-- TOC Entry ID 269 (OID 62275)
--
-- Name: seq_story_data_tile Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_story_data_tile" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 271 (OID 62275)
--
-- Name: seq_story_data_tile Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_story_data_tile" from PUBLIC;
GRANT ALL on "seq_story_data_tile" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_story_data_tile" to "nobody";

--
-- TOC Entry ID 272 (OID 62294)
--
-- Name: seq_media_data_tile Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_media_data_tile" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 274 (OID 62294)
--
-- Name: seq_media_data_tile Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_media_data_tile" from PUBLIC;
GRANT ALL on "seq_media_data_tile" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_media_data_tile" to "nobody";

--
-- TOC Entry ID 508 (OID 62313)
--
-- Name: story_data_tile Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "story_data_tile" (
	"id" numeric(10,0) DEFAULT nextval('seq_story_data_tile'::text) NOT NULL,
	"name" character varying(32),
	"description" character varying(256),
	"element_data__id" numeric(10,0) NOT NULL,
	"object_instance_id" numeric(10,0) NOT NULL,
	"parent_id" numeric(10,0) NOT NULL,
	"hold_val" numeric(1,0) DEFAULT 0 NOT NULL,
	"place" numeric(10,0) NOT NULL,
	"object_order" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_sd_tile__hold_val" CHECK (((hold_val = '0'::"numeric") OR (hold_val = '1'::"numeric"))),
	CONSTRAINT "ck_sd_tile__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_story_data_tile__id" Primary Key ("id")
);

--
-- TOC Entry ID 509 (OID 62313)
--
-- Name: story_data_tile Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "story_data_tile" from PUBLIC;
GRANT ALL on "story_data_tile" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "story_data_tile" to "nobody";

--
-- TOC Entry ID 510 (OID 62358)
--
-- Name: media_data_tile Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "media_data_tile" (
	"id" numeric(10,0) DEFAULT nextval('seq_media_data_tile'::text) NOT NULL,
	"name" character varying(32),
	"description" character varying(256),
	"element_data__id" numeric(10,0) NOT NULL,
	"object_instance_id" numeric(10,0) NOT NULL,
	"parent_id" numeric(10,0) NOT NULL,
	"place" numeric(10,0) NOT NULL,
	"hold_val" numeric(1,0) DEFAULT 0 NOT NULL,
	"object_order" numeric(10,0) NOT NULL,
	"date_val" timestamp with time zone,
	"short_val" character varying(1024),
	"blob_val" text,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_md_tile__hold_val" CHECK (((hold_val = '0'::"numeric") OR (hold_val = '1'::"numeric"))),
	CONSTRAINT "ck_md_tile__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_media_data_tile__id" Primary Key ("id")
);

--
-- TOC Entry ID 511 (OID 62358)
--
-- Name: media_data_tile Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "media_data_tile" from PUBLIC;
GRANT ALL on "media_data_tile" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "media_data_tile" to "nobody";

--
-- TOC Entry ID 275 (OID 62427)
--
-- Name: seq_story_container_tile Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_story_container_tile" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 277 (OID 62427)
--
-- Name: seq_story_container_tile Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_story_container_tile" from PUBLIC;
GRANT ALL on "seq_story_container_tile" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_story_container_tile" to "nobody";

--
-- TOC Entry ID 278 (OID 62446)
--
-- Name: seq_media_container_tile Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_media_container_tile" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 280 (OID 62446)
--
-- Name: seq_media_container_tile Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_media_container_tile" from PUBLIC;
GRANT ALL on "seq_media_container_tile" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_media_container_tile" to "nobody";

--
-- TOC Entry ID 512 (OID 62465)
--
-- Name: story_container_tile Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "story_container_tile" (
	"id" numeric(10,0) DEFAULT nextval('seq_container_tile'::text) NOT NULL,
	"name" character varying(32),
	"description" character varying(256),
	"element__id" numeric(10,0) NOT NULL,
	"object_instance_id" numeric(10,0) NOT NULL,
	"parent_id" numeric(10,0),
	"place" numeric(10,0) NOT NULL,
	"object_order" numeric(10,0) NOT NULL,
	"related_instance__id" numeric(10,0),
	"related_media__id" numeric(10,0),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_sc_tile__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_container_tile__id" Primary Key ("id")
);

--
-- TOC Entry ID 513 (OID 62465)
--
-- Name: story_container_tile Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "story_container_tile" from PUBLIC;
GRANT ALL on "story_container_tile" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "story_container_tile" to "nobody";

--
-- TOC Entry ID 514 (OID 62491)
--
-- Name: media_container_tile Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "media_container_tile" (
	"id" numeric(10,0) DEFAULT nextval('seq_media_container_tile'::text) NOT NULL,
	"name" character varying(32),
	"description" character varying(256),
	"element__id" numeric(10,0) NOT NULL,
	"object_instance_id" numeric(10,0) NOT NULL,
	"parent_id" numeric(10,0),
	"place" numeric(10,0) NOT NULL,
	"object_order" numeric(10,0) NOT NULL,
	"related_instance__id" numeric(10,0),
	"related_media__id" numeric(10,0),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_mc_tile__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_media_container_tile__id" Primary Key ("id")
);

--
-- TOC Entry ID 515 (OID 62491)
--
-- Name: media_container_tile Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "media_container_tile" from PUBLIC;
GRANT ALL on "media_container_tile" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "media_container_tile" to "nobody";

--
-- TOC Entry ID 281 (OID 62541)
--
-- Name: seq_output_channel Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_output_channel" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 283 (OID 62541)
--
-- Name: seq_output_channel Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_output_channel" from PUBLIC;
GRANT ALL on "seq_output_channel" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_output_channel" to "nobody";

--
-- TOC Entry ID 284 (OID 62560)
--
-- Name: seq_output_channel_member Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_output_channel_member" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 286 (OID 62560)
--
-- Name: seq_output_channel_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_output_channel_member" from PUBLIC;
GRANT ALL on "seq_output_channel_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_output_channel_member" to "nobody";

--
-- TOC Entry ID 516 (OID 62579)
--
-- Name: output_channel Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "output_channel" (
	"id" numeric(10,0) DEFAULT nextval('seq_output_channel'::text) NOT NULL,
	"name" character varying(64) NOT NULL,
	"description" character varying(256),
	"pre_path" character varying(64),
	"post_path" character varying(64),
	"filename" character varying(32) NOT NULL,
	"file_ext" character varying(32),
	"primary_ce" numeric(1,0),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_output_channel__active" CHECK (((active = '0'::"numeric") OR (active = '1'::"numeric"))),
	Constraint "pk_output_channel__id" Primary Key ("id")
);

--
-- TOC Entry ID 517 (OID 62579)
--
-- Name: output_channel Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "output_channel" from PUBLIC;
GRANT ALL on "output_channel" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "output_channel" to "nobody";

--
-- TOC Entry ID 518 (OID 62603)
--
-- Name: output_channel_member Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "output_channel_member" (
	"id" numeric(10,0) DEFAULT nextval('seq_output_channel_member'::text) NOT NULL,
	"object_id" numeric(10,0) NOT NULL,
	"member__id" numeric(10,0) NOT NULL,
	Constraint "pk_output_channel_member__id" Primary Key ("id")
);

--
-- TOC Entry ID 519 (OID 62603)
--
-- Name: output_channel_member Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "output_channel_member" from PUBLIC;
GRANT ALL on "output_channel_member" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "output_channel_member" to "nobody";

--
-- TOC Entry ID 520 (OID 62634)
--
-- Name: person_org Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "person_org" (
	"id" numeric(10,0) DEFAULT nextval('seq_person_org'::text) NOT NULL,
	"person__id" numeric(10,0) NOT NULL,
	"org__id" numeric(10,0) NOT NULL,
	"role" character varying(64),
	"department" character varying(64),
	"title" character varying(64),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_person_org__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_person_org__id" Primary Key ("id")
);

--
-- TOC Entry ID 521 (OID 62634)
--
-- Name: person_org Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "person_org" from PUBLIC;
GRANT ALL on "person_org" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "person_org" to "nobody";

--
-- TOC Entry ID 287 (OID 62668)
--
-- Name: seq_person_org Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_person_org" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 289 (OID 62668)
--
-- Name: seq_person_org Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_person_org" from PUBLIC;
GRANT ALL on "seq_person_org" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_person_org" to "nobody";

--
-- TOC Entry ID 290 (OID 62687)
--
-- Name: seq_source Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_source" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 292 (OID 62687)
--
-- Name: seq_source Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_source" from PUBLIC;
GRANT ALL on "seq_source" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_source" to "nobody";

--
-- TOC Entry ID 522 (OID 62706)
--
-- Name: source Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "source" (
	"id" numeric(10,0) DEFAULT nextval('seq_source'::text) NOT NULL,
	"org__id" numeric(10,0) NOT NULL,
	"name" character varying(64) NOT NULL,
	"description" character varying(256),
	"expire" numeric(4,0) DEFAULT 0 NOT NULL,
	"active" numeric(1,0) DEFAULT 1,
	CONSTRAINT "ck_source__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_source__id" Primary Key ("id")
);

--
-- TOC Entry ID 523 (OID 62706)
--
-- Name: source Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "source" from PUBLIC;
GRANT ALL on "source" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "source" to "nobody";

--
-- TOC Entry ID 524 (OID 62734)
--
-- Name: addr Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "addr" (
	"id" numeric(10,0) DEFAULT nextval('seq_addr'::text) NOT NULL,
	"org__id" numeric(10,0) NOT NULL,
	"type" character varying(64),
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_addr__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_addr__id" Primary Key ("id")
);

--
-- TOC Entry ID 525 (OID 62734)
--
-- Name: addr Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "addr" from PUBLIC;
GRANT ALL on "addr" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "addr" to "nobody";

--
-- TOC Entry ID 526 (OID 62753)
--
-- Name: addr_part_type Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "addr_part_type" (
	"id" numeric(10,0) DEFAULT nextval('seq_addr_part_type'::text) NOT NULL,
	"name" character varying(64) NOT NULL,
	"active" numeric(1,0) DEFAULT 1 NOT NULL,
	CONSTRAINT "ck_addr_part_type__active" CHECK (((active = '1'::"numeric") OR (active = '0'::"numeric"))),
	Constraint "pk_addr_part_type__id" Primary Key ("id")
);

--
-- TOC Entry ID 527 (OID 62753)
--
-- Name: addr_part_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "addr_part_type" from PUBLIC;
GRANT ALL on "addr_part_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "addr_part_type" to "nobody";

--
-- TOC Entry ID 528 (OID 62771)
--
-- Name: addr_part Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "addr_part" (
	"id" numeric(10,0) DEFAULT nextval('seq_addr_part'::text) NOT NULL,
	"addr__id" numeric(10,0) NOT NULL,
	"addr_part_type__id" numeric(10,0) NOT NULL,
	"value" character varying(256) NOT NULL,
	Constraint "pk_addr_part__id" Primary Key ("id")
);

--
-- TOC Entry ID 529 (OID 62771)
--
-- Name: addr_part Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "addr_part" from PUBLIC;
GRANT ALL on "addr_part" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "addr_part" to "nobody";

--
-- TOC Entry ID 530 (OID 62788)
--
-- Name: person_org__addr Type: TABLE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE TABLE "person_org__addr" (
	"addr__id" numeric(10,0) NOT NULL,
	"person_org__id" numeric(10,0) NOT NULL,
	Constraint "pk_person_org__addr__all" Primary Key ("addr__id", "person_org__id")
);

--
-- TOC Entry ID 531 (OID 62788)
--
-- Name: person_org__addr Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "person_org__addr" from PUBLIC;
GRANT ALL on "person_org__addr" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "person_org__addr" to "nobody";

--
-- TOC Entry ID 293 (OID 62826)
--
-- Name: seq_addr Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_addr" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 295 (OID 62826)
--
-- Name: seq_addr Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_addr" from PUBLIC;
GRANT ALL on "seq_addr" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_addr" to "nobody";

--
-- TOC Entry ID 296 (OID 62845)
--
-- Name: seq_addr_part Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_addr_part" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 298 (OID 62845)
--
-- Name: seq_addr_part Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_addr_part" from PUBLIC;
GRANT ALL on "seq_addr_part" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_addr_part" to "nobody";

--
-- TOC Entry ID 299 (OID 62864)
--
-- Name: seq_addr_part_type Type: SEQUENCE Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE SEQUENCE "seq_addr_part_type" start 1024 increment 1 maxvalue 2147483647 minvalue 1  cache 1 ;

--
-- TOC Entry ID 301 (OID 62864)
--
-- Name: seq_addr_part_type Type: ACL Owner: 
-- Data Pos: 0 (Length 0)
--

REVOKE ALL on "seq_addr_part_type" from PUBLIC;
GRANT ALL on "seq_addr_part_type" to "postgres";
GRANT INSERT,UPDATE,DELETE,SELECT on "seq_addr_part_type" to "nobody";

--
-- Data for TOC Entry ID 839 (OID 57440)
--
-- Name: grp Type: TABLE DATA Owner: postgres
-- Data Pos: 457169 (Length 941)
--


COPY "grp"  FROM stdin;
0	\N	6	Root Group	The mother of all groups.	1	1	1
1	0	9	All Contributors	All contributors in the system.	0	1	1
2	0	8	All Users	All users of the system.	0	1	1
3	0	17	All Organizations	All organizations in the system.	0	1	1
4	0	18	All Alert Types	All alert types in the system.	0	1	1
5	0	36	All Sources	All sources in the system.	0	1	1
6	\N	8	Global Admins	Users who can do anything.	0	0	1
7	\N	8	Story Editors	Users who edit stories.	0	0	1
8	\N	8	Media Producers	Users who produce and edit media.	0	0	1
9	\N	8	Template Developers	Users who develop templates	0	0	1
10	\N	8	Element Admins	Users who administer elements and element types.	0	0	1
11	\N	8	User Admins	Users who administer users.	0	0	1
12	\N	8	Preference Admins	Users who administer preferences.	0	0	1
13	\N	8	Group Admins	Users who administer groups.	0	0	1
14	\N	8	Output Channel Admins	Users who administer output channels.	0	0	1
15	\N	8	Contributor Admins	Users who administer contributors and contributor types.	0	0	1
16	\N	8	Workflow Admins	Users who administer workflows.	0	0	1
17	\N	8	Category Admins	Users who administer categories.	0	0	1
18	\N	8	Source Admins	Users who administer sources.	0	0	1
19	\N	8	Distribution Admins	Users who administer distribution jobs.	0	0	1
20	\N	8	Publishing Admins	Users who can use the publishing administration tools.	0	0	1
21	\N	8	System Admins	Users who administer system administration tools.	0	0	1
22	0	58	All Preferences	All prefernces in the system.	0	1	1
23	\N	59	All Output Channels	All output channels in the system.	0	1	1
24	\N	60	All Contributor Types	All contributor types in the system.	0	1	1
25	\N	61	All Workflows	All workflows in the system.	0	1	1
26	\N	47	All Categories	All categories in the system.	0	1	1
27	\N	70	All Elements	All elements in the system.	0	1	1
28	\N	64	All Element Types	All element types in the system.	0	1	1
29	\N	62	All Destinations	All destinations in the system.	0	1	1
30	\N	63	All Jobs	All distribution jobs in the system.	0	1	1
31	\N	65	All Stories	All stories in the system.	0	1	1
32	\N	66	All Media	All media in the system.	0	1	1
33	\N	67	All Templates	All templates in the system.	0	1	1
35	\N	68	All Groups	All groups in the system.	0	1	1
36	\N	8	Alert Type Admins	Users who administer alert types.	0	0	1
37	\N	8	Contributor Type Admins	Users who administer contributor types.	0	0	1
38	\N	8	Element Type Admins	Users who administer contributor types.	0	0	1
39	\N	9	Writers	People who contribute writing.	1	0	1
40	\N	9	Illustrators	People who provide original artwork.	1	0	1
61	\N	43	Desk Assets	A group for holding assets for Desk objects.	1	0	1
62	\N	43	Desk Assets	A group for holding assets for Desk objects.	1	0	1
63	\N	43	Desk Assets	A group for holding assets for Desk objects.	1	0	1
64	\N	43	Desk Assets	A group for holding assets for Desk objects.	1	0	1
65	\N	43	Desk Assets	A group for holding assets for Desk objects.	1	0	1
66	\N	43	Desk Assets	A group for holding assets for Desk objects.	1	0	1
67	\N	43	Desk Assets	A group for holding assets for Desk objects.	1	0	1
330	\N	24	AssetType Group	Grouped containers	1	0	1
331	\N	24	AssetType Group	Grouped containers	1	0	1
332	\N	24	AssetType Group	Grouped containers	1	0	1
333	\N	24	AssetType Group	Grouped containers	1	0	1
334	\N	24	AssetType Group	Grouped containers	1	0	1
335	\N	24	AssetType Group	Grouped containers	1	0	1
340	\N	24	AssetType Group	Grouped containers	1	0	1
341	\N	24	AssetType Group	Grouped containers	1	0	1
750	\N	23	Root Category	Root Category	1	0	1
41	\N	40	All Workflow Desks	All desks available to a workflow	1	0	1
42	\N	40	Required Workflow Desks	Desks required in a workflow	1	0	1
43	\N	40	All Workflow Desks	All desks available to a workflow	1	0	1
44	\N	40	Required Workflow Desks	Desks required in a workflow	1	0	1
45	\N	40	All Workflow Desks	All desks available to a workflow	1	0	1
46	\N	40	Required Workflow Desks	Desks required in a workflow	1	0	1
\.


--
-- Data for TOC Entry ID 840 (OID 57514)
--
-- Name: media_type Type: TABLE DATA Owner: postgres
-- Data Pos: 458110 (Length 829)
--


COPY "media_type"  FROM stdin;
0	none	Use when no MIME Type applies, or when they all do.	1
1	application/andrew-inset	\N	1
2	application/mac-binhex40	\N	1
3	application/mac-compactpro	\N	1
4	application/msword	\N	1
5	application/octet-stream	\N	1
6	application/oda	\N	1
7	application/pdf	\N	1
8	application/postscript	\N	1
9	application/smil	\N	1
10	application/vnd.mif	\N	1
11	application/vnd.ms-excel	\N	1
12	application/vnd.ms-powerpoint	\N	1
13	application/vnd.wap.wbxml	\N	1
14	application/vnd.wap.wmlc	\N	1
15	application/vnd.wap.wmlscriptc	\N	1
16	application/x-bcpio	\N	1
17	application/x-cdlink	\N	1
18	application/x-chess-pgn	\N	1
19	application/x-cpio	\N	1
20	application/x-csh	\N	1
21	application/x-director	\N	1
22	application/x-dvi	\N	1
23	application/x-futuresplash	\N	1
24	application/x-gtar	\N	1
25	application/x-hdf	\N	1
26	application/x-javascript	\N	1
27	application/x-koan	\N	1
28	application/x-latex	\N	1
29	application/x-netcdf	\N	1
30	application/x-sh	\N	1
31	application/x-shar	\N	1
32	application/x-shockwave-flash	\N	1
33	application/x-stuffit	\N	1
34	application/x-sv4cpio	\N	1
35	application/x-sv4crc	\N	1
36	application/x-tar	\N	1
37	application/x-tcl	\N	1
38	application/x-tex	\N	1
39	application/x-texinfo	\N	1
40	application/x-troff	\N	1
41	application/x-troff-man	\N	1
42	application/x-troff-me	\N	1
43	application/x-troff-ms	\N	1
44	application/x-ustar	\N	1
45	application/x-wais-source	\N	1
46	application/zip	\N	1
47	audio/basic	\N	1
48	audio/midi	\N	1
49	audio/mpeg	\N	1
50	audio/x-aiff	\N	1
51	audio/x-pn-realaudio	\N	1
52	audio/x-pn-realaudio-plugin	\N	1
53	audio/x-realaudio	\N	1
54	audio/x-wav	\N	1
55	chemical/x-pdb	\N	1
56	chemical/x-xyz	\N	1
57	image/bmp	\N	1
58	image/gif	\N	1
59	image/ief	\N	1
60	image/jpeg	\N	1
61	image/png	\N	1
62	image/tiff	\N	1
63	image/vnd.wap.wbmp	\N	1
64	image/x-cmu-raster	\N	1
65	image/x-portable-anymap	\N	1
66	image/x-portable-bitmap	\N	1
67	image/x-portable-graymap	\N	1
68	image/x-portable-pixmap	\N	1
69	image/x-rgb	\N	1
70	image/x-xbitmap	\N	1
71	image/x-xpixmap	\N	1
72	image/x-xwindowdump	\N	1
73	model/iges	\N	1
74	model/mesh	\N	1
75	model/vrml	\N	1
76	text/css	\N	1
77	text/html	\N	1
78	text/plain	\N	1
79	text/richtext	\N	1
80	text/rtf	\N	1
81	text/sgml	\N	1
82	text/tab-separated-values	\N	1
83	text/vnd.wap.wml	\N	1
84	text/vnd.wap.wmlscript	\N	1
85	text/x-setext	\N	1
86	text/xml	\N	1
87	video/mpeg	\N	1
88	video/quicktime	\N	1
89	video/x-msvideo	\N	1
90	video/x-sgi-movie	\N	1
91	x-conference/x-cooltalk	\N	1
\.


--
-- Data for TOC Entry ID 841 (OID 57533)
--
-- Name: media_type_ext Type: TABLE DATA Owner: postgres
-- Data Pos: 458939 (Length 749)
--


COPY "media_type_ext"  FROM stdin;
1	1	ez
2	2	hqx
3	3	cpt
4	4	doc
5	5	bin
6	5	class
7	5	dms
8	5	exe
9	5	lha
10	5	lzh
11	6	oda
12	7	pdf
13	8	ai
14	8	eps
15	8	ps
16	9	smi
17	9	smil
18	10	mif
19	11	xls
20	12	ppt
21	13	wbxml
22	14	wmlc
23	15	wmlsc
24	16	bcpio
25	17	vcd
26	18	pgn
27	19	cpio
28	20	csh
29	21	dcr
30	21	dir
31	21	dxr
32	22	dvi
33	23	spl
34	24	gtar
35	25	hdf
36	26	js
37	27	skd
38	27	skm
39	27	skp
40	27	skt
41	28	latex
42	29	cdf
43	29	nc
44	30	sh
45	31	shar
46	32	swf
47	33	sit
48	34	sv4cpio
49	35	sv4crc
50	36	tar
51	37	tcl
52	38	tex
53	39	texi
54	39	texinfo
55	40	roff
56	40	t
57	40	tr
58	41	man
59	42	me
60	43	ms
61	44	ustar
62	45	src
63	46	zip
64	47	au
65	47	snd
66	48	kar
67	48	mid
68	48	midi
69	49	mp2
70	49	mp3
71	49	mpga
72	50	aif
73	50	aifc
74	50	aiff
75	51	ram
76	51	rm
77	52	rpm
78	53	ra
79	54	wav
80	55	pdb
81	56	xyz
82	57	bmp
83	58	gif
84	59	ief
85	60	jpe
86	60	jpeg
87	60	jpg
88	61	png
89	62	tif
90	62	tiff
91	63	wbmp
92	64	ras
93	65	pnm
94	66	pbm
95	67	pgm
96	68	ppm
97	69	rgb
98	70	xbm
99	71	xpm
100	72	xwd
101	73	iges
102	73	igs
103	74	mesh
104	74	msh
105	74	silo
106	75	vrml
107	75	wrl
108	76	css
109	77	htm
110	77	html
111	78	asc
112	78	txt
113	79	rtx
114	80	rtf
115	81	sgm
116	81	sgml
117	82	tsv
118	83	wml
119	84	wmls
120	85	etx
121	86	xml
122	87	mpe
123	87	mpeg
124	87	mpg
125	88	mov
126	88	qt
127	89	avi
128	90	movie
129	91	ice
\.


--
-- Data for TOC Entry ID 842 (OID 57558)
--
-- Name: alerted Type: TABLE DATA Owner: postgres
-- Data Pos: 459688 (Length 27)
--


COPY "alerted"  FROM stdin;
\.


--
-- Data for TOC Entry ID 843 (OID 57575)
--
-- Name: alerted__contact_value Type: TABLE DATA Owner: postgres
-- Data Pos: 459715 (Length 27)
--


COPY "alerted__contact_value"  FROM stdin;
\.


--
-- Data for TOC Entry ID 844 (OID 57631)
--
-- Name: alert_type_rule Type: TABLE DATA Owner: postgres
-- Data Pos: 459742 (Length 27)
--


COPY "alert_type_rule"  FROM stdin;
\.


--
-- Data for TOC Entry ID 845 (OID 57677)
--
-- Name: alert Type: TABLE DATA Owner: postgres
-- Data Pos: 459769 (Length 27)
--


COPY "alert"  FROM stdin;
\.


--
-- Data for TOC Entry ID 846 (OID 57725)
--
-- Name: alert_type Type: TABLE DATA Owner: postgres
-- Data Pos: 459796 (Length 27)
--


COPY "alert_type"  FROM stdin;
\.


--
-- Data for TOC Entry ID 847 (OID 57750)
--
-- Name: alert_type__grp__contact Type: TABLE DATA Owner: postgres
-- Data Pos: 459823 (Length 27)
--


COPY "alert_type__grp__contact"  FROM stdin;
\.


--
-- Data for TOC Entry ID 848 (OID 57765)
--
-- Name: alert_type__usr__contact Type: TABLE DATA Owner: postgres
-- Data Pos: 459850 (Length 27)
--


COPY "alert_type__usr__contact"  FROM stdin;
\.


--
-- Data for TOC Entry ID 849 (OID 57886)
--
-- Name: attr_grp Type: TABLE DATA Owner: postgres
-- Data Pos: 459877 (Length 55)
--


COPY "attr_grp"  FROM stdin;
1	_MEMBER_SUBSYS	Bio	blob	1
\.


--
-- Data for TOC Entry ID 850 (OID 57906)
--
-- Name: attr_grp_val Type: TABLE DATA Owner: postgres
-- Data Pos: 459932 (Length 47)
--


COPY "attr_grp_val"  FROM stdin;
1	39	1	\N	\N	\N	0	1
2	40	1	\N	\N	\N	0	1
\.


--
-- Data for TOC Entry ID 851 (OID 57945)
--
-- Name: attr_grp_meta Type: TABLE DATA Owner: postgres
-- Data Pos: 459979 (Length 122)
--


COPY "attr_grp_meta"  FROM stdin;
1	1	maxlength	0	1
2	1	cols	50	1
3	1	length		1
4	1	multiple		1
5	1	vals		1
6	1	rows	5	1
7	1	type	textarea	1
8	1	disp	Bio	1
9	1	pos	1	1
\.


--
-- Data for TOC Entry ID 852 (OID 58007)
--
-- Name: grp_priv Type: TABLE DATA Owner: postgres
-- Data Pos: 460101 (Length 158)
--


COPY "grp_priv"  FROM stdin;
1	15	3	2001-12-03 12:37:56+01
2	11	3	2001-12-03 12:37:56+01
3	18	3	2001-12-03 12:37:56+01
4	18	3	2001-12-03 12:37:56+01
5	36	3	2001-12-03 12:37:56+01
6	7	3	2001-12-03 12:37:56+01
7	8	3	2001-12-03 12:37:56+01
8	9	3	2001-12-03 12:37:56+01
9	10	3	2001-12-03 12:37:56+01
10	12	3	2001-12-03 12:37:56+01
11	13	3	2001-12-03 12:37:56+01
12	14	3	2001-12-03 12:37:56+01
13	16	3	2001-12-03 12:37:56+01
14	17	3	2001-12-03 12:37:56+01
15	19	3	2001-12-03 12:37:56+01
16	19	3	2001-12-03 12:37:56+01
17	20	3	2001-12-03 12:37:56+01
18	20	3	2001-12-03 12:37:56+01
19	20	3	2001-12-03 12:37:56+01
20	20	3	2001-12-03 12:37:56+01
21	20	3	2001-12-03 12:37:56+01
22	20	3	2001-12-03 12:37:57+01
23	20	3	2001-12-03 12:37:57+01
24	20	3	2001-12-03 12:37:57+01
25	20	3	2001-12-03 12:37:57+01
26	21	3	2001-12-03 12:37:57+01
27	21	3	2001-12-03 12:37:57+01
28	21	3	2001-12-03 12:37:57+01
29	37	3	2001-12-03 12:37:57+01
30	38	3	2001-12-03 12:37:57+01
\.


--
-- Data for TOC Entry ID 853 (OID 58026)
--
-- Name: grp_priv__grp_member Type: TABLE DATA Owner: postgres
-- Data Pos: 460259 (Length 118)
--


COPY "grp_priv__grp_member"  FROM stdin;
1	1
2	2
3	3
4	5
5	4
6	31
7	32
8	33
9	27
10	22
11	35
12	23
13	25
14	26
15	29
16	30
17	23
18	1
19	24
20	25
21	26
22	27
23	28
24	3
25	5
26	22
27	2
28	35
29	24
30	28
\.


--
-- Data for TOC Entry ID 854 (OID 58106)
--
-- Name: pref Type: TABLE DATA Owner: postgres
-- Data Pos: 460377 (Length 212)
--


COPY "pref"  FROM stdin;
1	Time Zone	Time Zone	America/Los_Angeles	America/Los_Angeles
2	List Name Format	How people's names appear in lists.	%l%, f	%l%, f
3	Name Format	The default format for people's names.	%f% l	%f% l
5	Date/Time Format	How dates and times are displayed.	%G-%m-%d %T	%G-%m-%d %T
6	Permissions Widget	Permissions Widget	radio	radio
\.


--
-- Data for TOC Entry ID 855 (OID 58124)
--
-- Name: pref_opt Type: TABLE DATA Owner: postgres
-- Data Pos: 460589 (Length 5046)
--


COPY "pref_opt"  FROM stdin;
1	UTC	Coordinated Universal Time (UTC)
1	Cuba	Cuba
1	Egypt	Egypt
1	Eire	Eire
1	Hongkong	Hong Kong
1	Iceland	Iceland
1	Iran	Iran
1	Israel	Israel
1	Jamaica	Jamaica
1	Japan	Japan
1	Kwajalein	Kwajalein
1	Libya	Libya
1	Navajo	Navajo
1	Singapore	Singapore
1	Europe/Andorra	Europe/Andorra
1	Asia/Dubai	Asia - Dubai
1	Asia/Kabul	Asia - Kabul
1	America/Antigua	America - Antigua
1	America/Anguilla	America - Anguilla
1	Europe/Tirane	Europe - Tirane
1	Asia/Yerevan	Asia - Yerevan
1	America/Curacao	America - Curacao
1	Africa/Luanda	Africa - Luanda
1	Antarctica/McMurdo	McMurdo Station, Ross Island
1	Antarctica/South_Pole	Amundsen-Scott Station, South Pole
1	Antarctica/Palmer	Palmer Station, Anvers Island
1	Antarctica/Mawson	Mawson Station, Holme Bay
1	Antarctica/Davis	Davis Station, Vestfold Hills
1	Antarctica/Casey	Casey Station, Bailey Peninsula
1	Antarctica/DumontDUrville	Dumont-d'Urville Base
1	Antarctica/Syowa	Syowa Station, E Ongul I
1	America/Buenos_Aires	E Argentina - Buenos Aires
1	America/Rosario	NE Argentina - Rosario
1	America/Cordoba	West Argentina - Cordoba
1	America/Jujuy	Jujuy (JY)
1	America/Catamarca	Catamarca (CT)
1	America/Mendoza	Mendoza (MZ)
1	Pacific/Pago_Pago	Pacific - Pago Pago
1	Europe/Vienna	Europe - Vienna
1	Australia/Lord_Howe	Lord Howe Island
1	Australia/Hobart	Tasmania
1	Australia/Melbourne	Victoria
1	Australia/Sydney	New South Wales - Sydney
1	Australia/Broken_Hill	New South Wales - Broken Hill
1	Australia/Brisbane	Queensland - Brisbane
1	Australia/Lindeman	Queensland - Holiday Islands
1	Australia/Adelaide	South Australia
1	Australia/Darwin	Northern Territory
1	Australia/Perth	Western Australia
1	America/Aruba	America - Aruba
1	Asia/Baku	Asia - Baku
1	Europe/Sarajevo	Europe - Sarajevo
1	America/Barbados	America - Barbados
1	Asia/Dacca	Asia - Dacca
1	Europe/Brussels	Europe - Brussels
1	Africa/Ouagadougou	Africa - Ouagadougou
1	Europe/Sofia	Europe - Sofia
1	Asia/Bahrain	Asia - Bahrain
1	Africa/Bujumbura	Africa - Bujumbura
1	Africa/Porto-Novo	Africa - Porto-Novo
1	Atlantic/Bermuda	Atlantic - Bermuda
1	Asia/Brunei	Asia - Brunei
1	America/La_Paz	America - La Paz
1	America/Noronha	Fernando de Noronha
1	America/Belem	Amapa, E Para
1	America/Fortaleza	NE Brazil - Fortaleza
1	America/Araguaina	Tocantins
1	America/Maceio	Alagoas, Sergipe
1	America/Sao_Paulo	S & SE Brazil - Sao Paulo
1	America/Cuiaba	Mato Grosso, Mato Grosso do Sul
1	America/Porto_Velho	W Para, Rondonia
1	America/Boa_Vista	Roraima
1	America/Manaus	Amazonas
1	America/Porto_Acre	Acre
1	America/Nassau	America - Nassau
1	Asia/Thimbu	Asia - Thimbu
1	Africa/Gaborone	Africa - Gaborone
1	Europe/Minsk	Europe - Minsk
1	America/Belize	America - Belize
1	America/St_Johns	Newfoundland Island
1	America/Halifax	Atlantic Time - Halifax
1	America/Glace_Bay	Atlantic Time - Glace Bay
1	America/Goose_Bay	Atlantic Time - East Labrador
1	America/Montreal	Eastern Time - Montreal
1	America/Nipigon	Eastern Time - Nipigon
1	America/Thunder_Bay	Eastern Time - Thunder Bay
1	America/Winnipeg	Central Time - Winnipeg
1	America/Rainy_River	Central Time - Rainy River
1	America/Pangnirtung	Central Time - Pangnirtung
1	America/Iqaluit	Central Time - East Nunavut
1	America/Rankin_Inlet	Central Time - Central Nunavut
1	America/Cambridge_Bay	Central Time - West Nunavut
1	America/Regina	Central Standard Time - Regina
1	America/Swift_Current	Central Standard Time - Swift Current
1	America/Edmonton	Mountain Time - Edmonton
1	America/Yellowknife	Mountain Time - Yellowknife
1	America/Inuvik	Mountain Time - Inuvik
1	America/Dawson_Creek	Mountain Standard Time - Dawson Creek
1	America/Vancouver	Pacific Time - Vancouver
1	America/Whitehorse	Pacific Time - Whitehorse
1	America/Dawson	Pacific Time - Dawson
1	Indian/Cocos	Indian - Cocos
1	Africa/Kinshasa	West Dem. Rep. of Congo
1	Africa/Lubumbashi	East Dem. Rep. of Congo
1	Africa/Bangui	Africa - Bangui
1	Africa/Brazzaville	Africa - Brazzaville
1	Europe/Zurich	Europe - Zurich
1	Africa/Abidjan	Africa - Abidjan
1	Pacific/Rarotonga	Pacific - Rarotonga
1	America/Santiago	America - Santiago
1	Pacific/Easter	Easter Island
1	Africa/Douala	Africa - Douala
1	Asia/Harbin	North Manchuria
1	Asia/Shanghai	China coast
1	Asia/Chungking	China mountains
1	Asia/Urumqi	Tibet & Xinjiang
1	Asia/Kashgar	Eastern Turkestan
1	America/Bogota	America - Bogota
1	America/Costa_Rica	America - Costa Rica
1	America/Havana	America - Havana
1	Atlantic/Cape_Verde	Atlantic - Cape Verde
1	Indian/Christmas	Indian - Christmas
1	Asia/Nicosia	Asia - Nicosia
1	Europe/Prague	Europe - Prague
1	Europe/Berlin	Europe - Berlin
1	Africa/Djibouti	Africa - Djibouti
1	Europe/Copenhagen	Europe - Copenhagen
1	America/Dominica	America - Dominica
1	America/Santo_Domingo	America - Santo Domingo
1	Africa/Algiers	Africa - Algiers
1	America/Guayaquil	Mainland
1	Pacific/Galapagos	Galapagos Islands
1	Europe/Tallinn	Europe - Tallinn
1	Africa/Cairo	Africa - Cairo
1	Africa/El_Aaiun	Africa - El Aaiun
1	Africa/Asmera	Africa - Asmera
1	Europe/Madrid	Mainland
1	Africa/Ceuta	Ceuta & Melilla
1	Atlantic/Canary	Canary Islands
1	Africa/Addis_Ababa	Africa - Addis Ababa
1	Europe/Helsinki	Europe - Helsinki
1	Pacific/Fiji	Pacific - Fiji
1	Atlantic/Stanley	Atlantic - Stanley
1	Pacific/Yap	Yap
1	Pacific/Truk	Truk (Chuuk)
1	Pacific/Ponape	Ponape (Pohnpei)
1	Pacific/Kosrae	Kosrae
1	Atlantic/Faeroe	Atlantic - Faeroe
1	Europe/Paris	Europe - Paris
1	Africa/Libreville	Africa - Libreville
1	Europe/London	Great Britain
1	Europe/Belfast	Northern Ireland
1	America/Grenada	America - Grenada
1	Asia/Tbilisi	Asia - Tbilisi
1	America/Cayenne	America - Cayenne
1	Africa/Accra	Africa - Accra
1	Europe/Gibraltar	Europe - Gibraltar
1	America/Scoresbysund	East Greenland
1	America/Godthab	Southwest Greenland
1	America/Thule	Northwest Greenland
1	Africa/Banjul	Africa - Banjul
1	Africa/Conakry	Africa - Conakry
1	America/Guadeloupe	America - Guadeloupe
1	Africa/Malabo	Africa - Malabo
1	Europe/Athens	Europe - Athens
1	Atlantic/South_Georgia	Atlantic - South Georgia
1	America/Guatemala	America - Guatemala
1	Pacific/Guam	Pacific - Guam
1	Africa/Bissau	Africa - Bissau
1	America/Guyana	America - Guyana
1	Asia/Hong_Kong	Asia - Hong Kong
1	America/Tegucigalpa	America - Tegucigalpa
1	Europe/Zagreb	Europe - Zagreb
1	America/Port-au-Prince	America - Port-au-Prince
1	Europe/Budapest	Europe - Budapest
1	Asia/Jakarta	Java & Sumatra
1	Asia/Ujung_Pandang	Borneo & Celebes
1	Asia/Jayapura	Irian Jaya & the Moluccas
1	Europe/Dublin	Europe - Dublin
1	Asia/Jerusalem	Asia - Jerusalem
1	Asia/Calcutta	Asia - Calcutta
1	Indian/Chagos	Indian - Chagos
1	Asia/Baghdad	Asia - Baghdad
1	Asia/Tehran	Asia - Tehran
1	Atlantic/Reykjavik	Atlantic - Reykjavik
1	Europe/Rome	Europe - Rome
1	America/Jamaica	America - Jamaica
1	Asia/Amman	Asia - Amman
1	Asia/Tokyo	Asia - Tokyo
1	Africa/Nairobi	Africa - Nairobi
1	Asia/Bishkek	Asia - Bishkek
1	Asia/Phnom_Penh	Asia - Phnom Penh
1	Pacific/Tarawa	Gilbert Islands
1	Pacific/Enderbury	Phoenix Islands
1	Pacific/Kiritimati	Line Islands
1	Indian/Comoro	Indian - Comoro
1	America/St_Kitts	America - St Kitts
1	Asia/Pyongyang	Asia - Pyongyang
1	Asia/Seoul	Asia - Seoul
1	Asia/Kuwait	Asia - Kuwait
1	America/Cayman	America - Cayman
1	Asia/Almaty	East Kazakhstan
1	Asia/Aqtobe	Central Kazakhstan
1	Asia/Aqtau	West Kazakhstan
1	Asia/Vientiane	Asia - Vientiane
1	Asia/Beirut	Asia - Beirut
1	America/St_Lucia	America - St Lucia
1	Europe/Vaduz	Europe - Vaduz
1	Asia/Colombo	Asia - Colombo
1	Africa/Monrovia	Africa - Monrovia
1	Africa/Maseru	Africa - Maseru
1	Europe/Vilnius	Europe - Vilnius
1	Europe/Luxembourg	Europe - Luxembourg
1	Europe/Riga	Europe - Riga
1	Africa/Tripoli	Africa - Tripoli
1	Africa/Casablanca	Africa - Casablanca
1	Europe/Monaco	Europe - Monaco
1	Europe/Chisinau	Europe - Chisinau
1	Europe/Tiraspol	Transdniestria
1	Indian/Antananarivo	Indian - Antananarivo
1	Pacific/Majuro	Pacific - Majuro
1	Pacific/Kwajalein	Kwajalein
1	Europe/Skopje	Europe - Skopje
1	Africa/Bamako	Southwest Mali
1	Africa/Timbuktu	Northeast Mali
1	Asia/Rangoon	Asia - Rangoon
1	Asia/Ulaanbaatar	Asia - Ulaanbaatar
1	Asia/Hovd	Bayan-Olgiy, Hovd, Uvs
1	Asia/Macao	Asia - Macao
1	Pacific/Saipan	Pacific - Saipan
1	America/Martinique	America - Martinique
1	Africa/Nouakchott	Africa - Nouakchott
1	America/Montserrat	America - Montserrat
1	Europe/Malta	Europe - Malta
1	Indian/Mauritius	Indian - Mauritius
1	Indian/Maldives	Indian - Maldives
1	Africa/Blantyre	Africa - Blantyre
1	America/Mexico_City	Central Time - Mexico City
1	America/Cancun	Central Time - Quintana Roo
1	America/Mazatlan	Mountain Time - Mazatlna
1	America/Chihuahua	Mountain Time - Chihuahua
1	America/Hermosillo	Mountain Standard Time - Sonora
1	America/Tijuana	Pacific Time - Tijuana
1	Asia/Kuala_Lumpur	Peninsular Malaysia
1	Asia/Kuching	Sabah & Sarawak
1	Africa/Maputo	Africa - Maputo
1	Africa/Windhoek	Africa - Windhoek
1	Pacific/Noumea	Pacific - Noumea
1	Africa/Niamey	Africa - Niamey
1	Pacific/Norfolk	Pacific - Norfolk
1	Africa/Lagos	Africa - Lagos
1	America/Managua	America - Managua
1	Europe/Amsterdam	Europe - Amsterdam
1	Europe/Oslo	Europe - Oslo
1	Asia/Katmandu	Asia - Katmandu
1	Pacific/Nauru	Pacific - Nauru
1	Pacific/Niue	Pacific - Niue
1	Pacific/Auckland	Pacific - Auckland
1	Pacific/Chatham	Chatham Islands
1	Asia/Muscat	Asia - Muscat
1	America/Panama	America - Panama
1	America/Lima	America - Lima
1	Pacific/Tahiti	Society Islands
1	Pacific/Marquesas	Marquesas Islands
1	Pacific/Gambier	Gambier Islands
1	Pacific/Port_Moresby	Pacific - Port Moresby
1	Asia/Manila	Asia - Manila
1	Asia/Karachi	Asia - Karachi
1	Europe/Warsaw	Europe - Warsaw
1	America/Miquelon	America - Miquelon
1	Pacific/Pitcairn	Pacific - Pitcairn
1	America/Puerto_Rico	America - Puerto Rico
1	Asia/Gaza	Asia - Gaza
1	Europe/Lisbon	Mainland
1	Atlantic/Madeira	Madeira Islands
1	Atlantic/Azores	Azores
1	Pacific/Palau	Pacific - Palau
1	America/Asuncion	America - Asuncion
1	Asia/Qatar	Asia - Qatar
1	Indian/Reunion	Indian - Reunion
1	Europe/Bucharest	Europe - Bucharest
1	Europe/Kaliningrad	Moscow-01 - Kaliningrad
1	Europe/Moscow	Moscow+00 - west Russia
1	Europe/Samara	Moscow+01 - Caspian Sea
1	Asia/Yekaterinburg	Moscow+02 - Urals
1	Asia/Omsk	Moscow+03 - west Siberia
1	Asia/Novosibirsk	Moscow+03 - Novosibirsk
1	Asia/Krasnoyarsk	Moscow+04 - Yenisei River
1	Asia/Irkutsk	Moscow+05 - Lake Baikal
1	Asia/Yakutsk	Moscow+06 - Lena River
1	Asia/Vladivostok	Moscow+07 - Amur River
1	Asia/Magadan	Moscow+08 - Magadan & Sakhalin
1	Asia/Kamchatka	Moscow+09 - Kamchatka
1	Asia/Anadyr	Moscow+10 - Bering Sea
1	Africa/Kigali	Africa - Kigali
1	Asia/Riyadh	Asia - Riyadh
1	Pacific/Guadalcanal	Pacific - Guadalcanal
1	Indian/Mahe	Indian - Mahe
1	Africa/Khartoum	Africa - Khartoum
1	Europe/Stockholm	Europe - Stockholm
1	Asia/Singapore	Asia - Singapore
1	Atlantic/St_Helena	Atlantic - St Helena
1	Europe/Ljubljana	Europe - Ljubljana
1	Arctic/Longyearbyen	Svalbard
1	Atlantic/Jan_Mayen	Jan Mayen
1	Europe/Bratislava	Europe - Bratislava
1	Africa/Freetown	Africa - Freetown
1	Europe/San_Marino	Europe - San Marino
1	Africa/Dakar	Africa - Dakar
1	Africa/Mogadishu	Africa - Mogadishu
1	America/Paramaribo	America - Paramaribo
1	Africa/Sao_Tome	Africa - Sao Tome
1	America/El_Salvador	America - El Salvador
1	Asia/Damascus	Asia - Damascus
1	Africa/Mbabane	Africa - Mbabane
1	America/Grand_Turk	America - Grand Turk
1	Africa/Ndjamena	Africa - Ndjamena
1	Indian/Kerguelen	Indian - Kerguelen
1	Africa/Lome	Africa - Lome
1	Asia/Bangkok	Asia - Bangkok
1	Asia/Dushanbe	Asia - Dushanbe
1	Pacific/Fakaofo	Pacific - Fakaofo
1	Asia/Ashkhabad	Asia - Ashkhabad
1	Africa/Tunis	Africa - Tunis
1	Pacific/Tongatapu	Pacific - Tongatapu
1	Asia/Dili	Asia - Dili
1	Europe/Istanbul	Europe - Istanbul
1	America/Port_of_Spain	America - Port of Spain
1	Pacific/Funafuti	Pacific - Funafuti
1	Asia/Taipei	Asia - Taipei
1	Africa/Dar_es_Salaam	Africa - Dar es Salaam
1	Europe/Kiev	Europe - Kiev
1	Europe/Uzhgorod	Ruthenia
1	Europe/Zaporozhye	Zaporozh'ye, E Lugansk
1	Europe/Simferopol	Central Crimea
1	Africa/Kampala	Africa - Kampala
1	Pacific/Johnston	Johnston Atoll
1	Pacific/Midway	Midway Islands
1	Pacific/Wake	Wake Island
1	America/New_York	Eastern Time
1	America/Detroit	Eastern Time - Detroit
1	America/Louisville	Eastern Time - Louisville, KY
1	America/Indianapolis	Eastern Standard Time - Indianapolis
1	America/Indiana/Marengo	Eastern Standard Time - Marengo, IN
1	America/Indiana/Knox	Eastern Standard Time - Knox, IN
1	America/Indiana/Vevay	Eastern Standard Time - Vevay, IN
1	America/Chicago	Central Time - Chicago
1	America/Menominee	Central Time - Menominee
1	America/Denver	Mountain Time - Denver
1	America/Boise	Mountain Time - Boise
1	America/Shiprock	Mountain Time - Navajo
1	America/Phoenix	Mountain Standard Time - Arizona
1	America/Los_Angeles	Pacific Time - Los Angeles
1	America/Anchorage	Alaska Time
1	America/Juneau	Alaska Time - Juneau
1	America/Yakutat	Alaska Time - Yakutat
1	America/Nome	Alaska Time - Nome
1	America/Adak	Aleutian Islands
1	Pacific/Honolulu	Hawaii
1	America/Montevideo	America - Montevideo
1	Asia/Samarkand	West Uzbekistan
1	Asia/Tashkent	East Uzbekistan
1	Europe/Vatican	Europe - Vatican
1	America/St_Vincent	America - St Vincent
1	America/Caracas	America - Caracas
1	America/Tortola	America - Tortola
1	America/St_Thomas	America - St Thomas
1	Asia/Saigon	Asia - Saigon
1	Pacific/Efate	Pacific - Efate
1	Pacific/Wallis	Pacific - Wallis
1	Pacific/Apia	Pacific - Apia
1	Asia/Aden	Asia - Aden
1	Indian/Mayotte	Indian - Mayotte
1	Europe/Belgrade	Europe - Belgrade
1	Africa/Johannesburg	Africa - Johannesburg
1	Africa/Lusaka	Africa - Lusaka
1	Africa/Harare	Africa - Harare
2	%l%, f% m	"Clinton, William Jefferson"
2	%l%, f% M	"Clinton, William J."
2	%l%, f	"Clinton, William"
2	%l%, F%M	"Clinton, W.J."
2	%l%, F% m	"Clinton, W. Jefferson"
2	%f% m% l	"William Jefferson Clinton"
2	%f% l	"William Clinton"
2	%f% M% l	"William J. Clinton"
2	%F%M% l	"W.J. Clinton"
2	%F% m% l	"W. Jefferson Clinton"
3	%l%, f% m	"Clinton, William Jefferson"
3	%l%, f% M	"Clinton, William J."
3	%l%, f	"Clinton, William"
3	%l%, F%M	"Clinton, W.J."
3	%l%, F% m	"Clinton, W. Jefferson"
3	%f% m% l	"William Jefferson Clinton"
3	%f% l	"William Clinton"
3	%f% M% l	"William J. Clinton"
3	%F%M% l	"W.J. Clinton"
3	%F% m% l	"W. Jefferson Clinton"
5	%G-%m-%d %T	ISO-8601 Compliant (CCYY-MM-DD hh:mm:ss)
5	%G-%m-%dT%T	ISO-8601 Strict (CCYY-MM-DDThh:mm:ss)
5	%m/%d/%Y %T	U.S. (MM/DD/CCYY hh:mm:ss)
5	%m/%d/%Y	U.S. Date Only (MM/DD/CCYY)
5	%m/%d/%y %T	U.S. Short (MM/DD/YY hh:mm:ss)
5	%m/%d/%y	U.S. Short Date Only (MM/DD/YY)
5	%B %d, %Y %T	U.S. Long (Month DD, CCYY hh:mm:ss)
5	%b %d, %Y %T	U.S. Long Abbrev. (Mon DD, CCYY hh:mm:ss)
5	%B %d, %Y	U.S. Long Date Only (Month DD, CCYY)
5	%b %d, %Y	U.S. Long Abbrev. Date Only (Mon DD, CCYY)
5	%d/%m/%Y %T	European (DD/MM/CCYY hh:mm:ss)
5	%d/%m/%Y	European Date Only (DD/MM/CCYY)
5	%d/%m/%y %T	European Short (DD/MM/YY hh:mm:ss)
5	%d/%m/%y	European Short Date Only (DD/MM/YY)
5	%d %B %Y %T	European Long (DD Month CCYY hh:mm:ss)
5	%d %b %Y %T	European Long Abbrev. (DD Mon CCYY hh:mm:ss)
5	%d %B, %Y	European Long Date Only (DD Month CCYY)
5	%d %b, %Y	European Long Abbrev. Date Only (DD Mon CCYY)
5	epoch	Epoch Time (Seconds since 1970-01-01 00:00:00)
6	radio	Radio Buttons
6	select	Select List
\.


--
-- Data for TOC Entry ID 856 (OID 58139)
--
-- Name: pref_member Type: TABLE DATA Owner: postgres
-- Data Pos: 465635 (Length 61)
--


COPY "pref_member"  FROM stdin;
1	1	401
2	2	402
3	3	403
5	5	405
6	6	156
\.


--
-- Data for TOC Entry ID 857 (OID 58186)
--
-- Name: class Type: TABLE DATA Owner: postgres
-- Data Pos: 465696 (Length 1637)
--


COPY "class"  FROM stdin;
0	bric	Bricolage	Bricolage	Bricolage Root Class	0	0
1	person	Bric::Biz::Person	Person	People	Person objects	0
2	user	Bric::Biz::Person::User	User	Users	User objects	0
3	org	Bric::Biz::Org	Organization	Organizations	Organization objects	0
4	event_type	Bric::Util::EventType	Event Type	Event Types	Event Type objects	0
5	event	Bric::Util::Event	Event	Events	Event objects	0
6	grp	Bric::Util::Grp	Group	Groups	Group objects	0
7	event_grp	Bric::Util::Grp::Event	Event Group	Event Groups	Event Group objects	0
8	user_grp	Bric::Util::Grp::User	User Group	User Groups	User Group objects	0
9	contrib_type	Bric::Util::Grp::Person	Contributor Type	Contributor Types	Contriburtor Type objects	0
10	story	Bric::Biz::Asset::Business::Story	Story	Stories	Story Asset objects	0
11	ftp	Bric::Util::Trans::FTP	FTP	FTP Transport	Class with methods to move files via FTP.	0
12	fs	Bric::Util::Trans::FS	File System	File System Transport	Class with methods to move files within the file system.	1
13	mail	Bric::Util::Trans::Mail	Email	Email Transport	Class with methods to send email.	0
14	action	Bric::Dist::Action	Action	Actions	Factory class for distribution actions.	0
15	akamaize	Bric::Dist::Action::Akamaize	Akamaize	Akamaize	Action subclass that akamaizes resources.	0
16	html_clean	Bric::Dist::Action::HTMLClean	Clean HTML	Clean HTML	Action subclass that cleans up and reformats HTML to make it nice and neat.	0
17	org_grp	Bric::Util::Grp::Org	Organization Group	Organization Groups	Organization Group objects	0
18	alert_type_grp	Bric::Util::Grp::AlertType	Alert Type Group	Alert Type Groups	Alert Type Group objects	0
19	formatting	Bric::Biz::Asset::Formatting	Template	Templates	Templates	0
20	category	Bric::Biz::Category	Category	Categories	Categories	0
21	output_channel	Bric::Biz::OutputChannel	Output Channel	Output Channels	Output Channel	0
22	element	Bric::Biz::AssetType	Element	Elements	Element objects	0
23	category_grp	Bric::Util::Grp::Category	Hierarchical Category Group	Hierarchical Category Groups	Used to group together categories that have a hierarchical relationship to one another.	0
24	asset_type_grp	Bric::Util::Grp::AssetType	Asset Type Group	Asset Type Groups	Asset Type Group	0
25	asset_version_grp	Bric::Util::Grp::AssetVersion	Asset Version Group	Asset Version Groups	Asset Version Group	0
26	asset_language_grp	Bric::Util::Grp::AssetLanguage	Asset Language Group	Asset Language Groups	Asset Language Group	0
27	keyword_grp	Bric::Util::Grp::Keyword	Keyword Group	Keyword Groups	Keyword group	0
29	element_data	Bric::Biz::AssetType::Parts::Data	Element Datum	Element Data	Element Data	0
30	alert_type	Bric::Util::AlertType	Alert Type	Alert Types	Alert type	0
31	alert_type_rule	Bric::Util::AlertType::Parts::Rule	Alert Type Rule	Alert Type Rules	Alert Type rule	0
32	alert	Bric::Util::Alert	Alert	Alerts	Alert	0
33	recip	Bric::Util::Alerted	Recipient	Recipients	Alert recipients	0
34	recip_sent	Bric::Util::Alerted::Parts::Sent	Sent Alert	Sent Alerts	Sent Alert	0
35	source	Bric::Biz::Org::Source	Source	Sources	Source objects	0
36	source_grp	Bric::Util::Grp::Source	Source Group	Source Groups	Source group objects	0
37	element_type	Bric::Biz::ATType	Element Type	Element Types	Element Type objects	0
38	grp_member	Bric::Util::Grp::Parts::Member	Group Member	Group Members	Members of a group	0
39	contrib	Bric::Util::Grp::Parts::Member::Contrib	Contributor	Contributors	Contributors	0
40	desk_grp	Bric::Util::Grp::Desk	Desk Group	Desk Groups	Desk Group	0
41	keyword	Bric::Biz::Keyword	Keyword	Keywords	Keyword	0
42	contact	Bric::Biz::Contact	Contact	Contacts	Contact objects	0
43	asset_grp	Bric::Util::Grp::Asset	Asset Group	Asset Groups	A group of asset objects.	0
44	workflow	Bric::Biz::Workflow	Workflow	Workflows	Workflow objects.	0
45	desk	Bric::Biz::Workflow::Parts::Desk	Desk	Desks	Desk objects.	0
46	media	Bric::Biz::Asset::Business::Media	Media	Media	Media objects.	0
47	category_set	Bric::Util::Grp::CategorySet	Category Group	Category Group	A group of related categories	0
48	pref	Bric::Util::Pref	Preference	Preferences	Preference objects.	0
49	audio	Bric::Biz::Asset::Business::Media::Audio	Audio	Audio	Audio Files	0
50	image	Bric::Biz::Asset::Business::Media::Image	Image	Images	Images	0
51	video	Bric::Biz::Asset::Business::Media::Video	Video	Videos	Videos	0
52	dest	Bric::Dist::ServerType	Destination	Destinations	Distribution destination profile objects.	0
53	server	Bric::Dist::Server	Server	Servers	Server objects.	0
54	job	Bric::Dist::Job	Job	Jobs	Distribution job objects.	0
55	resource	Bric::Dist::Resource	Resource	Resources	Distribution resource objects.	0
56	action_type	Bric::Dist::ActionType	Action Type	Action Types	Distribution action type objects.	0
57	biz	Bric::Biz::Asset::Business	Business Asset	Business Assets	Business Asset objects	0
58	pref_grp	Bric::Util::Grp::Pref	Preference Group	Preference Groups	Group of preferences	0
59	output_channel_grp	Bric::Util::Grp::OutputChannel	Output Channel Group	Output Channel Groups	Group of output channels	0
60	contrib_type_grp	Bric::Util::Grp::ContribType	Contributor Type Group	Contributor Type Groups	Group of contributor types	0
61	workflow_grp	Bric::Util::Grp::Workflow	Workflow Group	Workflow Groups	Group of workflows	0
62	dest_grp	Bric::Util::Grp::Dest	Destination Group	Destination Groups	Group of destinatinos	0
63	job_grp	Bric::Util::Grp::Job	Job Group	Job Groups	Group of jobs	0
64	element_type_grp	Bric::Util::Grp::ElementType	Element Type Group	Element Type Groups	Group of element types	0
65	story_grp	Bric::Util::Grp::Story	Story Group	Story Groups	Group of stories	0
66	media_grp	Bric::Util::Grp::Media	Media Group	Media Groups	Group of media	0
67	formatting_grp	Bric::Util::Grp::Formatting	Template Group	Template Groups	Group of templates	0
68	grp_grp	Bric::Util::Grp::Grp	Group of Groups	Groups of Groups	Group of groups	0
69	asset	Bric::Biz::Asset	Asset	Assets	Asset objects	0
70	element_grp	Bric::Util::Grp::Element	Element Group	Element Groups	Element group objects	0
71	perm	Bric::Util::Priv	Permission	Permissions	Permission objects	0
\.


--
-- Data for TOC Entry ID 858 (OID 58256)
--
-- Name: event_type Type: TABLE DATA Owner: postgres
-- Data Pos: 467333 (Length 2181)
--


COPY "event_type"  FROM stdin;
1024	formatting_deploy	Template Deployed	Template was deployed.	19	1
1025	formatting_redeploy	Template Redeployed	Template was Redeployed.	19	1
1026	story_publish	Story Published	Story was published.	10	1
1027	story_republish	Story Republished	Story was republished.	10	1
1028	media_publish	Media Published	Media was published.	46	1
1029	media_republish	Media Republished	Media was republished.	46	1
1030	formatting_checkin	Template Checked In	Template was checked in.	19	1
1031	story_checkin	Story Checked In	Story was checked in.	10	1
1032	media_checkin	Media Checked In	Media was checked in.	46	1
1033	story_add_contrib	Contributor Added to Story	A contributor was associated with the story.	10	1
1034	story_del_contrib	Contributor Removed from Story	A contributor was dissociated from the story.	10	1
1035	media_add_contrib	Contributor Added to Media	A contributor was associated with the media.	46	1
1036	media_del_contrib	Contributor Removed from Media	A contributor was dissociated from the media.	46	1
1037	media_upload	Media File Uploaded	Media file was uploaded.	46	1
1038	story_add_category	Category Added to Story	A category was associated with the story.	10	1
1039	story_del_category	Category Removed from Story	A category was dissociated from the story.	10	1
1040	story_moved	Story Moved to Desk	Story moved onto a desk.	10	1
1041	media_moved	Media Moved to Desk	Media moved onto a desk.	46	1
1042	formatting_moved	Template Moved to Desk	Template moved onto a desk.	19	1
1043	story_add_workflow	Story Moved into Workflow	Story moved into a workflow.	10	1
1044	media_add_workflow	Media Moved into Workflow	Media moved into a workflow.	46	1
1045	formatting_add_workflow	Template Moved into Workflow	Template moved into a workflow.	19	1
1046	story_rem_workflow	Story Removed from Workflow	Story removed from a workflow.	10	1
1047	media_rem_workflow	Media Removed from Workflow	Media removed from a workflow.	46	1
1048	formatting_rem_workflow	Template Removed from Workflow	Template removed from a workflow.	19	1
1049	story_checkout	Story Checked Out	Story was checked out.	10	1
1050	media_checkout	Media Checked Out	Media was checked out.	46	1
1051	formatting_checkout	Template Checked Out Canceled	Template was checked out.	19	1
1052	story_cancel_checkout	Story Check Out Canceled	Story check out was canceled.	10	1
1053	media_cancel_checkout	Media Check Out Canceled	Media check out was canceled.	46	1
1054	formatting_cancel_checkout	Template Check Out Canceled	Template check out was caneled.	19	1
1055	story_new	Story Created	Story profile was created.	10	1
1056	story_save	Story Changes Saved	Story profile changes were saved.	10	1
1057	story_deact	Story Deactivated	Story profile was deactivated.	10	1
1058	media_new	Media Created	Media profile was created.	46	1
1059	media_save	Media Changes Saved	Media profile changes were saved.	46	1
1060	media_deact	Media Deactivated	Media profile was deactivated.	46	1
1061	formatting_new	Template Created	Template profile was created.	19	1
1062	formatting_save	Template Changes Saved	Template profile changes were saved.	19	1
1063	formatting_deact	Template Deactivated	Template profile was deactivated.	19	1
1064	formatting_edit_code	Template Code Edited	Template profile code was edited.	19	1
1065	story_add_element	Element Added to Story	An element was added to the story.	10	1
1066	media_add_element	Element Added to Media	An element was added to the media.	46	1
1067	story_del_element	Element Deleted from Story	An element was deleted from the story.	10	1
1068	media_del_element	Element Deleted from Media	An element was deleted from the media.	46	1
1069	pref_save	Preference Changes Saved	Preference profile changes were saved.	48	1
1070	user_new	User Created	User profile was created.	2	1
1071	user_save	User Changes Saved	User profile changes were saved.	2	1
1072	user_deact	User Deactivated	User profile was deactivated.	2	1
1073	passwd_chg	User Password Changed	The password was changed.	2	1
1074	grp_new	Group Created	Group profile was created.	6	1
1075	grp_save	Group Saved	Group profile changes were saved.	6	1
1076	grp_deact	Group Deactivated	Group profile was deactivated.	6	1
1077	grp_perm_save	Group Permissions Changed	The permissions associated with the group were changed.	6	1
1078	dest_new	Destination Created	Destination profile was created.	52	1
1079	dest_save	Destination Saved	Destination profile changes were saved.	52	1
1080	dest_deact	Destination Deactivated	Destination profile was deactivated.	52	1
1081	server_new	Server Created	Server profile was created.	53	1
1082	server_save	Server Saved	Server profile changes were saved.	53	1
1083	server_act	Server Activated	Server profile was activated.	53	1
1084	server_deact	Server Deactivated	Server profile was deactivated.	53	1
1085	server_del	Server Deleted	Server profile was deleted.	53	1
1086	action_new	Action Created	Action profile was created.	14	1
1087	action_save	Action Saved	Action profile changes were saved.	14	1
1088	action_act	Action Activated	Action profile was activated.	14	1
1089	action_deact	Action Deactivated	Action profile was deactivated.	14	1
1090	action_del	Action Deleted	Action profile was deleted.	14	1
1091	output_channel_new	Output Channel Created	Output Channel profile was created.	21	1
1092	output_channel_save	Output Channel Changes Saved	Output Channel profile changes were saved.	21	1
1093	output_channel_deact	Output Channel Deactivated	Output Channel profile was deactivated.	21	1
1094	contrib_new	Contributor Created	Contributor profile was created.	39	1
1095	contrib_save	Contributor Changes Saved	Contributor profile changes were saved.	39	1
1096	contrib_deact	Contributor Deactivated	Contributor profile was deactivated.	39	1
1097	contrib_ext	Contributor Forked	Contributor profile was forked to become a new contributor profile.	39	1
1098	contrib_type_new	Contributor Type Created	Contributor Type profile was created.	9	1
1099	contrib_type_save	Contributor Type Changes Saved	Contributor Type profile changes were saved.	9	1
1100	contrib_type_deact	Contributor Type Deactivated	Contributor Type profile was deactivated.	9	1
1101	contrib_type_ext	Contributor Type Attribute Added	A new attribute was added to the Contributor Type profile.	9	1
1102	contrib_type_unext	Contributor Type Attribute Deleted	An attribute was deleted from the Contributor Type profile.	9	1
1103	workflow_new	Workflow Created	Workflow profile was created.	44	1
1104	workflow_save	Workflow Changes Saved	Workflow profile changes were saved.	44	1
1105	workflow_deact	Workflow Deactivated	Workflow profile was deactivated.	44	1
1106	workflow_add_desk	Desk Added to Workflow	A desk was added to the workflow profile.	44	1
1107	workflow_del_desk	Desk Removed from Workflow	A desk was removed from the workflow profile.	44	1
1108	desk_new	Desk Created	Desk profile was created.	45	1
1109	desk_save	Desk Changes Saved	Desk profile changes were saved.	45	1
1110	desk_deact	Desk Deactivated	Desk profile was deactivated.	45	1
1111	category_new	Category Created	Category profile was created.	20	1
1112	category_save	Category Changes Saved	Category profile changes were saved.	20	1
1113	category_deact	Category Deactivated	Category profile was deactivated.	20	1
1114	category_deact_cascade	Category and Subcategories Deactivated	Category profile and all its subcategory profiles were deactivated.	20	1
1115	source_new	Source Created	Source profile was created.	35	1
1116	source_save	Source Changes Saved	Source profile changes were saved.	35	1
1117	source_deact	Source Deactivated	Source profile was deactivated.	35	1
1118	org_new	Organization Created	Organization profile was created.	3	1
1119	org_save	Organization Changes Saved	Organization profile changes were saved.	3	1
1120	org_deact	Organization Deactivated	Organization profile was deactivated.	3	1
1121	element_new	Element Created	Element profile was created.	22	1
1122	element_save	Element Changes Saved	Element profile changes were saved.	22	1
1123	element_deact	Element Deactivated	Element profile was deactivated.	22	1
1124	element_attr_add	Attribute Added to Element	An attribute was added to the element profile.	22	1
1125	element_attr_del	Attribute Deleted from Element	An attribute was deleted from the element profile.	22	1
1126	element_type_new	Element Type Created	Element Type profile was created.	37	1
1127	element_type_save	Element Type Changes Saved	Element Type profile changes were saved.	37	1
1128	element_type_deact	Element Type Deactivated	Element Type profile was deactivated.	37	1
1129	job_new	Job Created	Job was created.	54	1
1130	job_save	Job Changes Saved	Job changes were saved.	54	1
1131	job_cancel	Job Cancelled	Job was cancelled.	54	1
1132	job_exec	Job Executed	Job was executed.	54	1
1133	resource_action	Action Applied to Resource	An action was applied to the resource.	55	1
1134	resource_undo_action	Action Undone on Resource	An action was undone on the resource.	55	1
1135	resource_new	Resource Created	Resource profile was created.	55	1
1136	resource_save	Resource Changes Saved	Resource profile changes were saved.	55	1
1137	resource_move	Resource Distributed	Resource was distributed.	55	1
1138	resource_remove	Resource Removed	Resource was removed.	55	1
1139	alert_type_new	Alert Type Created	Alert Type was created.	30	1
1140	alert_type_save	Alert Type Saved	Alert Type profile changes were saved.	30	1
1141	alert_type_act	Alert Type Activated	Alert Type profile was activated.	30	1
1142	alert_type_deact	Alert Type Deactivated	Alert Type profile was deactivated.	30	1
1143	alert_type_del	Alert Type Deleted	Alert Type profile was deleted.	30	1
\.


--
-- Data for TOC Entry ID 859 (OID 58277)
--
-- Name: event_type_attr Type: TABLE DATA Owner: postgres
-- Data Pos: 469514 (Length 203)
--


COPY "event_type_attr"  FROM stdin;
1024	1033	Name
1025	1034	Name
1026	1035	Name
1027	1036	Name
1028	1038	Category
1029	1039	Category
1030	1040	Desk
1031	1041	Desk
1032	1042	Desk
1033	1043	Workflow
1034	1044	Workflow
1035	1045	Workflow
1036	1065	Element
1037	1066	Element
1038	1067	Element
1039	1068	Element
1040	1101	Name
1041	1102	Name
1042	1106	Desk
1043	1107	Desk
1044	1124	Name
1045	1125	Name
1046	1133	Action
1047	1134	Action
1048	1137	Via
1049	1138	Via
\.


--
-- Data for TOC Entry ID 860 (OID 58324)
--
-- Name: event Type: TABLE DATA Owner: postgres
-- Data Pos: 469717 (Length 27)
--


COPY "event"  FROM stdin;
\.


--
-- Data for TOC Entry ID 861 (OID 58343)
--
-- Name: event_attr Type: TABLE DATA Owner: postgres
-- Data Pos: 469744 (Length 27)
--


COPY "event_attr"  FROM stdin;
\.


--
-- Data for TOC Entry ID 862 (OID 58389)
--
-- Name: contrib_type_member Type: TABLE DATA Owner: postgres
-- Data Pos: 469771 (Length 50)
--


COPY "contrib_type_member"  FROM stdin;
1	1	406
2	39	152
3	40	154
\.


--
-- Data for TOC Entry ID 863 (OID 58411)
--
-- Name: alert_type_member Type: TABLE DATA Owner: postgres
-- Data Pos: 469821 (Length 27)
--


COPY "alert_type_member"  FROM stdin;
\.


--
-- Data for TOC Entry ID 864 (OID 58452)
--
-- Name: user_member Type: TABLE DATA Owner: postgres
-- Data Pos: 469848 (Length 37)
--


COPY "user_member"  FROM stdin;
0	0	1
1	0	2
\.


--
-- Data for TOC Entry ID 865 (OID 58493)
--
-- Name: source_member Type: TABLE DATA Owner: postgres
-- Data Pos: 469885 (Length 35)
--


COPY "source_member"  FROM stdin;
1	1	429
\.


--
-- Data for TOC Entry ID 866 (OID 58534)
--
-- Name: org_member Type: TABLE DATA Owner: postgres
-- Data Pos: 469920 (Length 35)
--


COPY "org_member"  FROM stdin;
1	1	428
\.


--
-- Data for TOC Entry ID 867 (OID 58594)
--
-- Name: member Type: TABLE DATA Owner: postgres
-- Data Pos: 469955 (Length 381)
--


COPY "member"  FROM stdin;
112	35	6	1
113	35	6	1
406	24	9	1
114	35	6	1
115	35	6	1
116	35	6	1
117	35	6	1
118	35	6	1
119	35	6	1
120	35	6	1
121	35	6	1
122	35	6	1
123	35	6	1
124	35	6	1
125	35	6	1
126	35	6	1
127	35	6	1
128	35	6	1
129	35	6	1
130	35	6	1
131	35	6	1
132	35	6	1
133	35	6	1
134	35	6	1
135	35	6	1
136	35	6	1
137	35	6	1
138	35	6	1
139	35	6	1
140	35	6	1
141	35	6	1
142	35	6	1
143	35	6	1
144	35	6	1
145	35	6	1
147	35	6	1
148	35	6	1
149	35	6	1
150	35	6	1
151	35	6	1
152	24	9	1
153	35	6	1
154	24	9	1
157	35	6	1
158	35	6	1
159	35	6	1
160	35	6	1
161	35	6	1
162	35	6	1
163	35	6	1
401	22	48	1
402	22	48	1
403	22	48	1
405	22	48	1
156	22	48	1
410	27	22	1
411	27	22	1
412	27	22	1
413	27	22	1
414	27	22	1
415	27	22	1
416	27	22	1
417	27	22	1
418	27	22	1
419	27	22	1
420	27	22	1
437	27	22	1
438	27	22	1
301	330	22	1
302	331	22	1
303	332	22	1
305	340	22	1
306	340	22	1
307	330	22	1
308	341	22	1
309	332	22	1
310	335	22	1
311	335	22	1
421	28	37	1
422	28	37	1
423	28	37	1
424	28	37	1
425	28	37	1
426	28	37	1
427	28	37	1
0	1	1	1
111	26	20	1
407	25	44	1
201	41	45	1
202	42	45	1
203	41	45	1
204	41	45	1
205	42	45	1
206	41	45	1
207	42	45	1
408	25	44	1
208	43	45	1
209	44	45	1
210	43	45	1
211	44	45	1
212	43	45	1
213	44	45	1
409	25	44	1
214	45	45	1
215	46	45	1
216	45	45	1
217	46	45	1
1	2	2	1
2	6	2	1
428	3	3	1
515	33	19	1
519	33	19	1
521	33	19	1
525	33	19	1
528	33	19	1
532	33	19	1
535	33	19	1
537	33	19	1
540	33	19	1
542	33	19	1
544	33	19	1
546	33	19	1
436	23	21	1
429	5	35	1
\.


--
-- Data for TOC Entry ID 868 (OID 58619)
--
-- Name: story_member Type: TABLE DATA Owner: postgres
-- Data Pos: 470336 (Length 27)
--


COPY "story_member"  FROM stdin;
\.


--
-- Data for TOC Entry ID 869 (OID 58679)
--
-- Name: grp_member Type: TABLE DATA Owner: postgres
-- Data Pos: 470363 (Length 241)
--


COPY "grp_member"  FROM stdin;
1	0	112
2	1	113
3	2	114
4	3	115
5	4	116
6	5	117
7	6	118
8	7	119
9	8	120
10	9	121
11	10	122
12	11	123
13	12	124
14	13	125
15	14	126
16	15	127
17	16	128
18	17	129
19	18	130
20	19	131
21	20	131
22	21	133
23	22	134
24	23	135
25	24	136
26	25	137
27	26	138
28	27	139
29	28	140
30	29	141
31	30	142
32	31	143
33	32	144
34	33	145
36	35	147
37	36	148
38	37	149
39	38	150
40	39	151
41	40	153
42	61	157
43	62	158
44	63	159
45	64	160
46	65	161
47	66	162
48	67	163
\.


--
-- Data for TOC Entry ID 870 (OID 58758)
--
-- Name: attr_member Type: TABLE DATA Owner: postgres
-- Data Pos: 470604 (Length 27)
--


COPY "attr_member"  FROM stdin;
\.


--
-- Data for TOC Entry ID 871 (OID 58777)
--
-- Name: attr_member_val Type: TABLE DATA Owner: postgres
-- Data Pos: 470631 (Length 27)
--


COPY "attr_member_val"  FROM stdin;
\.


--
-- Data for TOC Entry ID 872 (OID 58815)
--
-- Name: attr_member_meta Type: TABLE DATA Owner: postgres
-- Data Pos: 470658 (Length 27)
--


COPY "attr_member_meta"  FROM stdin;
\.


--
-- Data for TOC Entry ID 873 (OID 58895)
--
-- Name: media__resource Type: TABLE DATA Owner: postgres
-- Data Pos: 470685 (Length 27)
--


COPY "media__resource"  FROM stdin;
\.


--
-- Data for TOC Entry ID 874 (OID 58909)
--
-- Name: resource Type: TABLE DATA Owner: postgres
-- Data Pos: 470712 (Length 27)
--


COPY "resource"  FROM stdin;
\.


--
-- Data for TOC Entry ID 875 (OID 58930)
--
-- Name: story__resource Type: TABLE DATA Owner: postgres
-- Data Pos: 470739 (Length 27)
--


COPY "story__resource"  FROM stdin;
\.


--
-- Data for TOC Entry ID 876 (OID 58971)
--
-- Name: server Type: TABLE DATA Owner: postgres
-- Data Pos: 470766 (Length 27)
--


COPY "server"  FROM stdin;
\.


--
-- Data for TOC Entry ID 877 (OID 59042)
--
-- Name: action_type Type: TABLE DATA Owner: postgres
-- Data Pos: 470793 (Length 63)
--


COPY "action_type"  FROM stdin;
1	Move	Puts resources on servers.	1
\.


--
-- Data for TOC Entry ID 878 (OID 59061)
--
-- Name: action_type__media_type Type: TABLE DATA Owner: postgres
-- Data Pos: 470856 (Length 31)
--


COPY "action_type__media_type"  FROM stdin;
1	0
\.


--
-- Data for TOC Entry ID 879 (OID 59122)
--
-- Name: job Type: TABLE DATA Owner: postgres
-- Data Pos: 470887 (Length 27)
--


COPY "job"  FROM stdin;
\.


--
-- Data for TOC Entry ID 880 (OID 59150)
--
-- Name: job__resource Type: TABLE DATA Owner: postgres
-- Data Pos: 470914 (Length 27)
--


COPY "job__resource"  FROM stdin;
\.


--
-- Data for TOC Entry ID 881 (OID 59164)
--
-- Name: job__server_type Type: TABLE DATA Owner: postgres
-- Data Pos: 470941 (Length 27)
--


COPY "job__server_type"  FROM stdin;
\.


--
-- Data for TOC Entry ID 882 (OID 59178)
--
-- Name: job_member Type: TABLE DATA Owner: postgres
-- Data Pos: 470968 (Length 27)
--


COPY "job_member"  FROM stdin;
\.


--
-- Data for TOC Entry ID 883 (OID 59300)
--
-- Name: action Type: TABLE DATA Owner: postgres
-- Data Pos: 470995 (Length 27)
--


COPY "action"  FROM stdin;
\.


--
-- Data for TOC Entry ID 884 (OID 59317)
--
-- Name: attr_action Type: TABLE DATA Owner: postgres
-- Data Pos: 471022 (Length 27)
--


COPY "attr_action"  FROM stdin;
\.


--
-- Data for TOC Entry ID 885 (OID 59337)
--
-- Name: attr_action_val Type: TABLE DATA Owner: postgres
-- Data Pos: 471049 (Length 27)
--


COPY "attr_action_val"  FROM stdin;
\.


--
-- Data for TOC Entry ID 886 (OID 59376)
--
-- Name: attr_action_meta Type: TABLE DATA Owner: postgres
-- Data Pos: 471076 (Length 27)
--


COPY "attr_action_meta"  FROM stdin;
\.


--
-- Data for TOC Entry ID 887 (OID 59444)
--
-- Name: server_type Type: TABLE DATA Owner: postgres
-- Data Pos: 471103 (Length 27)
--


COPY "server_type"  FROM stdin;
\.


--
-- Data for TOC Entry ID 888 (OID 59473)
--
-- Name: server_type__output_channel Type: TABLE DATA Owner: postgres
-- Data Pos: 471130 (Length 27)
--


COPY "server_type__output_channel"  FROM stdin;
\.


--
-- Data for TOC Entry ID 889 (OID 59487)
--
-- Name: dest_member Type: TABLE DATA Owner: postgres
-- Data Pos: 471157 (Length 27)
--


COPY "dest_member"  FROM stdin;
\.


--
-- Data for TOC Entry ID 890 (OID 59635)
--
-- Name: at_data Type: TABLE DATA Owner: postgres
-- Data Pos: 471184 (Length 353)
--


COPY "at_data"  FROM stdin;
1	10	Paragraph	A Paragraph of text.	1	0	1	0	1	\N	1	0	blob
2	10	Previous	Describes previous page.	2	0	0	0	1	\N	1	256	short
3	10	Next	Describes next page.	3	0	0	0	1	\N	1	256	short
4	7	Quote	The pull quote quotation.	1	1	0	0	1	\N	1	1024	short
5	6	Copy	The inset copy text.	1	1	0	0	1	\N	1	1024	short
6	9	Alternate Title	Alternate title to the story's own	1	0	0	0	1	\N	1	256	short
7	9	Alternate Teaser	Alternate teaser to the story's own	2	0	0	0	1	\N	1	512	short
8	11	Title	The book's title.	1	1	0	0	1	\N	1	256	short
9	11	Author	The author's name.	2	1	0	0	1	\N	1	256	short
10	11	Publisher	The book's publisher.	3	1	0	0	1	\N	1	256	short
11	11	Date	The date of publication.	4	1	0	0	1	\N	1	0	date
12	1	Deck	A one-sentence teaser or subhead.	1	1	0	0	1	\N	1	256	short
13	2	Deck	A one-sentence teaser or subhead.	1	1	0	0	1	\N	1	256	short
14	3	Deck	A one-sentence teaser or subhead.	1	1	0	0	1	\N	1	256	short
\.


--
-- Data for TOC Entry ID 891 (OID 59669)
--
-- Name: attr_at_data Type: TABLE DATA Owner: postgres
-- Data Pos: 471537 (Length 119)
--


COPY "attr_at_data"  FROM stdin;
1	id_1	html_info	short	1
2	id_2	html_info	short	1
3	id_3	html_info	short	1
4	id_4	html_info	short	1
5	id_5	html_info	short	1
6	id_6	html_info	short	1
7	id_7	html_info	short	1
8	id_8	html_info	short	1
9	id_9	html_info	short	1
10	id_10	html_info	short	1
11	id_11	html_info	short	1
12	id_12	html_info	short	1
13	id_13	html_info	short	1
14	id_14	html_info	short	1
\.


--
-- Data for TOC Entry ID 892 (OID 59689)
--
-- Name: attr_at_data_val Type: TABLE DATA Owner: postgres
-- Data Pos: 471656 (Length 98)
--


COPY "attr_at_data_val"  FROM stdin;
1	1	1	\N	\N	\N	0	1
2	2	2	\N	\N	\N	0	1
3	3	3	\N	\N	\N	0	1
4	4	4	\N	\N	\N	0	1
5	5	5	\N	\N	\N	0	1
6	6	6	\N	\N	\N	0	1
7	7	7	\N	\N	\N	0	1
8	8	8	\N	\N	\N	0	1
9	9	9	\N	\N	\N	0	1
10	10	10	\N	\N	\N	0	1
11	11	11	\N	\N	\N	0	1
12	12	12	\N	\N	\N	0	1
13	13	13	\N	\N	\N	0	1
14	14	14	\N	\N	\N	0	1
\.


--
-- Data for TOC Entry ID 893 (OID 59728)
--
-- Name: attr_at_data_meta Type: TABLE DATA Owner: postgres
-- Data Pos: 471754 (Length 828)
--


COPY "attr_at_data_meta"  FROM stdin;
1	1	cols	50	1
2	1	maxlength		1
3	1	length		1
4	1	vals		1
5	1	multiple		1
6	1	rows	8	1
7	1	value		1
8	1	pos	1	1
9	1	disp	Paragraph	1
10	1	type	textarea	1
11	2	cols		1
12	2	maxlength	256	1
13	2	length	32	1
14	2	vals		1
15	2	multiple		1
16	2	rows		1
17	2	value		1
18	2	pos	2	1
19	2	disp	Previous	1
20	2	type	text	1
21	3	cols		1
22	3	maxlength	256	1
23	3	length	32	1
24	3	vals		1
25	3	multiple		1
26	3	rows		1
27	3	value		1
28	3	pos	3	1
29	3	disp	Next	1
30	3	type	text	1
31	4	cols	40	1
32	4	maxlength	1024	1
33	4	length		1
34	4	vals		1
35	4	multiple		1
36	4	rows	4	1
37	4	value		1
38	4	pos	1	1
39	4	disp	Quote	1
40	4	type	textarea	1
41	5	cols	50	1
42	5	maxlength	1024	1
43	5	length		1
44	5	vals		1
45	5	multiple		1
46	5	rows	8	1
47	5	value		1
48	5	pos	1	1
49	5	disp	Copy	1
50	5	type	textarea	1
51	6	cols		1
52	6	maxlength	256	1
53	6	length	32	1
54	6	vals		1
55	6	multiple		1
56	6	rows		1
57	6	value		1
58	6	pos	1	1
59	6	disp	Alternate Title	1
60	6	type	text	1
61	7	cols	40	1
62	7	maxlength	512	1
63	7	length		1
64	7	vals		1
65	7	multiple		1
66	7	rows	4	1
67	7	value		1
68	7	pos	2	1
69	7	disp	Alternate Teaser	1
70	7	type	textarea	1
71	8	cols		1
72	8	maxlength	256	1
73	8	length	32	1
74	8	vals		1
75	8	multiple		1
76	8	rows		1
77	8	value		1
78	8	pos	1	1
79	8	disp	Title	1
80	8	type	text	1
81	9	cols		1
82	9	maxlength	256	1
83	9	length	32	1
84	9	vals		1
85	9	multiple		1
86	9	rows		1
87	9	value		1
88	9	pos	2	1
89	9	disp	Author	1
90	9	type	text	1
91	10	cols		1
92	10	maxlength	256	1
93	10	length	32	1
94	10	vals		1
95	10	multiple		1
96	10	rows		1
97	10	value		1
98	10	pos	3	1
99	10	disp	Publisher	1
100	10	type	text	1
101	11	cols		1
102	11	maxlength		1
103	11	length		1
104	11	vals		1
105	11	multiple		1
106	11	rows		1
107	11	value		1
108	11	pos	4	1
109	11	disp	Date	1
110	11	type	date	1
111	12	cols	40	1
112	12	maxlength	256	1
113	12	length		1
114	12	vals		1
115	12	multiple		1
116	12	rows	4	1
117	12	value		1
118	12	pos	1	1
119	12	disp	Deck	1
120	12	type	textarea	1
121	13	cols	40	1
122	13	maxlength	256	1
123	13	length		1
124	13	vals		1
125	13	multiple		1
126	13	rows	4	1
127	13	value		1
128	13	pos	1	1
129	13	disp	Deck	1
130	13	type	textarea	1
131	14	cols	40	1
132	14	maxlength	256	1
133	14	length		1
134	14	vals		1
135	14	multiple		1
136	14	rows	4	1
137	14	value		1
138	14	pos	1	1
139	14	disp	Deck	1
140	14	type	textarea	1
\.


--
-- Data for TOC Entry ID 894 (OID 59913)
--
-- Name: element Type: TABLE DATA Owner: postgres
-- Data Pos: 472582 (Length 293)
--


COPY "element"  FROM stdin;
1	Story	A story element	1	0	1	330	1	1
2	Column	A weekly column element	1	0	1	331	1	1
3	Book Review	A book review element	1	0	1	332	1	1
4	Photograph	A photograph element	1	0	2	333	1	1
5	Illustration	An illustration element	1	0	2	334	1	1
6	Inset	An inset element	1	0	3	\N	\N	1
7	Pull Quote	A pull quote element	1	0	3	\N	\N	1
8	Related Stories	A related stories element.	1	0	3	341	\N	1
9	Related Story	A related story element.	1	0	4	\N	\N	1
10	Page	A page element.	1	0	5	340	\N	1
11	Book Profile	A book profile inset element.	1	0	3	\N	\N	1
12	Related Media	A related media element.	1	0	6	\N	\N	1
13	Cover	A cover element.	1	0	7	335	1	1
\.


--
-- Data for TOC Entry ID 895 (OID 59940)
--
-- Name: element__output_channel Type: TABLE DATA Owner: postgres
-- Data Pos: 472875 (Length 56)
--


COPY "element__output_channel"  FROM stdin;
1	1	1	1
4	2	1	1
7	3	1	1
10	4	1	1
13	5	1	1
14	13	1	1
\.


--
-- Data for TOC Entry ID 896 (OID 59959)
--
-- Name: element_member Type: TABLE DATA Owner: postgres
-- Data Pos: 472931 (Length 140)
--


COPY "element_member"  FROM stdin;
11	1	410
12	2	411
13	3	412
14	4	413
15	5	414
16	6	415
17	7	416
18	8	417
19	9	418
20	10	419
21	11	420
22	12	437
23	13	438
1	10	301
2	10	302
3	10	303
5	7	305
6	6	306
7	7	307
8	9	308
9	11	309
10	8	310
24	12	311
\.


--
-- Data for TOC Entry ID 897 (OID 59975)
--
-- Name: attr_element Type: TABLE DATA Owner: postgres
-- Data Pos: 473071 (Length 27)
--


COPY "attr_element"  FROM stdin;
\.


--
-- Data for TOC Entry ID 898 (OID 59995)
--
-- Name: attr_element_val Type: TABLE DATA Owner: postgres
-- Data Pos: 473098 (Length 27)
--


COPY "attr_element_val"  FROM stdin;
\.


--
-- Data for TOC Entry ID 899 (OID 60034)
--
-- Name: attr_element_meta Type: TABLE DATA Owner: postgres
-- Data Pos: 473125 (Length 27)
--


COPY "attr_element_meta"  FROM stdin;
\.


--
-- Data for TOC Entry ID 900 (OID 60161)
--
-- Name: at_type Type: TABLE DATA Owner: postgres
-- Data Pos: 473152 (Length 154)
--


COPY "at_type"  FROM stdin;
1	Stories	Story Types	1	0	0	0	0	0	10	1
2	Media	Media Types	1	0	0	0	0	1	46	1
3	Insets	Inset Elements	0	0	0	0	0	0	10	1
4	Related Stories	Related Story Elements	0	0	0	1	0	0	10	1
5	Pages	Page Elements	0	1	0	0	0	0	10	1
6	Related Media	Related Media Elements	0	0	0	0	1	0	10	1
7	Covers	Cover Story Types	1	0	1	0	0	0	10	1
\.


--
-- Data for TOC Entry ID 901 (OID 60199)
--
-- Name: element_type_member Type: TABLE DATA Owner: postgres
-- Data Pos: 473306 (Length 66)
--


COPY "element_type_member"  FROM stdin;
1	1	421
2	2	422
3	3	423
4	4	424
5	5	425
6	6	426
7	7	427
\.


--
-- Data for TOC Entry ID 902 (OID 60227)
--
-- Name: contact Type: TABLE DATA Owner: postgres
-- Data Pos: 473372 (Length 260)
--


COPY "contact"  FROM stdin;
1	Primary Email	Primary Electronic Mail Address	1	1
2	Secondary Email	Secondary Electronic Mail Address	1	1
3	Business Phone	Business Phone Number	1	0
4	Home Phone	Home Phone Number	1	0
5	Fax	Fax Number	1	0
6	Mobile Phone	Mobile Phone Number	1	0
7	Pager	Pager Number	1	0
8	Pager Email	Email Address for Pager	1	1
9	AIM ID	AOL Instant Messenger ID	1	0
10	ICQ ID	ICQ Messenger ID	1	0
11	MSN ID	Microsoft Messenger ID	1	0
12	Yahoo! Pager ID	Yahoo! Pager Messenger ID	1	0
13	Jabber ID	Jabber Messenger ID	1	0
14	WWW	WWW URL	1	0
\.


--
-- Data for TOC Entry ID 903 (OID 60249)
--
-- Name: contact_value Type: TABLE DATA Owner: postgres
-- Data Pos: 473632 (Length 27)
--


COPY "contact_value"  FROM stdin;
\.


--
-- Data for TOC Entry ID 904 (OID 60268)
--
-- Name: person__contact_value Type: TABLE DATA Owner: postgres
-- Data Pos: 473659 (Length 27)
--


COPY "person__contact_value"  FROM stdin;
\.


--
-- Data for TOC Entry ID 905 (OID 60335)
--
-- Name: person Type: TABLE DATA Owner: postgres
-- Data Pos: 473686 (Length 58)
--


COPY "person"  FROM stdin;
0		Administrator	Bricolage			1
\.


--
-- Data for TOC Entry ID 906 (OID 60357)
--
-- Name: person_member Type: TABLE DATA Owner: postgres
-- Data Pos: 473744 (Length 33)
--


COPY "person_member"  FROM stdin;
0	0	0
\.


--
-- Data for TOC Entry ID 907 (OID 60521)
--
-- Name: category Type: TABLE DATA Owner: postgres
-- Data Pos: 473777 (Length 39)
--


COPY "category"  FROM stdin;
0		750	\N	\N	1
\.


--
-- Data for TOC Entry ID 908 (OID 60542)
--
-- Name: category_member Type: TABLE DATA Owner: postgres
-- Data Pos: 473816 (Length 35)
--


COPY "category_member"  FROM stdin;
1	0	111
\.


--
-- Data for TOC Entry ID 909 (OID 60558)
--
-- Name: attr_category Type: TABLE DATA Owner: postgres
-- Data Pos: 473851 (Length 27)
--


COPY "attr_category"  FROM stdin;
\.


--
-- Data for TOC Entry ID 910 (OID 60578)
--
-- Name: attr_category_val Type: TABLE DATA Owner: postgres
-- Data Pos: 473878 (Length 27)
--


COPY "attr_category_val"  FROM stdin;
\.


--
-- Data for TOC Entry ID 911 (OID 60617)
--
-- Name: attr_category_meta Type: TABLE DATA Owner: postgres
-- Data Pos: 473905 (Length 27)
--


COPY "attr_category_meta"  FROM stdin;
\.


--
-- Data for TOC Entry ID 912 (OID 60735)
--
-- Name: keyword Type: TABLE DATA Owner: postgres
-- Data Pos: 473932 (Length 27)
--


COPY "keyword"  FROM stdin;
\.


--
-- Data for TOC Entry ID 913 (OID 60760)
--
-- Name: keyword_member Type: TABLE DATA Owner: postgres
-- Data Pos: 473959 (Length 27)
--


COPY "keyword_member"  FROM stdin;
\.


--
-- Data for TOC Entry ID 914 (OID 60832)
--
-- Name: workflow Type: TABLE DATA Owner: postgres
-- Data Pos: 473986 (Length 106)
--


COPY "workflow"  FROM stdin;
101	Story	Story Workflow	41	42	101	2	1
102	Media	Media Workflow	43	44	105	3	1
103	Template	Template Workflow	45	46	106	1	1
\.


--
-- Data for TOC Entry ID 915 (OID 60855)
--
-- Name: workflow_member Type: TABLE DATA Owner: postgres
-- Data Pos: 474092 (Length 52)
--


COPY "workflow_member"  FROM stdin;
1	101	407
2	102	408
3	103	409
\.


--
-- Data for TOC Entry ID 916 (OID 60918)
--
-- Name: desk Type: TABLE DATA Owner: postgres
-- Data Pos: 474144 (Length 144)
--


COPY "desk"  FROM stdin;
101	Edit	Edit Desk	\N	\N	61	0	1
102	Copy	Copy Desk	\N	\N	62	0	1
103	Legal	Legal Desk	\N	\N	63	0	1
104	Publish	Publish Desk	\N	\N	64	1	1
105	Art	Art Desk	\N	\N	65	0	1
106	Development	Development Desk	\N	\N	66	0	1
107	Deploy	Deploy Desk	\N	\N	67	1	1
\.


--
-- Data for TOC Entry ID 917 (OID 60943)
--
-- Name: desk_member Type: TABLE DATA Owner: postgres
-- Data Pos: 474288 (Length 116)
--


COPY "desk_member"  FROM stdin;
101	101	201
102	101	202
103	102	203
104	103	204
105	103	205
106	104	206
107	104	207
108	105	208
109	105	209
110	103	210
111	103	211
112	104	212
113	104	213
114	106	214
115	106	215
116	107	216
117	107	217
\.


--
-- Data for TOC Entry ID 918 (OID 60977)
--
-- Name: usr Type: TABLE DATA Owner: postgres
-- Data Pos: 474404 (Length 70)
--


COPY "usr"  FROM stdin;
0	admin	0a3e416ccf73bcfe645f05791f77caf6	1
\.


--
-- Data for TOC Entry ID 919 (OID 61000)
--
-- Name: org Type: TABLE DATA Owner: postgres
-- Data Pos: 474474 (Length 45)
--


COPY "org"  FROM stdin;
1	Internal	\N	0	1
\.


--
-- Data for TOC Entry ID 920 (OID 61158)
--
-- Name: formatting Type: TABLE DATA Owner: postgres
-- Data Pos: 474519 (Length 381)
--


COPY "formatting"  FROM stdin;
502	Book Profile	A default book profile	3	\N	1	11	0	/book_profile.mc	1	\N	1	2001-07-30 22:34:21+02	\N	1
503	Book Review	A default book review	3	\N	1	3	0	/book_review.mc	1	\N	1	2001-07-30 22:34:22+02	\N	1
504	Column	A default column	3	\N	1	2	0	/column.mc	1	\N	1	2001-07-30 22:34:22+02	\N	1
506	Inset	A generic inset	3	\N	1	6	0	/inset.mc	1	\N	1	2001-07-30 22:34:23+02	\N	1
507	Page	A generic page	3	\N	1	10	0	/page.mc	1	\N	1	2001-07-30 22:34:20+02	\N	1
509	Pull Quote	A generic pull quote	3	\N	1	7	0	/pull_quote.mc	1	\N	1	2001-07-30 22:34:20+02	\N	1
510	Related Stories	A generic related stories template	3	\N	1	8	0	/related_stories.mc	1	\N	1	2001-07-30 22:34:21+02	\N	1
511	Related Story	A generic related story	3	\N	1	9	0	/related_story.mc	1	\N	1	2001-07-30 22:34:21+02	\N	1
512	Story	A generic story template	3	\N	1	1	0	/story.mc	1	\N	1	2001-07-30 22:34:22+02	\N	1
513	autohandler	A generic root level autohandler template	3	\N	1	\N	0	/autohandler	1	\N	1	2001-07-30 22:34:22+02	\N	1
514	Related Media	A default related media template	3	\N	1	12	0	/related_media.mc	1	\N	1	2001-08-01 23:51:34+02	\N	1
515	Cover	A default cover template	3	\N	1	13	0	/cover.mc	1	\N	1	2001-08-01 23:51:34+02	\N	1
\.


--
-- Data for TOC Entry ID 921 (OID 61192)
--
-- Name: formatting_instance Type: TABLE DATA Owner: postgres
-- Data Pos: 474900 (Length 1260)
--


COPY "formatting_instance"  FROM stdin;
501	502	1	0	\
<!-- Start "Book Profile" -->\
<table>\
<tr>\
<td>Title</td>\
<td><% $element->get_data('title') %></td>\
</tr>\
<tr>\
<td>Author</td>\
<td><% $element->get_data('author') %></td>\
</tr>\
<tr>\
<td>Publisher</td>\
<td><% $element->get_data('date') %></td>\
</tr>\
</table>\
<!-- End "Book Profile" -->\
	0
502	503	1	0	<!-- Start "Book Review" -->\
\
%# Only show this if we are on the first page\
% unless ($burner->get_page) {\
<h1><% $story->get_title %></h1>\
<% $element->get_data('deck') %>\
<hr />\
% }\
\
%# Display all the pages of this story\
% $burner->display_pages('page');\
\
<br>\
Page <% $burner->get_page + 1 %>\
<!-- End "Book Review" -->\
	0
503	504	1	0	\
<!-- Start "Column" -->\
\
%# Only show this if we are on the first page\
% unless ($burner->get_page) {\
<h1><% $story->get_title %></h1>\
<% $element->get_data('deck') %>\
<hr />\
% }\
\
%# Display all the pages of this story\
% $burner->display_pages('page');\
\
<br>\
Page <% $burner->get_page + 1 %>\
<!-- End "Column" -->\
	0
505	506	1	0	\
<!-- Start 'Inset' -->\
<table>\
<tr><td>\
<% $element->get_data('copy') %>\
</td></tr>\
</table>\
<!-- End 'Inset' -->\
	0
506	507	1	0	<!-- Start "Page" -->\
<%perl>\
foreach my $e ($element->get_elements) {\
    if ($e->has_name('paragraph')) {\
        $m->out('<p>'.$e->get_data.'</p>');\
\
    } elsif ($e->has_name('pull_quote')) {\
        $burner->display_element($e);\
\
    } elsif ($e->has_name('inset')) {\
        $burner->display_element($e);\
\
    }\
}\
</%perl>\
\
<hr />\
\
%# $burner numbers pages from '0' not '1'.\
% my $pnum = $burner->get_page + 1;\
\
%# Show 'previous' link\
% my $prev = $element->get_data('previous');\
% if ($prev) {\
<a href="index<% $pnum-2 != 0 ? $pnum-2 : '' %>.html">\
&lt;&lt;&lt; Page <% $pnum - 1 %> : </a>\
<% $prev %>\
% }\
\
&nbsp;&nbsp;&nbsp;\
\
%# Show 'next' link\
% my $next = $element->get_data('next');\
% if ($next) {\
<% $next %>\
<a href="index<% $pnum %>.html">\
 : Page <% $pnum + 1 %> &gt;&gt;&gt;\
</a>\
% }\
\
<!-- End "Page" -->\
	0
508	509	1	0	\
<!-- Start "Pull Quote" -->\
&quot;<% $element->get_data('quote') %>&quot;\
<!-- End "Pull Quote" -->	0
509	510	1	0	\
<!-- Start "Related Stories" -->\
% my @rel = $element->get_elements;\
\
% if (@rel > 0) {\
<table>\
\
% foreach my $rs (@rel) {\
<tr><td>\
% $burner->display_element($rs);\
</td></tr>\
% }\
\
</table>\
% }\
<!-- End "Related Stories" -->\
	0
510	511	1	0	\
<!-- Start "Related Story" -->\
% my $rel_story = $element->get_related_story;\
<b>Title:</b>&nbsp;\
<% $element->get_data('alternate_title') || $rel_story->get_title %><br />\
<b>Teaser:</b>&nbsp;\
<% $element->get_data('alternate_teaser') ||\
$rel_story->get_description %><br />\
<!-- End "Related Story" -->\
	0
511	512	1	0	\
<!-- Start "Story" -->\
\
%# Only show this if we are on the first page\
% unless ($burner->get_page     ) {\
<h1><% $story->get_title %></h1>\
<% $element->get_data('deck') %>\
<hr />\
% }\
\
%# Display all the pages of this story\
% $burner->display_pages('page');\
\
<br>\
Page <% $burner->get_page + 1 %>\
<!-- End "Story" -->\
	0
512	513	1	0	\
<!-- Start "autohandler" -->\
<html>\
    <head>\
        <title><% $story->get_title %></title>\
    </head>\
    <body>\
% $burner->chain_next;\
    </body>\
</html>\
<!-- End "autohandler" -->\
	0
513	514	1	0	<!-- Start "Related Media" -->\
% my $rel_media = $element->get_related_media;\
\
%# This template only handles images.\
% if (substr($rel_media->get_media_type->get_name, 0, 5) eq 'image') {\
<img src="<% $rel_media->get_uri %>">\
% }\
<!-- End "Related Media" -->	0
514	515	1	0	\
<!-- Start "Cover" -->\
%# Lets make this a 3 column cover.\
% my @elem = $element->get_elements;\
%# Find the elements per column\
% my $per_col = int((scalar @elem)/3)+1;\
\
<table>\
<tr>\
<%perl>\
# Lay these elements out over three columns.\
while (scalar @elem) {\
    foreach (1..$per_col) {\
        my $e = shift @elem || last;\
        $burner->display_element($e);\
        $m->out('<br />');\
    }\
}\
</%perl>\
</tr>\
</table>\
<!-- End "Cover" -->\
	0
\.


--
-- Data for TOC Entry ID 922 (OID 61228)
--
-- Name: formatting_member Type: TABLE DATA Owner: postgres
-- Data Pos: 476160 (Length 104)
--


COPY "formatting_member"  FROM stdin;
501	502	515
503	503	519
505	504	521
509	506	525
511	507	528
515	509	532
517	510	535
519	511	537
521	512	540
523	513	542
525	514	544
526	515	546
\.


--
-- Data for TOC Entry ID 923 (OID 61244)
--
-- Name: attr_formatting Type: TABLE DATA Owner: postgres
-- Data Pos: 476264 (Length 60)
--


COPY "attr_formatting"  FROM stdin;
502	deskstamps	1	short	1
503	deskstamps	2	short	1
\.


--
-- Data for TOC Entry ID 924 (OID 61264)
--
-- Name: attr_formatting_val Type: TABLE DATA Owner: postgres
-- Data Pos: 476324 (Length 159)
--


COPY "attr_formatting_val"  FROM stdin;
502	502	502	\N	106	\N	\N	1
504	503	502	\N	106	\N	\N	1
506	504	502	\N	106	\N	\N	1
510	506	502	\N	106	\N	\N	1
512	507	502	\N	106	\N	\N	1
516	509	502	\N	106	\N	\N	1
518	510	502	\N	106	\N	\N	1
520	511	502	\N	106	\N	\N	1
522	512	502	\N	106	\N	\N	1
524	513	502	\N	106	\N	\N	1
525	513	503	\N	107	\N	\N	1
526	512	503	\N	107	\N	\N	1
527	511	503	\N	107	\N	\N	1
528	510	503	\N	107	\N	\N	1
529	509	503	\N	107	\N	\N	1
531	507	503	\N	107	\N	\N	1
532	506	503	\N	107	\N	\N	1
534	504	503	\N	107	\N	\N	1
535	503	503	\N	107	\N	\N	1
536	502	503	\N	107	\N	\N	1
538	514	502	\N	106	\N	\N	1
540	515	502	\N	106	\N	\N	1
542	514	503	\N	107	\N	\N	1
544	515	503	\N	107	\N	\N	1
\.


--
-- Data for TOC Entry ID 925 (OID 61303)
--
-- Name: attr_formatting_meta Type: TABLE DATA Owner: postgres
-- Data Pos: 476483 (Length 27)
--


COPY "attr_formatting_meta"  FROM stdin;
\.


--
-- Data for TOC Entry ID 926 (OID 61531)
--
-- Name: story Type: TABLE DATA Owner: postgres
-- Data Pos: 476510 (Length 27)
--


COPY "story"  FROM stdin;
\.


--
-- Data for TOC Entry ID 927 (OID 61564)
--
-- Name: story_instance Type: TABLE DATA Owner: postgres
-- Data Pos: 476537 (Length 27)
--


COPY "story_instance"  FROM stdin;
\.


--
-- Data for TOC Entry ID 928 (OID 61587)
--
-- Name: story__category Type: TABLE DATA Owner: postgres
-- Data Pos: 476564 (Length 27)
--


COPY "story__category"  FROM stdin;
\.


--
-- Data for TOC Entry ID 929 (OID 61606)
--
-- Name: story__contributor Type: TABLE DATA Owner: postgres
-- Data Pos: 476591 (Length 27)
--


COPY "story__contributor"  FROM stdin;
\.


--
-- Data for TOC Entry ID 930 (OID 61624)
--
-- Name: attr_story Type: TABLE DATA Owner: postgres
-- Data Pos: 476618 (Length 27)
--


COPY "attr_story"  FROM stdin;
\.


--
-- Data for TOC Entry ID 931 (OID 61644)
--
-- Name: attr_story_val Type: TABLE DATA Owner: postgres
-- Data Pos: 476645 (Length 27)
--


COPY "attr_story_val"  FROM stdin;
\.


--
-- Data for TOC Entry ID 932 (OID 61683)
--
-- Name: attr_story_meta Type: TABLE DATA Owner: postgres
-- Data Pos: 476672 (Length 27)
--


COPY "attr_story_meta"  FROM stdin;
\.


--
-- Data for TOC Entry ID 933 (OID 61958)
--
-- Name: media Type: TABLE DATA Owner: postgres
-- Data Pos: 476699 (Length 27)
--


COPY "media"  FROM stdin;
\.


--
-- Data for TOC Entry ID 934 (OID 61990)
--
-- Name: media_instance Type: TABLE DATA Owner: postgres
-- Data Pos: 476726 (Length 27)
--


COPY "media_instance"  FROM stdin;
\.


--
-- Data for TOC Entry ID 935 (OID 62033)
--
-- Name: media_fields Type: TABLE DATA Owner: postgres
-- Data Pos: 476753 (Length 120)
--


COPY "media_fields"  FROM stdin;
0	50	Width	get_width	1
1	50	Height	get_height	1
2	50	Color Type	get_color_type	1
3	50	Resolution	get_resolution	1
4	50	Compression	get_compression	1
\.


--
-- Data for TOC Entry ID 936 (OID 62053)
--
-- Name: media__contributor Type: TABLE DATA Owner: postgres
-- Data Pos: 476873 (Length 27)
--


COPY "media__contributor"  FROM stdin;
\.


--
-- Data for TOC Entry ID 937 (OID 62071)
--
-- Name: media_member Type: TABLE DATA Owner: postgres
-- Data Pos: 476900 (Length 27)
--


COPY "media_member"  FROM stdin;
\.


--
-- Data for TOC Entry ID 938 (OID 62087)
--
-- Name: image_member Type: TABLE DATA Owner: postgres
-- Data Pos: 476927 (Length 27)
--


COPY "image_member"  FROM stdin;
\.


--
-- Data for TOC Entry ID 939 (OID 62103)
--
-- Name: attr_media Type: TABLE DATA Owner: postgres
-- Data Pos: 476954 (Length 27)
--


COPY "attr_media"  FROM stdin;
\.


--
-- Data for TOC Entry ID 940 (OID 62123)
--
-- Name: attr_media_val Type: TABLE DATA Owner: postgres
-- Data Pos: 476981 (Length 27)
--


COPY "attr_media_val"  FROM stdin;
\.


--
-- Data for TOC Entry ID 941 (OID 62162)
--
-- Name: attr_media_meta Type: TABLE DATA Owner: postgres
-- Data Pos: 477008 (Length 27)
--


COPY "attr_media_meta"  FROM stdin;
\.


--
-- Data for TOC Entry ID 942 (OID 62313)
--
-- Name: story_data_tile Type: TABLE DATA Owner: postgres
-- Data Pos: 477035 (Length 27)
--


COPY "story_data_tile"  FROM stdin;
\.


--
-- Data for TOC Entry ID 943 (OID 62358)
--
-- Name: media_data_tile Type: TABLE DATA Owner: postgres
-- Data Pos: 477062 (Length 27)
--


COPY "media_data_tile"  FROM stdin;
\.


--
-- Data for TOC Entry ID 944 (OID 62465)
--
-- Name: story_container_tile Type: TABLE DATA Owner: postgres
-- Data Pos: 477089 (Length 27)
--


COPY "story_container_tile"  FROM stdin;
\.


--
-- Data for TOC Entry ID 945 (OID 62491)
--
-- Name: media_container_tile Type: TABLE DATA Owner: postgres
-- Data Pos: 477116 (Length 27)
--


COPY "media_container_tile"  FROM stdin;
\.


--
-- Data for TOC Entry ID 946 (OID 62579)
--
-- Name: output_channel Type: TABLE DATA Owner: postgres
-- Data Pos: 477143 (Length 65)
--


COPY "output_channel"  FROM stdin;
1	Web	Ouput to the Web			index	html	1	1
\.


--
-- Data for TOC Entry ID 947 (OID 62603)
--
-- Name: output_channel_member Type: TABLE DATA Owner: postgres
-- Data Pos: 477208 (Length 35)
--


COPY "output_channel_member"  FROM stdin;
1	1	436
\.


--
-- Data for TOC Entry ID 948 (OID 62634)
--
-- Name: person_org Type: TABLE DATA Owner: postgres
-- Data Pos: 477243 (Length 27)
--


COPY "person_org"  FROM stdin;
\.


--
-- Data for TOC Entry ID 949 (OID 62706)
--
-- Name: source Type: TABLE DATA Owner: postgres
-- Data Pos: 477270 (Length 71)
--


COPY "source"  FROM stdin;
1	1	Internal Source (Rename)	Ourselves.	0	1
\.


--
-- Data for TOC Entry ID 950 (OID 62734)
--
-- Name: addr Type: TABLE DATA Owner: postgres
-- Data Pos: 477341 (Length 27)
--


COPY "addr"  FROM stdin;
\.


--
-- Data for TOC Entry ID 951 (OID 62753)
--
-- Name: addr_part_type Type: TABLE DATA Owner: postgres
-- Data Pos: 477368 (Length 67)
--


COPY "addr_part_type"  FROM stdin;
1	Line	1
2	City	1
3	State	1
4	Code	1
5	Country	1
\.


--
-- Data for TOC Entry ID 952 (OID 62771)
--
-- Name: addr_part Type: TABLE DATA Owner: postgres
-- Data Pos: 477435 (Length 27)
--


COPY "addr_part"  FROM stdin;
\.


--
-- Data for TOC Entry ID 953 (OID 62788)
--
-- Name: person_org__addr Type: TABLE DATA Owner: postgres
-- Data Pos: 477462 (Length 27)
--


COPY "person_org__addr"  FROM stdin;
\.


--
-- Data for TOC Entry ID 954 (OID 0)
--
-- Name: BLOBS Type: BLOBS Owner: 
-- Data Pos: 477489 (Length 0)
--


--
-- SKIPPED 
--

--
-- TOC Entry ID 532 (OID 57440)
--
-- Name: "idx_grp__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_grp__name" on "grp" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 533 (OID 57440)
--
-- Name: "fkx_grp__grp" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_grp__grp" on "grp" using btree ( "parent_id" "numeric_ops" );

--
-- TOC Entry ID 534 (OID 57440)
--
-- Name: "fkx_class__grp" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_class__grp" on "grp" using btree ( "class__id" "numeric_ops" );

--
-- TOC Entry ID 535 (OID 57514)
--
-- Name: "udx_media_type__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_media_type__name" on "media_type" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 536 (OID 57514)
--
-- Name: "udx_media_type_ext__extension" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_media_type_ext__extension" on "media_type" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 537 (OID 57533)
--
-- Name: "fkx_media_type__media_type_ext" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_media_type__media_type_ext" on "media_type_ext" using btree ( "media_type__id" "numeric_ops" );

--
-- TOC Entry ID 538 (OID 57558)
--
-- Name: "idx_alerted__ack_time" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_alerted__ack_time" on "alerted" using btree ( "ack_time" "timestamp_ops" );

--
-- TOC Entry ID 539 (OID 57558)
--
-- Name: "fkx_alert__alerted" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_alert__alerted" on "alerted" using btree ( "alert__id" "numeric_ops" );

--
-- TOC Entry ID 540 (OID 57558)
--
-- Name: "fkx_usr__alerted" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_usr__alerted" on "alerted" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 541 (OID 57575)
--
-- Name: "idx_ac_value__sent_time" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_ac_value__sent_time" on "alerted__contact_value" using btree ( "sent_time" "timestamp_ops" );

--
-- TOC Entry ID 542 (OID 57575)
--
-- Name: "idx_ac_value__cv__value" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_ac_value__cv__value" on "alerted__contact_value" using btree ( "contact_value__value" "varchar_ops" );

--
-- TOC Entry ID 543 (OID 57575)
--
-- Name: "fkx_alerted__alerted__contact" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_alerted__alerted__contact" on "alerted__contact_value" using btree ( "alerted__id" "numeric_ops" );

--
-- TOC Entry ID 544 (OID 57575)
--
-- Name: "fkx_contact__alerted__cont" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_contact__alerted__cont" on "alerted__contact_value" using btree ( "contact__id" "numeric_ops" );

--
-- TOC Entry ID 545 (OID 57631)
--
-- Name: "idx_alert_type_rule__attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_alert_type_rule__attr" on "alert_type_rule" using btree ( lower ("attr") "text_ops" );

--
-- TOC Entry ID 546 (OID 57631)
--
-- Name: "idx_alert_type_rule__value" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_alert_type_rule__value" on "alert_type_rule" using btree ( lower ("value") "text_ops" );

--
-- TOC Entry ID 547 (OID 57631)
--
-- Name: "fkx_alert_type__at_rule" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_alert_type__at_rule" on "alert_type_rule" using btree ( "alert_type__id" "numeric_ops" );

--
-- TOC Entry ID 548 (OID 57677)
--
-- Name: "idx_alert__timestamp" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_alert__timestamp" on "alert" using btree ( "timestamp" "timestamp_ops" );

--
-- TOC Entry ID 549 (OID 57677)
--
-- Name: "fkx_alert_type__alert" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_alert_type__alert" on "alert" using btree ( "alert_type__id" "numeric_ops" );

--
-- TOC Entry ID 550 (OID 57677)
--
-- Name: "fkx_event__alert" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_event__alert" on "alert" using btree ( "event__id" "numeric_ops" );

--
-- TOC Entry ID 551 (OID 57725)
--
-- Name: "udx_alert_type__usr__id__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_alert_type__usr__id__name" on "alert_type" using btree ( "usr__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 552 (OID 57725)
--
-- Name: "idx_alert_type__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_alert_type__name" on "alert_type" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 553 (OID 57725)
--
-- Name: "fkx_event_type__alert_type" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_event_type__alert_type" on "alert_type" using btree ( "event_type__id" "numeric_ops" );

--
-- TOC Entry ID 554 (OID 57725)
--
-- Name: "fkx_usr__alert_type" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_usr__alert_type" on "alert_type" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 555 (OID 57750)
--
-- Name: "fkx_alert_type__grp__contact" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_alert_type__grp__contact" on "alert_type__grp__contact" using btree ( "alert_type__id" "numeric_ops" );

--
-- TOC Entry ID 556 (OID 57750)
--
-- Name: "fkx_contact__grp__contact" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_contact__grp__contact" on "alert_type__grp__contact" using btree ( "contact__id" "numeric_ops" );

--
-- TOC Entry ID 557 (OID 57750)
--
-- Name: "fkx_grp__grp__contact" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_grp__grp__contact" on "alert_type__grp__contact" using btree ( "grp__id" "numeric_ops" );

--
-- TOC Entry ID 558 (OID 57765)
--
-- Name: "fkx_alert_type__at_user__cont" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_alert_type__at_user__cont" on "alert_type__usr__contact" using btree ( "alert_type__id" "numeric_ops" );

--
-- TOC Entry ID 559 (OID 57765)
--
-- Name: "fkx_contact__at_usr__contact" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_contact__at_usr__contact" on "alert_type__usr__contact" using btree ( "contact__id" "numeric_ops" );

--
-- TOC Entry ID 560 (OID 57765)
--
-- Name: "fkx_usr__at_usr__contact" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_usr__at_usr__contact" on "alert_type__usr__contact" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 561 (OID 57886)
--
-- Name: "udx_attr_grp__subsys__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_grp__subsys__name" on "attr_grp" using btree ( "subsys" "varchar_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 562 (OID 57886)
--
-- Name: "idx_attr_grp__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_grp__name" on "attr_grp" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 563 (OID 57886)
--
-- Name: "idx_attr_grp__subsys" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_grp__subsys" on "attr_grp" using btree ( lower ("subsys") "text_ops" );

--
-- TOC Entry ID 564 (OID 57906)
--
-- Name: "udx_attr_grp_val__obj_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_grp_val__obj_attr" on "attr_grp_val" using btree ( "object__id" "numeric_ops", "attr__id" "numeric_ops" );

--
-- TOC Entry ID 565 (OID 57906)
--
-- Name: "fkx_grp__attr_grp_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_grp__attr_grp_val" on "attr_grp_val" using btree ( "object__id" "numeric_ops" );

--
-- TOC Entry ID 566 (OID 57906)
--
-- Name: "fkx_attr_grp__attr_grp_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_grp__attr_grp_val" on "attr_grp_val" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 567 (OID 57945)
--
-- Name: "udx_attr_grp_meta__attr_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_grp_meta__attr_name" on "attr_grp_meta" using btree ( "attr__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 568 (OID 57945)
--
-- Name: "idx_attr_grp_meta__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_grp_meta__name" on "attr_grp_meta" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 569 (OID 57945)
--
-- Name: "fkx_attr_grp__attr_grp_meta" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_grp__attr_grp_meta" on "attr_grp_meta" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 570 (OID 58007)
--
-- Name: "fkx_grp__grp_priv" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_grp__grp_priv" on "grp_priv" using btree ( "grp__id" "numeric_ops" );

--
-- TOC Entry ID 571 (OID 58026)
--
-- Name: "fkx_grp__grp_priv__grp_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_grp__grp_priv__grp_member" on "grp_priv__grp_member" using btree ( "grp__id" "numeric_ops" );

--
-- TOC Entry ID 572 (OID 58026)
--
-- Name: "fkx_grp_priv__grp_priv__grp_mem" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_grp_priv__grp_priv__grp_mem" on "grp_priv__grp_member" using btree ( "grp_priv__id" "numeric_ops" );

--
-- TOC Entry ID 573 (OID 58106)
--
-- Name: "udx_pref__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_pref__name" on "pref" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 574 (OID 58124)
--
-- Name: "fkx_pref__pref__opt" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_pref__pref__opt" on "pref_opt" using btree ( "pref__id" "numeric_ops" );

--
-- TOC Entry ID 575 (OID 58139)
--
-- Name: "fkx_pref__pref_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_pref__pref_member" on "pref_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 576 (OID 58139)
--
-- Name: "fkx_member__pref_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__pref_member" on "pref_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 577 (OID 58186)
--
-- Name: "udx_class__key_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_class__key_name" on "class" using btree ( lower ("key_name") "text_ops" );

--
-- TOC Entry ID 578 (OID 58186)
--
-- Name: "udx_class__pkg_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_class__pkg_name" on "class" using btree ( lower ("pkg_name") "text_ops" );

--
-- TOC Entry ID 579 (OID 58186)
--
-- Name: "udx_class__disp__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_class__disp__name" on "class" using btree ( lower ("disp_name") "text_ops" );

--
-- TOC Entry ID 580 (OID 58256)
--
-- Name: "udx_event_type__key_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_event_type__key_name" on "event_type" using btree ( lower ("key_name") "text_ops" );

--
-- TOC Entry ID 581 (OID 58256)
--
-- Name: "udx_event_type__class_id__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_event_type__class_id__name" on "event_type" using btree ( "class__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 583 (OID 58256)
--
-- Name: "fkx_class__event_type" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_class__event_type" on "event_type" using btree ( "class__id" "numeric_ops" );

--
-- TOC Entry ID 582 (OID 58277)
--
-- Name: "fkx_event_type__event_type_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_event_type__event_type_attr" on "event_type_attr" using btree ( "event_type__id" "numeric_ops" );

--
-- TOC Entry ID 584 (OID 58324)
--
-- Name: "fkx_event_type__event" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_event_type__event" on "event" using btree ( "event_type__id" "numeric_ops" );

--
-- TOC Entry ID 585 (OID 58324)
--
-- Name: "fkx_usr__event" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_usr__event" on "event" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 586 (OID 58324)
--
-- Name: "idx_event__timestamp" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_event__timestamp" on "event" using btree ( "timestamp" "timestamp_ops" );

--
-- TOC Entry ID 587 (OID 58343)
--
-- Name: "fkx_event__event_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_event__event_attr" on "event_attr" using btree ( "event__id" "numeric_ops" );

--
-- TOC Entry ID 588 (OID 58343)
--
-- Name: "fkx_event_type_attr__event_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_event_type_attr__event_attr" on "event_attr" using btree ( "event_type_attr__id" "numeric_ops" );

--
-- TOC Entry ID 589 (OID 58389)
--
-- Name: "fkx_contrib_type__ctype_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_contrib_type__ctype_member" on "contrib_type_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 590 (OID 58389)
--
-- Name: "fkx_member__ctype_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__ctype_member" on "contrib_type_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 591 (OID 58411)
--
-- Name: "fkx_alert_type__alert_type_memb" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_alert_type__alert_type_memb" on "alert_type_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 592 (OID 58411)
--
-- Name: "fkx_member__alert_type_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__alert_type_member" on "alert_type_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 593 (OID 58452)
--
-- Name: "fkx_user__user_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_user__user_member" on "user_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 594 (OID 58452)
--
-- Name: "fkx_member__user_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__user_member" on "user_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 595 (OID 58493)
--
-- Name: "fkx_source__source_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_source__source_member" on "source_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 596 (OID 58493)
--
-- Name: "fkx_member__source_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__source_member" on "source_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 597 (OID 58534)
--
-- Name: "fkx_org__org_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_org__org_member" on "org_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 598 (OID 58534)
--
-- Name: "fkx_member__org_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__org_member" on "org_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 599 (OID 58594)
--
-- Name: "fkx_grp__member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_grp__member" on "member" using btree ( "grp__id" "numeric_ops" );

--
-- TOC Entry ID 600 (OID 58594)
--
-- Name: "fkx_grp__class" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_grp__class" on "member" using btree ( "class__id" "numeric_ops" );

--
-- TOC Entry ID 601 (OID 58619)
--
-- Name: "fkx_story__story_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_story__story_member" on "story_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 602 (OID 58619)
--
-- Name: "fkx_member__story_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__story_member" on "story_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 603 (OID 58679)
--
-- Name: "fkx_grp__grp_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_grp__grp_member" on "grp_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 604 (OID 58679)
--
-- Name: "fkx_member__grp_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__grp_member" on "grp_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 605 (OID 58758)
--
-- Name: "udx_attr_member__subsys__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_member__subsys__name" on "attr_member" using btree ( "subsys" "varchar_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 606 (OID 58758)
--
-- Name: "idx_attr_member__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_member__name" on "attr_member" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 607 (OID 58758)
--
-- Name: "idx_attr_member__subsys" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_member__subsys" on "attr_member" using btree ( lower ("subsys") "text_ops" );

--
-- TOC Entry ID 608 (OID 58777)
--
-- Name: "udx_attr_member_val__obj_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_member_val__obj_attr" on "attr_member_val" using btree ( "object__id" "numeric_ops", "attr__id" "numeric_ops" );

--
-- TOC Entry ID 609 (OID 58777)
--
-- Name: "fkx_member__attr_member_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__attr_member_val" on "attr_member_val" using btree ( "object__id" "numeric_ops" );

--
-- TOC Entry ID 610 (OID 58777)
--
-- Name: "fkx_attr_member__attr_member_va" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_member__attr_member_va" on "attr_member_val" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 611 (OID 58815)
--
-- Name: "udx_attr_member_meta__attr_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_member_meta__attr_name" on "attr_member_meta" using btree ( "attr__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 612 (OID 58815)
--
-- Name: "idx_attr_member_meta__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_member_meta__name" on "attr_member_meta" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 613 (OID 58815)
--
-- Name: "fkx_attr_member__attr_member_me" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_member__attr_member_me" on "attr_member_meta" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 619 (OID 58895)
--
-- Name: "fkx_resource__media__resource" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_resource__media__resource" on "media__resource" using btree ( "resource__id" "numeric_ops" );

--
-- TOC Entry ID 620 (OID 58895)
--
-- Name: "fkx_media__media__resource" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_media__media__resource" on "media__resource" using btree ( "media__id" "numeric_ops" );

--
-- TOC Entry ID 614 (OID 58909)
--
-- Name: "udx_resource__path" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_resource__path" on "resource" using btree ( lower ("path") "text_ops" );

--
-- TOC Entry ID 615 (OID 58909)
--
-- Name: "idx_resource__uri" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_resource__uri" on "resource" using btree ( lower ("uri") "text_ops" );

--
-- TOC Entry ID 616 (OID 58909)
--
-- Name: "idx_resrouce__mod_time" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_resrouce__mod_time" on "resource" using btree ( "mod_time" "timestamp_ops" );

--
-- TOC Entry ID 617 (OID 58909)
--
-- Name: "fkx_media_type__resource" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_media_type__resource" on "resource" using btree ( "media_type__id" "numeric_ops" );

--
-- TOC Entry ID 618 (OID 58909)
--
-- Name: "fkx_resource__resource" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_resource__resource" on "resource" using btree ( "parent_id" "numeric_ops" );

--
-- TOC Entry ID 621 (OID 58930)
--
-- Name: "fkx_story__story__resource" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_story__story__resource" on "story__resource" using btree ( "story__id" "numeric_ops" );

--
-- TOC Entry ID 622 (OID 58930)
--
-- Name: "fkx_resource__story__resource" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_resource__story__resource" on "story__resource" using btree ( "resource__id" "numeric_ops" );

--
-- TOC Entry ID 623 (OID 58971)
--
-- Name: "udx_server__name__st_id" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_server__name__st_id" on "server" using btree ( "host_name" "varchar_ops", "server_type__id" "numeric_ops" );

--
-- TOC Entry ID 624 (OID 58971)
--
-- Name: "fkx_server_type__server" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_server_type__server" on "server" using btree ( "server_type__id" "numeric_ops" );

--
-- TOC Entry ID 625 (OID 58971)
--
-- Name: "idx_server__os" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_server__os" on "server" using btree ( "os" "bpchar_ops" );

--
-- TOC Entry ID 626 (OID 59042)
--
-- Name: "udx_action_type__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_action_type__name" on "action_type" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 627 (OID 59061)
--
-- Name: "fkx_media_type__at_mt" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_media_type__at_mt" on "action_type__media_type" using btree ( "media_type__id" "numeric_ops" );

--
-- TOC Entry ID 628 (OID 59061)
--
-- Name: "fkx_action_type__at_mt" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_action_type__at_mt" on "action_type__media_type" using btree ( "action_type__id" "numeric_ops" );

--
-- TOC Entry ID 629 (OID 59122)
--
-- Name: "idx_job__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_job__name" on "job" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 630 (OID 59122)
--
-- Name: "idx_job__sched_time" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_job__sched_time" on "job" using btree ( "sched_time" "timestamp_ops" );

--
-- TOC Entry ID 631 (OID 59122)
--
-- Name: "idx_job__comp_time" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_job__comp_time" on "job" using btree ( "comp_time" "timestamp_ops" );

--
-- TOC Entry ID 633 (OID 59122)
--
-- Name: "fkx_usr__job" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_usr__job" on "job" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 632 (OID 59150)
--
-- Name: "fkx_job__job__resource" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_job__job__resource" on "job__resource" using btree ( "job__id" "numeric_ops" );

--
-- TOC Entry ID 634 (OID 59150)
--
-- Name: "fkx_resource__job__resource" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_resource__job__resource" on "job__resource" using btree ( "resource__id" "numeric_ops" );

--
-- TOC Entry ID 635 (OID 59164)
--
-- Name: "fkx_job__job__server_type" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_job__job__server_type" on "job__server_type" using btree ( "job__id" "numeric_ops" );

--
-- TOC Entry ID 636 (OID 59164)
--
-- Name: "fkx_srvr_type__job__srvr_type" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_srvr_type__job__srvr_type" on "job__server_type" using btree ( "server_type__id" "numeric_ops" );

--
-- TOC Entry ID 637 (OID 59178)
--
-- Name: "fkx_job__job_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_job__job_member" on "job_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 638 (OID 59178)
--
-- Name: "fkx_member__job_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__job_member" on "job_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 639 (OID 59300)
--
-- Name: "fkx_action_type__action" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_action_type__action" on "action" using btree ( "action_type__id" "numeric_ops" );

--
-- TOC Entry ID 640 (OID 59300)
--
-- Name: "fkx_server_type__action" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_server_type__action" on "action" using btree ( "server_type__id" "numeric_ops" );

--
-- TOC Entry ID 641 (OID 59317)
--
-- Name: "udx_attr_action__subsys__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_action__subsys__name" on "attr_action" using btree ( "subsys" "varchar_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 642 (OID 59317)
--
-- Name: "idx_attr_action__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_action__name" on "attr_action" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 643 (OID 59317)
--
-- Name: "idx_attr_action__subsys" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_action__subsys" on "attr_action" using btree ( lower ("subsys") "text_ops" );

--
-- TOC Entry ID 644 (OID 59337)
--
-- Name: "udx_attr_action_val__obj_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_action_val__obj_attr" on "attr_action_val" using btree ( "object__id" "numeric_ops", "attr__id" "numeric_ops" );

--
-- TOC Entry ID 645 (OID 59337)
--
-- Name: "fkx_action__attr_action_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_action__attr_action_val" on "attr_action_val" using btree ( "object__id" "numeric_ops" );

--
-- TOC Entry ID 646 (OID 59337)
--
-- Name: "fkx_attr_action__attr_action_va" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_action__attr_action_va" on "attr_action_val" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 647 (OID 59376)
--
-- Name: "udx_attr_action_meta__attr_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_action_meta__attr_name" on "attr_action_meta" using btree ( "attr__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 648 (OID 59376)
--
-- Name: "idx_attr_action_meta__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_action_meta__name" on "attr_action_meta" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 649 (OID 59376)
--
-- Name: "fkx_attr_action__attr_action_me" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_action__attr_action_me" on "attr_action_meta" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 650 (OID 59444)
--
-- Name: "udx_server_type__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_server_type__name" on "server_type" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 651 (OID 59444)
--
-- Name: "fkx_class__server_type" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_class__server_type" on "server_type" using btree ( "class__id" "numeric_ops" );

--
-- TOC Entry ID 652 (OID 59473)
--
-- Name: "fkx_server_type__st_oc" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_server_type__st_oc" on "server_type__output_channel" using btree ( "server_type__id" "numeric_ops" );

--
-- TOC Entry ID 653 (OID 59473)
--
-- Name: "fk_output_channel__st_oc" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fk_output_channel__st_oc" on "server_type__output_channel" using btree ( "output_channel__id" "numeric_ops" );

--
-- TOC Entry ID 654 (OID 59487)
--
-- Name: "fkx_dest__dest_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_dest__dest_member" on "dest_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 655 (OID 59487)
--
-- Name: "fkx_member__dest_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__dest_member" on "dest_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 656 (OID 59635)
--
-- Name: "udx_atd__name__at_id" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_atd__name__at_id" on "at_data" using btree ( "name" "varchar_ops", "element__id" "numeric_ops" );

--
-- TOC Entry ID 657 (OID 59635)
--
-- Name: "fkx_map_type__atd" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_map_type__atd" on "at_data" using btree ( "map_type__id" "numeric_ops" );

--
-- TOC Entry ID 658 (OID 59635)
--
-- Name: "fkx_element__atd" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_element__atd" on "at_data" using btree ( "element__id" "numeric_ops" );

--
-- TOC Entry ID 659 (OID 59669)
--
-- Name: "udx_attr_atd__subsys__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_atd__subsys__name" on "attr_at_data" using btree ( "subsys" "varchar_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 660 (OID 59669)
--
-- Name: "idx_attr_atd__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_atd__name" on "attr_at_data" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 661 (OID 59669)
--
-- Name: "idx_attr_atd__subsys" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_atd__subsys" on "attr_at_data" using btree ( lower ("subsys") "text_ops" );

--
-- TOC Entry ID 662 (OID 59689)
--
-- Name: "udx_attr_atd_val__obj_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_atd_val__obj_attr" on "attr_at_data_val" using btree ( "object__id" "numeric_ops", "attr__id" "numeric_ops" );

--
-- TOC Entry ID 663 (OID 59689)
--
-- Name: "fkx_atd__attr_atd_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_atd__attr_atd_val" on "attr_at_data_val" using btree ( "object__id" "numeric_ops" );

--
-- TOC Entry ID 664 (OID 59689)
--
-- Name: "fkx_attr_atd__attr_atd_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_atd__attr_atd_val" on "attr_at_data_val" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 665 (OID 59728)
--
-- Name: "udx_attr_atd_meta__attr_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_atd_meta__attr_name" on "attr_at_data_meta" using btree ( "attr__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 666 (OID 59728)
--
-- Name: "idx_attr_atd_meta__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_atd_meta__name" on "attr_at_data_meta" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 667 (OID 59728)
--
-- Name: "fkx_attr_atd__attr_atd_meta" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_atd__attr_atd_meta" on "attr_at_data_meta" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 668 (OID 59913)
--
-- Name: "udx_element__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_element__name" on "element" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 669 (OID 59913)
--
-- Name: "fkx_at_type__element" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_at_type__element" on "element" using btree ( "type__id" "numeric_ops" );

--
-- TOC Entry ID 670 (OID 59913)
--
-- Name: "fkx_grp__element" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_grp__element" on "element" using btree ( "type__id" "numeric_ops" );

--
-- TOC Entry ID 671 (OID 59913)
--
-- Name: "fkx_output_channel__element" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_output_channel__element" on "element" using btree ( "primary_oc__id" "numeric_ops" );

--
-- TOC Entry ID 672 (OID 59940)
--
-- Name: "udx_at_oc_id__at__oc_id" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_at_oc_id__at__oc_id" on "element__output_channel" using btree ( "element__id" "numeric_ops", "output_channel__id" "numeric_ops" );

--
-- TOC Entry ID 673 (OID 59940)
--
-- Name: "fkx_output_channel__at_oc" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_output_channel__at_oc" on "element__output_channel" using btree ( "output_channel__id" "numeric_ops" );

--
-- TOC Entry ID 674 (OID 59940)
--
-- Name: "fkx_element__at_oc" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_element__at_oc" on "element__output_channel" using btree ( "element__id" "numeric_ops" );

--
-- TOC Entry ID 675 (OID 59959)
--
-- Name: "fkx_element__at_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_element__at_member" on "element_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 676 (OID 59959)
--
-- Name: "fkx_member__at_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__at_member" on "element_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 677 (OID 59975)
--
-- Name: "udx_attr_at__subsys__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_at__subsys__name" on "attr_element" using btree ( "subsys" "varchar_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 678 (OID 59975)
--
-- Name: "idx_attr_at__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_at__name" on "attr_element" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 679 (OID 59975)
--
-- Name: "idx_attr_at__subsys" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_at__subsys" on "attr_element" using btree ( lower ("subsys") "text_ops" );

--
-- TOC Entry ID 680 (OID 59995)
--
-- Name: "udx_attr_at_val__obj_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_at_val__obj_attr" on "attr_element_val" using btree ( "object__id" "numeric_ops", "attr__id" "numeric_ops" );

--
-- TOC Entry ID 681 (OID 59995)
--
-- Name: "fkx_at__attr_at_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_at__attr_at_val" on "attr_element_val" using btree ( "object__id" "numeric_ops" );

--
-- TOC Entry ID 682 (OID 59995)
--
-- Name: "fkx_attr_at__attr_at_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_at__attr_at_val" on "attr_element_val" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 683 (OID 60034)
--
-- Name: "udx_attr_at_meta__attr_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_at_meta__attr_name" on "attr_element_meta" using btree ( "attr__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 684 (OID 60034)
--
-- Name: "idx_attr_at_meta__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_at_meta__name" on "attr_element_meta" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 685 (OID 60034)
--
-- Name: "fkx_attr_at__attr_at_meta" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_at__attr_at_meta" on "attr_element_meta" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 686 (OID 60161)
--
-- Name: "udx_at_type__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_at_type__name" on "at_type" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 687 (OID 60161)
--
-- Name: "fdx_class__at_type" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fdx_class__at_type" on "at_type" using btree ( "biz_class__id" "numeric_ops" );

--
-- TOC Entry ID 688 (OID 60199)
--
-- Name: "fkx_comp_type__comp_type_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_comp_type__comp_type_member" on "element_type_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 689 (OID 60199)
--
-- Name: "fkx_member__comp_type_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__comp_type_member" on "element_type_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 690 (OID 60227)
--
-- Name: "udx_contact__type" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_contact__type" on "contact" using btree ( lower ("type") "text_ops" );

--
-- TOC Entry ID 691 (OID 60249)
--
-- Name: "idx_contact_value_value" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_contact_value_value" on "contact_value" using btree ( lower ("value") "text_ops" );

--
-- TOC Entry ID 692 (OID 60249)
--
-- Name: "fdx_contact__contact_value" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fdx_contact__contact_value" on "contact_value" using btree ( "contact__id" "numeric_ops" );

--
-- TOC Entry ID 693 (OID 60268)
--
-- Name: "fkx_person__p_c_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_person__p_c_val" on "person__contact_value" using btree ( "person__id" "numeric_ops" );

--
-- TOC Entry ID 694 (OID 60268)
--
-- Name: "fkx_contact_value__p_c_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_contact_value__p_c_val" on "person__contact_value" using btree ( "contact_value__id" "numeric_ops" );

--
-- TOC Entry ID 695 (OID 60335)
--
-- Name: "idx_person__lname" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_person__lname" on "person" using btree ( "lname" "varchar_ops" );

--
-- TOC Entry ID 696 (OID 60335)
--
-- Name: "idx_person__fname" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_person__fname" on "person" using btree ( "fname" "varchar_ops" );

--
-- TOC Entry ID 697 (OID 60335)
--
-- Name: "idx_person__mname" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_person__mname" on "person" using btree ( "mname" "varchar_ops" );

--
-- TOC Entry ID 698 (OID 60357)
--
-- Name: "fkx_person__person_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_person__person_member" on "person_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 699 (OID 60357)
--
-- Name: "fkx_member__person_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__person_member" on "person_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 700 (OID 60521)
--
-- Name: "idx_category__directory" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_category__directory" on "category" using btree ( lower ("directory") "text_ops" );

--
-- TOC Entry ID 701 (OID 60521)
--
-- Name: "fkx_subcat_grp__category" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_subcat_grp__category" on "category" using btree ( "category_grp_id" "numeric_ops" );

--
-- TOC Entry ID 702 (OID 60521)
--
-- Name: "fkx_kw_grp__category" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_kw_grp__category" on "category" using btree ( "keyword_grp_id" "numeric_ops" );

--
-- TOC Entry ID 703 (OID 60521)
--
-- Name: "fkx_asset_grp__category" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_asset_grp__category" on "category" using btree ( "asset_grp_id" "numeric_ops" );

--
-- TOC Entry ID 704 (OID 60542)
--
-- Name: "fkx_category__category_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_category__category_member" on "category_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 705 (OID 60542)
--
-- Name: "fkx_member__category_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__category_member" on "category_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 706 (OID 60558)
--
-- Name: "udx_attr_cat__subsys__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_cat__subsys__name" on "attr_category" using btree ( "subsys" "varchar_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 707 (OID 60558)
--
-- Name: "idx_attr_cat__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_cat__name" on "attr_category" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 708 (OID 60558)
--
-- Name: "idx_attr_cat__subsys" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_cat__subsys" on "attr_category" using btree ( lower ("subsys") "text_ops" );

--
-- TOC Entry ID 709 (OID 60578)
--
-- Name: "udx_attr_cat_val__obj_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_cat_val__obj_attr" on "attr_category_val" using btree ( "object__id" "numeric_ops", "attr__id" "numeric_ops" );

--
-- TOC Entry ID 710 (OID 60578)
--
-- Name: "fkx_cat__attr_cat_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_cat__attr_cat_val" on "attr_category_val" using btree ( "object__id" "numeric_ops" );

--
-- TOC Entry ID 711 (OID 60578)
--
-- Name: "fkx_attr_cat__attr_cat_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_cat__attr_cat_val" on "attr_category_val" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 712 (OID 60617)
--
-- Name: "udx_attr_cat_meta__attr_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_cat_meta__attr_name" on "attr_category_meta" using btree ( "attr__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 713 (OID 60617)
--
-- Name: "idx_attr_cat_meta__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_cat_meta__name" on "attr_category_meta" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 714 (OID 60617)
--
-- Name: "fkx_attr_cat__attr_cat_meta" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_cat__attr_cat_meta" on "attr_category_meta" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 715 (OID 60735)
--
-- Name: "udx_keyword__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_keyword__name" on "keyword" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 716 (OID 60735)
--
-- Name: "udx_keyword__screen_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_keyword__screen_name" on "keyword" using btree ( lower ("screen_name") "text_ops" );

--
-- TOC Entry ID 717 (OID 60735)
--
-- Name: "idx_keyword__sort_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_keyword__sort_name" on "keyword" using btree ( lower ("sort_name") "text_ops" );

--
-- TOC Entry ID 718 (OID 60735)
--
-- Name: "fkx_keyword__grp" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_keyword__grp" on "keyword" using btree ( "synonym_grp_id" "numeric_ops" );

--
-- TOC Entry ID 719 (OID 60760)
--
-- Name: "fkx_keyword__keyword_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_keyword__keyword_member" on "keyword_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 720 (OID 60760)
--
-- Name: "fkx_member__keyword_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__keyword_member" on "keyword_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 721 (OID 60832)
--
-- Name: "udx_workflow__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_workflow__name" on "workflow" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 722 (OID 60855)
--
-- Name: "fkx_workflow__workflow_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_workflow__workflow_member" on "workflow_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 723 (OID 60855)
--
-- Name: "fkx_member__workflow_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__workflow_member" on "workflow_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 724 (OID 60918)
--
-- Name: "udx_desk__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_desk__name" on "desk" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 725 (OID 60918)
--
-- Name: "fkx_asset_grp__desk" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_asset_grp__desk" on "desk" using btree ( "asset_grp" "numeric_ops" );

--
-- TOC Entry ID 726 (OID 60918)
--
-- Name: "fkx_pre_grp__desk" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_pre_grp__desk" on "desk" using btree ( "pre_chk_rules" "numeric_ops" );

--
-- TOC Entry ID 727 (OID 60918)
--
-- Name: "fkx_post_grp__desk" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_post_grp__desk" on "desk" using btree ( "post_chk_rules" "numeric_ops" );

--
-- TOC Entry ID 728 (OID 60943)
--
-- Name: "fkx_desk__desk_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_desk__desk_member" on "desk_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 729 (OID 60943)
--
-- Name: "fkx_member__desk_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__desk_member" on "desk_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 730 (OID 60977)
--
-- Name: "idx_usr__login" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_usr__login" on "usr" using btree ( lower ("login") "text_ops" );

--
-- TOC Entry ID 731 (OID 61000)
--
-- Name: "idx_org__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_org__name" on "org" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 732 (OID 61158)
--
-- Name: "idx_formatting__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_formatting__name" on "formatting" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 733 (OID 61158)
--
-- Name: "idx_formatting__file_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_formatting__file_name" on "formatting" using btree ( lower ("file_name") "text_ops" );

--
-- TOC Entry ID 734 (OID 61158)
--
-- Name: "idx_formatting__deploy_date" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_formatting__deploy_date" on "formatting" using btree ( "deploy_date" "timestamp_ops" );

--
-- TOC Entry ID 735 (OID 61158)
--
-- Name: "fkx_usr__formatting" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_usr__formatting" on "formatting" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 736 (OID 61158)
--
-- Name: "fkx_output_channel__formatting" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_output_channel__formatting" on "formatting" using btree ( "output_channel__id" "numeric_ops" );

--
-- TOC Entry ID 737 (OID 61158)
--
-- Name: "fkx_element__formatting" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_element__formatting" on "formatting" using btree ( "element__id" "numeric_ops" );

--
-- TOC Entry ID 738 (OID 61158)
--
-- Name: "fkx_category__formatting" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_category__formatting" on "formatting" using btree ( "category__id" "numeric_ops" );

--
-- TOC Entry ID 739 (OID 61192)
--
-- Name: "fkx_usr__formatting_instance" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_usr__formatting_instance" on "formatting_instance" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 740 (OID 61192)
--
-- Name: "fkx_formatting__frmt_instance" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_formatting__frmt_instance" on "formatting_instance" using btree ( "formatting__id" "numeric_ops" );

--
-- TOC Entry ID 741 (OID 61228)
--
-- Name: "fkx_frmt__frmt_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_frmt__frmt_member" on "formatting_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 742 (OID 61228)
--
-- Name: "fkx_member__frmt_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__frmt_member" on "formatting_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 743 (OID 61244)
--
-- Name: "udx_attr_frmt__subsys__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_frmt__subsys__name" on "attr_formatting" using btree ( "subsys" "varchar_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 744 (OID 61244)
--
-- Name: "idx_attr_frmt__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_frmt__name" on "attr_formatting" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 745 (OID 61244)
--
-- Name: "idx_attr_frmt__subsys" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_frmt__subsys" on "attr_formatting" using btree ( lower ("subsys") "text_ops" );

--
-- TOC Entry ID 746 (OID 61264)
--
-- Name: "udx_attr_frmt_val__obj_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_frmt_val__obj_attr" on "attr_formatting_val" using btree ( "object__id" "numeric_ops", "attr__id" "numeric_ops" );

--
-- TOC Entry ID 747 (OID 61264)
--
-- Name: "fkx_frmt__attr_frmt_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_frmt__attr_frmt_val" on "attr_formatting_val" using btree ( "object__id" "numeric_ops" );

--
-- TOC Entry ID 748 (OID 61264)
--
-- Name: "fkx_attr_frmt__attr_frmt_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_frmt__attr_frmt_val" on "attr_formatting_val" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 749 (OID 61303)
--
-- Name: "udx_attr_frmt_meta__attr_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_frmt_meta__attr_name" on "attr_formatting_meta" using btree ( "attr__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 750 (OID 61303)
--
-- Name: "idx_attr_frmt_meta__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_frmt_meta__name" on "attr_formatting_meta" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 751 (OID 61303)
--
-- Name: "fkx_attr_frmt__attr_frmt_meta" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_frmt__attr_frmt_meta" on "attr_formatting_meta" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 752 (OID 61531)
--
-- Name: "idx_story__primary_uri" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_story__primary_uri" on "story" using btree ( lower ("primary_uri") "text_ops" );

--
-- TOC Entry ID 753 (OID 61531)
--
-- Name: "fdx_usr__story" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fdx_usr__story" on "story" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 754 (OID 61531)
--
-- Name: "fdx_source__story" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fdx_source__story" on "story" using btree ( "source__id" "numeric_ops" );

--
-- TOC Entry ID 755 (OID 61531)
--
-- Name: "fdx_element__story" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fdx_element__story" on "story" using btree ( "element__id" "numeric_ops" );

--
-- TOC Entry ID 756 (OID 61531)
--
-- Name: "fdx_grp__story" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fdx_grp__story" on "story" using btree ( "keyword_grp__id" "numeric_ops" );

--
-- TOC Entry ID 757 (OID 61564)
--
-- Name: "idx_story_instance__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_story_instance__name" on "story_instance" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 758 (OID 61564)
--
-- Name: "idx_story_instance__slug" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_story_instance__slug" on "story_instance" using btree ( lower ("slug") "text_ops" );

--
-- TOC Entry ID 759 (OID 61564)
--
-- Name: "fdx_story__story_instance" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fdx_story__story_instance" on "story_instance" using btree ( "story__id" "numeric_ops" );

--
-- TOC Entry ID 760 (OID 61564)
--
-- Name: "fdx_usr__story_instance" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fdx_usr__story_instance" on "story_instance" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 761 (OID 61587)
--
-- Name: "udx_story_category__story__cat" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_story_category__story__cat" on "story__category" using btree ( "story_instance__id" "numeric_ops", "category__id" "numeric_ops" );

--
-- TOC Entry ID 762 (OID 61587)
--
-- Name: "fkx_story__story__category" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_story__story__category" on "story__category" using btree ( "story_instance__id" "numeric_ops" );

--
-- TOC Entry ID 763 (OID 61587)
--
-- Name: "fkx_category__story__category" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_category__story__category" on "story__category" using btree ( "category__id" "numeric_ops" );

--
-- TOC Entry ID 764 (OID 61606)
--
-- Name: "fkx_story__story__contributor" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_story__story__contributor" on "story__contributor" using btree ( "story_instance__id" "numeric_ops" );

--
-- TOC Entry ID 765 (OID 61606)
--
-- Name: "fkx_member__story__contributor" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__story__contributor" on "story__contributor" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 766 (OID 61624)
--
-- Name: "udx_attr_story__subsys__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_story__subsys__name" on "attr_story" using btree ( "subsys" "varchar_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 767 (OID 61624)
--
-- Name: "idx_attr_story__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_story__name" on "attr_story" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 768 (OID 61624)
--
-- Name: "idx_attr_story__subsys" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_story__subsys" on "attr_story" using btree ( lower ("subsys") "text_ops" );

--
-- TOC Entry ID 769 (OID 61644)
--
-- Name: "udx_attr_story_val__obj_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_story_val__obj_attr" on "attr_story_val" using btree ( "object__id" "numeric_ops", "attr__id" "numeric_ops" );

--
-- TOC Entry ID 770 (OID 61644)
--
-- Name: "fkx_story__attr_story_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_story__attr_story_val" on "attr_story_val" using btree ( "object__id" "numeric_ops" );

--
-- TOC Entry ID 771 (OID 61644)
--
-- Name: "fkx_attr_story__attr_story_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_story__attr_story_val" on "attr_story_val" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 772 (OID 61683)
--
-- Name: "udx_attr_story_meta__attr_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_story_meta__attr_name" on "attr_story_meta" using btree ( "attr__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 773 (OID 61683)
--
-- Name: "idx_attr_story_meta__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_story_meta__name" on "attr_story_meta" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 774 (OID 61683)
--
-- Name: "fkx_attr_story__attr_story_meta" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_story__attr_story_meta" on "attr_story_meta" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 775 (OID 61958)
--
-- Name: "idx_media__publish_date" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_media__publish_date" on "media" using btree ( "publish_date" "timestamp_ops" );

--
-- TOC Entry ID 776 (OID 61958)
--
-- Name: "idx_media__cover_date" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_media__cover_date" on "media" using btree ( "cover_date" "timestamp_ops" );

--
-- TOC Entry ID 777 (OID 61958)
--
-- Name: "fkx_source__media" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_source__media" on "media" using btree ( "source__id" "numeric_ops" );

--
-- TOC Entry ID 778 (OID 61958)
--
-- Name: "fkx_usr__media" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_usr__media" on "media" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 779 (OID 61958)
--
-- Name: "fkx_kw__media" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_kw__media" on "media" using btree ( "keyword_grp__id" "numeric_ops" );

--
-- TOC Entry ID 780 (OID 61958)
--
-- Name: "fkx_element__media" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_element__media" on "media" using btree ( "element__id" "numeric_ops" );

--
-- TOC Entry ID 781 (OID 61990)
--
-- Name: "idx_media_instance__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_media_instance__name" on "media_instance" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 782 (OID 61990)
--
-- Name: "idx_media_instance__file_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_media_instance__file_name" on "media_instance" using btree ( lower ("file_name") "text_ops" );

--
-- TOC Entry ID 783 (OID 61990)
--
-- Name: "idx_media_instance__uri" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_media_instance__uri" on "media_instance" using btree ( lower ("uri") "text_ops" );

--
-- TOC Entry ID 784 (OID 61990)
--
-- Name: "fkx_media__media_instance" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_media__media_instance" on "media_instance" using btree ( "media__id" "numeric_ops" );

--
-- TOC Entry ID 785 (OID 61990)
--
-- Name: "fkx_usr__media_instance" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_usr__media_instance" on "media_instance" using btree ( "usr__id" "numeric_ops" );

--
-- TOC Entry ID 786 (OID 61990)
--
-- Name: "fkx_media_type__media_instance" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_media_type__media_instance" on "media_instance" using btree ( "media_type__id" "numeric_ops" );

--
-- TOC Entry ID 787 (OID 61990)
--
-- Name: "fkx_category__media_instance" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_category__media_instance" on "media_instance" using btree ( "category__id" "numeric_ops" );

--
-- TOC Entry ID 788 (OID 62071)
--
-- Name: "fkx_media__media_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_media__media_member" on "media_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 789 (OID 62071)
--
-- Name: "fkx_member__media_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__media_member" on "media_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 790 (OID 62087)
--
-- Name: "fkx_image__image_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_image__image_member" on "image_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 791 (OID 62087)
--
-- Name: "fkx_member__image_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__image_member" on "image_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 792 (OID 62103)
--
-- Name: "udx_attr_media__subsys__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_media__subsys__name" on "attr_media" using btree ( "subsys" "varchar_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 793 (OID 62103)
--
-- Name: "idx_attr_media__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_media__name" on "attr_media" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 794 (OID 62103)
--
-- Name: "idx_attr_media__subsys" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_media__subsys" on "attr_media" using btree ( lower ("subsys") "text_ops" );

--
-- TOC Entry ID 795 (OID 62123)
--
-- Name: "udx_attr_media_val__obj_attr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_media_val__obj_attr" on "attr_media_val" using btree ( "object__id" "numeric_ops", "attr__id" "numeric_ops" );

--
-- TOC Entry ID 796 (OID 62123)
--
-- Name: "fkx_media__attr_media_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_media__attr_media_val" on "attr_media_val" using btree ( "object__id" "numeric_ops" );

--
-- TOC Entry ID 797 (OID 62123)
--
-- Name: "fkx_attr_media__attr_media_val" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_media__attr_media_val" on "attr_media_val" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 798 (OID 62162)
--
-- Name: "udx_attr_media_meta__attr_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_attr_media_meta__attr_name" on "attr_media_meta" using btree ( "attr__id" "numeric_ops", "name" "varchar_ops" );

--
-- TOC Entry ID 799 (OID 62162)
--
-- Name: "idx_attr_media_meta__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_attr_media_meta__name" on "attr_media_meta" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 800 (OID 62162)
--
-- Name: "fkx_attr_media__attr_media_meta" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_attr_media__attr_media_meta" on "attr_media_meta" using btree ( "attr__id" "numeric_ops" );

--
-- TOC Entry ID 801 (OID 62313)
--
-- Name: "idx_story_data_tile__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_story_data_tile__name" on "story_data_tile" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 802 (OID 62313)
--
-- Name: "fkx_story_instance__sd_tile" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_story_instance__sd_tile" on "story_data_tile" using btree ( "object_instance_id" "numeric_ops" );

--
-- TOC Entry ID 803 (OID 62313)
--
-- Name: "fkx_element__sd_tile" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_element__sd_tile" on "story_data_tile" using btree ( "element_data__id" "numeric_ops" );

--
-- TOC Entry ID 804 (OID 62313)
--
-- Name: "fkx_sc_tile__sd_tile" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_sc_tile__sd_tile" on "story_data_tile" using btree ( "parent_id" "numeric_ops" );

--
-- TOC Entry ID 805 (OID 62358)
--
-- Name: "idx_media_data_tile__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_media_data_tile__name" on "media_data_tile" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 806 (OID 62358)
--
-- Name: "fkx_media_instance__md_tile" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_media_instance__md_tile" on "media_data_tile" using btree ( "object_instance_id" "numeric_ops" );

--
-- TOC Entry ID 807 (OID 62358)
--
-- Name: "fkx_element__md_tile" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_element__md_tile" on "media_data_tile" using btree ( "element_data__id" "numeric_ops" );

--
-- TOC Entry ID 808 (OID 62358)
--
-- Name: "fkx_sc_tile__md_tile" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_sc_tile__md_tile" on "media_data_tile" using btree ( "parent_id" "numeric_ops" );

--
-- TOC Entry ID 809 (OID 62465)
--
-- Name: "idx_sc_tile__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_sc_tile__name" on "story_container_tile" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 810 (OID 62465)
--
-- Name: "fkx_sc_tile__sc_tile" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_sc_tile__sc_tile" on "story_container_tile" using btree ( "parent_id" "numeric_ops" );

--
-- TOC Entry ID 811 (OID 62465)
--
-- Name: "fkx_story__sc_tile" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_story__sc_tile" on "story_container_tile" using btree ( "object_instance_id" "numeric_ops" );

--
-- TOC Entry ID 812 (OID 62465)
--
-- Name: "fkx_sc_tile__related_story" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_sc_tile__related_story" on "story_container_tile" using btree ( "related_instance__id" "numeric_ops" );

--
-- TOC Entry ID 813 (OID 62465)
--
-- Name: "fkx_sc_tile__related_media" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_sc_tile__related_media" on "story_container_tile" using btree ( "related_media__id" "numeric_ops" );

--
-- TOC Entry ID 814 (OID 62491)
--
-- Name: "idx_mc_tile__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_mc_tile__name" on "media_container_tile" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 815 (OID 62491)
--
-- Name: "fkx_mc_tile__mc_tile" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_mc_tile__mc_tile" on "media_container_tile" using btree ( "parent_id" "numeric_ops" );

--
-- TOC Entry ID 816 (OID 62491)
--
-- Name: "fkx_media__mc_tile" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_media__mc_tile" on "media_container_tile" using btree ( "object_instance_id" "numeric_ops" );

--
-- TOC Entry ID 817 (OID 62579)
--
-- Name: "udx_output_channel__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_output_channel__name" on "output_channel" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 818 (OID 62579)
--
-- Name: "idx_output_channel__filename" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_output_channel__filename" on "output_channel" using btree ( lower ("filename") "text_ops" );

--
-- TOC Entry ID 819 (OID 62579)
--
-- Name: "idx_output_channel__file_ext" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_output_channel__file_ext" on "output_channel" using btree ( lower ("file_ext") "text_ops" );

--
-- TOC Entry ID 820 (OID 62603)
--
-- Name: "fkx_output_channel__oc_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_output_channel__oc_member" on "output_channel_member" using btree ( "object_id" "numeric_ops" );

--
-- TOC Entry ID 821 (OID 62603)
--
-- Name: "fkx_member__oc_member" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_member__oc_member" on "output_channel_member" using btree ( "member__id" "numeric_ops" );

--
-- TOC Entry ID 822 (OID 62634)
--
-- Name: "udx_person_org__person__org" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_person_org__person__org" on "person_org" using btree ( "person__id" "numeric_ops", "org__id" "numeric_ops", "role" "varchar_ops" );

--
-- TOC Entry ID 823 (OID 62634)
--
-- Name: "idx_person_org__department" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_person_org__department" on "person_org" using btree ( lower ("department") "text_ops" );

--
-- TOC Entry ID 824 (OID 62634)
--
-- Name: "fdx_person__person_org" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fdx_person__person_org" on "person_org" using btree ( "person__id" "numeric_ops" );

--
-- TOC Entry ID 825 (OID 62634)
--
-- Name: "fdx_org__person_org" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fdx_org__person_org" on "person_org" using btree ( "org__id" "numeric_ops" );

--
-- TOC Entry ID 826 (OID 62706)
--
-- Name: "udx_source_name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_source_name" on "source" using btree ( "name" "varchar_ops" );

--
-- TOC Entry ID 827 (OID 62706)
--
-- Name: "fkx_source__org" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_source__org" on "source" using btree ( "org__id" "numeric_ops" );

--
-- TOC Entry ID 828 (OID 62734)
--
-- Name: "idx_addr__type" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_addr__type" on "addr" using btree ( lower ("type") "text_ops" );

--
-- TOC Entry ID 831 (OID 62734)
--
-- Name: "fkx_org__addr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_org__addr" on "addr" using btree ( "org__id" "numeric_ops" );

--
-- TOC Entry ID 829 (OID 62753)
--
-- Name: "udx_addr_part_type__name" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE UNIQUE INDEX "udx_addr_part_type__name" on "addr_part_type" using btree ( lower ("name") "text_ops" );

--
-- TOC Entry ID 830 (OID 62771)
--
-- Name: "idx_addr_part__value" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "idx_addr_part__value" on "addr_part" using btree ( lower ("value") "text_ops" );

--
-- TOC Entry ID 832 (OID 62771)
--
-- Name: "fkx_addr__addr_part" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_addr__addr_part" on "addr_part" using btree ( "addr__id" "numeric_ops" );

--
-- TOC Entry ID 833 (OID 62771)
--
-- Name: "fkx_addr_part_type__addr_part" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_addr_part_type__addr_part" on "addr_part" using btree ( "addr_part_type__id" "numeric_ops" );

--
-- TOC Entry ID 834 (OID 62788)
--
-- Name: "fkx_addr__person_org_addr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fkx_addr__person_org_addr" on "person_org__addr" using btree ( "addr__id" "numeric_ops" );

--
-- TOC Entry ID 835 (OID 62788)
--
-- Name: "fk_person_org__pers_org_addr" Type: INDEX Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE  INDEX "fk_person_org__pers_org_addr" on "person_org__addr" using btree ( "person_org__id" "numeric_ops" );

--
-- TOC Entry ID 955 (OID 64427)
--
-- Name: "RI_ConstraintTrigger_64426" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp" AFTER INSERT OR UPDATE ON "grp"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_grp__grp', 'grp', 'grp', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 956 (OID 64429)
--
-- Name: "RI_ConstraintTrigger_64428" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp" AFTER DELETE ON "grp"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_grp__grp', 'grp', 'grp', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 957 (OID 64431)
--
-- Name: "RI_ConstraintTrigger_64430" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp" AFTER UPDATE ON "grp"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_grp__grp', 'grp', 'grp', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 958 (OID 64433)
--
-- Name: "RI_ConstraintTrigger_64432" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__grp" AFTER INSERT OR UPDATE ON "grp"  FROM "class" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_class__grp', 'grp', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1050 (OID 64435)
--
-- Name: "RI_ConstraintTrigger_64434" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__grp" AFTER DELETE ON "class"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_class__grp', 'grp', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1051 (OID 64437)
--
-- Name: "RI_ConstraintTrigger_64436" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__grp" AFTER UPDATE ON "class"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_class__grp', 'grp', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1001 (OID 64439)
--
-- Name: "RI_ConstraintTrigger_64438" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__media_type_ext" AFTER INSERT OR UPDATE ON "media_type_ext"  FROM "media_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_media_type__media_type_ext', 'media_type_ext', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 993 (OID 64441)
--
-- Name: "RI_ConstraintTrigger_64440" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__media_type_ext" AFTER DELETE ON "media_type"  FROM "media_type_ext" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_media_type__media_type_ext', 'media_type_ext', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 994 (OID 64443)
--
-- Name: "RI_ConstraintTrigger_64442" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__media_type_ext" AFTER UPDATE ON "media_type"  FROM "media_type_ext" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_media_type__media_type_ext', 'media_type_ext', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 1002 (OID 64445)
--
-- Name: "RI_ConstraintTrigger_64444" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert__alerted" AFTER INSERT OR UPDATE ON "alerted"  FROM "alert" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_alert__alerted', 'alerted', 'alert', 'UNSPECIFIED', 'alert__id', 'id');

--
-- TOC Entry ID 1009 (OID 64447)
--
-- Name: "RI_ConstraintTrigger_64446" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert__alerted" AFTER DELETE ON "alert"  FROM "alerted" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_alert__alerted', 'alerted', 'alert', 'UNSPECIFIED', 'alert__id', 'id');

--
-- TOC Entry ID 1010 (OID 64449)
--
-- Name: "RI_ConstraintTrigger_64448" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert__alerted" AFTER UPDATE ON "alert"  FROM "alerted" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_alert__alerted', 'alerted', 'alert', 'UNSPECIFIED', 'alert__id', 'id');

--
-- TOC Entry ID 1003 (OID 64451)
--
-- Name: "RI_ConstraintTrigger_64450" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__alerted" AFTER INSERT OR UPDATE ON "alerted"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_usr__alerted', 'alerted', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1323 (OID 64453)
--
-- Name: "RI_ConstraintTrigger_64452" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__alerted" AFTER DELETE ON "usr"  FROM "alerted" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_usr__alerted', 'alerted', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1324 (OID 64455)
--
-- Name: "RI_ConstraintTrigger_64454" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__alerted" AFTER UPDATE ON "usr"  FROM "alerted" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_usr__alerted', 'alerted', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1006 (OID 64457)
--
-- Name: "RI_ConstraintTrigger_64456" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alerted__alerted__contact" AFTER INSERT OR UPDATE ON "alerted__contact_value"  FROM "alerted" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_alerted__alerted__contact', 'alerted__contact_value', 'alerted', 'UNSPECIFIED', 'alerted__id', 'id');

--
-- TOC Entry ID 1004 (OID 64459)
--
-- Name: "RI_ConstraintTrigger_64458" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alerted__alerted__contact" AFTER DELETE ON "alerted"  FROM "alerted__contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_alerted__alerted__contact', 'alerted__contact_value', 'alerted', 'UNSPECIFIED', 'alerted__id', 'id');

--
-- TOC Entry ID 1005 (OID 64461)
--
-- Name: "RI_ConstraintTrigger_64460" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alerted__alerted__contact" AFTER UPDATE ON "alerted"  FROM "alerted__contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_alerted__alerted__contact', 'alerted__contact_value', 'alerted', 'UNSPECIFIED', 'alerted__id', 'id');

--
-- TOC Entry ID 1007 (OID 64463)
--
-- Name: "RI_ConstraintTrigger_64462" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__alerted__cont" AFTER INSERT OR UPDATE ON "alerted__contact_value"  FROM "contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_contact__alerted__cont', 'alerted__contact_value', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1255 (OID 64465)
--
-- Name: "RI_ConstraintTrigger_64464" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__alerted__cont" AFTER DELETE ON "contact"  FROM "alerted__contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_contact__alerted__cont', 'alerted__contact_value', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1256 (OID 64467)
--
-- Name: "RI_ConstraintTrigger_64466" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__alerted__cont" AFTER UPDATE ON "contact"  FROM "alerted__contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_contact__alerted__cont', 'alerted__contact_value', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1008 (OID 64469)
--
-- Name: "RI_ConstraintTrigger_64468" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__at_rule" AFTER INSERT OR UPDATE ON "alert_type_rule"  FROM "alert_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_alert_type__at_rule', 'alert_type_rule', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1013 (OID 64471)
--
-- Name: "RI_ConstraintTrigger_64470" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__at_rule" AFTER DELETE ON "alert_type"  FROM "alert_type_rule" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_alert_type__at_rule', 'alert_type_rule', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1014 (OID 64473)
--
-- Name: "RI_ConstraintTrigger_64472" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__at_rule" AFTER UPDATE ON "alert_type"  FROM "alert_type_rule" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_alert_type__at_rule', 'alert_type_rule', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1011 (OID 64475)
--
-- Name: "RI_ConstraintTrigger_64474" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__alert" AFTER INSERT OR UPDATE ON "alert"  FROM "alert_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_alert_type__alert', 'alert', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1015 (OID 64477)
--
-- Name: "RI_ConstraintTrigger_64476" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__alert" AFTER DELETE ON "alert_type"  FROM "alert" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_alert_type__alert', 'alert', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1016 (OID 64479)
--
-- Name: "RI_ConstraintTrigger_64478" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__alert" AFTER UPDATE ON "alert_type"  FROM "alert" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_alert_type__alert', 'alert', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1012 (OID 64481)
--
-- Name: "RI_ConstraintTrigger_64480" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event__alert" AFTER INSERT OR UPDATE ON "alert"  FROM "event" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_event__alert', 'alert', 'event', 'UNSPECIFIED', 'event__id', 'id');

--
-- TOC Entry ID 1070 (OID 64483)
--
-- Name: "RI_ConstraintTrigger_64482" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event__alert" AFTER DELETE ON "event"  FROM "alert" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_event__alert', 'alert', 'event', 'UNSPECIFIED', 'event__id', 'id');

--
-- TOC Entry ID 1071 (OID 64485)
--
-- Name: "RI_ConstraintTrigger_64484" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event__alert" AFTER UPDATE ON "event"  FROM "alert" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_event__alert', 'alert', 'event', 'UNSPECIFIED', 'event__id', 'id');

--
-- TOC Entry ID 1017 (OID 64487)
--
-- Name: "RI_ConstraintTrigger_64486" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type__alert_type" AFTER INSERT OR UPDATE ON "alert_type"  FROM "event_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_event_type__alert_type', 'alert_type', 'event_type', 'UNSPECIFIED', 'event_type__id', 'id');

--
-- TOC Entry ID 1060 (OID 64489)
--
-- Name: "RI_ConstraintTrigger_64488" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type__alert_type" AFTER DELETE ON "event_type"  FROM "alert_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_event_type__alert_type', 'alert_type', 'event_type', 'UNSPECIFIED', 'event_type__id', 'id');

--
-- TOC Entry ID 1061 (OID 64491)
--
-- Name: "RI_ConstraintTrigger_64490" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type__alert_type" AFTER UPDATE ON "event_type"  FROM "alert_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_event_type__alert_type', 'alert_type', 'event_type', 'UNSPECIFIED', 'event_type__id', 'id');

--
-- TOC Entry ID 1018 (OID 64493)
--
-- Name: "RI_ConstraintTrigger_64492" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__alert_type" AFTER INSERT OR UPDATE ON "alert_type"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_usr__alert_type', 'alert_type', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1325 (OID 64495)
--
-- Name: "RI_ConstraintTrigger_64494" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__alert_type" AFTER DELETE ON "usr"  FROM "alert_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_usr__alert_type', 'alert_type', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1326 (OID 64497)
--
-- Name: "RI_ConstraintTrigger_64496" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__alert_type" AFTER UPDATE ON "usr"  FROM "alert_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_usr__alert_type', 'alert_type', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1025 (OID 64499)
--
-- Name: "RI_ConstraintTrigger_64498" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__grp__contact" AFTER INSERT OR UPDATE ON "alert_type__grp__contact"  FROM "alert_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_alert_type__grp__contact', 'alert_type__grp__contact', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1019 (OID 64501)
--
-- Name: "RI_ConstraintTrigger_64500" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__grp__contact" AFTER DELETE ON "alert_type"  FROM "alert_type__grp__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_alert_type__grp__contact', 'alert_type__grp__contact', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1020 (OID 64503)
--
-- Name: "RI_ConstraintTrigger_64502" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__grp__contact" AFTER UPDATE ON "alert_type"  FROM "alert_type__grp__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_alert_type__grp__contact', 'alert_type__grp__contact', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1026 (OID 64505)
--
-- Name: "RI_ConstraintTrigger_64504" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__grp__contact" AFTER INSERT OR UPDATE ON "alert_type__grp__contact"  FROM "contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_contact__grp__contact', 'alert_type__grp__contact', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1257 (OID 64507)
--
-- Name: "RI_ConstraintTrigger_64506" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__grp__contact" AFTER DELETE ON "contact"  FROM "alert_type__grp__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_contact__grp__contact', 'alert_type__grp__contact', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1258 (OID 64509)
--
-- Name: "RI_ConstraintTrigger_64508" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__grp__contact" AFTER UPDATE ON "contact"  FROM "alert_type__grp__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_contact__grp__contact', 'alert_type__grp__contact', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1027 (OID 64511)
--
-- Name: "RI_ConstraintTrigger_64510" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp__contact" AFTER INSERT OR UPDATE ON "alert_type__grp__contact"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_grp__grp__contact', 'alert_type__grp__contact', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 959 (OID 64513)
--
-- Name: "RI_ConstraintTrigger_64512" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp__contact" AFTER DELETE ON "grp"  FROM "alert_type__grp__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_grp__grp__contact', 'alert_type__grp__contact', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 960 (OID 64515)
--
-- Name: "RI_ConstraintTrigger_64514" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp__contact" AFTER UPDATE ON "grp"  FROM "alert_type__grp__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_grp__grp__contact', 'alert_type__grp__contact', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 1028 (OID 64517)
--
-- Name: "RI_ConstraintTrigger_64516" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__at_user__cont" AFTER INSERT OR UPDATE ON "alert_type__usr__contact"  FROM "alert_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_alert_type__at_user__cont', 'alert_type__usr__contact', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1021 (OID 64519)
--
-- Name: "RI_ConstraintTrigger_64518" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__at_user__cont" AFTER DELETE ON "alert_type"  FROM "alert_type__usr__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_alert_type__at_user__cont', 'alert_type__usr__contact', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1022 (OID 64521)
--
-- Name: "RI_ConstraintTrigger_64520" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__at_user__cont" AFTER UPDATE ON "alert_type"  FROM "alert_type__usr__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_alert_type__at_user__cont', 'alert_type__usr__contact', 'alert_type', 'UNSPECIFIED', 'alert_type__id', 'id');

--
-- TOC Entry ID 1029 (OID 64523)
--
-- Name: "RI_ConstraintTrigger_64522" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__at_usr__contact" AFTER INSERT OR UPDATE ON "alert_type__usr__contact"  FROM "contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_contact__at_usr__contact', 'alert_type__usr__contact', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1259 (OID 64525)
--
-- Name: "RI_ConstraintTrigger_64524" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__at_usr__contact" AFTER DELETE ON "contact"  FROM "alert_type__usr__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_contact__at_usr__contact', 'alert_type__usr__contact', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1260 (OID 64527)
--
-- Name: "RI_ConstraintTrigger_64526" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__at_usr__contact" AFTER UPDATE ON "contact"  FROM "alert_type__usr__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_contact__at_usr__contact', 'alert_type__usr__contact', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1030 (OID 64529)
--
-- Name: "RI_ConstraintTrigger_64528" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__at_usr__contact" AFTER INSERT OR UPDATE ON "alert_type__usr__contact"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_usr__at_usr__contact', 'alert_type__usr__contact', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1327 (OID 64531)
--
-- Name: "RI_ConstraintTrigger_64530" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__at_usr__contact" AFTER DELETE ON "usr"  FROM "alert_type__usr__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_usr__at_usr__contact', 'alert_type__usr__contact', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1328 (OID 64533)
--
-- Name: "RI_ConstraintTrigger_64532" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__at_usr__contact" AFTER UPDATE ON "usr"  FROM "alert_type__usr__contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_usr__at_usr__contact', 'alert_type__usr__contact', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1035 (OID 64535)
--
-- Name: "RI_ConstraintTrigger_64534" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_grp__attr_grp_val" AFTER INSERT OR UPDATE ON "attr_grp_val"  FROM "attr_grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_grp__attr_grp_val', 'attr_grp_val', 'attr_grp', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1031 (OID 64537)
--
-- Name: "RI_ConstraintTrigger_64536" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_grp__attr_grp_val" AFTER DELETE ON "attr_grp"  FROM "attr_grp_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_grp__attr_grp_val', 'attr_grp_val', 'attr_grp', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1032 (OID 64539)
--
-- Name: "RI_ConstraintTrigger_64538" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_grp__attr_grp_val" AFTER UPDATE ON "attr_grp"  FROM "attr_grp_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_grp__attr_grp_val', 'attr_grp_val', 'attr_grp', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1036 (OID 64541)
--
-- Name: "RI_ConstraintTrigger_64540" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__attr_grp_val" AFTER INSERT OR UPDATE ON "attr_grp_val"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_grp__attr_grp_val', 'attr_grp_val', 'grp', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 961 (OID 64543)
--
-- Name: "RI_ConstraintTrigger_64542" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__attr_grp_val" AFTER DELETE ON "grp"  FROM "attr_grp_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_grp__attr_grp_val', 'attr_grp_val', 'grp', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 962 (OID 64545)
--
-- Name: "RI_ConstraintTrigger_64544" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__attr_grp_val" AFTER UPDATE ON "grp"  FROM "attr_grp_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_grp__attr_grp_val', 'attr_grp_val', 'grp', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1037 (OID 64547)
--
-- Name: "RI_ConstraintTrigger_64546" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_grp__attr_grp_meta" AFTER INSERT OR UPDATE ON "attr_grp_meta"  FROM "attr_grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_grp__attr_grp_meta', 'attr_grp_meta', 'attr_grp', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1033 (OID 64549)
--
-- Name: "RI_ConstraintTrigger_64548" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_grp__attr_grp_meta" AFTER DELETE ON "attr_grp"  FROM "attr_grp_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_grp__attr_grp_meta', 'attr_grp_meta', 'attr_grp', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1034 (OID 64551)
--
-- Name: "RI_ConstraintTrigger_64550" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_grp__attr_grp_meta" AFTER UPDATE ON "attr_grp"  FROM "attr_grp_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_grp__attr_grp_meta', 'attr_grp_meta', 'attr_grp', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1038 (OID 64553)
--
-- Name: "RI_ConstraintTrigger_64552" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp_priv" AFTER INSERT OR UPDATE ON "grp_priv"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_grp__grp_priv', 'grp_priv', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 963 (OID 64555)
--
-- Name: "RI_ConstraintTrigger_64554" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp_priv" AFTER DELETE ON "grp"  FROM "grp_priv" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_grp__grp_priv', 'grp_priv', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 964 (OID 64557)
--
-- Name: "RI_ConstraintTrigger_64556" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp_priv" AFTER UPDATE ON "grp"  FROM "grp_priv" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_grp__grp_priv', 'grp_priv', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 1041 (OID 64559)
--
-- Name: "RI_ConstraintTrigger_64558" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp_priv__grp_priv__grp_mem" AFTER INSERT OR UPDATE ON "grp_priv__grp_member"  FROM "grp_priv" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_grp_priv__grp_priv__grp_mem', 'grp_priv__grp_member', 'grp_priv', 'UNSPECIFIED', 'grp_priv__id', 'id');

--
-- TOC Entry ID 1039 (OID 64561)
--
-- Name: "RI_ConstraintTrigger_64560" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp_priv__grp_priv__grp_mem" AFTER DELETE ON "grp_priv"  FROM "grp_priv__grp_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_grp_priv__grp_priv__grp_mem', 'grp_priv__grp_member', 'grp_priv', 'UNSPECIFIED', 'grp_priv__id', 'id');

--
-- TOC Entry ID 1040 (OID 64563)
--
-- Name: "RI_ConstraintTrigger_64562" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp_priv__grp_priv__grp_mem" AFTER UPDATE ON "grp_priv"  FROM "grp_priv__grp_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_grp_priv__grp_priv__grp_mem', 'grp_priv__grp_member', 'grp_priv', 'UNSPECIFIED', 'grp_priv__id', 'id');

--
-- TOC Entry ID 1042 (OID 64565)
--
-- Name: "RI_ConstraintTrigger_64564" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp_priv__grp_member" AFTER INSERT OR UPDATE ON "grp_priv__grp_member"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_grp__grp_priv__grp_member', 'grp_priv__grp_member', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 965 (OID 64567)
--
-- Name: "RI_ConstraintTrigger_64566" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp_priv__grp_member" AFTER DELETE ON "grp"  FROM "grp_priv__grp_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_grp__grp_priv__grp_member', 'grp_priv__grp_member', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 966 (OID 64569)
--
-- Name: "RI_ConstraintTrigger_64568" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp_priv__grp_member" AFTER UPDATE ON "grp"  FROM "grp_priv__grp_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_grp__grp_priv__grp_member', 'grp_priv__grp_member', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 1047 (OID 64571)
--
-- Name: "RI_ConstraintTrigger_64570" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_pref__pref_opt" AFTER INSERT OR UPDATE ON "pref_opt"  FROM "pref" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_pref__pref_opt', 'pref_opt', 'pref', 'UNSPECIFIED', 'pref__id', 'id');

--
-- TOC Entry ID 1043 (OID 64573)
--
-- Name: "RI_ConstraintTrigger_64572" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_pref__pref_opt" AFTER DELETE ON "pref"  FROM "pref_opt" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_pref__pref_opt', 'pref_opt', 'pref', 'UNSPECIFIED', 'pref__id', 'id');

--
-- TOC Entry ID 1044 (OID 64575)
--
-- Name: "RI_ConstraintTrigger_64574" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_pref__pref_opt" AFTER UPDATE ON "pref"  FROM "pref_opt" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_pref__pref_opt', 'pref_opt', 'pref', 'UNSPECIFIED', 'pref__id', 'id');

--
-- TOC Entry ID 1048 (OID 64577)
--
-- Name: "RI_ConstraintTrigger_64576" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_pref__pref_member" AFTER INSERT OR UPDATE ON "pref_member"  FROM "pref" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_pref__pref_member', 'pref_member', 'pref', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1045 (OID 64579)
--
-- Name: "RI_ConstraintTrigger_64578" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_pref__pref_member" AFTER DELETE ON "pref"  FROM "pref_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_pref__pref_member', 'pref_member', 'pref', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1046 (OID 64581)
--
-- Name: "RI_ConstraintTrigger_64580" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_pref__pref_member" AFTER UPDATE ON "pref"  FROM "pref_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_pref__pref_member', 'pref_member', 'pref', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1049 (OID 64583)
--
-- Name: "RI_ConstraintTrigger_64582" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__pref_member" AFTER INSERT OR UPDATE ON "pref_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__pref_member', 'pref_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1088 (OID 64585)
--
-- Name: "RI_ConstraintTrigger_64584" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__pref_member" AFTER DELETE ON "member"  FROM "pref_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__pref_member', 'pref_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1089 (OID 64587)
--
-- Name: "RI_ConstraintTrigger_64586" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__pref_member" AFTER UPDATE ON "member"  FROM "pref_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__pref_member', 'pref_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1062 (OID 64589)
--
-- Name: "RI_ConstraintTrigger_64588" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__event_type" AFTER INSERT OR UPDATE ON "event_type"  FROM "class" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_class__event_type', 'event_type', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1052 (OID 64591)
--
-- Name: "RI_ConstraintTrigger_64590" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__event_type" AFTER DELETE ON "class"  FROM "event_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_class__event_type', 'event_type', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1053 (OID 64593)
--
-- Name: "RI_ConstraintTrigger_64592" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__event_type" AFTER UPDATE ON "class"  FROM "event_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_class__event_type', 'event_type', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1067 (OID 64595)
--
-- Name: "RI_ConstraintTrigger_64594" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type__event_type_attr" AFTER INSERT OR UPDATE ON "event_type_attr"  FROM "event_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_event_type__event_type_attr', 'event_type_attr', 'event_type', 'UNSPECIFIED', 'event_type__id', 'id');

--
-- TOC Entry ID 1063 (OID 64597)
--
-- Name: "RI_ConstraintTrigger_64596" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type__event_type_attr" AFTER DELETE ON "event_type"  FROM "event_type_attr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_event_type__event_type_attr', 'event_type_attr', 'event_type', 'UNSPECIFIED', 'event_type__id', 'id');

--
-- TOC Entry ID 1064 (OID 64599)
--
-- Name: "RI_ConstraintTrigger_64598" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type__event_type_attr" AFTER UPDATE ON "event_type"  FROM "event_type_attr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_event_type__event_type_attr', 'event_type_attr', 'event_type', 'UNSPECIFIED', 'event_type__id', 'id');

--
-- TOC Entry ID 1072 (OID 64601)
--
-- Name: "RI_ConstraintTrigger_64600" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type__event" AFTER INSERT OR UPDATE ON "event"  FROM "event_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_event_type__event', 'event', 'event_type', 'UNSPECIFIED', 'event_type__id', 'id');

--
-- TOC Entry ID 1065 (OID 64603)
--
-- Name: "RI_ConstraintTrigger_64602" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type__event" AFTER DELETE ON "event_type"  FROM "event" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_event_type__event', 'event', 'event_type', 'UNSPECIFIED', 'event_type__id', 'id');

--
-- TOC Entry ID 1066 (OID 64605)
--
-- Name: "RI_ConstraintTrigger_64604" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type__event" AFTER UPDATE ON "event_type"  FROM "event" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_event_type__event', 'event', 'event_type', 'UNSPECIFIED', 'event_type__id', 'id');

--
-- TOC Entry ID 1073 (OID 64607)
--
-- Name: "RI_ConstraintTrigger_64606" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__event" AFTER INSERT OR UPDATE ON "event"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_usr__event', 'event', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1329 (OID 64609)
--
-- Name: "RI_ConstraintTrigger_64608" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__event" AFTER DELETE ON "usr"  FROM "event" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_usr__event', 'event', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1330 (OID 64611)
--
-- Name: "RI_ConstraintTrigger_64610" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__event" AFTER UPDATE ON "usr"  FROM "event" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_usr__event', 'event', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1076 (OID 64613)
--
-- Name: "RI_ConstraintTrigger_64612" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event__event_attr" AFTER INSERT OR UPDATE ON "event_attr"  FROM "event" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_event__event_attr', 'event_attr', 'event', 'UNSPECIFIED', 'event__id', 'id');

--
-- TOC Entry ID 1074 (OID 64615)
--
-- Name: "RI_ConstraintTrigger_64614" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event__event_attr" AFTER DELETE ON "event"  FROM "event_attr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_event__event_attr', 'event_attr', 'event', 'UNSPECIFIED', 'event__id', 'id');

--
-- TOC Entry ID 1075 (OID 64617)
--
-- Name: "RI_ConstraintTrigger_64616" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event__event_attr" AFTER UPDATE ON "event"  FROM "event_attr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_event__event_attr', 'event_attr', 'event', 'UNSPECIFIED', 'event__id', 'id');

--
-- TOC Entry ID 1077 (OID 64619)
--
-- Name: "RI_ConstraintTrigger_64618" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type_attr__event_attr" AFTER INSERT OR UPDATE ON "event_attr"  FROM "event_type_attr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_event_type_attr__event_attr', 'event_attr', 'event_type_attr', 'UNSPECIFIED', 'event_type_attr__id', 'id');

--
-- TOC Entry ID 1068 (OID 64621)
--
-- Name: "RI_ConstraintTrigger_64620" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type_attr__event_attr" AFTER DELETE ON "event_type_attr"  FROM "event_attr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_event_type_attr__event_attr', 'event_attr', 'event_type_attr', 'UNSPECIFIED', 'event_type_attr__id', 'id');

--
-- TOC Entry ID 1069 (OID 64623)
--
-- Name: "RI_ConstraintTrigger_64622" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_event_type_attr__event_attr" AFTER UPDATE ON "event_type_attr"  FROM "event_attr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_event_type_attr__event_attr', 'event_attr', 'event_type_attr', 'UNSPECIFIED', 'event_type_attr__id', 'id');

--
-- TOC Entry ID 1078 (OID 64625)
--
-- Name: "RI_ConstraintTrigger_64624" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contrib_type__ctype_member" AFTER INSERT OR UPDATE ON "contrib_type_member"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_contrib_type__ctype_member', 'contrib_type_member', 'grp', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 967 (OID 64627)
--
-- Name: "RI_ConstraintTrigger_64626" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contrib_type__ctype_member" AFTER DELETE ON "grp"  FROM "contrib_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_contrib_type__ctype_member', 'contrib_type_member', 'grp', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 968 (OID 64629)
--
-- Name: "RI_ConstraintTrigger_64628" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contrib_type__ctype_member" AFTER UPDATE ON "grp"  FROM "contrib_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_contrib_type__ctype_member', 'contrib_type_member', 'grp', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1079 (OID 64631)
--
-- Name: "RI_ConstraintTrigger_64630" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__ctype_member" AFTER INSERT OR UPDATE ON "contrib_type_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__ctype_member', 'contrib_type_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1090 (OID 64633)
--
-- Name: "RI_ConstraintTrigger_64632" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__ctype_member" AFTER DELETE ON "member"  FROM "contrib_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__ctype_member', 'contrib_type_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1091 (OID 64635)
--
-- Name: "RI_ConstraintTrigger_64634" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__ctype_member" AFTER UPDATE ON "member"  FROM "contrib_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__ctype_member', 'contrib_type_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1080 (OID 64637)
--
-- Name: "RI_ConstraintTrigger_64636" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__alert_type_membe" AFTER INSERT OR UPDATE ON "alert_type_member"  FROM "alert_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_alert_type__alert_type_membe', 'alert_type_member', 'alert_type', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1023 (OID 64639)
--
-- Name: "RI_ConstraintTrigger_64638" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__alert_type_membe" AFTER DELETE ON "alert_type"  FROM "alert_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_alert_type__alert_type_membe', 'alert_type_member', 'alert_type', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1024 (OID 64641)
--
-- Name: "RI_ConstraintTrigger_64640" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_alert_type__alert_type_membe" AFTER UPDATE ON "alert_type"  FROM "alert_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_alert_type__alert_type_membe', 'alert_type_member', 'alert_type', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1081 (OID 64643)
--
-- Name: "RI_ConstraintTrigger_64642" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__alert_type_member" AFTER INSERT OR UPDATE ON "alert_type_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__alert_type_member', 'alert_type_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1092 (OID 64645)
--
-- Name: "RI_ConstraintTrigger_64644" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__alert_type_member" AFTER DELETE ON "member"  FROM "alert_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__alert_type_member', 'alert_type_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1093 (OID 64647)
--
-- Name: "RI_ConstraintTrigger_64646" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__alert_type_member" AFTER UPDATE ON "member"  FROM "alert_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__alert_type_member', 'alert_type_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1082 (OID 64649)
--
-- Name: "RI_ConstraintTrigger_64648" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_user__user_member" AFTER INSERT OR UPDATE ON "user_member"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_user__user_member', 'user_member', 'usr', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1331 (OID 64651)
--
-- Name: "RI_ConstraintTrigger_64650" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_user__user_member" AFTER DELETE ON "usr"  FROM "user_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_user__user_member', 'user_member', 'usr', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1332 (OID 64653)
--
-- Name: "RI_ConstraintTrigger_64652" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_user__user_member" AFTER UPDATE ON "usr"  FROM "user_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_user__user_member', 'user_member', 'usr', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1083 (OID 64655)
--
-- Name: "RI_ConstraintTrigger_64654" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__user_member" AFTER INSERT OR UPDATE ON "user_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__user_member', 'user_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1094 (OID 64657)
--
-- Name: "RI_ConstraintTrigger_64656" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__user_member" AFTER DELETE ON "member"  FROM "user_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__user_member', 'user_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1095 (OID 64659)
--
-- Name: "RI_ConstraintTrigger_64658" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__user_member" AFTER UPDATE ON "member"  FROM "user_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__user_member', 'user_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1084 (OID 64661)
--
-- Name: "RI_ConstraintTrigger_64660" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_source__source_member" AFTER INSERT OR UPDATE ON "source_member"  FROM "source" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_source__source_member', 'source_member', 'source', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1486 (OID 64663)
--
-- Name: "RI_ConstraintTrigger_64662" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_source__source_member" AFTER DELETE ON "source"  FROM "source_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_source__source_member', 'source_member', 'source', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1487 (OID 64665)
--
-- Name: "RI_ConstraintTrigger_64664" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_source__source_member" AFTER UPDATE ON "source"  FROM "source_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_source__source_member', 'source_member', 'source', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1085 (OID 64667)
--
-- Name: "RI_ConstraintTrigger_64666" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__source_member" AFTER INSERT OR UPDATE ON "source_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__source_member', 'source_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1096 (OID 64669)
--
-- Name: "RI_ConstraintTrigger_64668" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__source_member" AFTER DELETE ON "member"  FROM "source_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__source_member', 'source_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1097 (OID 64671)
--
-- Name: "RI_ConstraintTrigger_64670" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__source_member" AFTER UPDATE ON "member"  FROM "source_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__source_member', 'source_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1086 (OID 64673)
--
-- Name: "RI_ConstraintTrigger_64672" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__org_member" AFTER INSERT OR UPDATE ON "org_member"  FROM "org" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_org__org_member', 'org_member', 'org', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1348 (OID 64675)
--
-- Name: "RI_ConstraintTrigger_64674" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__org_member" AFTER DELETE ON "org"  FROM "org_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_org__org_member', 'org_member', 'org', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1349 (OID 64677)
--
-- Name: "RI_ConstraintTrigger_64676" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__org_member" AFTER UPDATE ON "org"  FROM "org_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_org__org_member', 'org_member', 'org', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1087 (OID 64679)
--
-- Name: "RI_ConstraintTrigger_64678" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__org_member" AFTER INSERT OR UPDATE ON "org_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__org_member', 'org_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1098 (OID 64681)
--
-- Name: "RI_ConstraintTrigger_64680" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__org_member" AFTER DELETE ON "member"  FROM "org_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__org_member', 'org_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1099 (OID 64683)
--
-- Name: "RI_ConstraintTrigger_64682" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__org_member" AFTER UPDATE ON "member"  FROM "org_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__org_member', 'org_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1100 (OID 64685)
--
-- Name: "RI_ConstraintTrigger_64684" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__member" AFTER INSERT OR UPDATE ON "member"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_grp__member', 'member', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 969 (OID 64687)
--
-- Name: "RI_ConstraintTrigger_64686" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__member" AFTER DELETE ON "grp"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_grp__member', 'member', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 970 (OID 64689)
--
-- Name: "RI_ConstraintTrigger_64688" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__member" AFTER UPDATE ON "grp"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_grp__member', 'member', 'grp', 'UNSPECIFIED', 'grp__id', 'id');

--
-- TOC Entry ID 1101 (OID 64691)
--
-- Name: "RI_ConstraintTrigger_64690" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__member" AFTER INSERT OR UPDATE ON "member"  FROM "class" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_class__member', 'member', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1054 (OID 64693)
--
-- Name: "RI_ConstraintTrigger_64692" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__member" AFTER DELETE ON "class"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_class__member', 'member', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1055 (OID 64695)
--
-- Name: "RI_ConstraintTrigger_64694" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__member" AFTER UPDATE ON "class"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_class__member', 'member', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1136 (OID 64697)
--
-- Name: "RI_ConstraintTrigger_64696" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story_member" AFTER INSERT OR UPDATE ON "story_member"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_story__story_member', 'story_member', 'story', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1378 (OID 64699)
--
-- Name: "RI_ConstraintTrigger_64698" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story_member" AFTER DELETE ON "story"  FROM "story_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_story__story_member', 'story_member', 'story', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1379 (OID 64701)
--
-- Name: "RI_ConstraintTrigger_64700" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story_member" AFTER UPDATE ON "story"  FROM "story_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_story__story_member', 'story_member', 'story', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1137 (OID 64703)
--
-- Name: "RI_ConstraintTrigger_64702" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__story_member" AFTER INSERT OR UPDATE ON "story_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__story_member', 'story_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1102 (OID 64705)
--
-- Name: "RI_ConstraintTrigger_64704" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__story_member" AFTER DELETE ON "member"  FROM "story_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__story_member', 'story_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1103 (OID 64707)
--
-- Name: "RI_ConstraintTrigger_64706" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__story_member" AFTER UPDATE ON "member"  FROM "story_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__story_member', 'story_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1138 (OID 64709)
--
-- Name: "RI_ConstraintTrigger_64708" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp_member" AFTER INSERT OR UPDATE ON "grp_member"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_grp__grp_member', 'grp_member', 'grp', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 971 (OID 64711)
--
-- Name: "RI_ConstraintTrigger_64710" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp_member" AFTER DELETE ON "grp"  FROM "grp_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_grp__grp_member', 'grp_member', 'grp', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 972 (OID 64713)
--
-- Name: "RI_ConstraintTrigger_64712" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__grp_member" AFTER UPDATE ON "grp"  FROM "grp_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_grp__grp_member', 'grp_member', 'grp', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1139 (OID 64715)
--
-- Name: "RI_ConstraintTrigger_64714" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__grp_member" AFTER INSERT OR UPDATE ON "grp_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__grp_member', 'grp_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1104 (OID 64717)
--
-- Name: "RI_ConstraintTrigger_64716" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__grp_member" AFTER DELETE ON "member"  FROM "grp_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__grp_member', 'grp_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1105 (OID 64719)
--
-- Name: "RI_ConstraintTrigger_64718" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__grp_member" AFTER UPDATE ON "member"  FROM "grp_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__grp_member', 'grp_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1144 (OID 64721)
--
-- Name: "RI_ConstraintTrigger_64720" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_member__attr_member_val" AFTER INSERT OR UPDATE ON "attr_member_val"  FROM "attr_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_member__attr_member_val', 'attr_member_val', 'attr_member', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1140 (OID 64723)
--
-- Name: "RI_ConstraintTrigger_64722" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_member__attr_member_val" AFTER DELETE ON "attr_member"  FROM "attr_member_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_member__attr_member_val', 'attr_member_val', 'attr_member', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1141 (OID 64725)
--
-- Name: "RI_ConstraintTrigger_64724" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_member__attr_member_val" AFTER UPDATE ON "attr_member"  FROM "attr_member_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_member__attr_member_val', 'attr_member_val', 'attr_member', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1145 (OID 64727)
--
-- Name: "RI_ConstraintTrigger_64726" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__attr_member_val" AFTER INSERT OR UPDATE ON "attr_member_val"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__attr_member_val', 'attr_member_val', 'member', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1106 (OID 64729)
--
-- Name: "RI_ConstraintTrigger_64728" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__attr_member_val" AFTER DELETE ON "member"  FROM "attr_member_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__attr_member_val', 'attr_member_val', 'member', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1107 (OID 64731)
--
-- Name: "RI_ConstraintTrigger_64730" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__attr_member_val" AFTER UPDATE ON "member"  FROM "attr_member_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__attr_member_val', 'attr_member_val', 'member', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1146 (OID 64733)
--
-- Name: "RI_ConstraintTrigger_64732" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_member__attr_member_met" AFTER INSERT OR UPDATE ON "attr_member_meta"  FROM "attr_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_member__attr_member_met', 'attr_member_meta', 'attr_member', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1142 (OID 64735)
--
-- Name: "RI_ConstraintTrigger_64734" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_member__attr_member_met" AFTER DELETE ON "attr_member"  FROM "attr_member_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_member__attr_member_met', 'attr_member_meta', 'attr_member', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1143 (OID 64737)
--
-- Name: "RI_ConstraintTrigger_64736" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_member__attr_member_met" AFTER UPDATE ON "attr_member"  FROM "attr_member_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_member__attr_member_met', 'attr_member_meta', 'attr_member', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1149 (OID 64739)
--
-- Name: "RI_ConstraintTrigger_64738" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__resource" AFTER INSERT OR UPDATE ON "resource"  FROM "media_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_media_type__resource', 'resource', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 995 (OID 64741)
--
-- Name: "RI_ConstraintTrigger_64740" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__resource" AFTER DELETE ON "media_type"  FROM "resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_media_type__resource', 'resource', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 996 (OID 64743)
--
-- Name: "RI_ConstraintTrigger_64742" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__resource" AFTER UPDATE ON "media_type"  FROM "resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_media_type__resource', 'resource', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 1150 (OID 64745)
--
-- Name: "RI_ConstraintTrigger_64744" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__resource" AFTER INSERT OR UPDATE ON "resource"  FROM "resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_resource__resource', 'resource', 'resource', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1151 (OID 64747)
--
-- Name: "RI_ConstraintTrigger_64746" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__resource" AFTER DELETE ON "resource"  FROM "resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_resource__resource', 'resource', 'resource', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1152 (OID 64749)
--
-- Name: "RI_ConstraintTrigger_64748" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__resource" AFTER UPDATE ON "resource"  FROM "resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_resource__resource', 'resource', 'resource', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1147 (OID 64751)
--
-- Name: "RI_ConstraintTrigger_64750" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__media__resource" AFTER INSERT OR UPDATE ON "media__resource"  FROM "resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_resource__media__resource', 'media__resource', 'resource', 'UNSPECIFIED', 'resource__id', 'id');

--
-- TOC Entry ID 1153 (OID 64753)
--
-- Name: "RI_ConstraintTrigger_64752" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__media__resource" AFTER DELETE ON "resource"  FROM "media__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_resource__media__resource', 'media__resource', 'resource', 'UNSPECIFIED', 'resource__id', 'id');

--
-- TOC Entry ID 1154 (OID 64755)
--
-- Name: "RI_ConstraintTrigger_64754" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__media__resource" AFTER UPDATE ON "resource"  FROM "media__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_resource__media__resource', 'media__resource', 'resource', 'UNSPECIFIED', 'resource__id', 'id');

--
-- TOC Entry ID 1148 (OID 64757)
--
-- Name: "RI_ConstraintTrigger_64756" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__media__resource" AFTER INSERT OR UPDATE ON "media__resource"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_media__media__resource', 'media__resource', 'media', 'UNSPECIFIED', 'media__id', 'id');

--
-- TOC Entry ID 1414 (OID 64759)
--
-- Name: "RI_ConstraintTrigger_64758" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__media__resource" AFTER DELETE ON "media"  FROM "media__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_media__media__resource', 'media__resource', 'media', 'UNSPECIFIED', 'media__id', 'id');

--
-- TOC Entry ID 1415 (OID 64761)
--
-- Name: "RI_ConstraintTrigger_64760" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__media__resource" AFTER UPDATE ON "media"  FROM "media__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_media__media__resource', 'media__resource', 'media', 'UNSPECIFIED', 'media__id', 'id');

--
-- TOC Entry ID 1159 (OID 64763)
--
-- Name: "RI_ConstraintTrigger_64762" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__story__resource" AFTER INSERT OR UPDATE ON "story__resource"  FROM "resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_resource__story__resource', 'story__resource', 'resource', 'UNSPECIFIED', 'resource__id', 'id');

--
-- TOC Entry ID 1155 (OID 64765)
--
-- Name: "RI_ConstraintTrigger_64764" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__story__resource" AFTER DELETE ON "resource"  FROM "story__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_resource__story__resource', 'story__resource', 'resource', 'UNSPECIFIED', 'resource__id', 'id');

--
-- TOC Entry ID 1156 (OID 64767)
--
-- Name: "RI_ConstraintTrigger_64766" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__story__resource" AFTER UPDATE ON "resource"  FROM "story__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_resource__story__resource', 'story__resource', 'resource', 'UNSPECIFIED', 'resource__id', 'id');

--
-- TOC Entry ID 1160 (OID 64769)
--
-- Name: "RI_ConstraintTrigger_64768" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story__resource" AFTER INSERT OR UPDATE ON "story__resource"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_story__story__resource', 'story__resource', 'story', 'UNSPECIFIED', 'story__id', 'id');

--
-- TOC Entry ID 1380 (OID 64771)
--
-- Name: "RI_ConstraintTrigger_64770" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story__resource" AFTER DELETE ON "story"  FROM "story__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_story__story__resource', 'story__resource', 'story', 'UNSPECIFIED', 'story__id', 'id');

--
-- TOC Entry ID 1381 (OID 64773)
--
-- Name: "RI_ConstraintTrigger_64772" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story__resource" AFTER UPDATE ON "story"  FROM "story__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_story__story__resource', 'story__resource', 'story', 'UNSPECIFIED', 'story__id', 'id');

--
-- TOC Entry ID 1161 (OID 64775)
--
-- Name: "RI_ConstraintTrigger_64774" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_server_type__server" AFTER INSERT OR UPDATE ON "server"  FROM "server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_server_type__server', 'server', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1192 (OID 64777)
--
-- Name: "RI_ConstraintTrigger_64776" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_server_type__server" AFTER DELETE ON "server_type"  FROM "server" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_server_type__server', 'server', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1193 (OID 64779)
--
-- Name: "RI_ConstraintTrigger_64778" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_server_type__server" AFTER UPDATE ON "server_type"  FROM "server" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_server_type__server', 'server', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1166 (OID 64781)
--
-- Name: "RI_ConstraintTrigger_64780" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_action_type__at_mt" AFTER INSERT OR UPDATE ON "action_type__media_type"  FROM "action_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_action_type__at_mt', 'action_type__media_type', 'action_type', 'UNSPECIFIED', 'action_type__id', 'id');

--
-- TOC Entry ID 1162 (OID 64783)
--
-- Name: "RI_ConstraintTrigger_64782" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_action_type__at_mt" AFTER DELETE ON "action_type"  FROM "action_type__media_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_action_type__at_mt', 'action_type__media_type', 'action_type', 'UNSPECIFIED', 'action_type__id', 'id');

--
-- TOC Entry ID 1163 (OID 64785)
--
-- Name: "RI_ConstraintTrigger_64784" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_action_type__at_mt" AFTER UPDATE ON "action_type"  FROM "action_type__media_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_action_type__at_mt', 'action_type__media_type', 'action_type', 'UNSPECIFIED', 'action_type__id', 'id');

--
-- TOC Entry ID 1167 (OID 64787)
--
-- Name: "RI_ConstraintTrigger_64786" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__at_mt" AFTER INSERT OR UPDATE ON "action_type__media_type"  FROM "media_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_media_type__at_mt', 'action_type__media_type', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 997 (OID 64789)
--
-- Name: "RI_ConstraintTrigger_64788" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__at_mt" AFTER DELETE ON "media_type"  FROM "action_type__media_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_media_type__at_mt', 'action_type__media_type', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 998 (OID 64791)
--
-- Name: "RI_ConstraintTrigger_64790" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__at_mt" AFTER UPDATE ON "media_type"  FROM "action_type__media_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_media_type__at_mt', 'action_type__media_type', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 1168 (OID 64793)
--
-- Name: "RI_ConstraintTrigger_64792" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__usr" AFTER INSERT OR UPDATE ON "job"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_job__usr', 'job', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1333 (OID 64795)
--
-- Name: "RI_ConstraintTrigger_64794" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__usr" AFTER DELETE ON "usr"  FROM "job" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_job__usr', 'job', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1334 (OID 64797)
--
-- Name: "RI_ConstraintTrigger_64796" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__usr" AFTER UPDATE ON "usr"  FROM "job" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_job__usr', 'job', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1175 (OID 64799)
--
-- Name: "RI_ConstraintTrigger_64798" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__job__resource" AFTER INSERT OR UPDATE ON "job__resource"  FROM "job" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_job__job__resource', 'job__resource', 'job', 'UNSPECIFIED', 'job__id', 'id');

--
-- TOC Entry ID 1169 (OID 64801)
--
-- Name: "RI_ConstraintTrigger_64800" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__job__resource" AFTER DELETE ON "job"  FROM "job__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_job__job__resource', 'job__resource', 'job', 'UNSPECIFIED', 'job__id', 'id');

--
-- TOC Entry ID 1170 (OID 64803)
--
-- Name: "RI_ConstraintTrigger_64802" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__job__resource" AFTER UPDATE ON "job"  FROM "job__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_job__job__resource', 'job__resource', 'job', 'UNSPECIFIED', 'job__id', 'id');

--
-- TOC Entry ID 1176 (OID 64805)
--
-- Name: "RI_ConstraintTrigger_64804" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__job__resource" AFTER INSERT OR UPDATE ON "job__resource"  FROM "resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_resource__job__resource', 'job__resource', 'resource', 'UNSPECIFIED', 'resource__id', 'id');

--
-- TOC Entry ID 1157 (OID 64807)
--
-- Name: "RI_ConstraintTrigger_64806" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__job__resource" AFTER DELETE ON "resource"  FROM "job__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_resource__job__resource', 'job__resource', 'resource', 'UNSPECIFIED', 'resource__id', 'id');

--
-- TOC Entry ID 1158 (OID 64809)
--
-- Name: "RI_ConstraintTrigger_64808" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_resource__job__resource" AFTER UPDATE ON "resource"  FROM "job__resource" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_resource__job__resource', 'job__resource', 'resource', 'UNSPECIFIED', 'resource__id', 'id');

--
-- TOC Entry ID 1177 (OID 64811)
--
-- Name: "RI_ConstraintTrigger_64810" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__job__server_type" AFTER INSERT OR UPDATE ON "job__server_type"  FROM "job" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_job__job__server_type', 'job__server_type', 'job', 'UNSPECIFIED', 'job__id', 'id');

--
-- TOC Entry ID 1171 (OID 64813)
--
-- Name: "RI_ConstraintTrigger_64812" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__job__server_type" AFTER DELETE ON "job"  FROM "job__server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_job__job__server_type', 'job__server_type', 'job', 'UNSPECIFIED', 'job__id', 'id');

--
-- TOC Entry ID 1172 (OID 64815)
--
-- Name: "RI_ConstraintTrigger_64814" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__job__server_type" AFTER UPDATE ON "job"  FROM "job__server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_job__job__server_type', 'job__server_type', 'job', 'UNSPECIFIED', 'job__id', 'id');

--
-- TOC Entry ID 1178 (OID 64817)
--
-- Name: "RI_ConstraintTrigger_64816" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_srvr_type__job__srvr_type" AFTER INSERT OR UPDATE ON "job__server_type"  FROM "server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_srvr_type__job__srvr_type', 'job__server_type', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1194 (OID 64819)
--
-- Name: "RI_ConstraintTrigger_64818" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_srvr_type__job__srvr_type" AFTER DELETE ON "server_type"  FROM "job__server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_srvr_type__job__srvr_type', 'job__server_type', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1195 (OID 64821)
--
-- Name: "RI_ConstraintTrigger_64820" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_srvr_type__job__srvr_type" AFTER UPDATE ON "server_type"  FROM "job__server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_srvr_type__job__srvr_type', 'job__server_type', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1179 (OID 64823)
--
-- Name: "RI_ConstraintTrigger_64822" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__job_member" AFTER INSERT OR UPDATE ON "job_member"  FROM "job" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_job__job_member', 'job_member', 'job', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1173 (OID 64825)
--
-- Name: "RI_ConstraintTrigger_64824" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__job_member" AFTER DELETE ON "job"  FROM "job_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_job__job_member', 'job_member', 'job', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1174 (OID 64827)
--
-- Name: "RI_ConstraintTrigger_64826" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_job__job_member" AFTER UPDATE ON "job"  FROM "job_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_job__job_member', 'job_member', 'job', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1180 (OID 64829)
--
-- Name: "RI_ConstraintTrigger_64828" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__job_member" AFTER INSERT OR UPDATE ON "job_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__job_member', 'job_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1108 (OID 64831)
--
-- Name: "RI_ConstraintTrigger_64830" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__job_member" AFTER DELETE ON "member"  FROM "job_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__job_member', 'job_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1109 (OID 64833)
--
-- Name: "RI_ConstraintTrigger_64832" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__job_member" AFTER UPDATE ON "member"  FROM "job_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__job_member', 'job_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1189 (OID 64835)
--
-- Name: "RI_ConstraintTrigger_64834" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_action__attr_action_val" AFTER INSERT OR UPDATE ON "attr_action_val"  FROM "attr_action" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_action__attr_action_val', 'attr_action_val', 'attr_action', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1185 (OID 64837)
--
-- Name: "RI_ConstraintTrigger_64836" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_action__attr_action_val" AFTER DELETE ON "attr_action"  FROM "attr_action_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_action__attr_action_val', 'attr_action_val', 'attr_action', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1186 (OID 64839)
--
-- Name: "RI_ConstraintTrigger_64838" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_action__attr_action_val" AFTER UPDATE ON "attr_action"  FROM "attr_action_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_action__attr_action_val', 'attr_action_val', 'attr_action', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1190 (OID 64841)
--
-- Name: "RI_ConstraintTrigger_64840" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_action__attr_action_val" AFTER INSERT OR UPDATE ON "attr_action_val"  FROM "action" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_action__attr_action_val', 'attr_action_val', 'action', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1181 (OID 64843)
--
-- Name: "RI_ConstraintTrigger_64842" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_action__attr_action_val" AFTER DELETE ON "action"  FROM "attr_action_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_action__attr_action_val', 'attr_action_val', 'action', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1182 (OID 64845)
--
-- Name: "RI_ConstraintTrigger_64844" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_action__attr_action_val" AFTER UPDATE ON "action"  FROM "attr_action_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_action__attr_action_val', 'attr_action_val', 'action', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1191 (OID 64847)
--
-- Name: "RI_ConstraintTrigger_64846" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_action__attr_action_met" AFTER INSERT OR UPDATE ON "attr_action_meta"  FROM "attr_action" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_action__attr_action_met', 'attr_action_meta', 'attr_action', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1187 (OID 64849)
--
-- Name: "RI_ConstraintTrigger_64848" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_action__attr_action_met" AFTER DELETE ON "attr_action"  FROM "attr_action_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_action__attr_action_met', 'attr_action_meta', 'attr_action', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1188 (OID 64851)
--
-- Name: "RI_ConstraintTrigger_64850" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_action__attr_action_met" AFTER UPDATE ON "attr_action"  FROM "attr_action_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_action__attr_action_met', 'attr_action_meta', 'attr_action', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1183 (OID 64853)
--
-- Name: "RI_ConstraintTrigger_64852" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_action_type__action" AFTER INSERT OR UPDATE ON "action"  FROM "action_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_action_type__action', 'action', 'action_type', 'UNSPECIFIED', 'action_type__id', 'id');

--
-- TOC Entry ID 1164 (OID 64855)
--
-- Name: "RI_ConstraintTrigger_64854" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_action_type__action" AFTER DELETE ON "action_type"  FROM "action" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_action_type__action', 'action', 'action_type', 'UNSPECIFIED', 'action_type__id', 'id');

--
-- TOC Entry ID 1165 (OID 64857)
--
-- Name: "RI_ConstraintTrigger_64856" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_action_type__action" AFTER UPDATE ON "action_type"  FROM "action" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_action_type__action', 'action', 'action_type', 'UNSPECIFIED', 'action_type__id', 'id');

--
-- TOC Entry ID 1184 (OID 64859)
--
-- Name: "RI_ConstraintTrigger_64858" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_server_type__action" AFTER INSERT OR UPDATE ON "action"  FROM "server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_server_type__action', 'action', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1196 (OID 64861)
--
-- Name: "RI_ConstraintTrigger_64860" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_server_type__action" AFTER DELETE ON "server_type"  FROM "action" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_server_type__action', 'action', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1197 (OID 64863)
--
-- Name: "RI_ConstraintTrigger_64862" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_server_type__action" AFTER UPDATE ON "server_type"  FROM "action" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_server_type__action', 'action', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1198 (OID 64865)
--
-- Name: "RI_ConstraintTrigger_64864" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__server_type" AFTER INSERT OR UPDATE ON "server_type"  FROM "class" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_class__server_type', 'server_type', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1056 (OID 64867)
--
-- Name: "RI_ConstraintTrigger_64866" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__server_type" AFTER DELETE ON "class"  FROM "server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_class__server_type', 'server_type', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1057 (OID 64869)
--
-- Name: "RI_ConstraintTrigger_64868" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__server_type" AFTER UPDATE ON "class"  FROM "server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_class__server_type', 'server_type', 'class', 'UNSPECIFIED', 'class__id', 'id');

--
-- TOC Entry ID 1203 (OID 64871)
--
-- Name: "RI_ConstraintTrigger_64870" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_server_type__st_oc" AFTER INSERT OR UPDATE ON "server_type__output_channel"  FROM "server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_server_type__st_oc', 'server_type__output_channel', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1199 (OID 64873)
--
-- Name: "RI_ConstraintTrigger_64872" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_server_type__st_oc" AFTER DELETE ON "server_type"  FROM "server_type__output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_server_type__st_oc', 'server_type__output_channel', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1200 (OID 64875)
--
-- Name: "RI_ConstraintTrigger_64874" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_server_type__st_oc" AFTER UPDATE ON "server_type"  FROM "server_type__output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_server_type__st_oc', 'server_type__output_channel', 'server_type', 'UNSPECIFIED', 'server_type__id', 'id');

--
-- TOC Entry ID 1204 (OID 64877)
--
-- Name: "RI_ConstraintTrigger_64876" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__st_oc" AFTER INSERT OR UPDATE ON "server_type__output_channel"  FROM "output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_output_channel__st_oc', 'server_type__output_channel', 'output_channel', 'UNSPECIFIED', 'output_channel__id', 'id');

--
-- TOC Entry ID 1470 (OID 64879)
--
-- Name: "RI_ConstraintTrigger_64878" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__st_oc" AFTER DELETE ON "output_channel"  FROM "server_type__output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_output_channel__st_oc', 'server_type__output_channel', 'output_channel', 'UNSPECIFIED', 'output_channel__id', 'id');

--
-- TOC Entry ID 1471 (OID 64881)
--
-- Name: "RI_ConstraintTrigger_64880" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__st_oc" AFTER UPDATE ON "output_channel"  FROM "server_type__output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_output_channel__st_oc', 'server_type__output_channel', 'output_channel', 'UNSPECIFIED', 'output_channel__id', 'id');

--
-- TOC Entry ID 1205 (OID 64883)
--
-- Name: "RI_ConstraintTrigger_64882" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_dest__dest_member" AFTER INSERT OR UPDATE ON "dest_member"  FROM "server_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_dest__dest_member', 'dest_member', 'server_type', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1201 (OID 64885)
--
-- Name: "RI_ConstraintTrigger_64884" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_dest__dest_member" AFTER DELETE ON "server_type"  FROM "dest_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_dest__dest_member', 'dest_member', 'server_type', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1202 (OID 64887)
--
-- Name: "RI_ConstraintTrigger_64886" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_dest__dest_member" AFTER UPDATE ON "server_type"  FROM "dest_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_dest__dest_member', 'dest_member', 'server_type', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1206 (OID 64889)
--
-- Name: "RI_ConstraintTrigger_64888" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__dest_member" AFTER INSERT OR UPDATE ON "dest_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__dest_member', 'dest_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1110 (OID 64891)
--
-- Name: "RI_ConstraintTrigger_64890" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__dest_member" AFTER DELETE ON "member"  FROM "dest_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__dest_member', 'dest_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1111 (OID 64893)
--
-- Name: "RI_ConstraintTrigger_64892" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__dest_member" AFTER UPDATE ON "member"  FROM "dest_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__dest_member', 'dest_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1207 (OID 64895)
--
-- Name: "RI_ConstraintTrigger_64894" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__at_data" AFTER INSERT OR UPDATE ON "at_data"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_element__at_data', 'at_data', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1221 (OID 64897)
--
-- Name: "RI_ConstraintTrigger_64896" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__at_data" AFTER DELETE ON "element"  FROM "at_data" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_element__at_data', 'at_data', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1222 (OID 64899)
--
-- Name: "RI_ConstraintTrigger_64898" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__at_data" AFTER UPDATE ON "element"  FROM "at_data" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_element__at_data', 'at_data', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1218 (OID 64901)
--
-- Name: "RI_ConstraintTrigger_64900" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_atd__attr_atd_val" AFTER INSERT OR UPDATE ON "attr_at_data_val"  FROM "attr_at_data" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_atd__attr_atd_val', 'attr_at_data_val', 'attr_at_data', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1214 (OID 64903)
--
-- Name: "RI_ConstraintTrigger_64902" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_atd__attr_atd_val" AFTER DELETE ON "attr_at_data"  FROM "attr_at_data_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_atd__attr_atd_val', 'attr_at_data_val', 'attr_at_data', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1215 (OID 64905)
--
-- Name: "RI_ConstraintTrigger_64904" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_atd__attr_atd_val" AFTER UPDATE ON "attr_at_data"  FROM "attr_at_data_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_atd__attr_atd_val', 'attr_at_data_val', 'attr_at_data', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1219 (OID 64907)
--
-- Name: "RI_ConstraintTrigger_64906" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_atd__attr_atd_val" AFTER INSERT OR UPDATE ON "attr_at_data_val"  FROM "at_data" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_atd__attr_atd_val', 'attr_at_data_val', 'at_data', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1208 (OID 64909)
--
-- Name: "RI_ConstraintTrigger_64908" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_atd__attr_atd_val" AFTER DELETE ON "at_data"  FROM "attr_at_data_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_atd__attr_atd_val', 'attr_at_data_val', 'at_data', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1209 (OID 64911)
--
-- Name: "RI_ConstraintTrigger_64910" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_atd__attr_atd_val" AFTER UPDATE ON "at_data"  FROM "attr_at_data_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_atd__attr_atd_val', 'attr_at_data_val', 'at_data', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1220 (OID 64913)
--
-- Name: "RI_ConstraintTrigger_64912" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_atd__attr_atd_meta" AFTER INSERT OR UPDATE ON "attr_at_data_meta"  FROM "attr_at_data" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_atd__attr_atd_meta', 'attr_at_data_meta', 'attr_at_data', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1216 (OID 64915)
--
-- Name: "RI_ConstraintTrigger_64914" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_atd__attr_atd_meta" AFTER DELETE ON "attr_at_data"  FROM "attr_at_data_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_atd__attr_atd_meta', 'attr_at_data_meta', 'attr_at_data', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1217 (OID 64917)
--
-- Name: "RI_ConstraintTrigger_64916" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_atd__attr_atd_meta" AFTER UPDATE ON "attr_at_data"  FROM "attr_at_data_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_atd__attr_atd_meta', 'attr_at_data_meta', 'attr_at_data', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1223 (OID 64919)
--
-- Name: "RI_ConstraintTrigger_64918" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at_type__element" AFTER INSERT OR UPDATE ON "element"  FROM "at_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_at_type__element', 'element', 'at_type', 'UNSPECIFIED', 'type__id', 'id');

--
-- TOC Entry ID 1248 (OID 64921)
--
-- Name: "RI_ConstraintTrigger_64920" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at_type__element" AFTER DELETE ON "at_type"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_at_type__element', 'element', 'at_type', 'UNSPECIFIED', 'type__id', 'id');

--
-- TOC Entry ID 1249 (OID 64923)
--
-- Name: "RI_ConstraintTrigger_64922" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at_type__element" AFTER UPDATE ON "at_type"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_at_type__element', 'element', 'at_type', 'UNSPECIFIED', 'type__id', 'id');

--
-- TOC Entry ID 1224 (OID 64925)
--
-- Name: "RI_ConstraintTrigger_64924" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__element" AFTER INSERT OR UPDATE ON "element"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_grp__element', 'element', 'grp', 'UNSPECIFIED', 'at_grp__id', 'id');

--
-- TOC Entry ID 973 (OID 64927)
--
-- Name: "RI_ConstraintTrigger_64926" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__element" AFTER DELETE ON "grp"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_grp__element', 'element', 'grp', 'UNSPECIFIED', 'at_grp__id', 'id');

--
-- TOC Entry ID 974 (OID 64929)
--
-- Name: "RI_ConstraintTrigger_64928" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__element" AFTER UPDATE ON "grp"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_grp__element', 'element', 'grp', 'UNSPECIFIED', 'at_grp__id', 'id');

--
-- TOC Entry ID 1225 (OID 64931)
--
-- Name: "RI_ConstraintTrigger_64930" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__element" AFTER INSERT OR UPDATE ON "element"  FROM "output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_output_channel__element', 'element', 'output_channel', 'UNSPECIFIED', 'primary_oc__id', 'id');

--
-- TOC Entry ID 1472 (OID 64933)
--
-- Name: "RI_ConstraintTrigger_64932" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__element" AFTER DELETE ON "output_channel"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_output_channel__element', 'element', 'output_channel', 'UNSPECIFIED', 'primary_oc__id', 'id');

--
-- TOC Entry ID 1473 (OID 64935)
--
-- Name: "RI_ConstraintTrigger_64934" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__element" AFTER UPDATE ON "output_channel"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_output_channel__element', 'element', 'output_channel', 'UNSPECIFIED', 'primary_oc__id', 'id');

--
-- TOC Entry ID 1238 (OID 64937)
--
-- Name: "RI_ConstraintTrigger_64936" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__at_oc" AFTER INSERT OR UPDATE ON "element__output_channel"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_element__at_oc', 'element__output_channel', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1226 (OID 64939)
--
-- Name: "RI_ConstraintTrigger_64938" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__at_oc" AFTER DELETE ON "element"  FROM "element__output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_element__at_oc', 'element__output_channel', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1227 (OID 64941)
--
-- Name: "RI_ConstraintTrigger_64940" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__at_oc" AFTER UPDATE ON "element"  FROM "element__output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_element__at_oc', 'element__output_channel', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1239 (OID 64943)
--
-- Name: "RI_ConstraintTrigger_64942" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__at_oc" AFTER INSERT OR UPDATE ON "element__output_channel"  FROM "output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_output_channel__at_oc', 'element__output_channel', 'output_channel', 'UNSPECIFIED', 'output_channel__id', 'id');

--
-- TOC Entry ID 1474 (OID 64945)
--
-- Name: "RI_ConstraintTrigger_64944" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__at_oc" AFTER DELETE ON "output_channel"  FROM "element__output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_output_channel__at_oc', 'element__output_channel', 'output_channel', 'UNSPECIFIED', 'output_channel__id', 'id');

--
-- TOC Entry ID 1475 (OID 64947)
--
-- Name: "RI_ConstraintTrigger_64946" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__at_oc" AFTER UPDATE ON "output_channel"  FROM "element__output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_output_channel__at_oc', 'element__output_channel', 'output_channel', 'UNSPECIFIED', 'output_channel__id', 'id');

--
-- TOC Entry ID 1240 (OID 64949)
--
-- Name: "RI_ConstraintTrigger_64948" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__at_member" AFTER INSERT OR UPDATE ON "element_member"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_element__at_member', 'element_member', 'element', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1228 (OID 64951)
--
-- Name: "RI_ConstraintTrigger_64950" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__at_member" AFTER DELETE ON "element"  FROM "element_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_element__at_member', 'element_member', 'element', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1229 (OID 64953)
--
-- Name: "RI_ConstraintTrigger_64952" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__at_member" AFTER UPDATE ON "element"  FROM "element_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_element__at_member', 'element_member', 'element', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1291 (OID 64955)
--
-- Name: "RI_ConstraintTrigger_64954" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__at_member" AFTER INSERT OR UPDATE ON "category_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__at_member', 'category_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1112 (OID 64957)
--
-- Name: "RI_ConstraintTrigger_64956" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__at_member" AFTER DELETE ON "member"  FROM "category_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__at_member', 'category_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1113 (OID 64959)
--
-- Name: "RI_ConstraintTrigger_64958" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__at_member" AFTER UPDATE ON "member"  FROM "category_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__at_member', 'category_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1245 (OID 64961)
--
-- Name: "RI_ConstraintTrigger_64960" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_at__attr_at_val" AFTER INSERT OR UPDATE ON "attr_element_val"  FROM "attr_element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_at__attr_at_val', 'attr_element_val', 'attr_element', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1241 (OID 64963)
--
-- Name: "RI_ConstraintTrigger_64962" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_at__attr_at_val" AFTER DELETE ON "attr_element"  FROM "attr_element_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_at__attr_at_val', 'attr_element_val', 'attr_element', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1242 (OID 64965)
--
-- Name: "RI_ConstraintTrigger_64964" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_at__attr_at_val" AFTER UPDATE ON "attr_element"  FROM "attr_element_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_at__attr_at_val', 'attr_element_val', 'attr_element', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1246 (OID 64967)
--
-- Name: "RI_ConstraintTrigger_64966" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at__attr_at_val" AFTER INSERT OR UPDATE ON "attr_element_val"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_at__attr_at_val', 'attr_element_val', 'element', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1230 (OID 64969)
--
-- Name: "RI_ConstraintTrigger_64968" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at__attr_at_val" AFTER DELETE ON "element"  FROM "attr_element_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_at__attr_at_val', 'attr_element_val', 'element', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1231 (OID 64971)
--
-- Name: "RI_ConstraintTrigger_64970" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at__attr_at_val" AFTER UPDATE ON "element"  FROM "attr_element_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_at__attr_at_val', 'attr_element_val', 'element', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1247 (OID 64973)
--
-- Name: "RI_ConstraintTrigger_64972" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_at__attr_at_meta" AFTER INSERT OR UPDATE ON "attr_element_meta"  FROM "attr_element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_at__attr_at_meta', 'attr_element_meta', 'attr_element', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1243 (OID 64975)
--
-- Name: "RI_ConstraintTrigger_64974" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_at__attr_at_meta" AFTER DELETE ON "attr_element"  FROM "attr_element_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_at__attr_at_meta', 'attr_element_meta', 'attr_element', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1244 (OID 64977)
--
-- Name: "RI_ConstraintTrigger_64976" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_at__attr_at_meta" AFTER UPDATE ON "attr_element"  FROM "attr_element_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_at__attr_at_meta', 'attr_element_meta', 'attr_element', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1250 (OID 64979)
--
-- Name: "RI_ConstraintTrigger_64978" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__at_type" AFTER INSERT OR UPDATE ON "at_type"  FROM "class" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_class__at_type', 'at_type', 'class', 'UNSPECIFIED', 'biz_class__id', 'id');

--
-- TOC Entry ID 1058 (OID 64981)
--
-- Name: "RI_ConstraintTrigger_64980" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__at_type" AFTER DELETE ON "class"  FROM "at_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_class__at_type', 'at_type', 'class', 'UNSPECIFIED', 'biz_class__id', 'id');

--
-- TOC Entry ID 1059 (OID 64983)
--
-- Name: "RI_ConstraintTrigger_64982" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_class__at_type" AFTER UPDATE ON "class"  FROM "at_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_class__at_type', 'at_type', 'class', 'UNSPECIFIED', 'biz_class__id', 'id');

--
-- TOC Entry ID 1253 (OID 64985)
--
-- Name: "RI_ConstraintTrigger_64984" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_comp_type__comp_type_member" AFTER INSERT OR UPDATE ON "element_type_member"  FROM "at_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_comp_type__comp_type_member', 'element_type_member', 'at_type', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1251 (OID 64987)
--
-- Name: "RI_ConstraintTrigger_64986" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_comp_type__comp_type_member" AFTER DELETE ON "at_type"  FROM "element_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_comp_type__comp_type_member', 'element_type_member', 'at_type', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1252 (OID 64989)
--
-- Name: "RI_ConstraintTrigger_64988" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_comp_type__comp_type_member" AFTER UPDATE ON "at_type"  FROM "element_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_comp_type__comp_type_member', 'element_type_member', 'at_type', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1254 (OID 64991)
--
-- Name: "RI_ConstraintTrigger_64990" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__comp_type_member" AFTER INSERT OR UPDATE ON "element_type_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__comp_type_member', 'element_type_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1114 (OID 64993)
--
-- Name: "RI_ConstraintTrigger_64992" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__comp_type_member" AFTER DELETE ON "member"  FROM "element_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__comp_type_member', 'element_type_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1115 (OID 64995)
--
-- Name: "RI_ConstraintTrigger_64994" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__comp_type_member" AFTER UPDATE ON "member"  FROM "element_type_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__comp_type_member', 'element_type_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1263 (OID 64997)
--
-- Name: "RI_ConstraintTrigger_64996" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__contact_value" AFTER INSERT OR UPDATE ON "contact_value"  FROM "contact" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_contact__contact_value', 'contact_value', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1261 (OID 64999)
--
-- Name: "RI_ConstraintTrigger_64998" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__contact_value" AFTER DELETE ON "contact"  FROM "contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_contact__contact_value', 'contact_value', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1262 (OID 65001)
--
-- Name: "RI_ConstraintTrigger_65000" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact__contact_value" AFTER UPDATE ON "contact"  FROM "contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_contact__contact_value', 'contact_value', 'contact', 'UNSPECIFIED', 'contact__id', 'id');

--
-- TOC Entry ID 1266 (OID 65003)
--
-- Name: "RI_ConstraintTrigger_65002" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__p_c_val" AFTER INSERT OR UPDATE ON "person__contact_value"  FROM "person" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_person__p_c_val', 'person__contact_value', 'person', 'UNSPECIFIED', 'person__id', 'id');

--
-- TOC Entry ID 1268 (OID 65005)
--
-- Name: "RI_ConstraintTrigger_65004" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__p_c_val" AFTER DELETE ON "person"  FROM "person__contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_person__p_c_val', 'person__contact_value', 'person', 'UNSPECIFIED', 'person__id', 'id');

--
-- TOC Entry ID 1269 (OID 65007)
--
-- Name: "RI_ConstraintTrigger_65006" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__p_c_val" AFTER UPDATE ON "person"  FROM "person__contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_person__p_c_val', 'person__contact_value', 'person', 'UNSPECIFIED', 'person__id', 'id');

--
-- TOC Entry ID 1267 (OID 65009)
--
-- Name: "RI_ConstraintTrigger_65008" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact_value__p_c_val" AFTER INSERT OR UPDATE ON "person__contact_value"  FROM "contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_contact_value__p_c_val', 'person__contact_value', 'contact_value', 'UNSPECIFIED', 'contact_value__id', 'id');

--
-- TOC Entry ID 1264 (OID 65011)
--
-- Name: "RI_ConstraintTrigger_65010" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact_value__p_c_val" AFTER DELETE ON "contact_value"  FROM "person__contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_contact_value__p_c_val', 'person__contact_value', 'contact_value', 'UNSPECIFIED', 'contact_value__id', 'id');

--
-- TOC Entry ID 1265 (OID 65013)
--
-- Name: "RI_ConstraintTrigger_65012" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_contact_value__p_c_val" AFTER UPDATE ON "contact_value"  FROM "person__contact_value" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_contact_value__p_c_val', 'person__contact_value', 'contact_value', 'UNSPECIFIED', 'contact_value__id', 'id');

--
-- TOC Entry ID 1276 (OID 65015)
--
-- Name: "RI_ConstraintTrigger_65014" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__person_member" AFTER INSERT OR UPDATE ON "person_member"  FROM "person" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_person__person_member', 'person_member', 'person', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1270 (OID 65017)
--
-- Name: "RI_ConstraintTrigger_65016" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__person_member" AFTER DELETE ON "person"  FROM "person_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_person__person_member', 'person_member', 'person', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1271 (OID 65019)
--
-- Name: "RI_ConstraintTrigger_65018" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__person_member" AFTER UPDATE ON "person"  FROM "person_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_person__person_member', 'person_member', 'person', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1277 (OID 65021)
--
-- Name: "RI_ConstraintTrigger_65020" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__person_member" AFTER INSERT OR UPDATE ON "person_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__person_member', 'person_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1116 (OID 65023)
--
-- Name: "RI_ConstraintTrigger_65022" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__person_member" AFTER DELETE ON "member"  FROM "person_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__person_member', 'person_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1117 (OID 65025)
--
-- Name: "RI_ConstraintTrigger_65024" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__person_member" AFTER UPDATE ON "member"  FROM "person_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__person_member', 'person_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1278 (OID 65027)
--
-- Name: "RI_ConstraintTrigger_65026" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_subcat_grp__category" AFTER INSERT OR UPDATE ON "category"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_subcat_grp__category', 'category', 'grp', 'UNSPECIFIED', 'category_grp_id', 'id');

--
-- TOC Entry ID 975 (OID 65029)
--
-- Name: "RI_ConstraintTrigger_65028" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_subcat_grp__category" AFTER DELETE ON "grp"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_subcat_grp__category', 'category', 'grp', 'UNSPECIFIED', 'category_grp_id', 'id');

--
-- TOC Entry ID 976 (OID 65031)
--
-- Name: "RI_ConstraintTrigger_65030" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_subcat_grp__category" AFTER UPDATE ON "grp"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_subcat_grp__category', 'category', 'grp', 'UNSPECIFIED', 'category_grp_id', 'id');

--
-- TOC Entry ID 1279 (OID 65033)
--
-- Name: "RI_ConstraintTrigger_65032" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_kw_grp__category" AFTER INSERT OR UPDATE ON "category"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_kw_grp__category', 'category', 'grp', 'UNSPECIFIED', 'keyword_grp_id', 'id');

--
-- TOC Entry ID 977 (OID 65035)
--
-- Name: "RI_ConstraintTrigger_65034" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_kw_grp__category" AFTER DELETE ON "grp"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_kw_grp__category', 'category', 'grp', 'UNSPECIFIED', 'keyword_grp_id', 'id');

--
-- TOC Entry ID 978 (OID 65037)
--
-- Name: "RI_ConstraintTrigger_65036" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_kw_grp__category" AFTER UPDATE ON "grp"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_kw_grp__category', 'category', 'grp', 'UNSPECIFIED', 'keyword_grp_id', 'id');

--
-- TOC Entry ID 1280 (OID 65039)
--
-- Name: "RI_ConstraintTrigger_65038" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_asset_grp__category" AFTER INSERT OR UPDATE ON "category"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_asset_grp__category', 'category', 'grp', 'UNSPECIFIED', 'asset_grp_id', 'id');

--
-- TOC Entry ID 979 (OID 65041)
--
-- Name: "RI_ConstraintTrigger_65040" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_asset_grp__category" AFTER DELETE ON "grp"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_asset_grp__category', 'category', 'grp', 'UNSPECIFIED', 'asset_grp_id', 'id');

--
-- TOC Entry ID 980 (OID 65043)
--
-- Name: "RI_ConstraintTrigger_65042" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_asset_grp__category" AFTER UPDATE ON "grp"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_asset_grp__category', 'category', 'grp', 'UNSPECIFIED', 'asset_grp_id', 'id');

--
-- TOC Entry ID 1292 (OID 65045)
--
-- Name: "RI_ConstraintTrigger_65044" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__category_member" AFTER INSERT OR UPDATE ON "category_member"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_category__category_member', 'category_member', 'category', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1281 (OID 65047)
--
-- Name: "RI_ConstraintTrigger_65046" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__category_member" AFTER DELETE ON "category"  FROM "category_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_category__category_member', 'category_member', 'category', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1282 (OID 65049)
--
-- Name: "RI_ConstraintTrigger_65048" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__category_member" AFTER UPDATE ON "category"  FROM "category_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_category__category_member', 'category_member', 'category', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1293 (OID 65051)
--
-- Name: "RI_ConstraintTrigger_65050" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__category_member" AFTER INSERT OR UPDATE ON "category_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__category_member', 'category_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1118 (OID 65053)
--
-- Name: "RI_ConstraintTrigger_65052" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__category_member" AFTER DELETE ON "member"  FROM "category_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__category_member', 'category_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1119 (OID 65055)
--
-- Name: "RI_ConstraintTrigger_65054" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__category_member" AFTER UPDATE ON "member"  FROM "category_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__category_member', 'category_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1298 (OID 65057)
--
-- Name: "RI_ConstraintTrigger_65056" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_cat__attr_cat_val" AFTER INSERT OR UPDATE ON "attr_category_val"  FROM "attr_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_cat__attr_cat_val', 'attr_category_val', 'attr_category', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1294 (OID 65059)
--
-- Name: "RI_ConstraintTrigger_65058" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_cat__attr_cat_val" AFTER DELETE ON "attr_category"  FROM "attr_category_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_cat__attr_cat_val', 'attr_category_val', 'attr_category', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1295 (OID 65061)
--
-- Name: "RI_ConstraintTrigger_65060" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_cat__attr_cat_val" AFTER UPDATE ON "attr_category"  FROM "attr_category_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_cat__attr_cat_val', 'attr_category_val', 'attr_category', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1299 (OID 65063)
--
-- Name: "RI_ConstraintTrigger_65062" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_cat__attr_cat_val" AFTER INSERT OR UPDATE ON "attr_category_val"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_cat__attr_cat_val', 'attr_category_val', 'category', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1283 (OID 65065)
--
-- Name: "RI_ConstraintTrigger_65064" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_cat__attr_cat_val" AFTER DELETE ON "category"  FROM "attr_category_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_cat__attr_cat_val', 'attr_category_val', 'category', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1284 (OID 65067)
--
-- Name: "RI_ConstraintTrigger_65066" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_cat__attr_cat_val" AFTER UPDATE ON "category"  FROM "attr_category_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_cat__attr_cat_val', 'attr_category_val', 'category', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1300 (OID 65069)
--
-- Name: "RI_ConstraintTrigger_65068" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_cat__attr_cat_meta" AFTER INSERT OR UPDATE ON "attr_category_meta"  FROM "attr_category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_cat__attr_cat_meta', 'attr_category_meta', 'attr_category', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1296 (OID 65071)
--
-- Name: "RI_ConstraintTrigger_65070" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_cat__attr_cat_meta" AFTER DELETE ON "attr_category"  FROM "attr_category_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_cat__attr_cat_meta', 'attr_category_meta', 'attr_category', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1297 (OID 65073)
--
-- Name: "RI_ConstraintTrigger_65072" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_cat__attr_cat_meta" AFTER UPDATE ON "attr_category"  FROM "attr_category_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_cat__attr_cat_meta', 'attr_category_meta', 'attr_category', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1301 (OID 65075)
--
-- Name: "RI_ConstraintTrigger_65074" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_keyword__grp" AFTER INSERT OR UPDATE ON "keyword"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_keyword__grp', 'keyword', 'grp', 'UNSPECIFIED', 'synonym_grp_id', 'id');

--
-- TOC Entry ID 981 (OID 65077)
--
-- Name: "RI_ConstraintTrigger_65076" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_keyword__grp" AFTER DELETE ON "grp"  FROM "keyword" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_keyword__grp', 'keyword', 'grp', 'UNSPECIFIED', 'synonym_grp_id', 'id');

--
-- TOC Entry ID 982 (OID 65079)
--
-- Name: "RI_ConstraintTrigger_65078" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_keyword__grp" AFTER UPDATE ON "grp"  FROM "keyword" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_keyword__grp', 'keyword', 'grp', 'UNSPECIFIED', 'synonym_grp_id', 'id');

--
-- TOC Entry ID 1304 (OID 65081)
--
-- Name: "RI_ConstraintTrigger_65080" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_keyword__keyword_member" AFTER INSERT OR UPDATE ON "keyword_member"  FROM "keyword" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_keyword__keyword_member', 'keyword_member', 'keyword', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1302 (OID 65083)
--
-- Name: "RI_ConstraintTrigger_65082" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_keyword__keyword_member" AFTER DELETE ON "keyword"  FROM "keyword_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_keyword__keyword_member', 'keyword_member', 'keyword', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1303 (OID 65085)
--
-- Name: "RI_ConstraintTrigger_65084" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_keyword__keyword_member" AFTER UPDATE ON "keyword"  FROM "keyword_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_keyword__keyword_member', 'keyword_member', 'keyword', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1305 (OID 65087)
--
-- Name: "RI_ConstraintTrigger_65086" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__keyword_member" AFTER INSERT OR UPDATE ON "keyword_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__keyword_member', 'keyword_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1120 (OID 65089)
--
-- Name: "RI_ConstraintTrigger_65088" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__keyword_member" AFTER DELETE ON "member"  FROM "keyword_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__keyword_member', 'keyword_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1121 (OID 65091)
--
-- Name: "RI_ConstraintTrigger_65090" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__keyword_member" AFTER UPDATE ON "member"  FROM "keyword_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__keyword_member', 'keyword_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1314 (OID 65093)
--
-- Name: "RI_ConstraintTrigger_65092" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__workflow_member" AFTER INSERT OR UPDATE ON "workflow_member"  FROM "workflow" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_workflow__workflow_member', 'workflow_member', 'workflow', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1306 (OID 65095)
--
-- Name: "RI_ConstraintTrigger_65094" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__workflow_member" AFTER DELETE ON "workflow"  FROM "workflow_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_workflow__workflow_member', 'workflow_member', 'workflow', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1307 (OID 65097)
--
-- Name: "RI_ConstraintTrigger_65096" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__workflow_member" AFTER UPDATE ON "workflow"  FROM "workflow_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_workflow__workflow_member', 'workflow_member', 'workflow', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1315 (OID 65099)
--
-- Name: "RI_ConstraintTrigger_65098" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__workflow_member" AFTER INSERT OR UPDATE ON "workflow_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__workflow_member', 'workflow_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1122 (OID 65101)
--
-- Name: "RI_ConstraintTrigger_65100" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__workflow_member" AFTER DELETE ON "member"  FROM "workflow_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__workflow_member', 'workflow_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1123 (OID 65103)
--
-- Name: "RI_ConstraintTrigger_65102" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__workflow_member" AFTER UPDATE ON "member"  FROM "workflow_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__workflow_member', 'workflow_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1316 (OID 65105)
--
-- Name: "RI_ConstraintTrigger_65104" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_pre_grp__desk" AFTER INSERT OR UPDATE ON "desk"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_pre_grp__desk', 'desk', 'grp', 'UNSPECIFIED', 'pre_chk_rules', 'id');

--
-- TOC Entry ID 983 (OID 65107)
--
-- Name: "RI_ConstraintTrigger_65106" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_pre_grp__desk" AFTER DELETE ON "grp"  FROM "desk" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_pre_grp__desk', 'desk', 'grp', 'UNSPECIFIED', 'pre_chk_rules', 'id');

--
-- TOC Entry ID 984 (OID 65109)
--
-- Name: "RI_ConstraintTrigger_65108" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_pre_grp__desk" AFTER UPDATE ON "grp"  FROM "desk" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_pre_grp__desk', 'desk', 'grp', 'UNSPECIFIED', 'pre_chk_rules', 'id');

--
-- TOC Entry ID 1317 (OID 65111)
--
-- Name: "RI_ConstraintTrigger_65110" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_post_grp__desk" AFTER INSERT OR UPDATE ON "desk"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_post_grp__desk', 'desk', 'grp', 'UNSPECIFIED', 'post_chk_rules', 'id');

--
-- TOC Entry ID 985 (OID 65113)
--
-- Name: "RI_ConstraintTrigger_65112" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_post_grp__desk" AFTER DELETE ON "grp"  FROM "desk" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_post_grp__desk', 'desk', 'grp', 'UNSPECIFIED', 'post_chk_rules', 'id');

--
-- TOC Entry ID 986 (OID 65115)
--
-- Name: "RI_ConstraintTrigger_65114" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_post_grp__desk" AFTER UPDATE ON "grp"  FROM "desk" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_post_grp__desk', 'desk', 'grp', 'UNSPECIFIED', 'post_chk_rules', 'id');

--
-- TOC Entry ID 1318 (OID 65117)
--
-- Name: "RI_ConstraintTrigger_65116" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_asset_grp__desk" AFTER INSERT OR UPDATE ON "desk"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_asset_grp__desk', 'desk', 'grp', 'UNSPECIFIED', 'asset_grp', 'id');

--
-- TOC Entry ID 987 (OID 65119)
--
-- Name: "RI_ConstraintTrigger_65118" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_asset_grp__desk" AFTER DELETE ON "grp"  FROM "desk" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_asset_grp__desk', 'desk', 'grp', 'UNSPECIFIED', 'asset_grp', 'id');

--
-- TOC Entry ID 988 (OID 65121)
--
-- Name: "RI_ConstraintTrigger_65120" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_asset_grp__desk" AFTER UPDATE ON "grp"  FROM "desk" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_asset_grp__desk', 'desk', 'grp', 'UNSPECIFIED', 'asset_grp', 'id');

--
-- TOC Entry ID 1321 (OID 65123)
--
-- Name: "RI_ConstraintTrigger_65122" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_desk__desk_member" AFTER INSERT OR UPDATE ON "desk_member"  FROM "desk" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_desk__desk_member', 'desk_member', 'desk', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1319 (OID 65125)
--
-- Name: "RI_ConstraintTrigger_65124" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_desk__desk_member" AFTER DELETE ON "desk"  FROM "desk_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_desk__desk_member', 'desk_member', 'desk', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1320 (OID 65127)
--
-- Name: "RI_ConstraintTrigger_65126" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_desk__desk_member" AFTER UPDATE ON "desk"  FROM "desk_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_desk__desk_member', 'desk_member', 'desk', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1322 (OID 65129)
--
-- Name: "RI_ConstraintTrigger_65128" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__desk_member" AFTER INSERT OR UPDATE ON "desk_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__desk_member', 'desk_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1124 (OID 65131)
--
-- Name: "RI_ConstraintTrigger_65130" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__desk_member" AFTER DELETE ON "member"  FROM "desk_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__desk_member', 'desk_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1125 (OID 65133)
--
-- Name: "RI_ConstraintTrigger_65132" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__desk_member" AFTER UPDATE ON "member"  FROM "desk_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__desk_member', 'desk_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1335 (OID 65135)
--
-- Name: "RI_ConstraintTrigger_65134" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__usr" AFTER INSERT OR UPDATE ON "usr"  FROM "person" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_person__usr', 'usr', 'person', 'UNSPECIFIED', 'id', 'id');

--
-- TOC Entry ID 1272 (OID 65137)
--
-- Name: "RI_ConstraintTrigger_65136" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__usr" AFTER DELETE ON "person"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_person__usr', 'usr', 'person', 'UNSPECIFIED', 'id', 'id');

--
-- TOC Entry ID 1273 (OID 65139)
--
-- Name: "RI_ConstraintTrigger_65138" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__usr" AFTER UPDATE ON "person"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_person__usr', 'usr', 'person', 'UNSPECIFIED', 'id', 'id');

--
-- TOC Entry ID 1356 (OID 65141)
--
-- Name: "RI_ConstraintTrigger_65140" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__formatting" AFTER INSERT OR UPDATE ON "formatting"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_usr__formatting', 'formatting', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1336 (OID 65143)
--
-- Name: "RI_ConstraintTrigger_65142" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__formatting" AFTER DELETE ON "usr"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_usr__formatting', 'formatting', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1337 (OID 65145)
--
-- Name: "RI_ConstraintTrigger_65144" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__formatting" AFTER UPDATE ON "usr"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_usr__formatting', 'formatting', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1357 (OID 65147)
--
-- Name: "RI_ConstraintTrigger_65146" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__fromatting" AFTER INSERT OR UPDATE ON "formatting"  FROM "output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_output_channel__fromatting', 'formatting', 'output_channel', 'UNSPECIFIED', 'output_channel__id', 'id');

--
-- TOC Entry ID 1476 (OID 65149)
--
-- Name: "RI_ConstraintTrigger_65148" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__fromatting" AFTER DELETE ON "output_channel"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_output_channel__fromatting', 'formatting', 'output_channel', 'UNSPECIFIED', 'output_channel__id', 'id');

--
-- TOC Entry ID 1477 (OID 65151)
--
-- Name: "RI_ConstraintTrigger_65150" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__fromatting" AFTER UPDATE ON "output_channel"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_output_channel__fromatting', 'formatting', 'output_channel', 'UNSPECIFIED', 'output_channel__id', 'id');

--
-- TOC Entry ID 1358 (OID 65153)
--
-- Name: "RI_ConstraintTrigger_65152" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__formatting" AFTER INSERT OR UPDATE ON "formatting"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_element__formatting', 'formatting', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1232 (OID 65155)
--
-- Name: "RI_ConstraintTrigger_65154" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__formatting" AFTER DELETE ON "element"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_element__formatting', 'formatting', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1233 (OID 65157)
--
-- Name: "RI_ConstraintTrigger_65156" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__formatting" AFTER UPDATE ON "element"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_element__formatting', 'formatting', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1359 (OID 65159)
--
-- Name: "RI_ConstraintTrigger_65158" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__formatting" AFTER INSERT OR UPDATE ON "formatting"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_category__formatting', 'formatting', 'category', 'UNSPECIFIED', 'category__id', 'id');

--
-- TOC Entry ID 1285 (OID 65161)
--
-- Name: "RI_ConstraintTrigger_65160" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__formatting" AFTER DELETE ON "category"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_category__formatting', 'formatting', 'category', 'UNSPECIFIED', 'category__id', 'id');

--
-- TOC Entry ID 1286 (OID 65163)
--
-- Name: "RI_ConstraintTrigger_65162" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__formatting" AFTER UPDATE ON "category"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_category__formatting', 'formatting', 'category', 'UNSPECIFIED', 'category__id', 'id');

--
-- TOC Entry ID 1360 (OID 65165)
--
-- Name: "RI_ConstraintTrigger_65164" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__formatting" AFTER INSERT OR UPDATE ON "formatting"  FROM "workflow" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_workflow__formatting', 'formatting', 'workflow', 'UNSPECIFIED', 'workflow__id', 'id');

--
-- TOC Entry ID 1308 (OID 65167)
--
-- Name: "RI_ConstraintTrigger_65166" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__formatting" AFTER DELETE ON "workflow"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_setnull_del" ('fk_workflow__formatting', 'formatting', 'workflow', 'UNSPECIFIED', 'workflow__id', 'id');

--
-- TOC Entry ID 1309 (OID 65169)
--
-- Name: "RI_ConstraintTrigger_65168" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__formatting" AFTER UPDATE ON "workflow"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_workflow__formatting', 'formatting', 'workflow', 'UNSPECIFIED', 'workflow__id', 'id');

--
-- TOC Entry ID 1367 (OID 65171)
--
-- Name: "RI_ConstraintTrigger_65170" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_formatting__frmt_instance" AFTER INSERT OR UPDATE ON "formatting_instance"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_formatting__frmt_instance', 'formatting_instance', 'formatting', 'UNSPECIFIED', 'formatting__id', 'id');

--
-- TOC Entry ID 1361 (OID 65173)
--
-- Name: "RI_ConstraintTrigger_65172" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_formatting__frmt_instance" AFTER DELETE ON "formatting"  FROM "formatting_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_formatting__frmt_instance', 'formatting_instance', 'formatting', 'UNSPECIFIED', 'formatting__id', 'id');

--
-- TOC Entry ID 1362 (OID 65175)
--
-- Name: "RI_ConstraintTrigger_65174" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_formatting__frmt_instance" AFTER UPDATE ON "formatting"  FROM "formatting_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_formatting__frmt_instance', 'formatting_instance', 'formatting', 'UNSPECIFIED', 'formatting__id', 'id');

--
-- TOC Entry ID 1368 (OID 65177)
--
-- Name: "RI_ConstraintTrigger_65176" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__format_instance" AFTER INSERT OR UPDATE ON "formatting_instance"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_usr__format_instance', 'formatting_instance', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1338 (OID 65179)
--
-- Name: "RI_ConstraintTrigger_65178" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__format_instance" AFTER DELETE ON "usr"  FROM "formatting_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_setnull_del" ('fk_usr__format_instance', 'formatting_instance', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1339 (OID 65181)
--
-- Name: "RI_ConstraintTrigger_65180" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__format_instance" AFTER UPDATE ON "usr"  FROM "formatting_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_usr__format_instance', 'formatting_instance', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1369 (OID 65183)
--
-- Name: "RI_ConstraintTrigger_65182" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_frmt__frmt_member" AFTER INSERT OR UPDATE ON "formatting_member"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_frmt__frmt_member', 'formatting_member', 'formatting', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1363 (OID 65185)
--
-- Name: "RI_ConstraintTrigger_65184" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_frmt__frmt_member" AFTER DELETE ON "formatting"  FROM "formatting_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_frmt__frmt_member', 'formatting_member', 'formatting', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1364 (OID 65187)
--
-- Name: "RI_ConstraintTrigger_65186" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_frmt__frmt_member" AFTER UPDATE ON "formatting"  FROM "formatting_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_frmt__frmt_member', 'formatting_member', 'formatting', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1370 (OID 65189)
--
-- Name: "RI_ConstraintTrigger_65188" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__frmt_member" AFTER INSERT OR UPDATE ON "formatting_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__frmt_member', 'formatting_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1126 (OID 65191)
--
-- Name: "RI_ConstraintTrigger_65190" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__frmt_member" AFTER DELETE ON "member"  FROM "formatting_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__frmt_member', 'formatting_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1127 (OID 65193)
--
-- Name: "RI_ConstraintTrigger_65192" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__frmt_member" AFTER UPDATE ON "member"  FROM "formatting_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__frmt_member', 'formatting_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1375 (OID 65195)
--
-- Name: "RI_ConstraintTrigger_65194" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_frmt__attr_frmt_val" AFTER INSERT OR UPDATE ON "attr_formatting_val"  FROM "attr_formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_frmt__attr_frmt_val', 'attr_formatting_val', 'attr_formatting', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1371 (OID 65197)
--
-- Name: "RI_ConstraintTrigger_65196" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_frmt__attr_frmt_val" AFTER DELETE ON "attr_formatting"  FROM "attr_formatting_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_frmt__attr_frmt_val', 'attr_formatting_val', 'attr_formatting', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1372 (OID 65199)
--
-- Name: "RI_ConstraintTrigger_65198" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_frmt__attr_frmt_val" AFTER UPDATE ON "attr_formatting"  FROM "attr_formatting_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_frmt__attr_frmt_val', 'attr_formatting_val', 'attr_formatting', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1376 (OID 65201)
--
-- Name: "RI_ConstraintTrigger_65200" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_frmt__attr_frmt_val" AFTER INSERT OR UPDATE ON "attr_formatting_val"  FROM "formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_frmt__attr_frmt_val', 'attr_formatting_val', 'formatting', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1365 (OID 65203)
--
-- Name: "RI_ConstraintTrigger_65202" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_frmt__attr_frmt_val" AFTER DELETE ON "formatting"  FROM "attr_formatting_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_frmt__attr_frmt_val', 'attr_formatting_val', 'formatting', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1366 (OID 65205)
--
-- Name: "RI_ConstraintTrigger_65204" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_frmt__attr_frmt_val" AFTER UPDATE ON "formatting"  FROM "attr_formatting_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_frmt__attr_frmt_val', 'attr_formatting_val', 'formatting', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1377 (OID 65207)
--
-- Name: "RI_ConstraintTrigger_65206" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_frmt__attr_frmt_meta" AFTER INSERT OR UPDATE ON "attr_formatting_meta"  FROM "attr_formatting" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_frmt__attr_frmt_meta', 'attr_formatting_meta', 'attr_formatting', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1373 (OID 65209)
--
-- Name: "RI_ConstraintTrigger_65208" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_frmt__attr_frmt_meta" AFTER DELETE ON "attr_formatting"  FROM "attr_formatting_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_frmt__attr_frmt_meta', 'attr_formatting_meta', 'attr_formatting', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1374 (OID 65211)
--
-- Name: "RI_ConstraintTrigger_65210" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_frmt__attr_frmt_meta" AFTER UPDATE ON "attr_formatting"  FROM "attr_formatting_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_frmt__attr_frmt_meta', 'attr_formatting_meta', 'attr_formatting', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1382 (OID 65213)
--
-- Name: "RI_ConstraintTrigger_65212" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_source__story" AFTER INSERT OR UPDATE ON "story"  FROM "source" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_source__story', 'story', 'source', 'UNSPECIFIED', 'source__id', 'id');

--
-- TOC Entry ID 1488 (OID 65215)
--
-- Name: "RI_ConstraintTrigger_65214" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_source__story" AFTER DELETE ON "source"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_source__story', 'story', 'source', 'UNSPECIFIED', 'source__id', 'id');

--
-- TOC Entry ID 1489 (OID 65217)
--
-- Name: "RI_ConstraintTrigger_65216" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_source__story" AFTER UPDATE ON "source"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_source__story', 'story', 'source', 'UNSPECIFIED', 'source__id', 'id');

--
-- TOC Entry ID 1383 (OID 65219)
--
-- Name: "RI_ConstraintTrigger_65218" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__story" AFTER INSERT OR UPDATE ON "story"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_usr__story', 'story', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1340 (OID 65221)
--
-- Name: "RI_ConstraintTrigger_65220" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__story" AFTER DELETE ON "usr"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_usr__story', 'story', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1341 (OID 65223)
--
-- Name: "RI_ConstraintTrigger_65222" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__story" AFTER UPDATE ON "usr"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_usr__story', 'story', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1384 (OID 65225)
--
-- Name: "RI_ConstraintTrigger_65224" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__story" AFTER INSERT OR UPDATE ON "story"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_element__story', 'story', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1234 (OID 65227)
--
-- Name: "RI_ConstraintTrigger_65226" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__story" AFTER DELETE ON "element"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_element__story', 'story', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1235 (OID 65229)
--
-- Name: "RI_ConstraintTrigger_65228" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__story" AFTER UPDATE ON "element"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_element__story', 'story', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1385 (OID 65231)
--
-- Name: "RI_ConstraintTrigger_65230" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__story" AFTER INSERT OR UPDATE ON "story"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_grp__story', 'story', 'grp', 'UNSPECIFIED', 'keyword_grp__id', 'id');

--
-- TOC Entry ID 989 (OID 65233)
--
-- Name: "RI_ConstraintTrigger_65232" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__story" AFTER DELETE ON "grp"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_setnull_del" ('fk_grp__story', 'story', 'grp', 'UNSPECIFIED', 'keyword_grp__id', 'id');

--
-- TOC Entry ID 990 (OID 65235)
--
-- Name: "RI_ConstraintTrigger_65234" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_grp__story" AFTER UPDATE ON "grp"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_grp__story', 'story', 'grp', 'UNSPECIFIED', 'keyword_grp__id', 'id');

--
-- TOC Entry ID 1386 (OID 65237)
--
-- Name: "RI_ConstraintTrigger_65236" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__story" AFTER INSERT OR UPDATE ON "story"  FROM "workflow" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_workflow__story', 'story', 'workflow', 'UNSPECIFIED', 'workflow__id', 'id');

--
-- TOC Entry ID 1310 (OID 65239)
--
-- Name: "RI_ConstraintTrigger_65238" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__story" AFTER DELETE ON "workflow"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_setnull_del" ('fk_workflow__story', 'story', 'workflow', 'UNSPECIFIED', 'workflow__id', 'id');

--
-- TOC Entry ID 1311 (OID 65241)
--
-- Name: "RI_ConstraintTrigger_65240" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__story" AFTER UPDATE ON "workflow"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_workflow__story', 'story', 'workflow', 'UNSPECIFIED', 'workflow__id', 'id');

--
-- TOC Entry ID 1393 (OID 65243)
--
-- Name: "RI_ConstraintTrigger_65242" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story_instance" AFTER INSERT OR UPDATE ON "story_instance"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_story__story_instance', 'story_instance', 'story', 'UNSPECIFIED', 'story__id', 'id');

--
-- TOC Entry ID 1387 (OID 65245)
--
-- Name: "RI_ConstraintTrigger_65244" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story_instance" AFTER DELETE ON "story"  FROM "story_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_story__story_instance', 'story_instance', 'story', 'UNSPECIFIED', 'story__id', 'id');

--
-- TOC Entry ID 1388 (OID 65247)
--
-- Name: "RI_ConstraintTrigger_65246" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story_instance" AFTER UPDATE ON "story"  FROM "story_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_story__story_instance', 'story_instance', 'story', 'UNSPECIFIED', 'story__id', 'id');

--
-- TOC Entry ID 1394 (OID 65249)
--
-- Name: "RI_ConstraintTrigger_65248" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__story_instance" AFTER INSERT OR UPDATE ON "story_instance"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_usr__story_instance', 'story_instance', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1342 (OID 65251)
--
-- Name: "RI_ConstraintTrigger_65250" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__story_instance" AFTER DELETE ON "usr"  FROM "story_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_setnull_del" ('fk_usr__story_instance', 'story_instance', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1343 (OID 65253)
--
-- Name: "RI_ConstraintTrigger_65252" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__story_instance" AFTER UPDATE ON "usr"  FROM "story_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_usr__story_instance', 'story_instance', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1403 (OID 65255)
--
-- Name: "RI_ConstraintTrigger_65254" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story__category" AFTER INSERT OR UPDATE ON "story__category"  FROM "story_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_story__story__category', 'story__category', 'story_instance', 'UNSPECIFIED', 'story_instance__id', 'id');

--
-- TOC Entry ID 1395 (OID 65257)
--
-- Name: "RI_ConstraintTrigger_65256" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story__category" AFTER DELETE ON "story_instance"  FROM "story__category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_story__story__category', 'story__category', 'story_instance', 'UNSPECIFIED', 'story_instance__id', 'id');

--
-- TOC Entry ID 1396 (OID 65259)
--
-- Name: "RI_ConstraintTrigger_65258" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story__category" AFTER UPDATE ON "story_instance"  FROM "story__category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_story__story__category', 'story__category', 'story_instance', 'UNSPECIFIED', 'story_instance__id', 'id');

--
-- TOC Entry ID 1404 (OID 65261)
--
-- Name: "RI_ConstraintTrigger_65260" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__story__category" AFTER INSERT OR UPDATE ON "story__category"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_category__story__category', 'story__category', 'category', 'UNSPECIFIED', 'category__id', 'id');

--
-- TOC Entry ID 1287 (OID 65263)
--
-- Name: "RI_ConstraintTrigger_65262" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__story__category" AFTER DELETE ON "category"  FROM "story__category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_category__story__category', 'story__category', 'category', 'UNSPECIFIED', 'category__id', 'id');

--
-- TOC Entry ID 1288 (OID 65265)
--
-- Name: "RI_ConstraintTrigger_65264" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__story__category" AFTER UPDATE ON "category"  FROM "story__category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_category__story__category', 'story__category', 'category', 'UNSPECIFIED', 'category__id', 'id');

--
-- TOC Entry ID 1405 (OID 65267)
--
-- Name: "RI_ConstraintTrigger_65266" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story__contributor" AFTER INSERT OR UPDATE ON "story__contributor"  FROM "story_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_story__story__contributor', 'story__contributor', 'story_instance', 'UNSPECIFIED', 'story_instance__id', 'id');

--
-- TOC Entry ID 1397 (OID 65269)
--
-- Name: "RI_ConstraintTrigger_65268" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story__contributor" AFTER DELETE ON "story_instance"  FROM "story__contributor" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_story__story__contributor', 'story__contributor', 'story_instance', 'UNSPECIFIED', 'story_instance__id', 'id');

--
-- TOC Entry ID 1398 (OID 65271)
--
-- Name: "RI_ConstraintTrigger_65270" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__story__contributor" AFTER UPDATE ON "story_instance"  FROM "story__contributor" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_story__story__contributor', 'story__contributor', 'story_instance', 'UNSPECIFIED', 'story_instance__id', 'id');

--
-- TOC Entry ID 1406 (OID 65273)
--
-- Name: "RI_ConstraintTrigger_65272" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__story__contributor" AFTER INSERT OR UPDATE ON "story__contributor"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__story__contributor', 'story__contributor', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1128 (OID 65275)
--
-- Name: "RI_ConstraintTrigger_65274" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__story__contributor" AFTER DELETE ON "member"  FROM "story__contributor" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__story__contributor', 'story__contributor', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1129 (OID 65277)
--
-- Name: "RI_ConstraintTrigger_65276" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__story__contributor" AFTER UPDATE ON "member"  FROM "story__contributor" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__story__contributor', 'story__contributor', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1411 (OID 65279)
--
-- Name: "RI_ConstraintTrigger_65278" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_story__attr_story_val" AFTER INSERT OR UPDATE ON "attr_story_val"  FROM "attr_story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_story__attr_story_val', 'attr_story_val', 'attr_story', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1407 (OID 65281)
--
-- Name: "RI_ConstraintTrigger_65280" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_story__attr_story_val" AFTER DELETE ON "attr_story"  FROM "attr_story_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_story__attr_story_val', 'attr_story_val', 'attr_story', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1408 (OID 65283)
--
-- Name: "RI_ConstraintTrigger_65282" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_story__attr_story_val" AFTER UPDATE ON "attr_story"  FROM "attr_story_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_story__attr_story_val', 'attr_story_val', 'attr_story', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1412 (OID 65285)
--
-- Name: "RI_ConstraintTrigger_65284" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__attr_story_val" AFTER INSERT OR UPDATE ON "attr_story_val"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_story__attr_story_val', 'attr_story_val', 'story', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1389 (OID 65287)
--
-- Name: "RI_ConstraintTrigger_65286" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__attr_story_val" AFTER DELETE ON "story"  FROM "attr_story_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_story__attr_story_val', 'attr_story_val', 'story', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1390 (OID 65289)
--
-- Name: "RI_ConstraintTrigger_65288" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__attr_story_val" AFTER UPDATE ON "story"  FROM "attr_story_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_story__attr_story_val', 'attr_story_val', 'story', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1413 (OID 65291)
--
-- Name: "RI_ConstraintTrigger_65290" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_story__attr_story_meta" AFTER INSERT OR UPDATE ON "attr_story_meta"  FROM "attr_story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_story__attr_story_meta', 'attr_story_meta', 'attr_story', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1409 (OID 65293)
--
-- Name: "RI_ConstraintTrigger_65292" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_story__attr_story_meta" AFTER DELETE ON "attr_story"  FROM "attr_story_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_story__attr_story_meta', 'attr_story_meta', 'attr_story', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1410 (OID 65295)
--
-- Name: "RI_ConstraintTrigger_65294" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_story__attr_story_meta" AFTER UPDATE ON "attr_story"  FROM "attr_story_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_story__attr_story_meta', 'attr_story_meta', 'attr_story', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1416 (OID 65297)
--
-- Name: "RI_ConstraintTrigger_65296" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_source__media" AFTER INSERT OR UPDATE ON "media"  FROM "source" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_source__media', 'media', 'source', 'UNSPECIFIED', 'source__id', 'id');

--
-- TOC Entry ID 1490 (OID 65299)
--
-- Name: "RI_ConstraintTrigger_65298" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_source__media" AFTER DELETE ON "source"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_source__media', 'media', 'source', 'UNSPECIFIED', 'source__id', 'id');

--
-- TOC Entry ID 1491 (OID 65301)
--
-- Name: "RI_ConstraintTrigger_65300" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_source__media" AFTER UPDATE ON "source"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_source__media', 'media', 'source', 'UNSPECIFIED', 'source__id', 'id');

--
-- TOC Entry ID 1417 (OID 65303)
--
-- Name: "RI_ConstraintTrigger_65302" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__media" AFTER INSERT OR UPDATE ON "media"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_usr__media', 'media', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1344 (OID 65305)
--
-- Name: "RI_ConstraintTrigger_65304" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__media" AFTER DELETE ON "usr"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_usr__media', 'media', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1345 (OID 65307)
--
-- Name: "RI_ConstraintTrigger_65306" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__media" AFTER UPDATE ON "usr"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_usr__media', 'media', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1418 (OID 65309)
--
-- Name: "RI_ConstraintTrigger_65308" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_kw_grp__media" AFTER INSERT OR UPDATE ON "media"  FROM "grp" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_kw_grp__media', 'media', 'grp', 'UNSPECIFIED', 'keyword_grp__id', 'id');

--
-- TOC Entry ID 991 (OID 65311)
--
-- Name: "RI_ConstraintTrigger_65310" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_kw_grp__media" AFTER DELETE ON "grp"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_setnull_del" ('fk_kw_grp__media', 'media', 'grp', 'UNSPECIFIED', 'keyword_grp__id', 'id');

--
-- TOC Entry ID 992 (OID 65313)
--
-- Name: "RI_ConstraintTrigger_65312" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_kw_grp__media" AFTER UPDATE ON "grp"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_kw_grp__media', 'media', 'grp', 'UNSPECIFIED', 'keyword_grp__id', 'id');

--
-- TOC Entry ID 1419 (OID 65315)
--
-- Name: "RI_ConstraintTrigger_65314" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__media" AFTER INSERT OR UPDATE ON "media"  FROM "element" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_element__media', 'media', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1236 (OID 65317)
--
-- Name: "RI_ConstraintTrigger_65316" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__media" AFTER DELETE ON "element"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_element__media', 'media', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1237 (OID 65319)
--
-- Name: "RI_ConstraintTrigger_65318" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_element__media" AFTER UPDATE ON "element"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_element__media', 'media', 'element', 'UNSPECIFIED', 'element__id', 'id');

--
-- TOC Entry ID 1420 (OID 65321)
--
-- Name: "RI_ConstraintTrigger_65320" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__media" AFTER INSERT OR UPDATE ON "media"  FROM "workflow" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_workflow__media', 'media', 'workflow', 'UNSPECIFIED', 'workflow__id', 'id');

--
-- TOC Entry ID 1312 (OID 65323)
--
-- Name: "RI_ConstraintTrigger_65322" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__media" AFTER DELETE ON "workflow"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_setnull_del" ('fk_workflow__media', 'media', 'workflow', 'UNSPECIFIED', 'workflow__id', 'id');

--
-- TOC Entry ID 1313 (OID 65325)
--
-- Name: "RI_ConstraintTrigger_65324" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_workflow__media" AFTER UPDATE ON "workflow"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_workflow__media', 'media', 'workflow', 'UNSPECIFIED', 'workflow__id', 'id');

--
-- TOC Entry ID 1431 (OID 65327)
--
-- Name: "RI_ConstraintTrigger_65326" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__media_instance" AFTER INSERT OR UPDATE ON "media_instance"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_media__media_instance', 'media_instance', 'media', 'UNSPECIFIED', 'media__id', 'id');

--
-- TOC Entry ID 1421 (OID 65329)
--
-- Name: "RI_ConstraintTrigger_65328" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__media_instance" AFTER DELETE ON "media"  FROM "media_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_media__media_instance', 'media_instance', 'media', 'UNSPECIFIED', 'media__id', 'id');

--
-- TOC Entry ID 1422 (OID 65331)
--
-- Name: "RI_ConstraintTrigger_65330" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__media_instance" AFTER UPDATE ON "media"  FROM "media_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_media__media_instance', 'media_instance', 'media', 'UNSPECIFIED', 'media__id', 'id');

--
-- TOC Entry ID 1432 (OID 65333)
--
-- Name: "RI_ConstraintTrigger_65332" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__media_instance" AFTER INSERT OR UPDATE ON "media_instance"  FROM "category" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_category__media_instance', 'media_instance', 'category', 'UNSPECIFIED', 'category__id', 'id');

--
-- TOC Entry ID 1289 (OID 65335)
--
-- Name: "RI_ConstraintTrigger_65334" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__media_instance" AFTER DELETE ON "category"  FROM "media_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_category__media_instance', 'media_instance', 'category', 'UNSPECIFIED', 'category__id', 'id');

--
-- TOC Entry ID 1290 (OID 65337)
--
-- Name: "RI_ConstraintTrigger_65336" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_category__media_instance" AFTER UPDATE ON "category"  FROM "media_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_category__media_instance', 'media_instance', 'category', 'UNSPECIFIED', 'category__id', 'id');

--
-- TOC Entry ID 1433 (OID 65339)
--
-- Name: "RI_ConstraintTrigger_65338" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__media_instance" AFTER INSERT OR UPDATE ON "media_instance"  FROM "media_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_media_type__media_instance', 'media_instance', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 999 (OID 65341)
--
-- Name: "RI_ConstraintTrigger_65340" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__media_instance" AFTER DELETE ON "media_type"  FROM "media_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_media_type__media_instance', 'media_instance', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 1000 (OID 65343)
--
-- Name: "RI_ConstraintTrigger_65342" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_type__media_instance" AFTER UPDATE ON "media_type"  FROM "media_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_media_type__media_instance', 'media_instance', 'media_type', 'UNSPECIFIED', 'media_type__id', 'id');

--
-- TOC Entry ID 1434 (OID 65345)
--
-- Name: "RI_ConstraintTrigger_65344" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__media_instance" AFTER INSERT OR UPDATE ON "media_instance"  FROM "usr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_usr__media_instance', 'media_instance', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1346 (OID 65347)
--
-- Name: "RI_ConstraintTrigger_65346" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__media_instance" AFTER DELETE ON "usr"  FROM "media_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_usr__media_instance', 'media_instance', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1347 (OID 65349)
--
-- Name: "RI_ConstraintTrigger_65348" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_usr__media_instance" AFTER UPDATE ON "usr"  FROM "media_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_usr__media_instance', 'media_instance', 'usr', 'UNSPECIFIED', 'usr__id', 'id');

--
-- TOC Entry ID 1439 (OID 65351)
--
-- Name: "RI_ConstraintTrigger_65350" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__media_member" AFTER INSERT OR UPDATE ON "media_member"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_media__media_member', 'media_member', 'media', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1423 (OID 65353)
--
-- Name: "RI_ConstraintTrigger_65352" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__media_member" AFTER DELETE ON "media"  FROM "media_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_media__media_member', 'media_member', 'media', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1424 (OID 65355)
--
-- Name: "RI_ConstraintTrigger_65354" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__media_member" AFTER UPDATE ON "media"  FROM "media_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_media__media_member', 'media_member', 'media', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1440 (OID 65357)
--
-- Name: "RI_ConstraintTrigger_65356" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__media_member" AFTER INSERT OR UPDATE ON "media_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__media_member', 'media_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1130 (OID 65359)
--
-- Name: "RI_ConstraintTrigger_65358" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__media_member" AFTER DELETE ON "member"  FROM "media_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__media_member', 'media_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1131 (OID 65361)
--
-- Name: "RI_ConstraintTrigger_65360" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__media_member" AFTER UPDATE ON "member"  FROM "media_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__media_member', 'media_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1441 (OID 65363)
--
-- Name: "RI_ConstraintTrigger_65362" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_image__image_member" AFTER INSERT OR UPDATE ON "image_member"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_image__image_member', 'image_member', 'media', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1425 (OID 65365)
--
-- Name: "RI_ConstraintTrigger_65364" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_image__image_member" AFTER DELETE ON "media"  FROM "image_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_image__image_member', 'image_member', 'media', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1426 (OID 65367)
--
-- Name: "RI_ConstraintTrigger_65366" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_image__image_member" AFTER UPDATE ON "media"  FROM "image_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_image__image_member', 'image_member', 'media', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1442 (OID 65369)
--
-- Name: "RI_ConstraintTrigger_65368" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__image_member" AFTER INSERT OR UPDATE ON "image_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__image_member', 'image_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1132 (OID 65371)
--
-- Name: "RI_ConstraintTrigger_65370" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__image_member" AFTER DELETE ON "member"  FROM "image_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__image_member', 'image_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1133 (OID 65373)
--
-- Name: "RI_ConstraintTrigger_65372" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__image_member" AFTER UPDATE ON "member"  FROM "image_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__image_member', 'image_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1447 (OID 65375)
--
-- Name: "RI_ConstraintTrigger_65374" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_media__attr_media_val" AFTER INSERT OR UPDATE ON "attr_media_val"  FROM "attr_media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_media__attr_media_val', 'attr_media_val', 'attr_media', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1443 (OID 65377)
--
-- Name: "RI_ConstraintTrigger_65376" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_media__attr_media_val" AFTER DELETE ON "attr_media"  FROM "attr_media_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_media__attr_media_val', 'attr_media_val', 'attr_media', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1444 (OID 65379)
--
-- Name: "RI_ConstraintTrigger_65378" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_media__attr_media_val" AFTER UPDATE ON "attr_media"  FROM "attr_media_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_media__attr_media_val', 'attr_media_val', 'attr_media', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1448 (OID 65381)
--
-- Name: "RI_ConstraintTrigger_65380" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__attr_media_val" AFTER INSERT OR UPDATE ON "attr_media_val"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_media__attr_media_val', 'attr_media_val', 'media', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1427 (OID 65383)
--
-- Name: "RI_ConstraintTrigger_65382" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__attr_media_val" AFTER DELETE ON "media"  FROM "attr_media_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_media__attr_media_val', 'attr_media_val', 'media', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1428 (OID 65385)
--
-- Name: "RI_ConstraintTrigger_65384" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__attr_media_val" AFTER UPDATE ON "media"  FROM "attr_media_val" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_media__attr_media_val', 'attr_media_val', 'media', 'UNSPECIFIED', 'object__id', 'id');

--
-- TOC Entry ID 1449 (OID 65387)
--
-- Name: "RI_ConstraintTrigger_65386" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_media__attr_media_meta" AFTER INSERT OR UPDATE ON "attr_media_meta"  FROM "attr_media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_attr_media__attr_media_meta', 'attr_media_meta', 'attr_media', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1445 (OID 65389)
--
-- Name: "RI_ConstraintTrigger_65388" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_media__attr_media_meta" AFTER DELETE ON "attr_media"  FROM "attr_media_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_attr_media__attr_media_meta', 'attr_media_meta', 'attr_media', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1446 (OID 65391)
--
-- Name: "RI_ConstraintTrigger_65390" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_attr_media__attr_media_meta" AFTER UPDATE ON "attr_media"  FROM "attr_media_meta" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_attr_media__attr_media_meta', 'attr_media_meta', 'attr_media', 'UNSPECIFIED', 'attr__id', 'id');

--
-- TOC Entry ID 1450 (OID 65393)
--
-- Name: "RI_ConstraintTrigger_65392" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story_instance__sd_tile" AFTER INSERT OR UPDATE ON "story_data_tile"  FROM "story_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_story_instance__sd_tile', 'story_data_tile', 'story_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1399 (OID 65395)
--
-- Name: "RI_ConstraintTrigger_65394" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story_instance__sd_tile" AFTER DELETE ON "story_instance"  FROM "story_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_story_instance__sd_tile', 'story_data_tile', 'story_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1400 (OID 65397)
--
-- Name: "RI_ConstraintTrigger_65396" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story_instance__sd_tile" AFTER UPDATE ON "story_instance"  FROM "story_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_story_instance__sd_tile', 'story_data_tile', 'story_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1451 (OID 65399)
--
-- Name: "RI_ConstraintTrigger_65398" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__sd_tile" AFTER INSERT OR UPDATE ON "story_data_tile"  FROM "story_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_sc_tile__sd_tile', 'story_data_tile', 'story_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1456 (OID 65401)
--
-- Name: "RI_ConstraintTrigger_65400" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__sd_tile" AFTER DELETE ON "story_container_tile"  FROM "story_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_sc_tile__sd_tile', 'story_data_tile', 'story_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1457 (OID 65403)
--
-- Name: "RI_ConstraintTrigger_65402" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__sd_tile" AFTER UPDATE ON "story_container_tile"  FROM "story_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_sc_tile__sd_tile', 'story_data_tile', 'story_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1452 (OID 65405)
--
-- Name: "RI_ConstraintTrigger_65404" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at_data__sd_tile" AFTER INSERT OR UPDATE ON "story_data_tile"  FROM "at_data" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_at_data__sd_tile', 'story_data_tile', 'at_data', 'UNSPECIFIED', 'element_data__id', 'id');

--
-- TOC Entry ID 1210 (OID 65407)
--
-- Name: "RI_ConstraintTrigger_65406" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at_data__sd_tile" AFTER DELETE ON "at_data"  FROM "story_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_at_data__sd_tile', 'story_data_tile', 'at_data', 'UNSPECIFIED', 'element_data__id', 'id');

--
-- TOC Entry ID 1211 (OID 65409)
--
-- Name: "RI_ConstraintTrigger_65408" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at_data__sd_tile" AFTER UPDATE ON "at_data"  FROM "story_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_at_data__sd_tile', 'story_data_tile', 'at_data', 'UNSPECIFIED', 'element_data__id', 'id');

--
-- TOC Entry ID 1453 (OID 65411)
--
-- Name: "RI_ConstraintTrigger_65410" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_instance__md_tile" AFTER INSERT OR UPDATE ON "media_data_tile"  FROM "media_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_media_instance__md_tile', 'media_data_tile', 'media_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1435 (OID 65413)
--
-- Name: "RI_ConstraintTrigger_65412" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_instance__md_tile" AFTER DELETE ON "media_instance"  FROM "media_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_media_instance__md_tile', 'media_data_tile', 'media_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1436 (OID 65415)
--
-- Name: "RI_ConstraintTrigger_65414" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media_instance__md_tile" AFTER UPDATE ON "media_instance"  FROM "media_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_media_instance__md_tile', 'media_data_tile', 'media_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1454 (OID 65417)
--
-- Name: "RI_ConstraintTrigger_65416" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_mc_tile__md_tile" AFTER INSERT OR UPDATE ON "media_data_tile"  FROM "media_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_mc_tile__md_tile', 'media_data_tile', 'media_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1464 (OID 65419)
--
-- Name: "RI_ConstraintTrigger_65418" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_mc_tile__md_tile" AFTER DELETE ON "media_container_tile"  FROM "media_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_mc_tile__md_tile', 'media_data_tile', 'media_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1465 (OID 65421)
--
-- Name: "RI_ConstraintTrigger_65420" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_mc_tile__md_tile" AFTER UPDATE ON "media_container_tile"  FROM "media_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_mc_tile__md_tile', 'media_data_tile', 'media_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1455 (OID 65423)
--
-- Name: "RI_ConstraintTrigger_65422" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at_data__md_tile" AFTER INSERT OR UPDATE ON "media_data_tile"  FROM "at_data" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_at_data__md_tile', 'media_data_tile', 'at_data', 'UNSPECIFIED', 'element_data__id', 'id');

--
-- TOC Entry ID 1212 (OID 65425)
--
-- Name: "RI_ConstraintTrigger_65424" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at_data__md_tile" AFTER DELETE ON "at_data"  FROM "media_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_at_data__md_tile', 'media_data_tile', 'at_data', 'UNSPECIFIED', 'element_data__id', 'id');

--
-- TOC Entry ID 1213 (OID 65427)
--
-- Name: "RI_ConstraintTrigger_65426" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_at_data__md_tile" AFTER UPDATE ON "at_data"  FROM "media_data_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_at_data__md_tile', 'media_data_tile', 'at_data', 'UNSPECIFIED', 'element_data__id', 'id');

--
-- TOC Entry ID 1458 (OID 65429)
--
-- Name: "RI_ConstraintTrigger_65428" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__sc_tile" AFTER INSERT OR UPDATE ON "story_container_tile"  FROM "story_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_sc_tile__sc_tile', 'story_container_tile', 'story_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1459 (OID 65431)
--
-- Name: "RI_ConstraintTrigger_65430" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__sc_tile" AFTER DELETE ON "story_container_tile"  FROM "story_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_sc_tile__sc_tile', 'story_container_tile', 'story_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1460 (OID 65433)
--
-- Name: "RI_ConstraintTrigger_65432" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__sc_tile" AFTER UPDATE ON "story_container_tile"  FROM "story_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_sc_tile__sc_tile', 'story_container_tile', 'story_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1461 (OID 65435)
--
-- Name: "RI_ConstraintTrigger_65434" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__sc_tile" AFTER INSERT OR UPDATE ON "story_container_tile"  FROM "story_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_story__sc_tile', 'story_container_tile', 'story_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1401 (OID 65437)
--
-- Name: "RI_ConstraintTrigger_65436" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__sc_tile" AFTER DELETE ON "story_instance"  FROM "story_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_story__sc_tile', 'story_container_tile', 'story_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1402 (OID 65439)
--
-- Name: "RI_ConstraintTrigger_65438" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_story__sc_tile" AFTER UPDATE ON "story_instance"  FROM "story_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_story__sc_tile', 'story_container_tile', 'story_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1462 (OID 65441)
--
-- Name: "RI_ConstraintTrigger_65440" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__related_story" AFTER INSERT OR UPDATE ON "story_container_tile"  FROM "story" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_sc_tile__related_story', 'story_container_tile', 'story', 'UNSPECIFIED', 'related_instance__id', 'id');

--
-- TOC Entry ID 1391 (OID 65443)
--
-- Name: "RI_ConstraintTrigger_65442" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__related_story" AFTER DELETE ON "story"  FROM "story_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_sc_tile__related_story', 'story_container_tile', 'story', 'UNSPECIFIED', 'related_instance__id', 'id');

--
-- TOC Entry ID 1392 (OID 65445)
--
-- Name: "RI_ConstraintTrigger_65444" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__related_story" AFTER UPDATE ON "story"  FROM "story_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_sc_tile__related_story', 'story_container_tile', 'story', 'UNSPECIFIED', 'related_instance__id', 'id');

--
-- TOC Entry ID 1463 (OID 65447)
--
-- Name: "RI_ConstraintTrigger_65446" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__related_media" AFTER INSERT OR UPDATE ON "story_container_tile"  FROM "media" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_sc_tile__related_media', 'story_container_tile', 'media', 'UNSPECIFIED', 'related_media__id', 'id');

--
-- TOC Entry ID 1429 (OID 65449)
--
-- Name: "RI_ConstraintTrigger_65448" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__related_media" AFTER DELETE ON "media"  FROM "story_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_sc_tile__related_media', 'story_container_tile', 'media', 'UNSPECIFIED', 'related_media__id', 'id');

--
-- TOC Entry ID 1430 (OID 65451)
--
-- Name: "RI_ConstraintTrigger_65450" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_sc_tile__related_media" AFTER UPDATE ON "media"  FROM "story_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_sc_tile__related_media', 'story_container_tile', 'media', 'UNSPECIFIED', 'related_media__id', 'id');

--
-- TOC Entry ID 1466 (OID 65453)
--
-- Name: "RI_ConstraintTrigger_65452" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_mc_tile__mc_tile" AFTER INSERT OR UPDATE ON "media_container_tile"  FROM "media_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_mc_tile__mc_tile', 'media_container_tile', 'media_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1467 (OID 65455)
--
-- Name: "RI_ConstraintTrigger_65454" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_mc_tile__mc_tile" AFTER DELETE ON "media_container_tile"  FROM "media_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_mc_tile__mc_tile', 'media_container_tile', 'media_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1468 (OID 65457)
--
-- Name: "RI_ConstraintTrigger_65456" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_mc_tile__mc_tile" AFTER UPDATE ON "media_container_tile"  FROM "media_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_mc_tile__mc_tile', 'media_container_tile', 'media_container_tile', 'UNSPECIFIED', 'parent_id', 'id');

--
-- TOC Entry ID 1469 (OID 65459)
--
-- Name: "RI_ConstraintTrigger_65458" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__mc_tile" AFTER INSERT OR UPDATE ON "media_container_tile"  FROM "media_instance" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_media__mc_tile', 'media_container_tile', 'media_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1437 (OID 65461)
--
-- Name: "RI_ConstraintTrigger_65460" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__mc_tile" AFTER DELETE ON "media_instance"  FROM "media_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_media__mc_tile', 'media_container_tile', 'media_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1438 (OID 65463)
--
-- Name: "RI_ConstraintTrigger_65462" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_media__mc_tile" AFTER UPDATE ON "media_instance"  FROM "media_container_tile" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_media__mc_tile', 'media_container_tile', 'media_instance', 'UNSPECIFIED', 'object_instance_id', 'id');

--
-- TOC Entry ID 1480 (OID 65465)
--
-- Name: "RI_ConstraintTrigger_65464" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__oc_member" AFTER INSERT OR UPDATE ON "output_channel_member"  FROM "output_channel" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_output_channel__oc_member', 'output_channel_member', 'output_channel', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1478 (OID 65467)
--
-- Name: "RI_ConstraintTrigger_65466" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__oc_member" AFTER DELETE ON "output_channel"  FROM "output_channel_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_output_channel__oc_member', 'output_channel_member', 'output_channel', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1479 (OID 65469)
--
-- Name: "RI_ConstraintTrigger_65468" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_output_channel__oc_member" AFTER UPDATE ON "output_channel"  FROM "output_channel_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_output_channel__oc_member', 'output_channel_member', 'output_channel', 'UNSPECIFIED', 'object_id', 'id');

--
-- TOC Entry ID 1481 (OID 65471)
--
-- Name: "RI_ConstraintTrigger_65470" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__oc_member" AFTER INSERT OR UPDATE ON "output_channel_member"  FROM "member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_member__oc_member', 'output_channel_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1134 (OID 65473)
--
-- Name: "RI_ConstraintTrigger_65472" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__oc_member" AFTER DELETE ON "member"  FROM "output_channel_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_member__oc_member', 'output_channel_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1135 (OID 65475)
--
-- Name: "RI_ConstraintTrigger_65474" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_member__oc_member" AFTER UPDATE ON "member"  FROM "output_channel_member" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_member__oc_member', 'output_channel_member', 'member', 'UNSPECIFIED', 'member__id', 'id');

--
-- TOC Entry ID 1482 (OID 65477)
--
-- Name: "RI_ConstraintTrigger_65476" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__person_org" AFTER INSERT OR UPDATE ON "person_org"  FROM "org" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_org__person_org', 'person_org', 'org', 'UNSPECIFIED', 'org__id', 'id');

--
-- TOC Entry ID 1350 (OID 65479)
--
-- Name: "RI_ConstraintTrigger_65478" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__person_org" AFTER DELETE ON "org"  FROM "person_org" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_org__person_org', 'person_org', 'org', 'UNSPECIFIED', 'org__id', 'id');

--
-- TOC Entry ID 1351 (OID 65481)
--
-- Name: "RI_ConstraintTrigger_65480" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__person_org" AFTER UPDATE ON "org"  FROM "person_org" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_org__person_org', 'person_org', 'org', 'UNSPECIFIED', 'org__id', 'id');

--
-- TOC Entry ID 1483 (OID 65483)
--
-- Name: "RI_ConstraintTrigger_65482" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__person_org" AFTER INSERT OR UPDATE ON "person_org"  FROM "person" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_person__person_org', 'person_org', 'person', 'UNSPECIFIED', 'person__id', 'id');

--
-- TOC Entry ID 1274 (OID 65485)
--
-- Name: "RI_ConstraintTrigger_65484" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__person_org" AFTER DELETE ON "person"  FROM "person_org" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_person__person_org', 'person_org', 'person', 'UNSPECIFIED', 'person__id', 'id');

--
-- TOC Entry ID 1275 (OID 65487)
--
-- Name: "RI_ConstraintTrigger_65486" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person__person_org" AFTER UPDATE ON "person"  FROM "person_org" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_person__person_org', 'person_org', 'person', 'UNSPECIFIED', 'person__id', 'id');

--
-- TOC Entry ID 1492 (OID 65489)
--
-- Name: "RI_ConstraintTrigger_65488" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__source" AFTER INSERT OR UPDATE ON "source"  FROM "org" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_org__source', 'source', 'org', 'UNSPECIFIED', 'org__id', 'id');

--
-- TOC Entry ID 1352 (OID 65491)
--
-- Name: "RI_ConstraintTrigger_65490" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__source" AFTER DELETE ON "org"  FROM "source" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_org__source', 'source', 'org', 'UNSPECIFIED', 'org__id', 'id');

--
-- TOC Entry ID 1353 (OID 65493)
--
-- Name: "RI_ConstraintTrigger_65492" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__source" AFTER UPDATE ON "org"  FROM "source" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_org__source', 'source', 'org', 'UNSPECIFIED', 'org__id', 'id');

--
-- TOC Entry ID 1493 (OID 65495)
--
-- Name: "RI_ConstraintTrigger_65494" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__addr" AFTER INSERT OR UPDATE ON "addr"  FROM "org" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_org__addr', 'addr', 'org', 'UNSPECIFIED', 'org__id', 'id');

--
-- TOC Entry ID 1354 (OID 65497)
--
-- Name: "RI_ConstraintTrigger_65496" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__addr" AFTER DELETE ON "org"  FROM "addr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_org__addr', 'addr', 'org', 'UNSPECIFIED', 'org__id', 'id');

--
-- TOC Entry ID 1355 (OID 65499)
--
-- Name: "RI_ConstraintTrigger_65498" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_org__addr" AFTER UPDATE ON "org"  FROM "addr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_org__addr', 'addr', 'org', 'UNSPECIFIED', 'org__id', 'id');

--
-- TOC Entry ID 1500 (OID 65501)
--
-- Name: "RI_ConstraintTrigger_65500" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_addr__addr_part" AFTER INSERT OR UPDATE ON "addr_part"  FROM "addr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_addr__addr_part', 'addr_part', 'addr', 'UNSPECIFIED', 'addr__id', 'id');

--
-- TOC Entry ID 1494 (OID 65503)
--
-- Name: "RI_ConstraintTrigger_65502" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_addr__addr_part" AFTER DELETE ON "addr"  FROM "addr_part" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_addr__addr_part', 'addr_part', 'addr', 'UNSPECIFIED', 'addr__id', 'id');

--
-- TOC Entry ID 1495 (OID 65505)
--
-- Name: "RI_ConstraintTrigger_65504" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_addr__addr_part" AFTER UPDATE ON "addr"  FROM "addr_part" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_addr__addr_part', 'addr_part', 'addr', 'UNSPECIFIED', 'addr__id', 'id');

--
-- TOC Entry ID 1501 (OID 65507)
--
-- Name: "RI_ConstraintTrigger_65506" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_addr_part_type__addr_part" AFTER INSERT OR UPDATE ON "addr_part"  FROM "addr_part_type" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_addr_part_type__addr_part', 'addr_part', 'addr_part_type', 'UNSPECIFIED', 'addr_part_type__id', 'id');

--
-- TOC Entry ID 1498 (OID 65509)
--
-- Name: "RI_ConstraintTrigger_65508" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_addr_part_type__addr_part" AFTER DELETE ON "addr_part_type"  FROM "addr_part" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_addr_part_type__addr_part', 'addr_part', 'addr_part_type', 'UNSPECIFIED', 'addr_part_type__id', 'id');

--
-- TOC Entry ID 1499 (OID 65511)
--
-- Name: "RI_ConstraintTrigger_65510" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_addr_part_type__addr_part" AFTER UPDATE ON "addr_part_type"  FROM "addr_part" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_addr_part_type__addr_part', 'addr_part', 'addr_part_type', 'UNSPECIFIED', 'addr_part_type__id', 'id');

--
-- TOC Entry ID 1502 (OID 65513)
--
-- Name: "RI_ConstraintTrigger_65512" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_addr__person_org_addr" AFTER INSERT OR UPDATE ON "person_org__addr"  FROM "addr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_addr__person_org_addr', 'person_org__addr', 'addr', 'UNSPECIFIED', 'addr__id', 'id');

--
-- TOC Entry ID 1496 (OID 65515)
--
-- Name: "RI_ConstraintTrigger_65514" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_addr__person_org_addr" AFTER DELETE ON "addr"  FROM "person_org__addr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_addr__person_org_addr', 'person_org__addr', 'addr', 'UNSPECIFIED', 'addr__id', 'id');

--
-- TOC Entry ID 1497 (OID 65517)
--
-- Name: "RI_ConstraintTrigger_65516" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_addr__person_org_addr" AFTER UPDATE ON "addr"  FROM "person_org__addr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_addr__person_org_addr', 'person_org__addr', 'addr', 'UNSPECIFIED', 'addr__id', 'id');

--
-- TOC Entry ID 1503 (OID 65519)
--
-- Name: "RI_ConstraintTrigger_65518" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person_org__pers_org_addr" AFTER INSERT OR UPDATE ON "person_org__addr"  FROM "person_org" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins" ('fk_person_org__pers_org_addr', 'person_org__addr', 'person_org', 'UNSPECIFIED', 'person_org__id', 'id');

--
-- TOC Entry ID 1484 (OID 65521)
--
-- Name: "RI_ConstraintTrigger_65520" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person_org__pers_org_addr" AFTER DELETE ON "person_org"  FROM "person_org__addr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del" ('fk_person_org__pers_org_addr', 'person_org__addr', 'person_org', 'UNSPECIFIED', 'person_org__id', 'id');

--
-- TOC Entry ID 1485 (OID 65523)
--
-- Name: "RI_ConstraintTrigger_65522" Type: TRIGGER Owner: postgres
-- Data Pos: 0 (Length 0)
--

CREATE CONSTRAINT TRIGGER "fk_person_org__pers_org_addr" AFTER UPDATE ON "person_org"  FROM "person_org__addr" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd" ('fk_person_org__pers_org_addr', 'person_org__addr', 'person_org', 'UNSPECIFIED', 'person_org__id', 'id');

--
-- TOC Entry ID 3 (OID 57421)
--
-- Name: seq_grp Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_grp"', 1024, 'f');

--
-- TOC Entry ID 6 (OID 57476)
--
-- Name: seq_media_type Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_media_type"', 1024, 'f');

--
-- TOC Entry ID 9 (OID 57495)
--
-- Name: seq_media_type_ext Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_media_type_ext"', 1024, 'f');

--
-- TOC Entry ID 12 (OID 57591)
--
-- Name: seq_alerted Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_alerted"', 1024, 'f');

--
-- TOC Entry ID 15 (OID 57649)
--
-- Name: seq_alert_type_rule Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_alert_type_rule"', 1024, 'f');

--
-- TOC Entry ID 18 (OID 57697)
--
-- Name: seq_alert Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_alert"', 1024, 'f');

--
-- TOC Entry ID 21 (OID 57780)
--
-- Name: seq_alert_type Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_alert_type"', 1024, 'f');

--
-- TOC Entry ID 24 (OID 57829)
--
-- Name: seq_attr_grp Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_grp"', 1024, 'f');

--
-- TOC Entry ID 27 (OID 57848)
--
-- Name: seq_attr_grp_val Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_grp_val"', 1024, 'f');

--
-- TOC Entry ID 30 (OID 57867)
--
-- Name: seq_attr_grp_meta Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_grp_meta"', 1024, 'f');

--
-- TOC Entry ID 33 (OID 58040)
--
-- Name: seq_priv Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_priv"', 1024, 'f');

--
-- TOC Entry ID 36 (OID 58068)
--
-- Name: seq_pref Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_pref"', 1024, 'f');

--
-- TOC Entry ID 39 (OID 58087)
--
-- Name: seq_pref_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_pref_member"', 1024, 'f');

--
-- TOC Entry ID 42 (OID 58167)
--
-- Name: seq_class Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_class"', 1024, 'f');

--
-- TOC Entry ID 45 (OID 58218)
--
-- Name: seq_event_type Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_event_type"', 1143, 't');

--
-- TOC Entry ID 48 (OID 58237)
--
-- Name: seq_event_type_attr Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_event_type_attr"', 1049, 't');

--
-- TOC Entry ID 51 (OID 58305)
--
-- Name: seq_event Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_event"', 1024, 'f');

--
-- TOC Entry ID 54 (OID 58370)
--
-- Name: seq_contrib_type_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_contrib_type_member"', 1024, 'f');

--
-- TOC Entry ID 57 (OID 58427)
--
-- Name: seq_alert_type_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_alert_type_member"', 1024, 'f');

--
-- TOC Entry ID 60 (OID 58468)
--
-- Name: seq_user_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_user_member"', 1024, 'f');

--
-- TOC Entry ID 63 (OID 58509)
--
-- Name: seq_source_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_source_member"', 1024, 'f');

--
-- TOC Entry ID 66 (OID 58550)
--
-- Name: seq_org_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_org_member"', 1024, 'f');

--
-- TOC Entry ID 69 (OID 58575)
--
-- Name: seq_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_member"', 1024, 'f');

--
-- TOC Entry ID 72 (OID 58635)
--
-- Name: seq_story_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_story_member"', 1024, 'f');

--
-- TOC Entry ID 75 (OID 58660)
--
-- Name: seq_grp_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_grp_member"', 1024, 'f');

--
-- TOC Entry ID 78 (OID 58701)
--
-- Name: seq_attr_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_member"', 1024, 'f');

--
-- TOC Entry ID 81 (OID 58720)
--
-- Name: seq_attr_member_val Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_member_val"', 1024, 'f');

--
-- TOC Entry ID 84 (OID 58739)
--
-- Name: seq_attr_member_meta Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_member_meta"', 1024, 'f');

--
-- TOC Entry ID 87 (OID 58876)
--
-- Name: seq_resource Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_resource"', 1024, 'f');

--
-- TOC Entry ID 90 (OID 58995)
--
-- Name: seq_server Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_server"', 1024, 'f');

--
-- TOC Entry ID 93 (OID 59023)
--
-- Name: seq_action_type Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_action_type"', 1024, 'f');

--
-- TOC Entry ID 96 (OID 59084)
--
-- Name: seq_job Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_job"', 1024, 'f');

--
-- TOC Entry ID 99 (OID 59103)
--
-- Name: seq_job_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_job_member"', 1024, 'f');

--
-- TOC Entry ID 102 (OID 59224)
--
-- Name: seq_action Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_action"', 1024, 'f');

--
-- TOC Entry ID 105 (OID 59243)
--
-- Name: seq_attr_action Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_action"', 1024, 'f');

--
-- TOC Entry ID 108 (OID 59262)
--
-- Name: seq_attr_action_val Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_action_val"', 1024, 'f');

--
-- TOC Entry ID 111 (OID 59281)
--
-- Name: seq_attr_action_meta Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_action_meta"', 1024, 'f');

--
-- TOC Entry ID 114 (OID 59503)
--
-- Name: seq_server_type Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_server_type"', 1024, 'f');

--
-- TOC Entry ID 117 (OID 59522)
--
-- Name: seq_dest_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_dest_member"', 1024, 'f');

--
-- TOC Entry ID 120 (OID 59559)
--
-- Name: seq_at_data Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_at_data"', 1024, 'f');

--
-- TOC Entry ID 123 (OID 59578)
--
-- Name: seq_attr_at_data Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_at_data"', 1024, 'f');

--
-- TOC Entry ID 126 (OID 59597)
--
-- Name: seq_attr_at_data_val Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_at_data_val"', 1024, 'f');

--
-- TOC Entry ID 129 (OID 59616)
--
-- Name: seq_attr_at_data_meta Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_at_data_meta"', 1024, 'f');

--
-- TOC Entry ID 132 (OID 59799)
--
-- Name: seq_element Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_element"', 1024, 'f');

--
-- TOC Entry ID 135 (OID 59818)
--
-- Name: seq_element__output_channel Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_element__output_channel"', 1024, 'f');

--
-- TOC Entry ID 138 (OID 59837)
--
-- Name: seq_element_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_element_member"', 1024, 'f');

--
-- TOC Entry ID 141 (OID 59856)
--
-- Name: seq_attr_element Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_element"', 1024, 'f');

--
-- TOC Entry ID 144 (OID 59875)
--
-- Name: seq_attr_element_val Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_element_val"', 1024, 'f');

--
-- TOC Entry ID 147 (OID 59894)
--
-- Name: seq_attr_element_meta Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_element_meta"', 1024, 'f');

--
-- TOC Entry ID 150 (OID 60123)
--
-- Name: seq_at_type Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_at_type"', 1024, 'f');

--
-- TOC Entry ID 153 (OID 60142)
--
-- Name: seq_element_type_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_element_type_member"', 1024, 'f');

--
-- TOC Entry ID 156 (OID 60297)
--
-- Name: seq_contact Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_contact"', 1024, 'f');

--
-- TOC Entry ID 159 (OID 60316)
--
-- Name: seq_contact_value Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_contact_value"', 1024, 'f');

--
-- TOC Entry ID 162 (OID 60388)
--
-- Name: seq_person Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_person"', 1024, 'f');

--
-- TOC Entry ID 165 (OID 60407)
--
-- Name: seq_person_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_person_member"', 1024, 'f');

--
-- TOC Entry ID 168 (OID 60426)
--
-- Name: seq_category Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_category"', 1024, 'f');

--
-- TOC Entry ID 171 (OID 60445)
--
-- Name: seq_category_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_category_member"', 1024, 'f');

--
-- TOC Entry ID 174 (OID 60464)
--
-- Name: seq_attr_category Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_category"', 1024, 'f');

--
-- TOC Entry ID 177 (OID 60483)
--
-- Name: seq_attr_category_val Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_category_val"', 1024, 'f');

--
-- TOC Entry ID 180 (OID 60502)
--
-- Name: seq_attr_category_meta Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_category_meta"', 1024, 'f');

--
-- TOC Entry ID 183 (OID 60697)
--
-- Name: seq_keyword Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_keyword"', 1024, 'f');

--
-- TOC Entry ID 186 (OID 60716)
--
-- Name: seq_keyword_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_keyword_member"', 1024, 'f');

--
-- TOC Entry ID 189 (OID 60794)
--
-- Name: seq_workflow Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_workflow"', 1024, 'f');

--
-- TOC Entry ID 192 (OID 60813)
--
-- Name: seq_workflow_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_workflow_member"', 1024, 'f');

--
-- TOC Entry ID 195 (OID 60880)
--
-- Name: seq_desk Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_desk"', 1024, 'f');

--
-- TOC Entry ID 198 (OID 60899)
--
-- Name: seq_desk_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_desk_member"', 1024, 'f');

--
-- TOC Entry ID 201 (OID 61025)
--
-- Name: seq_org Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_org"', 1024, 'f');

--
-- TOC Entry ID 204 (OID 61044)
--
-- Name: seq_formatting Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_formatting"', 1024, 'f');

--
-- TOC Entry ID 207 (OID 61063)
--
-- Name: seq_formatting_instance Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_formatting_instance"', 1024, 'f');

--
-- TOC Entry ID 210 (OID 61082)
--
-- Name: seq_formatting_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_formatting_member"', 1024, 'f');

--
-- TOC Entry ID 213 (OID 61101)
--
-- Name: seq_attr_formatting Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_formatting"', 1024, 'f');

--
-- TOC Entry ID 216 (OID 61120)
--
-- Name: seq_attr_formatting_val Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_formatting_val"', 1024, 'f');

--
-- TOC Entry ID 219 (OID 61139)
--
-- Name: seq_attr_formatting_meta Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_formatting_meta"', 1024, 'f');

--
-- TOC Entry ID 222 (OID 61398)
--
-- Name: seq_story Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_story"', 1024, 'f');

--
-- TOC Entry ID 225 (OID 61417)
--
-- Name: seq_story_instance Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_story_instance"', 1024, 'f');

--
-- TOC Entry ID 228 (OID 61436)
--
-- Name: seq_story__category Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_story__category"', 1024, 'f');

--
-- TOC Entry ID 231 (OID 61455)
--
-- Name: seq_story__contributor Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_story__contributor"', 1024, 'f');

--
-- TOC Entry ID 234 (OID 61474)
--
-- Name: seq_attr_story Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_story"', 1024, 'f');

--
-- TOC Entry ID 237 (OID 61493)
--
-- Name: seq_attr_story_val Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_story_val"', 1024, 'f');

--
-- TOC Entry ID 240 (OID 61512)
--
-- Name: seq_attr_story_meta Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_story_meta"', 1024, 'f');

--
-- TOC Entry ID 243 (OID 61787)
--
-- Name: seq_media Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_media"', 1024, 'f');

--
-- TOC Entry ID 246 (OID 61806)
--
-- Name: seq_media_instance Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_media_instance"', 1024, 'f');

--
-- TOC Entry ID 249 (OID 61825)
--
-- Name: seq_media__contributor Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_media__contributor"', 1024, 'f');

--
-- TOC Entry ID 252 (OID 61844)
--
-- Name: seq_media_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_media_member"', 1024, 'f');

--
-- TOC Entry ID 255 (OID 61863)
--
-- Name: seq_image_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_image_member"', 1024, 'f');

--
-- TOC Entry ID 258 (OID 61882)
--
-- Name: seq_media_fields Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_media_fields"', 1024, 'f');

--
-- TOC Entry ID 261 (OID 61901)
--
-- Name: seq_attr_media Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_media"', 1024, 'f');

--
-- TOC Entry ID 264 (OID 61920)
--
-- Name: seq_attr_media_val Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_media_val"', 1024, 'f');

--
-- TOC Entry ID 267 (OID 61939)
--
-- Name: seq_attr_media_meta Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_attr_media_meta"', 1024, 'f');

--
-- TOC Entry ID 270 (OID 62275)
--
-- Name: seq_story_data_tile Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_story_data_tile"', 1024, 'f');

--
-- TOC Entry ID 273 (OID 62294)
--
-- Name: seq_media_data_tile Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_media_data_tile"', 1024, 'f');

--
-- TOC Entry ID 276 (OID 62427)
--
-- Name: seq_story_container_tile Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_story_container_tile"', 1024, 'f');

--
-- TOC Entry ID 279 (OID 62446)
--
-- Name: seq_media_container_tile Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_media_container_tile"', 1024, 'f');

--
-- TOC Entry ID 282 (OID 62541)
--
-- Name: seq_output_channel Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_output_channel"', 1024, 'f');

--
-- TOC Entry ID 285 (OID 62560)
--
-- Name: seq_output_channel_member Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_output_channel_member"', 1024, 'f');

--
-- TOC Entry ID 288 (OID 62668)
--
-- Name: seq_person_org Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_person_org"', 1024, 'f');

--
-- TOC Entry ID 291 (OID 62687)
--
-- Name: seq_source Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_source"', 1024, 'f');

--
-- TOC Entry ID 294 (OID 62826)
--
-- Name: seq_addr Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_addr"', 1024, 'f');

--
-- TOC Entry ID 297 (OID 62845)
--
-- Name: seq_addr_part Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_addr_part"', 1024, 'f');

--
-- TOC Entry ID 300 (OID 62864)
--
-- Name: seq_addr_part_type Type: SEQUENCE SET Owner: 
-- Data Pos: 0 (Length 0)
--

SELECT setval ('"seq_addr_part_type"', 1024, 'f');

