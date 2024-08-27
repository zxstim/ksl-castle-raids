// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BanditFort {
    address banditLord;
    uint256 public prize;
    address public owner;

    constructor() payable {
        owner = msg.sender;
        banditLord = msg.sender;
        prize = msg.value;
    }

    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        payable(banditLord).transfer(msg.value);
        banditLord = msg.sender;
        prize = msg.value;
    }

    function _banditLord() public view returns (address) {
        return banditLord;
    }
}