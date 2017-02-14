pragma solidity ^0.4.8;

import "./Configurable.sol";
import "./SharedLibrary.sol";

contract UserManager is Configurable {

event userAdded(uint userId);
event userUpdated(uint userId);
event userRemoved(uint userId);

function setUser(address key, string name) {

   UserLibrary.setUser(eternalStorage, key, name);
}

}
