DROP TABLE RomanticRelationship;
DROP TABLE FamilialRelationship;
DROP TABLE C_VGR;
DROP TABLE VG_GCR;
DROP TABLE Roles;
DROP TABLE Genres;
DROP TABLE Character;
DROP TABLE GameCompany;
DROP TABLE VideoGame;
DROP TABLE VoiceActor;


/*
CREATE STATEMENTS
*/
CREATE TABLE GameCompany
(
    companyID NUMBER(3),
    companyName VARCHAR2(30),
    yearCreated NUMBER(4),
    yearsActive NUMBER(4),
    stillExist NUMBER(1) DEFAULT 1 NOT NULL,
    yearsClosed NUMBER(4),
    CONSTRAINT pk_GameCompany_companyID PRIMARY KEY (companyID)
);

CREATE TABLE VideoGame
(
    gameID NUMBER(3),
    title VARCHAR2(30),
    purchasePrice NUMBER(5,2),
    releaseDate DATE,
    platforms VARCHAR2(50),
    website VARCHAR2(200),
    series NUMBER(2),
    CONSTRAINT pk_VideoGame_gameID PRIMARY KEY (gameID)
);

CREATE TABLE VoiceActor
(
    voiceActorID NUMBER(3),
    vaLastName VARCHAR2(30),
    vaFirstName VARCHAR2(30),
    image VARCHAR2(200),
    CONSTRAINT pk_VoiceActor_voiceActorID PRIMARY KEY (voiceActorID)
);

CREATE TABLE Character
(
    characterID NUMBER(3),
    characterLName VARCHAR2(30),
    characterFName VARCHAR2(36),
    alias VARCHAR2(30),
    age NUMBER(2),
    fictional VARCHAR2(9),
    image VARCHAR2(200),
    voiceActorID NUMBER(3),
    CONSTRAINT pk_Character_characterID PRIMARY KEY (characterID),
    CONSTRAINT fk_Character_voiceActorID FOREIGN KEY (voiceActorID) REFERENCES VoiceActor(voiceActorID)
);

CREATE TABLE Genres
(
    gameID NUMBER(3),
    genre VARCHAR2(10),
    CONSTRAINT pk_Genres_gameID_genre PRIMARY KEY (gameID, genre),
    CONSTRAINT fk_Genres_gameID FOREIGN KEY (gameID) REFERENCES VideoGame(gameID)
);

CREATE TABLE Roles
(
    characterID NUMBER(3),
    role VARCHAR2(15),
    CONSTRAINT pk_Roles_characterID_role PRIMARY KEY (characterID, role),
    CONSTRAINT fk_Roles_characterID FOREIGN KEY (characterID) REFERENCES Character(characterID)
);

CREATE TABLE VG_GCR
(
    gameID NUMBER(3),
    companyID NUMBER(3),
    relationship VARCHAR2(20),
    CONSTRAINT pk_VG_GCR_gameID_companyID PRIMARY KEY (gameID, companyID),
    CONSTRAINT fk_VG_GCR_gameID FOREIGN KEY (gameID) REFERENCES VideoGame(gameID),
    CONSTRAINT fk_VG_GCR_companyID FOREIGN KEY (companyID) REFERENCES GameCompany(companyID)
);

CREATE TABLE C_VGR
(
    gameID NUMBER(3),
    characterID NUMBER(3),
    features VARCHAR2(20),
    CONSTRAINT pk_C_VGR_characterID_gameID PRIMARY KEY (characterID, gameID),
    CONSTRAINT fk_C_VGR_gameID FOREIGN KEY (gameID) REFERENCES VideoGame(gameID),
    CONSTRAINT fk_C_VGR_characterID FOREIGN KEY (characterID) REFERENCES Character(characterID)
);

CREATE TABLE FamilialRelationship
(
    characterID1 NUMBER(3),
    characterID2 NUMBER(3),
    relationship VARCHAR2(20),
    CONSTRAINT pk_C_VGFR_cID1_cID2 PRIMARY KEY (characterID1, characterID2),
    CONSTRAINT fk_C_VGFR_characterID1 FOREIGN KEY (characterID1) REFERENCES Character(characterID),
    CONSTRAINT fk_C_VGFR_characterID2 FOREIGN KEY (characterID2) REFERENCES Character(characterID)
);

