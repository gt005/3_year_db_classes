CREATE TABLE City (
    Name VARCHAR PRIMARY KEY,
    Region VARCHAR
);

CREATE TABLE Station (
    Name VARCHAR PRIMARY KEY,
    Tracks INTEGER,
    CityName VARCHAR REFERENCES City(Name)
);

CREATE TABLE Train (
    TrainNr INTEGER PRIMARY KEY,
    Length INTEGER,
    StartStationName VARCHAR REFERENCES Station(Name),
    EndStationName VARCHAR REFERENCES Station(Name)
);

CREATE TABLE Connection (
    FromStation VARCHAR REFERENCES Station(Name),
    ToStation VARCHAR REFERENCES Station(Name),
    TrainNr INTEGER REFERENCES Train(TrainNr),
    Departure TIME,
    Arrival TIME,
    PRIMARY KEY (FromStation, ToStation, TrainNr)
);
