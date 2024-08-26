// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact zxstim@gmail.com
contract CastleMap is Ownable {
    error CallerIsNotOwner();

    address[] private treasuryCastles;
    address[] private gemCastles;

    constructor(address initialOwner) Ownable(initialOwner) { }

    function addTreasuryCastle(address newCastle) public onlyOwner returns (address) {
        treasuryCastles.push(newCastle);
        return newCastle;
    }

    function addGemCastle(address newCastle) public onlyOwner returns (address) {
        gemCastles.push(newCastle);
        return newCastle;
    }

    function removeTreasuryCastle(address castle) public onlyOwner {
        for (uint256 i = 0; i < treasuryCastles.length; i++) {
            if (treasuryCastles[i] == castle) {
                treasuryCastles[i] = treasuryCastles[treasuryCastles.length - 1];
                treasuryCastles.pop();
                break;
            }
        }
    }

    function removeGemCastle(address castle) public onlyOwner {
        for (uint256 i = 0; i < gemCastles.length; i++) {
            if (gemCastles[i] == castle) {
                gemCastles[i] = gemCastles[gemCastles.length - 1];
                gemCastles.pop();
                break;
            }
        }
    }

    function getAllTreasuryCastles() public view returns (address[] memory) {
        return treasuryCastles;
    }

    function getAllGemCastles() public view returns (address[] memory) {
        return gemCastles;
    }

    function purgeAllTreasuryCastles() public onlyOwner {
        treasuryCastles = new address[](0);
    }

    function purgeAllGemCastles() public onlyOwner {
        gemCastles = new address[](0);
    }
}
