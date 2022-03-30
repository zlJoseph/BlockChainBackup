// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract EnumExa{

    enum State{ Active, Inactive}//Se representa como posiciones de un array

    State public state=State.Inactive;

    function setChangeState(State newState)public{
        state=newState;
    }

}