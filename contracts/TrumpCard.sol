pragma solidity >=0.4.21 <0.6.0;


import "./ownable.sol";
import "./erc721.sol";
import "./safemath.sol";

contract TrumpCard is ERC721,Ownable {
    
    using SafeMath for uint256;
        
    struct TrumpCardStruct{
        string nameId;
        uint defence;     //defence of card
        uint attack;      //attack of card
        address payable owner;    //Owner of card
        uint price;       // price of Card in ether
    }
        
    uint private count = 0;
        
    TrumpCardStruct public trumpCard;
    mapping(uint => address) CardApproval;


        //only one Card to be owned 
    function mintToken() public onlyOwner{
        require(count < 1,"Only one Card issued");
        trumpCard.nameId = "John Cena";
        trumpCard.defence = 95;
        trumpCard.attack = 97;
        trumpCard.owner = msg.sender;
        trumpCard.price = 3;
        count = count.add(1);
    }
        
        
        //function to sell card
    function buyTrumpcard() public payable {
        require(msg.value == trumpCard.price * 10**18,"Enter a larger value");
        trumpCard.owner = msg.sender;
    }
        
    function setTajmahalPrice(uint _prc) public {
        require(msg.sender == trumpCard.owner,"You are not the owner");
        trumpCard.price = _prc;
    } 
        
    function withdraw() external onlyOwner {
        trumpCard.owner.transfer(address(this).balance);
    }
    
    function balanceOf(address _owner) public view returns (uint256 _balance){
        return 1;
    }
    
    function ownerOf(uint256 _tokenId) public view returns (address _owner){
        return trumpCard.owner;
    }
    
    function transfer(address payable _to, uint256 _tokenId) public{
        require(msg.sender == trumpCard.owner,"You are not the owner");
        trumpCard.owner = _to;
        emit Transfer(msg.sender,_to,_tokenId);
    }
    
    //no implementation added 
    function approve(address _to, uint256 _tokenId) public{ 
    }
    
    //no implementation added
    function takeOwnership(uint256 _tokenId) public {
    }
        

    
}