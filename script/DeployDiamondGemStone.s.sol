// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script } from "forge-std/Script.sol";
import { DiamondGemStone } from "src/DiamondGemStone.sol";

contract Deploy is Script {
    function run() external returns (DiamondGemStone) {
        address owner = 0x6FaFF29226219756aa40CE648dbc65FB41DE5F72;
        /// @dev start the broadcast
        vm.startBroadcast();

        DiamondGemStone diamondGemStone = new DiamondGemStone(owner);

        /// @dev stop the broadcast
        vm.stopBroadcast();

        /// @dev return the Counter and DeployHelper contracts
        return (diamondGemStone);
    }
}