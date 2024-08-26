// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script } from "forge-std/Script.sol";
import { FakeKLAY } from "src/fKLAY.sol";

contract Deploy is Script {
    function run() external returns (FakeKLAY) {
        address owner = 0x6FaFF29226219756aa40CE648dbc65FB41DE5F72;
        /// @dev start the broadcast
        vm.startBroadcast();

        FakeKLAY fKLAY = new FakeKLAY(owner);

        /// @dev stop the broadcast
        vm.stopBroadcast();

        /// @dev return the Counter and DeployHelper contracts
        return (fKLAY);
    }
}