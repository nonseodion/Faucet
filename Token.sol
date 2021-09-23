pragma solidity ^0.4.18;
import './SafeMath.sol';


/**
    QRC20Token Standard Token implementation
*/
contract HRC20 is SafeMath {
    string public constant standard = 'Token 0.1';
    uint8 public constant decimals = 8; // it's recommended to set decimals to 8 in QTUM

    // you need change the following three values
    string public name;
    string public symbol;
    //Default assumes totalSupply can't be over max (2^256 - 1).
    //you need multiply 10^decimals by your real total supply.
    uint256 public totalSupply = 10**5 * 10**uint256(decimals);

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    function HRC20(string _name, string _symbol) public {
        balanceOf[msg.sender] = totalSupply;
        name = _name;
        symbol = _symbol;
    }

    // validates an address - currently only checks that it isn't null
    modifier validAddress(address _address) {
        require(_address != 0x0);
        _;
    }

    function transfer(address _to, uint256 _value)
    public
    validAddress(_to)
    returns (bool success)
    {
        balanceOf[msg.sender] = safeSub(balanceOf[msg.sender], _value);
        balanceOf[_to] = safeAdd(balanceOf[_to], _value);
        Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value)
    public
    validAddress(_from)
    validAddress(_to)
    returns (bool success)
    {
        allowance[_from][msg.sender] = safeSub(allowance[_from][msg.sender], _value);
        balanceOf[_from] = safeSub(balanceOf[_from], _value);
        balanceOf[_to] = safeAdd(balanceOf[_to], _value);
        Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value)
    public
    validAddress(_spender)
    returns (bool success)
    {
        // To change the approve amount you first have to reduce the addresses`
        //  allowance to zero by calling `approve(_spender, 0)` if it is not
        //  already 0 to mitigate the race condition described here:
        //  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
        require(_value == 0 || allowance[msg.sender][_spender] == 0);
        allowance[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "HRC20: mint to the zero address");
        totalSupply += amount;
        balanceOf[account] += amount;
        emit Transfer(address(0), account, amount);
    }

    // disable pay QTUM to this contract
    function () public payable {
        revert();
    }
}

contract Superfun is HRC20 {
    address public faucet;
    modifier onlyFaucet(){
        require(msg.sender == faucet, "Superfun: Only owner can call");
        _;
    }
    
    constructor(address _faucet) HRC20("Superfun", "SFUN") public{
        faucet = _faucet;
    }
    
    function mint(address to, uint256 amount) public onlyFaucet {
        _mint(to, amount);
    }
}

contract HtmlCoin is HRC20 {
    address public faucet;
    modifier onlyFaucet(){
        require(msg.sender == faucet, "HtmlCoin: Only owner can call");
        _;
    }
    
    constructor(address _faucet) HRC20("HtmlCoin", "HTML") public{
        faucet = _faucet;
    }
    
    function mint(address to, uint256 amount) public onlyFaucet {
        _mint(to, amount);
    }
}
