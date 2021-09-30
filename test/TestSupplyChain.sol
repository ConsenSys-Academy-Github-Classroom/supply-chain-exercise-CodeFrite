pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {

    // Test for failing conditions in this contracts:
    // https://truffleframework.com/tutorials/testing-for-throws-in-solidity-tests

    // For reference, I used this link : https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-solidity 

    // buyItem
    function testBuyItem() public {
        SupplyChain sc = SupplyChain(DeployedAddresses.SupplyChain());
        // test for failure if user does not send enough funds
        // test for purchasing an item that is not for Sale
        bool r;
        (r, ) = address(sc).call(abi.encodeWithSignature("buyItem(uint)",100));
        Assert.isFalse(r, "If this is true, something is broken!");
    }  

    // shipItem
    function shipItem() public {
        // test for calls that are made by not the seller
        // test for trying to ship an item that is not marked Sold
    }
    
    // receiveItem
    function receiveItem() public {
        // test calling the function from an address that is not the buyer
        // test calling the function on an item not marked Shipped
    }
    
}
