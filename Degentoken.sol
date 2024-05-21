    /* This line specify the license under which the contract is published under MIT and 
    the version of the Solidity compiler that the contract 
    should be compiled with (version 0.8.0 or higher).*/

    // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


    //An import statement brings in the ERC20.sol file from the OpenZeppelin library.
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

    /*The "ELISSA" contract is derived from the ERC20 contract. It indicates that the deal for "Degen" will 
    own every function listed in the ERC20 contract for an ERC20 token.*/ 

contract Degen is ERC20 {
        

    /*The constructor function is used to initialize the contract when it's deployed. 
    It has the initial name of the token to "Degen" and its symbol to "DGN".*/
    constructor() ERC20("Degen", "DGN"){

        /*_mint function is called within the constructor to mint 777 tokens and assign them to the deployer's address 
        (msg.sender or the owner account).*/
        _mint (msg.sender, 777);
    }

    /*Mint functions allows the owner to create a new token. */
    function Mint(uint _token) public {
        _mint(msg.sender, _token);
    }

    
    /* The caller can send tokens to a recipient address using the transfer function. 
    To complete the transfer, it makes use of the _transfer method that was inherited from ERC20.*/ 
     function transfer(address recipient, uint256 _token) public override returns (bool) {
        _transfer(msg.sender, recipient, _token);
        return true;
    }
    
    //Redeeming tokens typically refers to exchanging tokens for some form of value, such as rewards, goods, or services. 
    function redeem(uint _Redeem) public {
        require(balanceOf(msg.sender) >= _Redeem, "Insufficient balance");
        _burn(msg.sender, _Redeem);
    }

     function redeemtoken(address from, uint256 _token) public {
    require(balanceOf(from) >= _token, "Insufficient balance");
    _burn(from, _token);
    }
   
    function checkTokenBalance(address _account) public view returns (uint) {
        return balanceOf(_account);
    }


    /*Burn functions allow users to destroy their tokens.*/ 
     function Burn(address from, uint256 _token) public {
        _burn(from, _token);
    }
}
