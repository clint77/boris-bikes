#Boris Bikes
===========

Our first ever pair programming task at Makers Academy started on day 1 of our 12 weeks bootcamp. Test driven development introduction to Ruby.

###Clint & Andy's Domain Model

#Classes

##Bike
Responsibility  | Collaborators
----------------|---------------------------
Be Received     | User, Van, Station
Be Ejected      | User, Van, Station
Be Broken       | User
Be Fixed        | Garage
Be Held         | Van, Station, Garage, User
(?) Be Moved    | Van

##User
Responsibility  | Collaborators
----------------|---------------------------
Rent            | Station
Receive         | Bike, Station
Eject           | Bike, Station
Break           | Bike
Hold            | Bike

##Van
Responsibility  | Collaborators
----------------|---------------------------
Receive         | Bike, Station, Garage
Eject           | Bike, Station, Garage
Hold            | Bike
(?) Move        | Bike, Garage, Station

##Garage
Responsibility  | Collaborators
----------------|---------------------------
Receive         | Van, Bike
Eject           | Van, Bike
Fix             | Bike
Hold            | Bike

##Station
Responsibility  | Collaborators
----------------|---------------------------
Rent            | User
Receive         | User, Van, Bike
Eject           | User, Van, Bike
Hold            | Bike
