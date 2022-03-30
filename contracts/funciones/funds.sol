// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract Funds{

    function setFunds(address payable reciever)public payable{
        reciever.transfer(msg.value);
    }
}