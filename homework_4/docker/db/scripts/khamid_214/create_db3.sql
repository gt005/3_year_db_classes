CREATE TABLE Station (
    StatNr INTEGER PRIMARY KEY,
    Name VARCHAR
);

CREATE TABLE StationsPersonel (
    PersNr INTEGER PRIMARY KEY,
    Name VARCHAR,
    StatNr INTEGER REFERENCES Station(StatNr)
);

CREATE TABLE Doctor (
    PersNr INTEGER PRIMARY KEY REFERENCES StationsPersonel(PersNr),
    Name VARCHAR,
    StatNr INTEGER REFERENCES Station(StatNr),
    Area VARCHAR,
    Rang VARCHAR
);

CREATE TABLE Caregivers (
    PersNr INTEGER PRIMARY KEY REFERENCES StationsPersonel(PersNr),
    Name VARCHAR,
    StatNr INTEGER REFERENCES Station(StatNr),
    Qualification VARCHAR
);

CREATE TABLE Patient (
    PatientNr INTEGER PRIMARY KEY,
    Name VARCHAR,
    Disease VARCHAR,
    RoomNr INTEGER NULL,
    "from" DATE NULL,
    "to" DATE NULL
);

CREATE TABLE Room (
    StatNr INTEGER REFERENCES Station(StatNr),
    RoomNr INTEGER,
    Beds INTEGER,
    PRIMARY KEY (StatNr, RoomNr)
);

CREATE TABLE WorksAt (
    StatNr INTEGER REFERENCES Station(StatNr),
    PersNr INTEGER REFERENCES StationsPersonel(PersNr),
    PRIMARY KEY (StatNr, PersNr)
);

CREATE TABLE Treats (
    PatientNr INTEGER REFERENCES Patient(PatientNr),
    PersNr INTEGER REFERENCES StationsPersonel(PersNr),
    PRIMARY KEY (PatientNr, PersNr)
);

CREATE TABLE Admission (
    StatNr INTEGER,
    RoomNr INTEGER,
    PatientNr INTEGER REFERENCES Patient(PatientNr),
    "from" DATE,
    "to" DATE,
    PRIMARY KEY (StatNr, RoomNr, PatientNr),
    FOREIGN KEY (StatNr, RoomNr) REFERENCES Room(StatNr, RoomNr)
);

CREATE TABLE Has (
    StatNr INTEGER,
    RoomNr INTEGER,
    PRIMARY KEY (StatNr, RoomNr),
    FOREIGN KEY (StatNr, RoomNr) REFERENCES Room(StatNr, RoomNr)
);
