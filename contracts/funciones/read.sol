// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract Read{//public y privado

    string private a;
    int private c=1;

    function setRead(string memory va)public returns(int number){
        a=va;
        return number=2;
    }
}