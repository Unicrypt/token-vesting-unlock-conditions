// SPDX-License-Identifier: UNLICENSED
// ALL RIGHTS RESERVED

// Presale Unlock Condition For Unicrypt Token Vesting
// Settings: Enter the presale address into the constructor.
// Result: Tokens vested using this contract as an unlock condition will be immediately withdrawable
// on presale finalization (once liquidity pool has been created and the token is tradeable)

pragma solidity ^0.8.0;

interface IUnlockCondition {
    function unlockTokens() external view returns (bool);
}

interface IPresaleContract {
    function presaleStatus () external view returns (uint256);
}

contract PresaleFinalizeCondition is IUnlockCondition {
  IPresaleContract public PRESALE_CONTRACT;
  
  constructor (IPresaleContract _presaleContract) {
    PRESALE_CONTRACT = _presaleContract;
  }
  
  // Unlock tokens when presale is finalized (Status code 4)
  function unlockTokens() override external view returns (bool) {
      return PRESALE_CONTRACT.presaleStatus() == 4;
  }
}