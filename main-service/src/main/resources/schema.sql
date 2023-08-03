DROP TABLE IF EXISTS REQUESTS CASCADE;
DROP TABLE IF EXISTS EVENTS CASCADE;
DROP TABLE IF EXISTS USERS CASCADE;
DROP TABLE IF EXISTS CATEGORIES CASCADE;
DROP TABLE IF EXISTS LOCATIONS CASCADE;


CREATE TABLE IF NOT EXISTS USERS
(
    ID    BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    NAME  CHARACTER VARYING                       NOT NULL,
    EMAIL CHARACTER VARYING                       NOT NULL,
    CONSTRAINT UN_EMAIL UNIQUE (EMAIL),
    CONSTRAINT USERS_PK
        PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS CATEGORIES
(
    ID   BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    NAME CHARACTER VARYING                       NOT NULL,
    CONSTRAINT UN_NAME UNIQUE (NAME),
    CONSTRAINT CATEGORIES_PK
        PRIMARY KEY (ID)
);
CREATE TABLE IF NOT EXISTS LOCATIONS
(
    ID  BIGINT GENERATED BY DEFAULT AS IDENTITY,
    LAT FLOAT NOT NULL,
    LON FLOAT NOT NULL,
    CONSTRAINT LOCATIONS_PK PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS EVENTS
(
    ID                 BIGINT GENERATED BY DEFAULT AS IDENTITY,
    ANNOTATION         VARCHAR                     NOT NULL,
    CATEGORY_ID        BIGINT                      NOT NULL,
    CREATED_ON         TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    DESCRIPTION        VARCHAR                     NOT NULL,
    EVENT_DATE         TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    INITIATOR_ID       BIGINT                      NOT NULL,
    PAID               BOOLEAN                     NOT NULL,
    PARTICIPANT_LIMIT  BIGINT                      NOT NULL,
    PUBLISHED_ON       TIMESTAMP WITHOUT TIME ZONE,
    REQUEST_MODERATION BOOLEAN                     NOT NULL,
    STATE              VARCHAR                     NOT NULL,
    TITLE              VARCHAR                     NOT NULL,
    LOCATION           BIGINT,
    COMPILATION_ID BIGINT REFERENCES COMPILATIONS(ID) ON DELETE SET NULL,
    CONSTRAINT EVENTS_PK PRIMARY KEY (ID),
    CONSTRAINT LOCATION_FK FOREIGN KEY (LOCATION) REFERENCES LOCATIONS,
    CONSTRAINT CATEGORIES_FK FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES,
    CONSTRAINT INITIATOR_FK FOREIGN KEY (INITIATOR_ID) REFERENCES USERS
);

CREATE TABLE IF NOT EXISTS REQUESTS
(
    ID           BIGINT GENERATED BY DEFAULT AS IDENTITY,
    CREATED      TIMESTAMP WITHOUT TIME ZONE,
    EVENT_ID     BIGINT,
    REQUESTER_ID BIGINT NOT NULL,
    STATUS       VARCHAR,
    CONSTRAINT REQUESTS_PK PRIMARY KEY (ID),
    CONSTRAINT CATEGORIES_FK FOREIGN KEY (EVENT_ID) REFERENCES EVENTS,
    CONSTRAINT USERS_FK FOREIGN KEY (REQUESTER_ID) REFERENCES USERS
);

CREATE TABLE IF NOT EXISTS COMPILATIONS
(
    ID     BIGINT GENERATED BY DEFAULT AS IDENTITY,
    PINNED BOOLEAN,
    TITLE  VARCHAR,
    CONSTRAINT COMPILATIONS_PK PRIMARY KEY (ID)
)





