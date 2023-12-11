CREATE TABLE City (
    Name VARCHAR(255),
    Region VARCHAR(255),
    PRIMARY KEY (Name, Region)
);

CREATE TABLE Station (
    Name VARCHAR(255) PRIMARY KEY,
    Tracks INT,
    CityName VARCHAR(255),
    Region VARCHAR(255),
    FOREIGN KEY (CityName, Region) REFERENCES City(Name, Region)
);

CREATE TABLE Train (
    TrainNr INT PRIMARY KEY,
    Length INT,
    StartStationName VARCHAR(255),
    EndStationName VARCHAR(255),
    FOREIGN KEY (StartStationName) REFERENCES Station(Name),
    FOREIGN KEY (EndStationName) REFERENCES Station(Name)
);

CREATE TABLE Connection (
    FromStation VARCHAR(255),
    ToStation VARCHAR(255),
    TrainNr INT,
    Departure TIMESTAMP,
    Arrival TIMESTAMP,
    PRIMARY KEY (FromStation, ToStation, TrainNr),
    FOREIGN KEY (FromStation) REFERENCES Station(Name),
    FOREIGN KEY (ToStation) REFERENCES Station(Name),
    FOREIGN KEY (TrainNr) REFERENCES Train(TrainNr)
);

