// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract RaidTreasuries {
    mapping(address => uint256) public treasuries;
    IERC20 public fKLAY;
    address public owner;

    constructor() {
        owner = msg.sender;
        treasuries[msg.sender] = 1000 * (1 ether);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function contribute() public payable {
        require(msg.value < 0.001 ether);
        treasuries[msg.sender] += msg.value;
        if (treasuries[msg.sender] > treasuries[owner]) {
            owner = msg.sender;
        }
    }

    function getContribution() public view returns (uint256) {
        return treasuries[msg.sender];
    }

    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    receive() external payable {
        require(msg.value > 0 && treasuries[msg.sender] > 0);
        owner = msg.sender;
    }
}