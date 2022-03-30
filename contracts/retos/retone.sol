// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract Retone{

    uint public state=0;

    function setFunds(address payable reciever)public payable{
        reciever.transfer(msg.value);
    }

    function setState(uint _state)public returns(string memory stateText){
        state=_state;
        if(state==2){
            stateText="El estado es: completado";
        }else{
            if(state==1){
                stateText="El estado es: recaudando";
            }else{
                stateText="El estado es: iniciado";
            }
        }
    }

}