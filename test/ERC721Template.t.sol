// ERC721Template.t.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {ERC721Template} from "../src/ERC721Template.sol";

contract ERC721TemplateTest is Test {
    ERC721Template public token;

    function setUp() public {
        token = new ERC721Template();
    }
}
