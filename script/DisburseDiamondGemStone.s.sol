// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Script, console } from "forge-std/Script.sol";
import { CastleMap } from "src/CastleMap.sol";
import { IGasliteDrop } from "src/IGasliteDrop.sol";
import { DiamondGemStone } from "src/DiamondGemStone.sol";

contract DisburseFKLAY is Script {

    DiamondGemStone public diamondGemStone = DiamondGemStone(0x7bE02dECC3DC3BE771d851fcF457Bd9bAA99010A);
    CastleMap public castleMap = CastleMap(0x6EF551C906eE7E658Ec73471399D9C21Fda0DF18);
    IGasliteDrop public gasliteDrop = IGasliteDrop(0x61684fc62B6a0f1273f69D9Fca0E264001a61Db6);

    
    function run() external {
        vm.startBroadcast();    
        address[] memory castleList = castleMap.getAllCastles();
        diamondGemStone.setApprovalForAll(0x61684fc62B6a0f1273f69D9Fca0E264001a61Db6, true);
        uint256[] memory tokenIds = new uint256[](castleList.length);
        uint256 counter = 1;
        for (uint256 i = 0; i < tokenIds.length; i++) {
            tokenIds[i] = counter;
            counter++;
        }
        gasliteDrop.airdropERC721(0x7bE02dECC3DC3BE771d851fcF457Bd9bAA99010A, castleList, tokenIds);
        console.log("Disbursed all DiamondGemStone");
        vm.stopBroadcast();
    }
}