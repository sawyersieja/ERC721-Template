# ERC721 Template (Foundry + OpenZeppelin)

This repository contains a clean, minimal ERC721 token contract using Foundry and OpenZeppelin. It's designed as a reusable scaffold to quickly spin up new NFT projects with minimal boilerplate. This is a barebones ERC721 implementation that I encourage other developers to expand on and customize for their preferences. The goal of this repo is to reduce the amount of time required to begin the process of creating an ERC721 for my future projects, as well as anyone else that wants to clone this repo.

---

## What This Repo Does

* Deploys an ERC721 (NFT) smart contract
* Mints sequentially numbered NFTs to any address
* Provides an extendable structure for future features

---

## How to Use It

### 1. Clone the Repo

```bash
git clone https://github.com/your-username/ERC721-Template.git
cd ERC721-Template
```

### 2. Install Dependencies

```bash
forge install
```

### 3. Build the Project

```bash
forge build
```

### 4. (Optional) Generate Remappings

```bash
forge remappings > remappings.txt
```

### 5. Import Private Key Securely

Use `cast wallet` instead of `.env`:

```bash
cast wallet import defaultKey --interactive
```

This will prompt you for the private key and encrypt it under the name `defaultKey`.

### 6. Deploy the Contract

Replace `0xYourAddress` with your actual wallet address:

```bash
forge script script/ERC721Template.s.sol:DeployERC721Template \
  --rpc-url https://ethereum-sepolia-rpc.publicnode.com \
  --account defaultKey \
  --sender 0xYourAddress \
  --broadcast -vvvv
```

---

## How It Works

### `src/ERC721Template.sol`

```solidity
contract ERC721Template is ERC721 {
    uint256 public nextTokenId;

    constructor() ERC721("ERC721Name", "ERC721Symbol") Ownable(msg.sender) {}

    function mint(address to) external onlyOwner {
        _safeMint(to, nextTokenId);
        nextTokenId++;
    }
}
```

* The contract uses OpenZeppelin's secure ERC721 implementation
* Each mint call issues an NFT with a new unique ID
* `mint()` is restricted to the contract owner using onlyOwner (access control enforced via OpenZeppelin's Ownable)
* This means only the person who deployed the contract can mint an NFT and decide which address to send it to

---

## Tech Stack

| Tool                                                                             | Purpose                                            |
| -------------------------------------------------------------------------------- | ----------------------------------------           |
| [Foundry](https://book.getfoundry.sh/)                                           | Smart contract dev/test/deploy toolchain           |
| [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts) | Secure contract libraries                          |
| [forge](https://getfoundry.sh/forge/overview/)                                   | Tests, builds, and deploys your smart contracts    |
| [cast](https://book.getfoundry.sh/reference/cast/cast.html)                      | Interact with on-chain contracts                   |
| [Sepolia Testnet](https://sepolia.etherscan.io/)                                 | Ethereum testnet for contract testing              |

---

## Project Structure

```
ERC721-Template/
├── lib/                    # External dependencies (OpenZeppelin, forge-std)
├── src/                   # ERC721 contract source
├── script/                # Deployment scripts
├── test/                  # Optional test files
├── foundry.toml           # Foundry project settings
├── remappings.txt         # (Optional) import aliases
├── .gitignore             # Ignore sensitive and build files
└── README.md
```

---

## Interact with Deployed Contract

### Mint an NFT to an Address

```bash
cast send 0xYourContractAddress "mint(address)" 0xRecipientAddress \
  --account defaultKey \
  --rpc-url https://ethereum-sepolia-rpc.publicnode.com
```

### View Next Token ID

```bash
cast call 0xYourContractAddress "nextTokenId()(uint256)" \
  --rpc-url https://ethereum-sepolia-rpc.publicnode.com
```

---

## ⚠️ Security & Best Practices

* Never commit private keys or use `.env` files in production
* Use `cast wallet` for secure key storage
* Modify `mint()` with `onlyOwner` or other access control as needed
* Use testnets like Sepolia before mainnet deployment

---

## Author

Created by [Sawyer Sieja](https://github.com/sawyersieja). Feel free to fork and build on it!