# Module 4

This program is for creating a smart contract project that implements the mint(), transfer(), redeeming tokens, checking token balance and burning tokens.

## Description

Avalanche is a blockchain platform that provides decentralized apps and blockchain networks. Avalanche is designed to address the scalability issues that have conventional blockchain systems. The platform offers exceptional transaction speed and finality in milliseconds because of the consensus protocol, Avalanche. The adaptable architecture of Avalanche complements this scalability by enabling developers to design customized blockchain networks, or subnets, that satisfy particular needs and use cases. 

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., project.sol). Copy and paste the following code into the file:

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



To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.13" (or another compatible version), and then click on the "Compile + name of file(.sol)" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "project" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract has been deployed, you can interact with it through various functions such as mint(), transfer(), redeeming tokens, checking token balance and burning tokens.

## Authors

Contributors names and contact info

Elissa Mae Cruz


## License

This project is unlicensed.
