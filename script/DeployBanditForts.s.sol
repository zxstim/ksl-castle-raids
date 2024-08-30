// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { BanditFort } from "src/BanditFort.sol";
import { CastleMap } from "src/CastleMap.sol";

contract Deploy is Script {
    CastleMap public castleMap = CastleMap(0x95CE14EE82410C4a7296205e0c663969703Dc857);

    function run() external {
        
        /// @dev start the broadcast
        vm.startBroadcast();
        for (uint16 i = 0; i < 10; i++) {
            BanditFort banditFort = new BanditFort();
            console.log("RaidTreasury deployed at: ", address(banditFort));
            castleMap.addBanditFort(address(banditFort));
        }
        /// @dev stop the broadcast
        vm.stopBroadcast();
    }
}