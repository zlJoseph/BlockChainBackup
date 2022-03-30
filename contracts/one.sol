// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract Probando{

    bool public isWorking;
    uint public id;
    string public name;
    address public wallet;

    constructor(uint _id,bool _isworking,string memory _name){
        id=_id;
        isWorking=_isworking;
        name=_name;
        wallet=msg.sender;
    }
}