// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { CastleMap } from "src/CastleMap.sol";
import { IGasliteDrop } from "src/IGasliteDrop.sol";
import { Gold } from "src/Gold.sol";

contract DisburseGold is Script {

    Gold public gold = Gold(0x0b1FfE056fD5CD4918747D5F4872901B6Ad87aBf);
    CastleMap public castleMap = CastleMap(0x40A72f733a7168337Cc2523d20511AD6A569A2C3);
    IGasliteDrop public gasliteDrop = IGasliteDrop(0x61684fc62B6a0f1273f69D9Fca0E264001a61Db6);

    
    function run() external {
        vm.startBroadcast();    
        address[] memory castleList = castleMap.getAllTreasuryCastles();
        uint256[] memory allocations = new uint256[](castleList.length);
        uint256 totalAmount = 0;
        for (uint256 i = 0; i < allocations.length; i++) {
            allocations[i] = 10000000000000000000;
            totalAmount += allocations[i];
        }
        gold.approve(0x61684fc62B6a0f1273f69D9Fca0E264001a61Db6, totalAmount);
        gasliteDrop.airdropERC20(0x0b1FfE056fD5CD4918747D5F4872901B6Ad87aBf, castleList, allocations, totalAmount);
        console.log("Disbursed: ", totalAmount);
        vm.stopBroadcast();
    }
}