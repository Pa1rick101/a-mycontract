// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MyCar.sol";

contract MyCarTest is Test {
    MyCar public myCar;
    address testAddr = makeAddr("Test");

    function setUp() public {
        myCar = new MyCar();
    }

    function testExample() public {
        string memory name = myCar.name();
        assertEq(name, "MyCar");
        emit log_named_string("The name of the NFT Collection is: ", name);
    }

    function testMintNFT() public {
        myCar.safeMint(testAddr, "www.youtube.com");
        uint256 balance = myCar.balanceOf(testAddr);
        assertEq(balance, 1);
        emit log_named_uint("The new address has minted ", balance);
    }
}
