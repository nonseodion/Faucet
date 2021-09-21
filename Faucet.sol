// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Superfun is ERC20 {
    address public faucet;
    modifier onlyFaucet(){
        require(msg.sender == faucet, "Superfun: Only owner can call");
        _;
    }
    
    constructor(address _faucet) ERC20("Superfun", "SFUN") {
        faucet = _faucet;
    }
    
    function mint(address to, uint256 amount) public onlyFaucet {
        _mint(to, amount);
    }
}

contract HtmlCoin is ERC20 {
    address public faucet;
    modifier onlyFaucet(){
        require(msg.sender == faucet, "HtmlCoin: Only owner can call");
        _;
    }
    
    constructor(address _faucet) ERC20("HtmlCoin", "HTML") {
        faucet = _faucet;
    }
    
    function mint(address to, uint256 amount) public onlyFaucet {
        _mint(to, amount);
    }
}

contract Faucet is Ownable {
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
    
    constructor(){
        htmlCoin = new HtmlCoin(address(this));
        superfun = new Superfun(address(this));
        FaucetCooler = block.timestamp - 10 seconds;
    }
    
    function drip() public FaucetCooled senderCooled {
        htmlCoin.transfer(msg.sender, 3 * 10**18);
        superfun.transfer(msg.sender, 1 * 10**18);
        updateFaucet();
    }
    
    function mint(uint am1, uint am2) public  onlyOwner {
        (bool success1, ) = address(htmlCoin).call(abi.encodeWithSignature("mint(address,uint256)", address(this), am1));
        (bool success2, ) = address(superfun).call(abi.encodeWithSignature("mint(address,uint256)", address(this), am2));
        require(success1 && success2, "Faucet: Mint was unsuccessful");
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
