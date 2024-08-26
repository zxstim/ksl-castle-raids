// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script } from "forge-std/Script.sol";
import { CastleMap } from "src/CastleMap.sol";

contract Deploy is Script {
    function run() external returns (CastleMap) {
        address owner = 0x6FaFF29226219756aa40CE648dbc65FB41DE5F72;
        /// @dev start the broadcast
        vm.startBroadcast();

        CastleMap castleMap = new CastleMap(owner);

        /// @dev stop the broadcast
        vm.stopBroadcast();

        /// @dev return the Counter and DeployHelper contracts
        return (castleMap);
    }
}