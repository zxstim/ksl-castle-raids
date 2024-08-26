// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract RaidTreasury { 

    error CallerIsNotOwner();

    mapping(address => uint256) public treasury;

    /// @dev Fake KLAY token address
    address goldAddress = 0x32Bf51fa408A0ee9B7A414C6A793760CaF086118;
    /// @dev Fake KLAY token interface
    IERC20 public gold = IERC20(goldAddress);
    address public owner;

    constructor() {
        owner = msg.sender;
        treasury[msg.sender] = 10000 * (1 ether);
    }

    modifier onlyOwner() {
        if (msg.sender != owner) revert CallerIsNotOwner();
        _;
    }

    function contribute() public payable {
        require(msg.value < 0.001 ether);
        treasury[msg.sender] += msg.value;
        if (treasury[msg.sender] > treasury[owner]) {
            owner = msg.sender;
        }
    }

    function getContribution() public view returns (uint256) {
        return treasury[msg.sender];
    }

    function withdraw() public onlyOwner {
        gold.transfer(msg.sender, gold.balanceOf(address(this)));
    }

    receive() external payable {
        require(msg.value > 0 && treasury[msg.sender] > 0);
        owner = msg.sender;
    }
}