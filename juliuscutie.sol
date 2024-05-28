// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";
// Compatible with OpenZeppelin Contracts ^5.0.0
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";

contract Degen is ERC20, Ownable {
/* An array to store the IDs of items.*/
    uint256[] internal itemIds;

    /*A mapping from item ID to a struct Value.*/
    mapping(uint256 => Value) public items;

    struct Value {
        string daphcute;
        uint256 spend;
    }

    constructor(address daphcutie)
        ERC20("Degen", "DGN")
        Ownable(daphcutie){    
        _mint (msg.sender, 777);}

/* Allows the owner to create a new item by providing a name and cost. */
    function createItem(string memory _name, uint256 _cost) external onlyOwner {
        Value memory newItem = Value({daphcute: _name, spend: _cost});
        items[itemIds.length] = newItem;

        itemIds.push(itemIds.length);
    }

/* Allows to create a token */
    function mint(uint256 balance) public onlyOwner {
        _mint(msg.sender, balance);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

/* allows to burn token */
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }  

     function Burn(address from, uint256 _token) public {
    _burn(from, _token);
}

/* Allows to transfer the token */
    function transferTo(address to, uint256 amount) public  {
        transfer(to, amount);
    }

    function transfer(address receiver, uint256 _amount) public override returns (bool) {
    _transfer(msg.sender, receiver, _amount);
    return true;
}

/* allows the user to check the token balance */
function checkTokenBalance(address _account) public view returns (uint) {
    return balanceOf(_account);
}

/* allows the user to redeem the item using ID value or items*/
/* Allows any address to redeem an item by ID, 
transferring the item's cost from the caller to the contract and 
deleting the item from the mapping. */
    function redeemItem(uint256 id) external {
        require(items[id].spend > 0, "Item does not exist!");
        require(balanceOf(msg.sender) >= items[id].spend, "Insufficient Balance");

        _transfer(msg.sender, address(this), items[id].spend);

        delete items[id];
    }
    
}
