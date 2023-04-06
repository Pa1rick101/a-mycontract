// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {MyCar} from "src/MyCar.sol";

contract MyCarScript is Script {
    function setUp() public {}

    function run() public {
        new MyCar();
    }

    function mint() public {}
}
