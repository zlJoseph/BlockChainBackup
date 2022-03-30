// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract Eventos{

    uint public state=0;

    error StateNoDefined(uint a);

    function setChangeState(uint newState)public{
        require(newState==0 || newState==1, "No permitido");
        if(newState==1){
            state=newState;
        }/*else{
            revert StateNoDefined(newState);
        }*/
    }

}