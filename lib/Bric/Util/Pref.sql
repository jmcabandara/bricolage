--
-- Project: Bricolage API
-- VERSION: $Revision: 1.1 $
--
-- $Date: 2001-09-06 21:55:26 $
-- Author: David Wheeler <david@wheeler.net>


--
-- SEQUENCES
--

CREATE SEQUENCE seq_pref START 1024;
CREATE SEQUENCE seq_pref_member START 1024;



-- 
-- TABLE: pref
--        Global preferences.

CREATE TABLE pref (
    id           NUMERIC(10, 0)  NOT NULL
                                 DEFAULT NEXTVAL('seq_pref'),
    name         VARCHAR(64)     NOT NULL,
    description  VARCHAR(256),
    value        VARCHAR(256),
    def          VARCHAR(256),
    CONSTRAINT pk_pref__id PRIMARY KEY (id)
);

-- 
-- TABLE: pref
--        Preference options.

CREATE TABLE pref_opt (
    pref__id     NUMERIC(10, 0)  NOT NULL,
    value        VARCHAR(256)    NOT NULL,
    description  VARCHAR(256),
    CONSTRAINT pk_pref_opt__pref__id__value PRIMARY KEY (pref__id, value)
);


--
-- TABLE: pref_member
--

CREATE TABLE pref_member (
    id          NUMERIC(10,0)  NOT NULL
                               DEFAULT NEXTVAL('seq_pref_member'),
    object_id   NUMERIC(10,0)  NOT NULL,
    member__id  NUMERIC(10,0)  NOT NULL,
    CONSTRAINT pk_pref_member__id PRIMARY KEY (id)
);



-- 
-- INDEXES.
--

CREATE UNIQUE INDEX udx_pref__name ON pref(LOWER(name));
CREATE INDEX fkx_pref__pref__opt ON pref_opt(pref__id);
CREATE INDEX fkx_pref__pref_member ON pref_member(object_id);
CREATE INDEX fkx_member__pref_member ON pref_member(member__id);


/*
Change Log:
$Log: Pref.sql,v $
Revision 1.1  2001-09-06 21:55:26  wheeler
Initial revision

*/
