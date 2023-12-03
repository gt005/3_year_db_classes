# Домашнее задание 3
Хамид Карим, БПИ214

## Задание 1
Ключ таблицы сделан для поддержки уникальности записей. То есть если строка с одинаковыми данными, то нужен уникальный элемент, который бы их отличал. Это сделано еще и для отношений, то есть чтобы точно знать, на какую строку ссылаемся.


## Задание 2
Чтобы не искать, где мои диаграммы, которые тут описываю: 
### Из номера 1
```
Entities:
Reader (ReaderID, LastName, FirstName, Address, BirthDate)
Book (ISBN, Title, Author, PagesNumber, PublicationYear, PublisherName)
Publisher (PublisherName, PublisherKind)
Category (CategoryName, ParentCategory)
Copy (ISBN, CopyNumber, ShelfPosition)

Relationships:
Borrow (ReaderID, ISBN, CopyNumber, ReturnDate)
```

### Из номера 2
#### Из пункта 1

Это 1 в 1 с ответом, но я осознал, насколько такая структура ускоряет работу бд, поэтому оставлю ее.
```
Entities:

Country (CountryName)
City (CountryName, CityName)
Street (CountryName, CityName, StreetName)
House (CountryName, CityName, StreetName, HouseNo)
Apartment (CountryName, CityName, StreetName, HouseNo, AptNo)
```

#### Из пункта 2
```
Entities:

Team (Name)
Play (PlayDate, HostTeam, GuestTeam)
Arbiter (Name, Experience)
```

#### Из пункта 3
```
Entities:

Father(Name)
Mother(Name)

Relationships:
Woman's dad (FName, MName)
Woman's mother (FName, MName)
Son (FName, MName)
Daughter (FName, MName)
```


### Из номера 3
```
Entities:

Entity (Name)
Entity Attribute (Name, Key)
Relation (Name)
Relation Attribute (Name)

Relationships:

Engagement (Entity, Relation, Role, Functionality, Min, Max)
```


## Задание 3
Честно, я оставил это из ответа на задание, так как очень плохо понимаю как правильно реализовать именно эти две схемы

### Задание 3.1
```
City ( Name, Region ) (1) 
Station ( Name, #Tracks ) (2) 
Train ( TrainNr, Length ) (3) 
Lie_in ( StationName, CityName, Region ) (4) 
Start ( TrainNr, StartStationName ) (5) 
End ( TrainNr, EndStationName ) (6) 

Connection ( FromStation, ToStation, TrainNr, Departure, Arrival) (7)
Combining (4)->(2), (5)->(3), (6)->(3)
City ( Name, Region ) 
Station ( Name, #Tracks, CityName, Region ) 
Train ( TrainNr, Length, StartStationName, EndStationName ) 
Connection ( FromStation, ToStation, TrainNr, Departure, Arrival) 
```

### Задание 3.2
```
StationsPersonel ( PersNr, Name) (1)
Station ( StatNr, Name) (2) 
Doctor ( PersNr, Name, Area, Rang) (3) 
Caregivers ( PersNr, Name, Qualification) (4) 
Patient ( PatientNr, Name, Disease) (5) 
Room ( StatNr, RoomNr, #Beds) 
WorksAt ( StatNr, PersNr) (7) 
Treats ( PatientNr, PersNr) (8)    
Admission ( StatNr, RoomNr, PatientNr, from, to) (9) 
Has( StatNr, RoomNr) (10) 
Combining (1/3/4)->(2), (9)->(5), (10)->(6)
StationsPersonal ( PersNr, Name, StatNr) 
Station ( StatNr, Name) 
Doctor ( PersNr, Name, StatNr, Area, Rang) 
Caregivers ( PersNr, Name, StatNr, Qualification) 
Patient ( PatientNr, Name, Disease, RoomNr, from, to) 
Room ( StatNr, RoomNr, #Beds) 
Treats ( PatientNr, PersNr)
```
