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

function setUser(address key, string name) {
   UserLibrary.setUser(eternalStorage, key, name);
}

}
