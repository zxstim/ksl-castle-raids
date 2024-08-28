// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script } from "forge-std/Script.sol";
import { Factory } from "src/Factory.sol";

contract Deploy is Script {
    function run() external returns (Factory) {
        /// @dev start the broadcast
        vm.startBroadcast();

        Factory factory = new Factory();

        /// @dev stop the broadcast
        vm.stopBroadcast();

        /// @dev return the Counter and DeployHelper contracts
        return (factory);
    }
}