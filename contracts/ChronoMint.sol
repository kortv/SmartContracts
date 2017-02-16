pragma solidity ^0.4.8;

import "./UserLibrary.sol";
import "./LOCLibrary.sol";
import "./ContractsLibrary.sol";

contract ChronoMint {
  address public eternalStorage;

  function ChronoMint(address _eS) {
    eternalStorage = _eS;
  }

  function getUsers(address[] addresses) constant returns(uint[]) {
        return UserLibrary.getUserIds(eternalStorage, addresses);
  }

  function getLOCs(bytes32[] hashes) constant returns(uint[]) {
        return LOCLibrary.getLOCIds(eternalStorage, hashes);
  }
 
  function getTokenContracts(address[] addresses) constant returns(uint[]) {
      //  return ContractsLibrary.getTokenContractsIds(eternalStorage, addresses);
  }

  function getOtherContracts(address[] addresses) constant returns(uint[]) {
   //     return ContractsLibrary.getOtherContractsIds(eternalStorage, addresses);
  }

  function()
  {
    throw;
  }
}

