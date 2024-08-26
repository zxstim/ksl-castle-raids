// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @custom:security-contact zxstim@gmail.com
interface ICastleMap {
    function addCastle(address newCastle) external returns (address);

    function getAllCastles() external view returns (address[] memory);
}