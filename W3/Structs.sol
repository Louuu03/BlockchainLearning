// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.7;

contract Structs {
   struct Car {
    string model;
    uint year;
    address owner;
   }
   Car public car;
   Car[] public cars;
   mapping(address =>Car[]) public carsByOwner;

   function examples() external{
        Car memory toyota = Car('Toyota', 1990, msg.sender);
        Car memory lambo = Car({model:'Lamborghini', year:1995, owner: msg.sender});
        Car memory tesla; //default value
        tesla.model = 'Tesla';
        tesla.year = 1998;
        tesla.owner = msg.sender;
       
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car('Ferrari', 2022, msg.sender));

        Car storage _car = cars[0];
        _car.year = 1999;
        delete _car.owner;

        delete cars[1];
   }
}