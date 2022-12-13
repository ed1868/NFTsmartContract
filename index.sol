pragma solidity ^0.6.0;

contract NFTMarketplace {
  // define the structure of an NFT
  struct NFT {
    uint256 id;
    string name;
    string metadata;
    address owner;
  }

  // mapping of NFTs to their owners
  mapping(uint256 => NFT) public nfts;

  // create a new NFT
  function createNFT(uint256 _id, string memory _name, string memory _metadata) public {
    nfts[_id] = NFT(_id, _name, _metadata, msg.sender);
  }

  // transfer an NFT to a new owner
  function transferNFT(uint256 _id, address _to) public {
    require(nfts[_id].owner == msg.sender, "Only the owner can transfer an NFT");
    nfts[_id].owner = _to;
  }
}
