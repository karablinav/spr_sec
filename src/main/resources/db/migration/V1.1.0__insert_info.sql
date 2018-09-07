INSERT INTO users (id, username, password, account_non_expired, account_non_locked, credentials_non_expired, enabled)
VALUES
      (1, 'admin', '$2a$10$EepdouKrXDeNdrG1KzMazOoukeqTN5tF78xa7KGu.6D4PYF8S9GCe', true, true, true, true),
      (2, 'user', '$2a$10$70z65b3kb0kMJoNg6.w9a.fYHv1RoGXddjTLhzxTnJDyEJRRAmV9G', true, true, true, true)
ON CONFLICT (id)
            DO UPDATE SET
              id   = EXCLUDED.id,
              username = EXCLUDED.username,
              password = EXCLUDED.password,
              account_non_expired = EXCLUDED.account_non_expired,
              account_non_locked = EXCLUDED.account_non_locked,
              credentials_non_expired = EXCLUDED.credentials_non_expired,
              enabled = EXCLUDED.enabled
;


INSERT INTO role (id, name)
VALUES (1, 'ADMIN'),
        (2,'USER')
ON CONFLICT (id)
            DO UPDATE SET
              id   = EXCLUDED.id,
              name = EXCLUDED.name
;

INSERT INTO users_roles (user_id, role_id)
VALUES  (1,1),
        (2,2)
ON CONFLICT (user_id,role_id)
            DO UPDATE SET
              user_id   = EXCLUDED.user_id,
              role_id = EXCLUDED.role_id
;

