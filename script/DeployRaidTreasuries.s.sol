// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { RaidTreasury } from "src/RaidTreasury.sol";
import { CastleMap } from "src/CastleMap.sol";

contract Deploy is Script {
    address public owner = 0x6FaFF29226219756aa40CE648dbc65FB41DE5F72;
    CastleMap public castleMap = CastleMap(0x6EF551C906eE7E658Ec73471399D9C21Fda0DF18);

    function run() external {

        /// @dev start the broadcast
        vm.startBroadcast();

        for (uint16 i = 0; i < 100; i++) {
            RaidTreasury raidTreasury = new RaidTreasury();
            console.log("RaidTreasury deployed at: ", address(raidTreasury));
            castleMap.addCastle(address(raidTreasury));
        }
        /// @dev stop the broadcast
        vm.stopBroadcast();
    }
}