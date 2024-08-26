// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @custom:security-contact zxstim@gmail.com
contract CastleMap {

    error CallerIsNotOwner();

    address public owner;
    address[] private castles;

    constructor(address initialOwner) {
        owner = initialOwner;
    }

    function addCastle(address newCastle) public returns (address) {
        if (msg.sender != owner) revert CallerIsNotOwner();
        castles.push(newCastle);
        return newCastle;
    }

    function getAllCastles() public view returns (address[] memory) {
        return castles;
    }
}