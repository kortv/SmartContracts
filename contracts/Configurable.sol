pragma solidity ^0.4.8;

import "./UserLibrary.sol";
import "./Managed.sol";

contract Configurable is Managed {
  address public eternalStorage;

    function getSenderUserId() returns(uint) {
        return UserLibrary.getUserId(eternalStorage, msg.sender);
    }

    function getConfig(bytes32 key) constant returns(uint) {
        return EternalStorage(eternalStorage).getUIntValue(sha3("config/", key));
    }
}
