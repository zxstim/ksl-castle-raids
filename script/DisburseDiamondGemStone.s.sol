// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { CastleMap } from "src/CastleMap.sol";
import { IGasliteDrop } from "src/IGasliteDrop.sol";
import { DiamondGemStone } from "src/DiamondGemStone.sol";

contract DisburseDiamondGemStone is Script {

    DiamondGemStone public diamondGemStone = DiamondGemStone(0x7bE02dECC3DC3BE771d851fcF457Bd9bAA99010A);
    CastleMap public castleMap = CastleMap(0x95CE14EE82410C4a7296205e0c663969703Dc857);
    IGasliteDrop public gasliteDrop = IGasliteDrop(0x61684fc62B6a0f1273f69D9Fca0E264001a61Db6);
    uint256[] public tokenIds;
    
    function run() external {
        vm.startBroadcast();    
        address[] memory castleList = castleMap.getAllGemCastles();
        diamondGemStone.setApprovalForAll(0x61684fc62B6a0f1273f69D9Fca0E264001a61Db6, true);
        uint256 counter = 9;
        for (uint256 i = counter; i < castleList.length + 9; i++) {
            tokenIds.push(i);
        }
        gasliteDrop.airdropERC721(0x7bE02dECC3DC3BE771d851fcF457Bd9bAA99010A, castleList, tokenIds);
        console.log("Disbursed all DiamondGemStone");
        vm.stopBroadcast();
    }
}