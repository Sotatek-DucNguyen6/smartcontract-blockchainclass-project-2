pragma solidity 0.8.13;
import "hardhat/console.sol";
import "../library/Convert.sol";

contract Treasury {
    address private treasury;
    Convert convert = new Convert();

    constructor(string memory _treasury) {
        treasury = convert.toAddress(_treasury);
    }

    function getTreasury() public view returns (address) {
        return treasury;
    }
}
