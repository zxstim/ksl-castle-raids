// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { DiamondGemStone } from "src/DiamondGemStone.sol";

contract DisburseFKLAY is Script {

    DiamondGemStone public diamondGemStone = DiamondGemStone(0x7bE02dECC3DC3BE771d851fcF457Bd9bAA99010A);

    
    function run() external {
        vm.startBroadcast();    
        
        for (uint256 i = 0; i < 20; i++) {
            diamondGemStone.mint();
        }
        vm.stopBroadcast();
    }
}