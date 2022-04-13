pragma solidity 0.8.13;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//import {Blacklisting} from "./Blacklisting.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20Coin is ERC20, Ownable {
    address private treasury;
    //Blacklisting private blacklisting;
    mapping(address => bool) blacklisting;

    constructor() ERC20("ERC20Coin", "E2C") {
        _mint(msg.sender, 2000 * 10**18);
        treasury = 0x15d9f9AdcD94E0392749FEc47eaEC7E60AD327e0;
        //blacklisting = _blacklisting;
    }

    function mintToken(uint256 _amount) external onlyOwner {
        _mint(msg.sender, _amount);
    }

    function burnToken(uint256 _amount) external onlyOwner {
        _burn(msg.sender, _amount);
    }

    function _beforeTokenTransfer(
        address _from,
        address _to,
        uint256 _amount
    ) internal override {
        super._beforeTokenTransfer(_from, _to, _amount);
        //require(!blacklisting.isApper(_from), "Blacklisted User");
         require(!blacklisting[_from], "Blacklisted User");
    }

    function getTreasuryAddress() public view returns (address) {
        return treasury;
    }

    function chargeFee(address _from, uint256 _amount) internal {
        _transfer(_from, getTreasuryAddress(), _amount);
    }
     function addToBlacklists(address _address) external onlyOwner {
        blacklisting[_address] = true;
    }

    function removeFromBlacklists(address _address) external onlyOwner {
        blacklisting[_address] = false;
    }
}
