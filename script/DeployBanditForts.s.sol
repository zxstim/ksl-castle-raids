// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { BanditFort } from "src/BanditFort.sol";

contract Deploy is Script {
    function run() external {

        /// @dev start the broadcast
        vm.startBroadcast();
        for (uint16 i = 0; i < 3; i++) {
            BanditFort banditFort = new BanditFort();
            console.log("RaidTreasury deployed at: ", address(banditFort));
        }
        /// @dev stop the broadcast
        vm.stopBroadcast();
    }
}