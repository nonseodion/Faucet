// SPDX-License-Identifier: MIT
pragma solidity ^0.4.18;

import "./Token.sol";
import "./Ownable.sol";


contract Faucet is Ownable {
    event Mint(address  owner, uint am1, uint am2);
    event Drip( address receiver);
    
    HtmlCoin public htmlCoin;
    Superfun public superfun;
    
    struct singleCooler {
        uint intialTimeToday;
        uint drips;
    }
    
    mapping(address => singleCooler) public addressCooler;
    
    uint FaucetCooler;
    
    modifier senderCooled(){
        require(addressCooler[msg.sender].intialTimeToday + 1 days <= block.timestamp
            || addressCooler[msg.sender].drips <= 2,
            "Faucet: You can only have a drip 3 times a day"
        );
        _;
    }
    
    modifier FaucetCooled(){
        require(block.timestamp >= FaucetCooler + 10 seconds, "Faucet: Faucet is cooling down");
        _;
    }
    
    constructor() public{
        htmlCoin = new HtmlCoin(address(this));
        superfun = new Superfun(address(this));
        FaucetCooler = block.timestamp - 10 seconds;
    }
    
    function drip() public FaucetCooled senderCooled {
        htmlCoin.transfer(msg.sender, 3 * 10**9);
        superfun.transfer(msg.sender, 1 * 10**9);
        updateFaucet();
        emit Drip(msg.sender);
    }
    
    function mint(uint am1, uint am2) public  onlyOwner {
        bool success1 = address(htmlCoin).call(abi.encodeWithSignature("mint(address,uint256)", address(this), am1));
        bool success2 = address(superfun).call(abi.encodeWithSignature("mint(address,uint256)", address(this), am2));
        require(success1 && success2, "Faucet: Mint was unsuccessful");
        emit Mint(msg.sender, am1, am2);
    }
    
    function updateFaucet() private {
        FaucetCooler = block.timestamp;
        if(addressCooler[msg.sender].intialTimeToday + 1 days <= block.timestamp){
            addressCooler[msg.sender] = singleCooler(block.timestamp, 1);
        }
        else{
            addressCooler[msg.sender].drips += 1; 
        }
    }
}
