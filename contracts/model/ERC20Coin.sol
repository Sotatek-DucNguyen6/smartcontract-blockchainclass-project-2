pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Owner} from "./Owner.sol";
import {Blacklisting} from "./Blacklisting.sol";

contract ERC20Coin {
    Owner private owner ;
    Blacklisting private blacklisting ;

    constructor(Owner _owner, Blacklisting _blacklisting) {
        owner = _owner;
        blacklisting = _blacklisting;
    }

    function CanRequire(Owner _owner) private returns (bool) {
        return _owner.getOwner() == owner.getOwner();
    }

    function CanTransfer(Owner _owner) private returns (bool) {
        if (!CanRequire(_owner)) return false;
        if(blacklisting.isApper(_owner)) return false;
        return true;
    }

    function mint() public {}

    function burn() public {}
}
