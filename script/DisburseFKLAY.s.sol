// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { CastleMap } from "src/CastleMap.sol";
import { IGasliteDrop } from "src/IGasliteDrop.sol";
import { FakeKLAY } from "src/fKLAY.sol";

contract DisburseFKLAY is Script {

    FakeKLAY public fklay = FakeKLAY(0x0b1FfE056fD5CD4918747D5F4872901B6Ad87aBf);
    CastleMap public castleMap = CastleMap(0x6EF551C906eE7E658Ec73471399D9C21Fda0DF18);
    IGasliteDrop public gasliteDrop = IGasliteDrop(0x61684fc62B6a0f1273f69D9Fca0E264001a61Db6);

    
    function run() external {
        vm.startBroadcast();    
        address[] memory castleList = castleMap.getAllCastles();
        uint256[] memory allocations = new uint256[](castleList.length);
        uint256 totalAmount = 0;
        for (uint256 i = 0; i < allocations.length; i++) {
            allocations[i] = 10000000000000000000;
            totalAmount += allocations[i];
        }
        fklay.approve(0x61684fc62B6a0f1273f69D9Fca0E264001a61Db6, totalAmount);
        gasliteDrop.airdropERC20(0x0b1FfE056fD5CD4918747D5F4872901B6Ad87aBf, castleList, allocations, totalAmount);
        console.log("Disbursed: ", totalAmount);
        vm.stopBroadcast();
    }
}