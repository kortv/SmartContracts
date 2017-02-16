pragma solidity ^0.4.8;

import "./Shareable.sol";

contract Managed is Shareable {

  mapping (bytes32 => Transaction) txs;

  struct Transaction {
    address to;
    bytes data;
  }

  function Managed() {
  }

  //function getTxsType(bytes32 _hash) returns (uint) {
  //  return uint(txs[_hash].op);
 // }

  function setRequired(uint _required) execute() {
    if(_required > 1) {
      required = _required; 
    }
  }

  modifier onlyAuthorized() {
      if (isAuthorized(msg.sender)) {
          _;
      }
  }

  modifier execute() {
   if (required > 1) {
   if (this != msg.sender) {
      bytes32 _r = sha3(msg.data,"signature");
      txs[_r].data = msg.data;
     // txs[_r].op = _type;
      txs[_r].to = this;
      confirm(_r);
    } 
    else {
     _;
    }
  }
  else {
     _;
  }
 }

  function confirm(bytes32 _h) onlymanyowners(_h) returns (bool) {
     if (txs[_h].to != 0) {
      if(!txs[_h].to.call(txs[_h].data)) {
        throw;
      }
      delete txs[_h];
      return true;
      }
  }
  
  function isAuthorized(address key) returns(bool) {
      if(ownerIndex[uint(key)] != uint(0x0) || this == key) {
        return true;
      }
      return false;
  } 
 
}
