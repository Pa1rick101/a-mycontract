// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "ds-test/test.sol";
import "../src/MyCar.sol";

contract MyCarTest is DSTest {
    MyCar public myCar;

    function setUp() public {
        myCar = new MyCar();
    }

    function testExample() public {
        string memory name = myCar.name();
        assertEq(name, "MyCar");
    }
}
