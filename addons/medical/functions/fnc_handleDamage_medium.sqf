
#include "script_component.hpp"

private ["_unit","_selectionName","_amountOfDamage","_sourceOfDamage","_typeOfProjectile","_typeOfDamage"];
_unit = _this select 0;
_selectionName = _this select 1;
_amountOfDamage = _this select 2;
_sourceOfDamage = _this select 3;
_typeOfProjectile = _this select 4;
_returnDamage = _this select 5;
_typeOfDamage = _this select 6; //[_typeOfProjectile] call FUNC(getTypeOfDamage);

if (GVAR(enableAirway)) then {
    [_unit,_selectionName,_amountOfDamage,_sourceOfDamage, _typeOfDamage] call FUNC(handleDamage_wounds);
};

_returnDamage;
