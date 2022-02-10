//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract animalFactory{
  
    string public constant FACTORY_NAME = "Troy's Factory";

  uint public animalCounter;
  string public _name;
  string public _species;
  string public _color;
  int public _age;

    function setName(string memory _value) public {
        _name = _value;
    }

    function setSpecies(string memory _value2) public {
        _species = _value2;
    }

    function setColor(string memory _value3) public {
        _color = _value3;
    }

    function setAge(int userInput) public {
        _age = userInput;
    }

    struct Animal{
        string name;
        string species;
        string color;
        int age;
    }

    Animal[] public animals;

    function createAnimal() public{
        animals.push(Animal(_name, _species, _color, _age));
        animalCounter += 1;
    }

}
