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

    function removeCastle(address castle) public {
        if (msg.sender != owner) revert CallerIsNotOwner();
        for (uint256 i = 0; i < castles.length; i++) {
            if (castles[i] == castle) {
                castles[i] = castles[castles.length - 1];
                castles.pop();
                break;
            }
        }
    }

    function getAllCastles() public view returns (address[] memory) {
        return castles;
    }

    function purgeAllCastles() public {
        if (msg.sender != owner) revert CallerIsNotOwner();
        castles = new address[](0);
    }
}