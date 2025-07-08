// ERC721Template.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {ERC721Template} from "../src/ERC721Template.sol";

contract DeployERC721Template is Script {
    ERC721Template public token;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        token = new ERC721Template();

        vm.stopBroadcast();
    }
}
