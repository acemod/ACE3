/*
 * Author: SzwedzikPL
 * Turn on/off lamp
 *
 * Arguments:
 * 0: Lamp <OBJECT>
 *
 * Return value:
 * None
 *
 * Example:
 * [lamp] call ace_interaction_fnc_switchLamp
 *
 * Public: No
 */
#include "script_component.hpp"

#define DISABLED_LAMP_DMG 0.95

params ["_lamp"];

private _objectClass = typeof _lamp;
private _class = getText (configFile >> "CfgVehicles" >> _objectClass >> QGVAR(switchLampClass));

if (_class == "") exitWith {};

private _vectors = [vectorDir _lamp, vectorUp _lamp];
private _posATL = getPosATL _lamp;

private _reflectors = "true" configClasses (configfile >> "CfgVehicles" >> _objectClass >> "Reflectors");
private _hitPointsDamage = [];
{
    private _hitPoint = getText (_x >> "hitpoint");
    _hitPointsDamage pushback [_hitPoint, _lamp getHit _hitPoint];
    nil
} count _reflectors;

deleteVehicle _lamp;

private _newLamp = createVehicle [_class, _posATL, [], 0, "CAN_COLLIDE"];
_newLamp setVectorDirAndUp _vectors;
_newLamp setPosATL _posATL;
private _isOff = getNumber (configFile >> "CfgVehicles" >> _class >> QGVAR(switchLampOff)) == 1;

if(_isOff) then {
    //this version of lamp is off
    {_newLamp sethit [_x select 0, (_x select 1) max DISABLED_LAMP_DMG];nil} count _hitPointsDamage;
} else {
    //this version of lamp is on
    {if((_x select 1) > DISABLED_LAMP_DMG) then {_newLamp sethit _x;};nil} count _hitPointsDamage;
};
