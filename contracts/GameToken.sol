// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "ERC20.sol";

contract GameToken is ERC20 {
    address public admin;

    constructor() ERC20("Game Token", "GT") {
        _mint(msg.sender, 1000000000000000000000000); 
        admin = msg.sender;
    }

    modifier onlyAdmin {
        require(msg.sender == admin, "Unauthorized");
        _;
    }

    function mintTokens(address to, uint value) public onlyAdmin {
        _mint(to, value);
    }

    function burnTokens(uint value) public {
        _burn(msg.sender, value);
    }
}
