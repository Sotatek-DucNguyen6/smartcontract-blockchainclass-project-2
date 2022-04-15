pragma solidity 0.8.13;
import "hardhat/console.sol";
import "../library/Convert.sol";

contract Blacklisting {
    mapping(uint256 => address) private blacklist;
    uint256 private size = 0;
    Convert convert = new Convert();

    function isApper(string memory treasury) public view returns (bool) {
        address _treasury = convert.toAddress(treasury);
        for (uint256 i = 0; i < size; i++) {
            if (blacklist[i] == _treasury) {
                return true;
            }
        }
        return false;
    }

    function addToBlackList(string memory treasury) public {
        address _treasury = convert.toAddress(treasury);
        require(isApper(treasury), "This treasury already exists in BlackList");

        blacklist[size] = _treasury;
        size++;
    }

    function removeFromBlacklist(address _treasury) public {
        bool isFound = false;
        for (uint256 i = 0; i < size; i++) {
            if (isFound && (i != size - 1)) {
                address temp = blacklist[i + 1];
                blacklist[i] = temp;
                continue;
            }
            if ((!isFound) && blacklist[i] == _treasury) {
                isFound = true;
            }
        }
        require(!isFound, "This treasury dosen't exist in BlackList");
        if (isFound) {
            size--;
        }
    }
}
