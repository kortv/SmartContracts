pragma solidity ^0.4.8;

import "./Configurable.sol";
import "./SharedLibrary.sol";

contract UserManager is Configurable {

function UserManager(address _es) {
    if(_es == 0x0) throw;
    eternalStorage = _es;
}

event userAdded(uint userId);
event userUpdated(uint userId);
event userRemoved(uint userId);

function setUser(address key, string name) returns (uint) {
   return UserLibrary.setUser(eternalStorage, key, name);
}

function getUser(uint _id) returns (address result, string result2) {
   result = UserLibrary.getUserAddress(eternalStorage, _id);
   result2 = UserLibrary.getUserName(eternalStorage, _id);
   return (result,result2);
} 

}
