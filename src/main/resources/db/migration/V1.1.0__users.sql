INSERT INTO users (id, username, password, accountNonExpired, accountNonLocked, credentialsNonExpired, enabled)
VALUES (1, 'admin', 'password', true, true, true, true)
ON CONFLICT (id)
            DO UPDATE SET
              id   = EXCLUDED.id,
              username = EXCLUDED.username,
              password = EXCLUDED.password,
              accountNonExpired = EXCLUDED.accountNonExpired,
              accountNonLocked = EXCLUDED.accountNonLocked,
              credentialsNonExpired = EXCLUDED.credentialsNonExpired,
              enabled = EXCLUDED.enabled
;