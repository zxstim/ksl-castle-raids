// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


/// @title DiamondGemStone contract for KSL Castle Raids
/// @author zxstim
/// @notice You can use this contract for only the most basic simulation
/// @dev All function calls are currently implemented without side effects
contract DiamondGemStone is ERC721, ERC721Enumerable, Ownable {

    error InvalidTokenId(uint256 tokenId);

    uint256 private counter;

    /// @notice Constructor to create a DiamondGemStone
    /// @param initialOwner the initial owner of the contract
    constructor(
        address initialOwner
    ) ERC721("DiamondGemStone", "GEM") Ownable(initialOwner) 
    {}
    

    /// @notice Mint function to mint buildstation DiamondGemStone NFT
    function mint() public onlyOwner {
        counter++;
        _safeMint(msg.sender, counter);
    }

    /// @notice internal pure function set the base URI
    /// @return BaseURI which is a string
    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    /// @notice function to set the token URI
    /// @param _tokenId the token id which is set by the counter
    /// @return TokenURI which is a base64 string with the SVG image encoded as a base64 string
    function tokenURI(
        uint _tokenId
    ) public view override returns (string memory) {
        if (_tokenId > counter) {
            revert InvalidTokenId(_tokenId);
        }

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "DiamondGemStone #',
                        Strings.toString(_tokenId),
                        '", "description": "Diamond Gem Stone of the Bandits during KSL Castle Raids", "image": "data:image/SVG+xml;base64,',
                        Base64.encode(
                            bytes(
                                string(
                                    abi.encodePacked(
                                        '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="500" zoomAndPan="magnify" viewBox="0 0 375 374.999991" height="500" preserveAspectRatio="xMidYMid meet" version="1.0"><defs><clipPath id="99e4b6e104"><path d="M 77.210938 93.453125 L 297.710938 93.453125 L 297.710938 281.703125 L 77.210938 281.703125 Z M 77.210938 93.453125 " clip-rule="nonzero"/></clipPath></defs><rect x="-37.5" width="450" fill="#ffffff" y="-37.499999" height="449.999989" fill-opacity="1"/><rect x="-37.5" width="450" fill="#7eda6c" y="-37.499999" height="449.999989" fill-opacity="1"/><path fill="#ffffff" d="M 296.121094 151.195312 L 187.460938 279.636719 L 78.796875 151.195312 L 127.261719 94.855469 L 247.65625 94.855469 Z M 296.121094 151.195312 " fill-opacity="1" fill-rule="nonzero"/><g clip-path="url(#99e4b6e104)"><path fill="#000000" d="M 248.183594 93.621094 L 126.734375 93.621094 L 77.210938 151.195312 L 187.460938 281.535156 L 297.046875 151.992188 L 297.710938 151.195312 Z M 248.847656 98.125 L 293.433594 149.960938 L 248.847656 149.960938 Z M 246.421875 96.050781 L 246.421875 148.414062 L 189.839844 96.050781 Z M 244.523438 150.003906 L 130.394531 150.003906 L 187.460938 97.195312 Z M 128.496094 96.050781 L 185.078125 96.050781 L 128.496094 148.414062 Z M 126.070312 98.125 L 126.070312 149.960938 L 81.488281 149.960938 Z M 81.441406 152.433594 L 126.511719 152.433594 L 182.476562 271.820312 Z M 129.203125 152.433594 L 245.714844 152.433594 L 187.460938 276.765625 Z M 192.488281 271.820312 L 248.449219 152.433594 L 293.519531 152.433594 Z M 192.488281 271.820312 " fill-opacity="1" fill-rule="nonzero"/></g></svg>'
                                    )
                                )
                            )
                        ),
                        '", "attributes": [{"trait_type": "Category", "value": "Prize"}, {"trait_type": "Chain", "value": "Kaia Kairos"}]}'
                    )
                )
            )
        );
        return string(abi.encodePacked(_baseURI(), json));
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    /// @notice function to get the counter
    /// @return counter which can be set as tokenId
    function getCounter() public view returns (uint256) {
        return counter;
    }

}
