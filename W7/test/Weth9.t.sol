// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Weth9.sol";

contract Weth9Test is Test {
    WETH9 public weth9;
    address addr1 = address(123);
    address addr2 = address(456);

    receive() external payable {}

    event Deposit(address indexed dst, uint256 wad);
    event Withdrawal(address indexed src, uint256 wad);

    function setUp() public {
        weth9 = new WETH9();
    }

    function test1(uint96 eth) public {
        weth9.deposit{value: eth}();
        assertEq(weth9.balanceOf(address(this)), eth);
    }

    function test2(uint96 eth) public {
        weth9.deposit{value: eth}();
        assertEq(address(weth9).balance, eth);
    }

    function test3(uint96 eth) public {
        vm.expectEmit();
        emit Deposit(address(this), eth);
        weth9.deposit{value: eth}();
    }

    function test4(uint96 eth) public {
        weth9.deposit{value: eth}();
        uint256 balanceBefore = weth9.totalSupply();
        weth9.withdraw(randomEth);
        uint256 balanceAfter = weth9.totalSupply();
        assertEq(balanceBefore - eth, balanceAfter);
    }

    function test5() public {
        weth9.deposit{value: 200 ether}();
        uint256 balanceBefore = address(this).balance;
        weth9.withdraw(1 ether);
        uint256 balanceAfter = address(this).balance;
        assertEq(balanceBefore + 1 ether, balanceAfter);
    }

    function test6(uint96 wad) public {
        weth9.deposit{value: wad}();
        vm.expectEmit();
        emit Withdrawal(address(this), wad);
        weth9.withdraw(wad);
    }

    function test7() public {
        weth9.deposit{value: 200}();
        weth9.transfer(addr1, 1);
        assertEq(weth9.balanceOf(address(this)), 1);
        assertEq(weth9.balanceOf(addr1), 1);
    }

    function test8(uint96 wad) public {
        weth9.approve(addr1, wad);
        assertEq(weth9.allowance(address(this), addr1), wad);
    }

    function test9() public {
        weth9.deposit{value: 200}();
        weth9.approve(addr1, 2);
        vm.prank(addr1);
        bool result = weth9.transferFrom(address(this), addr2, 1);
        require(result, "failed");
    }

    function test10() public {
        weth9.deposit{value: 200}();
        weth9.approve(addr1, 2);
        vm.prank(addr1);
        weth9.transferFrom(address(this), addr2, 1);
        assertEq(weth9.allowance(address(this), addr1), 2 - 1);
    }

    function test11() public {
        weth9.deposit{value: 200}();
        vm.prank(addr2);
        vm.expectRevert();
        weth9.transferFrom(address(this), addr2, 200);
    }
}
