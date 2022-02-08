// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract storeToken {
    
    // store name
    string public name = "La Store";

    // store profit
    uint public profit = 100;

    // variable used in Modulus function
    // dunno why solidity didn't want me using local variables
    uint public extra = 0;

    // buy function - increment your profit
    function buy() public {
        profit += 8;
    }

    // refund function - decrement your profit
    function refund() public {
        profit -= 8;
    }

    // seeProfit function - show the profit
    // return{number} - total profit of store. 
    function seeProfit() public view returns (uint) {
        return profit;
    }

    // multipleBuyers function - multiply profit increment by buyers
    // userInput{number} - the number of people buying
    function multipleBuyers(uint userInput) public {
        profit += 8*userInput;
    }

    function discountPurchase() public {
        profit += 8/2;
    }

    function extraProfit() public returns (uint) {
        extra = profit%3;
        return extra;
    }

}
