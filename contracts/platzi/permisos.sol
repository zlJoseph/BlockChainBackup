// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract Permisos{

    address author;
    string public state ="Abierto";

    constructor(){//cuando se despliega, msg es la dirección del propiertario del contrato
        author=msg.sender;
    }

    modifier onlyAuthor{
        require(msg.sender==author,"No es el propietario del contrato");
        _;// este guion en donde se pondrá la función
    }

    function setChangeState(string calldata newState)public onlyAuthor{
        state=newState;
    }

}