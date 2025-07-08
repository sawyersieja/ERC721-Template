// ERC721Template.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Remember to do 'forge remappings > remappings.txt'
// @openzeppelin/contracts/=lib/openzeppelin-contracts/contracts/
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC721Template is ERC721, Ownable {
    // Documentation for the ERC721, its functions, interfaces, and abstractions.
    // https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol

    // State variable stored on-chain in contract storage
    uint256 public nextTokenId;

    // Constructor needs to call ERC721 and pass in a name value, and a symbol value to use the ERC721 constructor.
    constructor() ERC721("ERC721Name", "ERC721Symbol") Ownable(msg.sender) {}

    //External means this function can only be called outside the contract by users/other contracts
    function mint(address to) external onlyOwner {
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }
}
