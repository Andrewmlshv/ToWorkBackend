DROP TABLE IF EXISTS userWithAchievements;
DROP TABLE IF EXISTS achievement;
DROP TABLE IF EXISTS user_progress_in_module;
DROP TABLE IF EXISTS page;
DROP TABLE IF EXISTS "module";
DROP TABLE IF EXISTS knowledge;
DROP TABLE IF EXISTS track;
DROP TABLE IF EXISTS AppUser;

CREATE TABLE AppUser (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	password TEXT NOT NULL,
    progress INTEGER NOT NULL
);

CREATE TABLE track (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	name TEXT NOT NULL,
    quantityModules INTEGER
);

CREATE TABLE knowledge (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	name TEXT NOT NULL,
	content TEXT
);

CREATE TABLE "module" (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    quantityPage INTEGER NOT NULL,
    quantityCoin INTEGER NOT NULL,
    startContent TEXT NOT NULL,
    endContent TEXT NOT NULL,
    numberInTrack INTEGER NOT NULL,
    idTrack INTEGER NOT NULL REFERENCES track(id)
);

CREATE TABLE page (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    content TEXT NOT NULL,
    name TEXT NOT NULL,
    numberInModule INTEGER NOT NULL,
    idModule INTEGER NOT NULL REFERENCES "module"(id),
    UNIQUE (idModule,numberInModule)
);

CREATE TABLE user_progress_in_module (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	numberLastCompletePage INTEGER NOT NULL,
	allQuantityPage INTEGER NOT NULL,
	id_user INTEGER UNIQUE NOT NULL REFERENCES AppUser(id),
	id_module INTEGER UNIQUE NOT NULL REFERENCES "module"(id)
);

CREATE TABLE achievement(
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    picture TEXT NOT NULL
);

CREATE TABLE userWithAchievements (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id_user INTEGER NOT NULL REFERENCES AppUser(id),
    id_achievements INTEGER NOT NULL REFERENCES achievement(id)
);

INSERT INTO achievement(name) VALUES ('лучший гуапчич');
INSERT INTO userWithAchievements(id_user,id_achievements) VALUES ('1','1');


