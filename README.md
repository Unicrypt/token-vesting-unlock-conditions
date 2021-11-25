# Premature unlocking conditions

This repo contains convenient premature unlocking conditions to be used with Unicrypt token vesting.

The PresaleFinalizeCondition.sol contract allows unlocking tokens immediately once the specified presale finalises, while the ConditionLight.sol contract has been coded for low gas deployment and can be used as a manual trigger, whereby the owner of the contract can update the setState() method to unlock tokens.