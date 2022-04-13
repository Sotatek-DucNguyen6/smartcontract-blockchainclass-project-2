// pragma solidity 0.8.13;
// import "hardhat/console.sol";

// contract Blacklisting {
//     mapping(uint256 => address) private blacklist;
//     uint256 private size = 0;

//     function isApper(address _owner) public view returns (bool) {
//         for (uint256 i = 0; i < size; i++) {
//             if (blacklist[i] == _owner) {
//                 return true;
//             }
//         }
//         return false;
//     }

//     function addToBlackList(address _owner) public {
//         require(isApper(_owner), "This owner already exists in BlackList");

//         blacklist[size] = _owner;
//         size++;
//     }

//     function removeFromBlacklist(address _owner) public {
//         bool isFound = false;
//         for (uint256 i = 0; i < size; i++) {
//             if (isFound && (i != size - 1)) {
//                 address temp = blacklist[i + 1];
//                 blacklist[i] = temp;
//                 continue;
//             }
//             if ((!isFound) && blacklist[i] == _owner) {
//                 isFound = true;
//             }
//         }
//         require(!isFound, "This owner dosen't exist in BlackList");
//         if (isFound) {
//             size--;
//         }
//     }
// }
