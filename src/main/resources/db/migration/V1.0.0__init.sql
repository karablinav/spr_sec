CREATE SEQUENCE role_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  START WITH 5;

CREATE SEQUENCE users_id_seq
  INCREMENT BY 1
  NO MAXVALUE
  START WITH 5;

CREATE TABLE users
(
  id                    INTEGER DEFAULT nextval('users_id_seq') NOT NULL,
  username              VARCHAR(100) UNIQUE,
  password              VARCHAR(100),
  accountNonExpired     boolean                                 NOT NULL,
  accountNonLocked      boolean                                 NOT NULL,
  credentialsNonExpired boolean                                 NOT NULL,
  enabled               boolean                                 NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE role
(
  id        INTEGER DEFAULT nextval('role_id_seq') NOT NULL PRIMARY KEY,
  name      VARCHAR(100)                             NOT NULL
);

CREATE TABLE users_roles
(
  user_id INTEGER,
  role_id    INTEGER,
  CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES role (id)
);

