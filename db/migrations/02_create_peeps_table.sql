CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(240), tstz TIMESTAMPTZ, user_id INTEGER REFERENCES users (id));