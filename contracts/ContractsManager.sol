pragma solidity ^0.4.8;

import "./Configurable.sol";
import "./SharedLibrary.sol";
import "./ContractsLibrary.sol";
import "./ERC20Interface.sol";
import "./ExchangeInterface.sol";
import "./ChronoBankPlatformInterface.sol";
import "./Owned.sol";

contract ContractsManager is Configurable {

function ContractsManager(address _es) {
    if(_es == 0x0) throw;
    eternalStorage = _es; 
}

function addContract(uint _type, address addr) {

}

function removeContract(uint _id) {

}

function getContract(uint _id) returns(address) {

}

function getTokenContract(string _symbol) returns(address) {

}

function getPlatformContract() returns(address) {


}

function getContacts(uint _type) returns(address[]) { 

}

  function claimContractOwnership(address _addr, string _type) onlyAuthorized() returns(bool) {
     if(Owned(_addr).claimContractOwnership()) {
       return true;
     }
     return false;
  }

  function setExchangePrices(uint _id, uint _buyPrice, uint _sellPrice) onlyAuthorized() returns(bool) {
     return ExchangeInterface(getContract(_id)).setPrices(_buyPrice, _sellPrice);
  }

  function reissueAsset(bytes32 _symbol, uint _value) onlyAuthorized() returns(bool) {
        return ChronoBankPlatformInterface(getPlatformContract()).reissueAsset(_symbol, _value);
  }

  function sendAsset(string _symbol, address _to, uint _value) onlyAuthorized() returns(bool) {
     return ERC20Interface(getTokenContract(_symbol)).transfer(_to,_value);
  }

  //function getBalance(uint _id) constant returns(uint) {
  //    return ERC20Interface(contracts[_name]).balanceOf(this);
  //}

}
