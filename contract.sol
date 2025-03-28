// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Voting {

    mapping(uint => string) public candidatesNames;
    mapping(uint => uint) public voteAmount;
    mapping(address => bool) public voters;

    uint public candidatesAmount;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function addCandidate(string memory _name) public {
        require(msg.sender == owner, "You cant add candidates, you are not the owner!");
        candidatesAmount++;
        candidatesNames[candidatesAmount] = _name;
        voteAmount[candidatesAmount] = 0;
    }

    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "You have already voted!");
        require(_candidateId > 0 && _candidateId <= candidatesAmount, "Invalid candidate ID");

        voters[msg.sender] = true;
        voteAmount[_candidateId]++;
    }

    function getCandidate(uint _candidateId) public view returns (string memory name, uint voteCount) {
        require(_candidateId > 0 && _candidateId <= candidatesAmount, "Invalid candidate ID");
        return (candidatesNames[_candidateId], voteAmount[_candidateId]);
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}
