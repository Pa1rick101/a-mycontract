// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Import necessary contracts from OpenZeppelin library
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// Define the contract MyCar which inherits from ERC721, ERC721URIStorage, Pausable, and Ownable contracts
contract MyCar is ERC721, ERC721URIStorage, Pausable, Ownable {
    // Use the Counters library for generating unique tokenIds
    using Counters for Counters.Counter;

    // Private variable for tracking tokenIds
    Counters.Counter private _tokenIdCounter;

    // Constructor for MyCar contract
    constructor() ERC721("MyCar", "CAR") {}

    // Function for pausing the contract, accessible only by the owner
    function pause() public onlyOwner {
        _pause();
    }

    // Function for unpausing the contract, accessible only by the owner
    function unpause() public onlyOwner {
        _unpause();
    }

    // Function for minting a new token, accessible only by the owner
    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // Function to be called before transferring a token
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId,
        uint256 batchSize
    ) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    // The following functions are overrides required by Solidity.

    // Function for burning a token
    function _burn(
        uint256 tokenId
    ) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    // Function for getting the token URI
    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }
}
