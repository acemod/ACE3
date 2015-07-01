/*
 * Author: Rocko, Ruthberg
 *
 * Place down spotting scope
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: scope class <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

PARAMS_2(_unit,_scopeClass);

_unit removeItem _scopeClass;

if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    _unit playMove "AmovPercMstpSrasWrflDnon_diary";
};

[{
    PARAMS_1(_unit);
    
    private ["_direction", "_position", "_spottingScope"];
    _direction = getDir _unit;
    _position = (getPosASL _unit) vectorAdd [0.8 * sin(_direction), 0.8 * cos(_direction), 0.02];
    
    _spottingScope = "ACE_SpottingScopeObject" createVehicle [0, 0, 0];
    _spottingScope setDir _direction;
    _spottingScope setPosASL _position;
    if ((getPosATL _spottingScope select 2) - (getPos _spottingScope select 2) < 1E-5) then {
        _spottingScope setVectorUp (surfaceNormal (position _spottingScope)); 
    };
    _unit reveal _spottingScope;
    
}, [_unit], 1, 0] call EFUNC(common,waitAndExecute);
