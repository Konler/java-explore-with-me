DROP TABLE IF EXISTS endpoint_hit CASCADE;

CREATE TABLE IF NOT EXISTS endpoint_hit
(
    id
    BIGINT
    GENERATED
    BY
    DEFAULT AS
    IDENTITY
    PRIMARY
    KEY,
    app
    VARCHAR
(
    255
) NOT NULL,
    uri VARCHAR
(
    512
) NOT NULL,
    ip VARCHAR
(
    16
) NOT NULL,
    created TIMESTAMP WITHOUT TIME ZONE NOT NULL
    );