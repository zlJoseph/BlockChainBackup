// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract Pandpr{//public y privado

    function getNumber()private pure returns(int){//view o pure o payable
        return 1020;
    }
    
    function sumar(int number)public pure returns (int){
        return getNumber()+number;
    }
}