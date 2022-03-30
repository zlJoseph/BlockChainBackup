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

    Project[] public proyectos;

    error ProjectClosed(string text);

    event changeState(
        address editor,
        StateProject newState
    );

    modifier onlyAuthor(uint indexProject){
        require(msg.sender==proyectos[indexProject].author,"No es el propietario del contrato");
        _;// este guion en donde se pondrá la función
    }

    modifier noAuthor(uint indexProject){// el argumento (uint indexProject) es el mismo de su función
        require(msg.sender!=proyectos[indexProject].author,"El propietario no puede realizar es proceso");
        _;// este guion en donde se pondrá la función
    }

    function setProject(string memory _id, string memory _name, string memory _description, uint _limit)public{
        proyectos.push(Project(_id,_name,_description,payable(msg.sender),StateProject.Opened,0,_limit));
    }

    function setFundsProject(uint indexProject)public payable noAuthor(indexProject){// cuando lo ejecuta, msg es la dirección del donador en ese momento
        //Project memory proyecto=proyectos[indexProject] //también se puede hacer esto
        if(proyectos[indexProject].state==StateProject.Closed){// lanzando error
            revert ProjectClosed("Proyecto cerrado");
        }
        require(proyectos[indexProject].funds < proyectos[indexProject].fundsLimit, "Objetivo cumplido");
        require((proyectos[indexProject].funds + msg.value)<proyectos[indexProject].fundsLimit, "Objetivo supera al cumplido");
        proyectos[indexProject].author.transfer(msg.value);
        proyectos[indexProject].funds+=msg.value;
    }

    function setChangeState(uint indexProject,StateProject newState)public onlyAuthor(indexProject){
        proyectos[indexProject].state=newState;
        emit changeState(msg.sender,newState);
    }

}