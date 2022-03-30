// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract Eventos{

    string public state ="Abierto";

    event changeState(
        address editor,
        string newState
    );

    function setChangeState(string calldata newState)public{
        state=newState;
        emit changeState(msg.sender,newState);
    }

}