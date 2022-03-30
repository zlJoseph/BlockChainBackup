// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract CrowFunding{

    

    string public id;
    string public name;
    string public description;
    address payable author;
    uint public state =0;// 0 abierto, 1 cerrado
    uint public funds;
    uint public fundsLimit;



    error ProjectClosed(string text);

    constructor(string memory _id, string memory _name, string memory _description, uint _limit){//cuando se despliega, msg es la dirección del propiertario del contrato
        
        id=_id;
        name=_name;
        description=_description;
        author=payable(msg.sender);
        fundsLimit=_limit;
    }

    modifier onlyAuthor{
        require(msg.sender==author,"No es el propietario del contrato");
        _;// este guion en donde se pondrá la función
    }

    modifier noAuthor{
        require(msg.sender!=author,"El propietario no puede realizar es proceso");
        _;// este guion en donde se pondrá la función
    }

    function setFundsProject()public payable noAuthor{// cuando lo ejecutar, msg es la dirección del donador en ese momento
        if(state==1){
            revert ProjectClosed("Proyecto cerrado");
        }
        require(funds < fundsLimit, "Objetivo cumplido");
        require((funds + msg.value)<fundsLimit, "Objetivo supera al cumplido");
        author.transfer(msg.value);
        funds+=msg.value;
    }

    function setChangeState(uint newState)public onlyAuthor{
        state=newState;
    }

}