pragma solidity 0.8.13;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Treasury} from "./Treasury.sol";
import {Blacklisting} from "./Blacklisting.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "../library/Convert.sol";

contract ERC20Coin is ERC20 {
    Treasury private treasury;
    Blacklisting private blacklisting;
    Convert convert = new Convert();

    constructor(string memory _treasury, string memory _blacklisting)
        ERC20("ERC20Coin", "E2C")
    {
        console.log(convert.toAddress(_treasury));
        treasury = Treasury(convert.toAddress(_treasury));
        console.log(convert.toAddress(_blacklisting));
        blacklisting = Blacklisting(convert.toAddress(_blacklisting));
        _mint(msg.sender, 2000 * 10**18);
    }

    function mintToken(uint256 _amount) external {
        _mint(msg.sender, _amount);
    }

    function burnToken(uint256 _amount) external {
        _burn(msg.sender, _amount);
    }

    function _beforeTokenTransfer(
        address _from,
        address _to,
        uint256 _amount
    ) internal override {
        super._beforeTokenTransfer(_from, _to, _amount);
        require(
            !blacklisting.isApper(convert.toAsciiString(_from)),
            "Blacklisted User"
        );
    }
}