CREATE TABLE RomanticRelationship
(
    characterID1 NUMBER(3),
    characterID2 NUMBER(3),
    relationship VARCHAR2(20),
    CONSTRAINT pk_C_VGRR_cID1_cID2 PRIMARY KEY (characterID1, characterID2),
    CONSTRAINT fk_C_VGRR_characterID1 FOREIGN KEY (characterID1) REFERENCES Character(characterID),
    CONSTRAINT fk_C_VGRR_characterID2 FOREIGN KEY (characterID2) REFERENCES Character(characterID)
);

/*commit;*/


/*
INSERT STATEMENTS
*/
INSERT INTO GameCompany VALUES (001, 'Blizzard Entertainment', 1991, 29, 1, null);
INSERT INTO GameCompany VALUES (002, 'Square Enix', 1986, 34, 1, null);

INSERT INTO VideoGame VALUES (001, 'Overwatch', 19.99, TO_DATE('27-OCT-2015', 'DD-MON-YYYY') , 'PC/Playstation 4/Xbox One/Nintendo Switch', 'https://playoverwatch.com/en-us/', 1);
INSERT INTO VideoGame VALUES (002, 'Final Fantasy 7', 49.99, TO_DATE('31-JAN-1997', 'DD-MON-YYYY') , 'Playstation', 'https://finalfantasy7.square-enix-games.com/en-us', 7);

