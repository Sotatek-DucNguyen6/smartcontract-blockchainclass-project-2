pragma solidity ^0.8.0;
import "hardhat/console.sol";
import "./Owner.sol";

contract Blacklisting {
    mapping(uint256 => Owner) private blacklist;
    uint256 private size = 0;

    function isApper(Owner _owner) public returns (bool) {
        for (uint256 i = 0; i < size; i++) {
            if (blacklist[i].getOwner() == _owner.getOwner()) {
                return true;
            }
        }
        return false;
    }

    function addToBlackList(Owner _owner) public {
        require(isApper(_owner), "This owner already exists in BlackList");

        blacklist[size] = _owner;
        size++;
    }

    function removeFromBlacklist(Owner _owner) public {
        bool isFound = false;
        for (uint256 i = 0; i < size; i++) {
            if (isFound && (i != size - 1)) {
                Owner temp = blacklist[i + 1];
                blacklist[i] = temp;
                continue;
            }
            if ((!isFound) && blacklist[i].getOwner() == _owner.getOwner()) {
                isFound = true;
            }
        }
        require(!isFound, "This owner dosen't exist in BlackList");
        if(isFound){
            size--;
        }
    }
}
