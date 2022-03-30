// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; //version de compilador

contract ArrayMappingExa{

    //longitud fija
    uint[3] public setpOne=[1,2,3];
    //longitud variable
    uint[] public steps;

    mapping(string => string) public mapE;

    function calcul()public{
        //Para agregar en longitud variable
        steps.push(6);
        //Para eliminar el ultimo elemento agregado en longitud variable
        //steps.pop();

        //Para actualizar en longitud fija
        setpOne[0]=4;
        mapE["Peru"]="Palomaxd";
    }

}