INSERT INTO VoiceActor VALUES (001, 'Theobold', 'Cara', 'https://m.media-amazon.com/images/M/MV5BMjU4NTExMjM1Nl5BMl5BanBnXkFtZTgwMzQ3NzcxMjE@._V1_.jpg');
INSERT INTO VoiceActor VALUES (002, 'Ferguson', 'Keith', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Keith_Ferguson_-_VO_Actor.jpg/1024px-Keith_Ferguson_-_VO_Actor.jpg');
INSERT INTO VoiceActor VALUES (003, 'Hollings', 'Chloé', 'https://m.media-amazon.com/images/M/MV5BNWVhZTlkNzAtMjM2My00MjE3LTk3OGYtMWM3Y2E5OTNjMWY2XkEyXkFqcGdeQXVyMTEyNTc4MDEx._V1_.jpg');
INSERT INTO VoiceActor VALUES (004, 'Cohn', 'Jen', 'https://m.media-amazon.com/images/M/MV5BN2UzZjk1NGItNGY4Yi00ZDM4LWFlYWUtNDQxZjVhYjFkZTkzXkEyXkFqcGdeQXVyODE3MjM2NDY@._V1_.jpg');
INSERT INTO VoiceActor VALUES (005, 'De Paul', 'Darin', 'https://m.media-amazon.com/images/M/MV5BODExODk4NTgxMF5BMl5BanBnXkFtZTgwODQzNTk1MDI@._V1_SX1501_CR0,0,1501,999_AL_.jpg');
INSERT INTO VoiceActor VALUES (006, 'Pohl', 'Lucie', 'https://m.media-amazon.com/images/M/MV5BZDNlZDMyZTAtYTBjOS00N2ZjLWFiNzYtNDliYjZjNWRlNDg3XkEyXkFqcGdeQXVyMTg1ODE5ODE@._V1_SY1000_SX1500_AL_.jpg');
INSERT INTO VoiceActor VALUES (007, 'Silverstein', 'Keith', 'https://m.media-amazon.com/images/M/MV5BNWM0MTUyNTktYTRlNS00M2E3LWE2YzItZmFhMzE1ZmVlMTljXkEyXkFqcGdeQXVyNjkwMjM2NTI@._V1_.jpg');
INSERT INTO VoiceActor VALUES (008, 'Nakauchi', 'Paul', 'https://m.media-amazon.com/images/M/MV5BOWYzOTQxNDUtMDViZi00OGU1LWE4NWEtYTFiMDMxZWQwM2VhXkEyXkFqcGdeQXVyMTcwMTEwMTI@._V1_SY1000_CR0,0,666,1000_AL_.jpg');
INSERT INTO VoiceActor VALUES (009, 'Freeman', 'Crispin', 'https://m.media-amazon.com/images/M/MV5BMjI1Mzg3Mzg0OV5BMl5BanBnXkFtZTcwNjEyNzQwOA@@._V1_SY1000_CR0,0,666,1000_AL_.jpg');
INSERT INTO VoiceActor VALUES (010, 'Chin', 'Feodor', 'https://m.media-amazon.com/images/M/MV5BYjUwZWRiZTctZDVhMS00NThlLWIzYzktMGE0ODc2Zjg5NDNkXkEyXkFqcGdeQXVyMTM5NTc4Ng@@._V1_SY1000_CR0,0,641,1000_AL_.jpg');
INSERT INTO VoiceActor VALUES (011, 'Metzen', 'Christopher', 'https://www.babelio.com/users/AVT_Chris-Metzen_4255.jpg');
INSERT INTO VoiceActor VALUES (012, 'Bhimani', 'Anjali', 'https://m.media-amazon.com/images/M/MV5BMTYzODIyNjQ4OV5BMl5BanBnXkFtZTgwMzMzNDU3ODE@._V1_SY1000_CR0,0,729,1000_AL_.jpg');
INSERT INTO VoiceActor VALUES (013, 'Gavanski', 'Dolya', 'https://m.media-amazon.com/images/M/MV5BODI5ZDU5NzQtYzVkZi00MmNiLWE1NGUtZjU2NzNjYzU5ZjcwXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_SY1000_CR0,0,827,1000_AL_.jpg');
INSERT INTO VoiceActor VALUES (014, 'Mercer', 'Matthew', 'https://m.media-amazon.com/images/M/MV5BMDkzZjg1ODUtM2FiOC00NmM1LWIyNWYtNGYwY2FhZTgzNzUxXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_.jpg');
INSERT INTO VoiceActor VALUES (015, 'Tatasciore', 'Frederick', 'https://m.media-amazon.com/images/M/MV5BMjU1MjE0MjAwNF5BMl5BanBnXkFtZTcwMDQ4ODUwOA@@._V1_SY1000_CR0,0,680,1000_AL_.jpg');
INSERT INTO VoiceActor VALUES (016, 'Cruz', 'Jonny', 'https://m.media-amazon.com/images/M/MV5BMjQxOTYxZGUtNTEzYi00N2M3LWI4MTUtZWYwNDhiMDEwYmIxXkEyXkFqcGdeQXVyOTE1NjU0OQ@@._V1_SY1000_CR0,0,681,1000_AL_.jpg');
INSERT INTO VoiceActor VALUES (017, 'Petersdorf', 'Josh', 'https://m.media-amazon.com/images/M/MV5BMTU5Mjk0NTI3OF5BMl5BanBnXkFtZTgwMzczNzgxMDI@._V1_.jpg');
INSERT INTO VoiceActor VALUES (018, 'Parson', 'Christopher', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Chris_Parson_Florida_SuperCon_2018.jpg/681px-Chris_Parson_Florida_SuperCon_2018.jpg');
INSERT INTO VoiceActor VALUES (019, 'Chung', 'Charlet', 'https://m.media-amazon.com/images/M/MV5BNGRlNjI5MTEtNTk4Ny00YTU3LWE5MTAtYmY0NGQ0OWIyMTkwXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_SY1000_CR0,0,1503,1000_AL_.jpg');
INSERT INTO VoiceActor VALUES (020, 'Zhang', 'Elise', 'https://pbs.twimg.com/profile_images/1035889001771675648/nvKniyFo_400x400.jpg');
INSERT INTO VoiceActor VALUES (021, 'Space', 'Gaku', 'https://m.media-amazon.com/images/M/MV5BM2QwZjMwZTMtZWZjNC00Y2Y3LTllOWUtYzZmZTJkYzYxNGMzXkEyXkFqcGdeQXVyOTU2MTMwMA@@._V1_.jpg');
INSERT INTO VoiceActor VALUES (022, 'Selim', 'Aysha', 'https://vignette.wikia.nocookie.net/overwatch/images/8/85/Aysha-selim-14.5-1-.jpg/revision/latest/top-crop/width/360/height/360?cb=20170213174418');
INSERT INTO VoiceActor VALUES (023, 'Ravassa', 'Carolina', 'https://m.media-amazon.com/images/M/MV5BMTE3OTIwMjItMjljMC00NjY1LTk1YjgtZmY4ZjM0NjM3ZTRjXkEyXkFqcGdeQXVyMjEyNDM2NzI@._V1_.jpg');
INSERT INTO VoiceActor VALUES (024, 'Skeete', 'Cherrelle', 'https://www.cherrelleskeete.com/images/headshot_05@2x.jpg');
INSERT INTO VoiceActor VALUES (025, 'Ngaujah', 'Sahr', 'https://m.media-amazon.com/images/M/MV5BMTUyMTI3MTQ1MV5BMl5BanBnXkFtZTcwNzg4NTQ0Mw@@._V1_.jpg');
INSERT INTO VoiceActor VALUES (026, 'O''Reilly', 'Genevieve', 'https://www.gstatic.com/tv/thumb/persons/331141/331141_v9_ba.jpg');
INSERT INTO VoiceActor VALUES (027, 'Smedius', 'Matilda', 'https://www.san-japan.org/wp-content/uploads/2019/04/image1.jpeg');
INSERT INTO VoiceActor VALUES (028, 'Lipow', 'Jonathan', 'https://vignette.wikia.nocookie.net/overwatch/images/d/dd/People_photography_-_Jonathan_Lipow-1-.jpg/revision/latest/top-crop/width/360/height/360?cb=20180629015906');
INSERT INTO VoiceActor VALUES (029, 'Hale', 'Jennifer', 'https://m.media-amazon.com/images/M/MV5BMjEzNzk2MzUwNF5BMl5BanBnXkFtZTcwMTk1MDQ4Nw@@._V1_SY1000_CR0,0,701,1000_AL_.jpg');
INSERT INTO VoiceActor VALUES (030, 'Antoine', 'Benz', 'https://m.media-amazon.com/images/M/MV5BZjA3NTFhZTQtZjU1MS00MDcyLWEyNDctNTIxNmM4ODdlOTI5XkEyXkFqcGdeQXVyMjIyNTkyMTk@._V1_.jpg');
INSERT INTO VoiceActor VALUES (031, 'Hiestand', 'Boris', 'https://m.media-amazon.com/images/M/MV5BZmFjODQ0ZWEtNTY5ZC00ZGRlLWE1ZDktZmM2ZDc5OWUxMzgyXkEyXkFqcGdeQXVyNDU1ODg4Mw@@._V1_SY1000_SX800_AL_.jpg');

INSERT INTO Character VALUES (001, 'Oxton', 'Lena', 'Tracer', 26, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/8/81/Tracer-portrait.png?version=06bfae396e7a2cc718f52c56a64f50f0', 001);
INSERT INTO Character VALUES (002, 'Reyes', 'Gabriel', 'Reaper', 58, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/7/74/Reaper-portrait.png?version=dbf6b4b02ba3173d959a92163995a0dc', 002);
INSERT INTO Character VALUES (003, 'Lacroix', 'Amélie', 'Widowmaker', 33, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/4/4c/Widowmaker-portrait.png?version=9136a3aee4d1fa764e7ba934d1727889', 003);
INSERT INTO Character VALUES (004, 'Amari', 'Fareeha', 'Pharah', 32, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/2/26/Pharah-portrait.png?version=3b333572d9d4226e7aaa764eb4a37ed4', 004);
INSERT INTO Character VALUES (005, 'Wilhelm', 'Reinhardt', 'Reinhardt', 61, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/0/07/Reinhardt-portrait.png?version=dfc08f64fce85f4f68139c00eead5661', 005);
INSERT INTO Character VALUES (006, 'Ziegler', 'Angela', 'Mercy', 37, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/d/d2/Mercy-portrait.png?version=fbd9e38d4120771f75d834e35757ab66', 006);
INSERT INTO Character VALUES (007, 'Lindholm', 'Torbjörn', 'Torbjörn', 57, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/c/c5/Torbjorn-portrait.png?version=754373e2fc2a78cddd13b514b87b162f', 007);
INSERT INTO Character VALUES (008, 'Shimada', 'Hanzo', 'Hanzo', 38, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/a/a0/Hanzo-portrait.png?version=7ba1f56104acf77e5e506f527220471e', 008);
INSERT INTO Character VALUES (009, null, 'Winston', 'Winston', 29, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/b/b8/Winston-portrait.png?version=1e29cc0be5d792375edc50c0d57c700e', 009);
INSERT INTO Character VALUES (010, 'Zenyatta', 'Tekhartha', 'Zenyatta', 20, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/9/92/Zenyatta-portrait.png?version=349b8c3eb69ab86e126b2f3f7afffb28', 010);
INSERT INTO Character VALUES (011, null, 'SST Laboratories Siege Automaton E54', 'Bastion', 30, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/d/d0/Bastion-portrait.png?version=04e9dd39241f9127ff0fd9446d038cc1', 011);
INSERT INTO Character VALUES (012, 'Vaswani', 'Satya', 'Symmetra', 28, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/1/18/Symmetra-portrait.png?version=2bfd5ca159b68f5cf0fc7d6ff31315c3', 012);
INSERT INTO Character VALUES (013, 'Zaryanova', 'Aleksandra', 'Zarya', 28, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/6/6d/Zarya-portrait.png?version=7b54c424554b8bba05437afa5cbd8fe2', 013);
INSERT INTO Character VALUES (014, 'McCree', 'Jesse', 'McCree', 37, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/d/d2/Mccree-portrait.png?version=97e9cc0d7ac1cf111af97a3a8152794f', 014);
INSERT INTO Character VALUES (015, 'Morrison', 'John Francis "Jack"', 'Soldier: 76', 55, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/e/e0/Soldier76-portrait.png?version=55f5960f435517fb40ccc2032c367467', 015);
INSERT INTO Character VALUES (016, 'Correia dos Santos', 'Lúcio', 'Lúcio', 26, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/8/8c/Lucio-portrait.png?version=13e1e285d10a84546b7363bef0315f77', 016);
INSERT INTO Character VALUES (017, 'Rutledge', 'Mako', 'Roadhog', 48, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/c/ce/Roadhog-Portrait.png?version=674b96469ee7f2ae0b28fe43e71d3b07', 017);
INSERT INTO Character VALUES (018, 'Fawkes', 'Jamison', 'Junkrat', 25, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/9/99/Junkrat-Portrait.png?version=cbef495426af13bb489b6becb0193f6a', 018);
INSERT INTO Character VALUES (019, 'Song', 'Hana', 'D.Va', 19, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/b/b0/DVa-portrait.png?version=52b3e6388cb4054bc8dca373e72cf9ab', 019);
INSERT INTO Character VALUES (020, 'Zhou', 'Mei-Ling', 'Mei', 40, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/d/d0/Mei-portrait.png?version=7a53428682ac1931cb4a83621c7f2547', 020);
INSERT INTO Character VALUES (021, 'Shimada', 'Genji', 'Genji', 35, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/d/d8/Genji-portrait.png?version=8ccde3eb88f65fa4edaacbb94f9ba451', 021);
INSERT INTO Character VALUES (022, 'Amari', 'Ana', 'Ana', 60, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/7/76/Ana.png?version=8b9993a234d6c256d6ff0085e22424db', 022);
INSERT INTO Character VALUES (023, 'Colomar', 'Olivia', 'Sombra', 30, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/c/c5/Sombra-portrait.png?version=3aae633b91db20c78118befe68a3a811', 023);
INSERT INTO Character VALUES (024, null, 'Orisa', 'Orisa', 1, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/6/66/Orisa-portrait.png?version=da7e9563042b5df10e10da87a05dc448', 024);
INSERT INTO Character VALUES (025, 'Ogundimu', 'Akande', 'Doomfist', 45, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/1/15/Doomfist_Artwork.png?version=757f3343b573243a917871c166f16cbd', 025);
INSERT INTO Character VALUES (026, 'O''Deorain', 'Moira', 'Moira', 48, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/b/b5/Moira.png?version=d894663c594cbb4abeae233e6a14f255', 026);
INSERT INTO Character VALUES (027, 'Lindholm', 'Brigitte', 'Brigitte', 23, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/8/8a/Brigitte_Concept.png?version=37164f41f6c9e5702a0df870b146de31', 027);
INSERT INTO Character VALUES (028, null, 'Hammond', 'Wrecking Ball', 14, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/9/9b/Wrecking_Ball.png?version=070aed5b28c65af48483ac3ebcad2e287', 028);
INSERT INTO Character VALUES (029, 'Ashe', 'Elizabeth Caledonia "Calamity"', 'Ashe', 39, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/4/4f/Ashe-portrait.png?version=e710b88c991b23951f5369517933029c', 029);
INSERT INTO Character VALUES (030, 'Augustin', 'Jean-Baptiste', 'Baptiste', 36, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/0/01/Baptiste-portrait.png?version=e7fc7bb13d83c4938d384d4acd72e837', 30);
INSERT INTO Character VALUES (031, 'de Kuiper', 'Siebren', 'Sigma', 36, 'Fictional', 'https://gamepedia.cursecdn.com/overwatch_gamepedia/8/80/Sigma.png?version=de4bceb77ca5680aad1540c0ccfc3b90', 31);
INSERT INTO Character VALUES (032, 'Strife', 'Cloud', 'Cloud', 21, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/1/1a/Cloud-FFVIIArt.png/revision/latest?cb=20110227161510', null);
INSERT INTO Character VALUES (033, 'Lockhart', 'Tifa', 'Tifa', 20, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/9/94/Tifa-FFVIIArt.png/revision/latest?cb=20110227161512', null);
INSERT INTO Character VALUES (034, null, 'Sephiroth', 'Sephiroth', 27, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/e/e4/Sephiroth-FFVIIArt.png/revision/latest?cb=20141008012137', null);
INSERT INTO Character VALUES (035, 'Fair', 'Zack', 'Zax', 23, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/1/15/ZackCGModel-CrisisCore.png/revision/latest?cb=20110225233727', null);
INSERT INTO Character VALUES (036, 'Gainsborough', 'Aerith', 'Aeris', 22, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/9/93/Aeris-FFVIIArt.png/revision/latest?cb=20181004134236', null);
INSERT INTO Character VALUES (037, 'Valentine', 'Vincent', 'Vince', 27, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/d/df/Vincent-FFVIIArt.png/revision/latest?cb=20110227161513', null);
INSERT INTO Character VALUES (038, 'Wallace', 'Barret', 'Barret', 35, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/1/1e/Barret-FFVIIArt.png/revision/latest?cb=20110227161508', null);
INSERT INTO Character VALUES (039, 'Sith', 'Cait', 'Cait', 1, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/6/65/CaitSith-FFVIIArt.png/revision/latest?cb=20110227161509', null);
INSERT INTO Character VALUES (040, 'Highwind', 'Cid', 'Captain', 32, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/b/b0/CidHighwind-FFVIIArt.png/revision/latest?cb=20110227161509', null);
INSERT INTO Character VALUES (041, 'XIII', 'Red', 'Nanaki', 48, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/1/1f/RedXIII-FFVIIArt.png/revision/latest?cb=20110227161510', null);
INSERT INTO Character VALUES (042, 'Kisaragi', 'Yuffie', 'Treasure Princess', 16, 'Fictional', 'https://vignette.wikia.nocookie.net/finalfantasy/images/2/20/Yuffie-FFVIIArt.png/revision/latest?cb=20110227161514', null);

INSERT INTO Genres VALUES (001, 'FPS');
INSERT INTO Genres VALUES (002, 'RPG');

INSERT INTO Roles VALUES (001, 'Damage');
INSERT INTO Roles VALUES (002, 'Damage');
INSERT INTO Roles VALUES (003, 'Damage');
INSERT INTO Roles VALUES (004, 'Damage');
INSERT INTO Roles VALUES (005, 'Tank');
INSERT INTO Roles VALUES (006, 'Healer');
INSERT INTO Roles VALUES (007, 'Damage');
INSERT INTO Roles VALUES (008, 'Damage');
INSERT INTO Roles VALUES (009, 'Tank');
INSERT INTO Roles VALUES (010, 'Healer');
INSERT INTO Roles VALUES (011, 'Damage');
INSERT INTO Roles VALUES (012, 'Damage');
INSERT INTO Roles VALUES (013, 'Tank');
INSERT INTO Roles VALUES (014, 'Damage');
INSERT INTO Roles VALUES (015, 'Damage');
INSERT INTO Roles VALUES (016, 'Healer');
INSERT INTO Roles VALUES (017, 'Healer');
INSERT INTO Roles VALUES (018, 'Damage');
INSERT INTO Roles VALUES (019, 'Tank');
INSERT INTO Roles VALUES (020, 'Damage');
INSERT INTO Roles VALUES (021, 'Damage');
INSERT INTO Roles VALUES (022, 'Healer');
INSERT INTO Roles VALUES (023, 'Damage');
INSERT INTO Roles VALUES (024, 'Tank');
INSERT INTO Roles VALUES (025, 'Damage');
INSERT INTO Roles VALUES (026, 'Healer');
INSERT INTO Roles VALUES (027, 'Healer');
INSERT INTO Roles VALUES (028, 'Tank');
INSERT INTO Roles VALUES (029, 'Damage');
INSERT INTO Roles VALUES (030, 'Healer');
INSERT INTO Roles VALUES (031, 'Tank');
INSERT INTO Roles VALUES (032, 'Damage');
INSERT INTO Roles VALUES (032, 'Tank');
INSERT INTO Roles VALUES (033, 'Damage');
INSERT INTO Roles VALUES (034, 'Damage');
INSERT INTO Roles VALUES (034, 'Tank');
INSERT INTO Roles VALUES (035, 'Tank');
INSERT INTO Roles VALUES (036, 'Healer');
INSERT INTO Roles VALUES (037, 'Damage');
INSERT INTO Roles VALUES (038, 'Tank');
INSERT INTO Roles VALUES (039, 'Healer');
INSERT INTO Roles VALUES (040, 'Damage');
INSERT INTO Roles VALUES (041, 'Damage');
INSERT INTO Roles VALUES (042, 'Healer');
INSERT INTO Roles VALUES (042, 'Damage');

INSERT INTO VG_GCR VALUES (001, 001, 'Developer/Publisher');
INSERT INTO VG_GCR VALUES (002, 002, 'Developer/Publisher');

INSERT INTO C_VGR VALUES (001, 001, 'Features');
INSERT INTO C_VGR VALUES (001, 002, 'Features');
INSERT INTO C_VGR VALUES (001, 003, 'Features');
INSERT INTO C_VGR VALUES (001, 004, 'Features');
INSERT INTO C_VGR VALUES (001, 005, 'Features');
INSERT INTO C_VGR VALUES (001, 006, 'Features');
INSERT INTO C_VGR VALUES (001, 007, 'Features');
INSERT INTO C_VGR VALUES (001, 008, 'Features');
INSERT INTO C_VGR VALUES (001, 009, 'Features');
INSERT INTO C_VGR VALUES (001, 010, 'Features');
INSERT INTO C_VGR VALUES (001, 011, 'Features');
INSERT INTO C_VGR VALUES (001, 012, 'Features');
INSERT INTO C_VGR VALUES (001, 013, 'Features');
INSERT INTO C_VGR VALUES (001, 014, 'Features');
INSERT INTO C_VGR VALUES (001, 015, 'Features');
INSERT INTO C_VGR VALUES (001, 016, 'Features');
INSERT INTO C_VGR VALUES (001, 017, 'Features');
INSERT INTO C_VGR VALUES (001, 018, 'Features');
INSERT INTO C_VGR VALUES (001, 019, 'Features');
INSERT INTO C_VGR VALUES (001, 020, 'Features');
INSERT INTO C_VGR VALUES (001, 021, 'Features');
INSERT INTO C_VGR VALUES (001, 022, 'Features');
INSERT INTO C_VGR VALUES (001, 023, 'Features');
INSERT INTO C_VGR VALUES (001, 024, 'Features');
INSERT INTO C_VGR VALUES (001, 025, 'Features');
INSERT INTO C_VGR VALUES (001, 026, 'Features');
INSERT INTO C_VGR VALUES (001, 027, 'Features');
INSERT INTO C_VGR VALUES (001, 028, 'Features');
INSERT INTO C_VGR VALUES (001, 029, 'Features');
INSERT INTO C_VGR VALUES (001, 030, 'Features');
INSERT INTO C_VGR VALUES (001, 031, 'Features');
INSERT INTO C_VGR VALUES (002, 032, 'Features');
INSERT INTO C_VGR VALUES (002, 033, 'Features');
INSERT INTO C_VGR VALUES (002, 034, 'Features');
INSERT INTO C_VGR VALUES (002, 035, 'Features');
INSERT INTO C_VGR VALUES (002, 036, 'Features');
INSERT INTO C_VGR VALUES (002, 037, 'Features');
INSERT INTO C_VGR VALUES (002, 038, 'Features');
INSERT INTO C_VGR VALUES (002, 039, 'Features');
INSERT INTO C_VGR VALUES (002, 040, 'Features');
INSERT INTO C_VGR VALUES (002, 041, 'Features');
INSERT INTO C_VGR VALUES (002, 042, 'Features');

INSERT INTO FamilialRelationship VALUES (022, 004, 'Mother-Daughter');
INSERT INTO FamilialRelationship VALUES (008, 021, 'Brother-Brother');
INSERT INTO FamilialRelationship VALUES (007, 027, 'Father-Daughter');
INSERT INTO FamilialRelationship VALUES (032, 034, 'Clone-Original');

INSERT INTO RomanticRelationship VALUES (032, 036, 'Dating');
INSERT INTO RomanticRelationship VALUES (035, 036, 'Past Lovers');

/*
SELECT STATEMENTS
*/

SELECT * FROM GameCompany;
SELECT * FROM VideoGame;
SELECT * FROM VoiceActor;
SELECT * FROM Character;
SELECT * FROM Genres;
SELECT * FROM Roles;
SELECT * FROM VG_GCR;
SELECT * FROM C_VGR;
SELECT * FROM FamilialRelationship;
SELECT * FROM RomanticRelationship;



SELECT characterLName, characterFName, age
FROM character
WHERE age < 30;

SELECT c.alias, r.role
FROM character c
JOIN roles r ON c.characterID = r.characterID
WHERE r.role = 'Damage';



SELECT r.role, COUNT(r.characterID) AS "COUNT"
FROM roles r
GROUP BY r.role;

SELECT gameID, COUNT(characterID) AS "COUNT"
FROM C_VGR
GROUP BY gameID;



SELECT gc.companyName, v.title, c.alias, va.VALastName
FROM GameCompany gc
JOIN VG_GCR r1 ON gc.companyID = r1.companyID
JOIN VideoGame v ON r1.gameID = v.gameID
JOIN C_VGR r2 ON v.gameID = r2.gameID
JOIN Character c ON r2.characterID = c.characterID
LEFT JOIN VoiceActor va ON va.voiceActorID = c.voiceActorID;



SELECT c.companyName, c.yearCreated, r.relationship, v.title, v.series
FROM GameCompany c
JOIN VG_GCR r ON c.companyID = r.companyID
JOIN VideoGame v ON r.gameID = v.gameID;

SELECT v.title, v.series, r.features, c.alias, c.age
FROM VideoGame v
JOIN C_VGR r ON v.gameID = r.gameID
JOIN Character c ON r.characterID = c.characterID;

SELECT c1.alias, c1.age, c2.alias, c2.age, f.relationship
FROM Character c1
JOIN FamilialRelationship f ON c1.characterID = f.characterID1
JOIN Character c2 ON f.characterID2 = c2.characterID;

SELECT c1.alias, c1.age, c2.alias, c2.age, r.relationship
FROM Character c1
JOIN RomanticRelationship r ON c1.characterID = r.characterID1
JOIN Character c2 ON r.characterID2 = c2.characterID;