-- Project: Bricolage
-- VERSION: $Revision: 1.1 $
--
-- $Date: 2001-09-06 21:55:37 $
-- Target DBMS: PostgreSQL 7.1.2
-- Author: David Wheeler <david@wheeler.net>
--


-- 
-- TABLE: alert_type_rule
--

CREATE TABLE alert_type_rule(
    id                NUMERIC(10, 0)  NOT NULL
                                      DEFAULT NEXTVAL('seq_alert_type_rule'),
    alert_type__id    NUMERIC(10, 0)  NOT NULL,
    attr              VARCHAR(64)     NOT NULL,
    operator          CHAR(2)         NOT NULL,
    value             VARCHAR(256)    NOT NULL,
    CONSTRAINT pk_alert_type_rule__id PRIMARY KEY (id)
);

-- 
-- SEQUENCES.
--

CREATE SEQUENCE seq_alert_type_rule START  1024;

-- 
-- INDEXS.
--

CREATE INDEX idx_alert_type_rule__attr ON alert_type_rule(LOWER(attr));
CREATE INDEX idx_alert_type_rule__value ON alert_type_rule(LOWER(value));
CREATE INDEX fkx_alert_type__at_rule ON alert_type_rule(alert_type__id);


/*
Change Log:
$Log: Rule.sql,v $
Revision 1.1  2001-09-06 21:55:37  wheeler
Initial revision

*/
