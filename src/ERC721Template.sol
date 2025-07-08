// ERC721Template.sol
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ERC721Template is ERC721 {
    uint256 public nextTokenId;

    constructor() ERC721("NFTName", "NFTSymbol") {}

    function mint(address to) external {
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }
}
