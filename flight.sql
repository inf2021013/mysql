CREATE TABLE Flights (
  FlightNumber INT PRIMARY KEY,
  Company VARCHAR(255),
  Direction VARCHAR(255),
  City VARCHAR(255),
  Date DATE,
  GateNumber INT
);

CREATE TABLE SecurityPersonnel (
  SecurityCode INT PRIMARY KEY,
  GateNumber INT,
  WeekStartDate DATE,
  FOREIGN KEY (GateNumber) REFERENCES Flights(GateNumber)
);

CREATE TABLE Airplanes (
  PlaneCode INT PRIMARY KEY,
  PlaneName VARCHAR(255),
  ManufactureYear INT
);

CREATE TABLE FlightTypes (
  TypeID INT PRIMARY KEY,
  TypeName VARCHAR(255),
  Capacity INT,
  MaxDistance INT
);

CREATE TABLE Fuels (
  FuelID INT PRIMARY KEY,
  FuelName VARCHAR(255),
  OctaneRating INT,
  PricePerLiter DECIMAL(10, 2)
);

CREATE TABLE Tests (
  TestName VARCHAR(255) PRIMARY KEY
);

CREATE TABLE TestSections (
  SectionID INT PRIMARY KEY,
  TestName VARCHAR(255),
  SectionName VARCHAR(255),
  TechnicianID INT,
  TestDate DATE,
  Result VARCHAR(255),
  FOREIGN KEY (TestName) REFERENCES Tests(TestName),
  FOREIGN KEY (TechnicianID) REFERENCES SecurityPersonnel(SecurityCode)
);

CREATE TABLE Technicians (
  TechnicianID INT PRIMARY KEY,
  TechnicianName VARCHAR(255),
  PlaneTypeID INT,
  FOREIGN KEY (PlaneTypeID) REFERENCES FlightTypes(TypeID)
);

CREATE TABLE Passengers (
  PassengerID INT PRIMARY KEY,
  PassengerName VARCHAR(255),
  Address VARCHAR(255),
  Income DECIMAL(10, 2),
  Age INT,
  CreditCardsNumber INT
);

CREATE TABLE Tickets (
  TicketID INT PRIMARY KEY,
  PassengerID INT,
  TicketNumber VARCHAR(255),
  BaggageReceipt VARCHAR(255),
  FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);

CREATE TABLE Crew (
  CrewID INT PRIMARY KEY,
  CrewType VARCHAR(255),
  FlightID INT,
  PilotID INT,
  StewardessID INT,
  FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
  FOREIGN KEY (PilotID) REFERENCES SecurityPersonnel(SecurityCode),
  FOREIGN KEY (StewardessID) REFERENCES SecurityPersonnel(SecurityCode)
);

CREATE TABLE Hotels (
  HotelID INT PRIMARY KEY,
  HotelName VARCHAR(255),
  PostalAddress VARCHAR(255),
  EmailAddress VARCHAR(255)
);

CREATE TABLE AdvertisingSpaces (
  SpaceID INT PRIMARY KEY,
  SpaceLocation VARCHAR(255),
  RentalCompanyID INT,
  ContractExpirationDate DATE,
  RentalAmount DECIMAL(10, 2),
  FOREIGN KEY (RentalCompanyID) REFERENCES Airlines(AirlineID)
);

CREATE TABLE ServiceKiosks (
  KioskID INT PRIMARY KEY,
  KioskNumber INT,
  AirlineID INT,
  FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

CREATE TABLE Meetings (
  MeetingID INT PRIMARY KEY,
  MeetingDate DATE,
  MeetingTopic VARCHAR(255)
);

CREATE TABLE MeetingParticipants (
  MeetingID INT,
  PersonnelID INT,
  FOREIGN KEY (MeetingID) REFERENCES Meetings(MeetingID),
  FOREIGN KEY (PersonnelID) REFERENCES SecurityPersonnel(SecurityCode)
);

-- Date table (for storing dates in combination with day, month, and year)
CREATE TABLE Dates (
  DateID INT PRIMARY KEY,
  DayOfWeek VARCHAR(255),
  DayOfMonth INT,
  Month INT,
  Year INT
);
