// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract CrowFunding2{

    enum StateProject{ Opened, Closed}

    struct Project {
        string id;
        string name;
        string description;
        address payable author;
        StateProject state;
        uint funds;
        uint fundsLimit;
    }

    Project public proyecto;

    error ProjectClosed(string text);

    constructor(string memory _id, string memory _name, string memory _description, uint _limit){//cuando se despliega, msg es la dirección del propiertario del contrato
        proyecto=Project(_id,_name,_description,payable(msg.sender),StateProject.Opened,0,_limit);
    }

    event changeState(
        address editor,
        StateProject newState
    );

    modifier onlyAuthor{
        require(msg.sender==proyecto.author,"No es el propietario del contrato");
        _;// este guion en donde se pondrá la función
    }

    modifier noAuthor{
        require(msg.sender!=proyecto.author,"El propietario no puede realizar es proceso");
        _;// este guion en donde se pondrá la función
    }

    function setFundsProject()public payable noAuthor{// cuando lo ejecutar, msg es la dirección del donador en ese momento
        if(proyecto.state==StateProject.Closed){// lanzando error
            revert ProjectClosed("Proyecto cerrado");
        }
        require(proyecto.funds < proyecto.fundsLimit, "Objetivo cumplido");
        require((proyecto.funds + msg.value)<proyecto.fundsLimit, "Objetivo supera al cumplido");
        proyecto.author.transfer(msg.value);
        proyecto.funds+=msg.value;
    }

    function setChangeState(StateProject newState)public onlyAuthor{
        proyecto.state=newState;
        emit changeState(msg.sender,newState);
    }

}