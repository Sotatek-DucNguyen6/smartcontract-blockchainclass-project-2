pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract Owner {

    address private owner;
    
    function getOwner() external view returns (address) {
        return owner;
    }
}