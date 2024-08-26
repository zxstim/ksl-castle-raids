// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { RaidTreasury } from "src/RaidTreasury.sol";

contract Deploy is Script {
    address public owner = 0x6FaFF29226219756aa40CE648dbc65FB41DE5F72;
    int8 public numberOfTreasuries;
    mapping(uint16 => address) public treasuries;

    function run() external {

        /// @dev start the broadcast
        vm.startBroadcast();

        for (uint16 i = 0; i < 5; i++) {
            RaidTreasury raidTreasury = new RaidTreasury();
            treasuries[i] = address(raidTreasury);
            numberOfTreasuries++;
            console.log("RaidTreasury deployed at: ", address(raidTreasury));
        }
        console.log("Deployed: ", numberOfTreasuries);
        /// @dev stop the broadcast
        vm.stopBroadcast();
    }
}