//SPDX-License-Identifier:MIT
pragma solidity ^0.8.10;

contract TroyToken {

    // talk about events here needed
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    // Fields
    string public constant name = "Troy Token";
    string public constant symbol = "TCM";
    uint public constant decimal = 18;

    // MAPPING  { key:value }
    // address: 100000 PRC
    mapping(address => uint256) balances;
    // Map
    // { 0x0: {0x1(some one else}: 100 TCM} }
    mapping(address => mapping (address => uint)) allowedTransactions;


    // Supply
    uint _totalSupply;

    constructor(uint inputSupply) {
        _totalSupply = inputSupply;
        // msg.sender => your metamask address
        balances[msg.sender] = _totalSupply;

    } 

    // ERC-20 Standard Functions
    
    // First required function
    function totalSupply() public view returns(uint) {
        return _totalSupply;
    }

    // Second required function
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }


    function transfer(address receiver, uint amount) public returns(bool) {
        // strictly say if we have enough tokens to send
        // Sending tokens from my address to yours
        require(amount <= balances[msg.sender], 'Insufficient Funds');
        // remove the number tokens from balances we are going to send
        balances[msg.sender] -= amount;
        // send the number of tokens to the other user
        balances[receiver] += amount;
        // Here is where our event function is emitted, we are calling
        // Helps s verify the transaction
        emit Transfer(msg.sender, receiver, amount);
        return true;
    }


    function approve(address receiver, uint amount) public returns(bool) {
        // Populate allowed Transactions
        allowedTransactions[msg.sender][receiver] = amount;
        // Emit our approval
        emit Approval(msg.sender, receiver, amount);
        return true;
    }


    function viewAllowedTransactions(address owner, address  otherAccount) public view returns(uint) {
        return allowedTransactions[owner][otherAccount];
    }


    function transferFrom(address owner, address otherAccount, uint amount) public returns(bool) {
        // Set a check using required
        require(amount <= balances[owner], 'Insufficient Funds');
        // we want to do another,
        // Allowed
        require(amount <= allowedTransactions[owner][otherAccount], 'You are not allowed to send this account');
        balances[owner] -= amount;
        // Send money from account to account
        allowedTransactions[owner][msg.sender] -= amount;
        balances[otherAccount] += amount;
        emit Transfer(owner, otherAccount, amount);
        return true;
    }
}
