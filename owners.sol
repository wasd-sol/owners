// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Owners {

    address public mainOwner;
    address[] public otherOwners;

    constructor() {
        mainOwner = msg.sender;
    }

    function addOwner(address newOwner) public {
        require(msg.sender == mainOwner, "You are not the owner!");
        otherOwners.push(newOwner);
    }

    function getOwners() public view returns(address[] memory){
        return otherOwners;
    }
}
