
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { DiamondGemStone } from "src/DiamondGemStone.sol";

contract Vault {
    error WrongPassword();
    error VaultIsLocked();
    DiamondGemStone diamondGemStone = DiamondGemStone(0x7bE02dECC3DC3BE771d851fcF457Bd9bAA99010A);

    bool public locked;
    bytes32 private password;

    constructor(bytes32 _password) {
        locked = true;
        password = _password;
    }

    function unlock(bytes32 _password) public {
        if (password == _password) {
            locked = false;
        } else {
            revert WrongPassword();
        }
    }

    function takeDiamondGemStone() public {
        if (locked == true) {
            revert VaultIsLocked();
        }
        diamondGemStone.transferFrom(address(this), msg.sender, diamondGemStone.tokenOfOwnerByIndex(address(this), 0));
    }
}