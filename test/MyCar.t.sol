// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MyCar.sol";

contract MyCarTest is Test {
    MyCar public myCar;

    function setUp() public {
        myCar = new MyCar();
    }

    function testExample() public {
        string memory name = myCar.name();
        assertEq(name, "MyCar");
    }
}
