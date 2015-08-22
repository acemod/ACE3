/*
 * Author: SzwedzikPL
 * Turn on/off lamp
 *
 * Arguments:
 * 0: Lamp <OBJECT>
 * 1: On/Off <SCALAR>
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

params ["_object"];

private ["_objectClass", "_class"];

_objectClass = typeof _object;
_class = getText (configFile >> "CfgVehicles" >> _objectClass >> QGVAR(switchLampClass));

if (_class == "") exitWith {};

private ["_vectors", "_pos", "_reflectors", "_hitpointsdmg"];

_vectors = [vectorDir _object, vectorUp _object];
_pos = getPosATL _object;

_reflectors = (configfile >> "CfgVehicles" >> _objectClass >> "Reflectors") call BIS_fnc_getCfgSubClasses;
_hitpointsdmg = [];
{
	_hitpoint = getText (configfile >> "CfgVehicles" >> _objectClass >> "Reflectors" >> _x >> "hitpoint");
	_hitpointsdmg pushback [_hitpoint, _object getHit _hitpoint];
	nil
} count _reflectors;

deleteVehicle _object;

private ["_newobject", "_isOff"];

_newobject = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
_newobject setVectorDirAndUp _vectors;
_newobject setPosATL _pos;
_isOff = getNumber (configFile >> "CfgVehicles" >> _class >> QGVAR(switchLampOff)) == 1;

if(_isOff) then {
	//this lamp is off
	{_newobject sethit [_x select 0, (_x select 1) max DISABLED_LAMP_DMG];nil} count _hitpointsdmg;
} else {
	//new lamp is on
	{if((_x select 1) > DISABLED_LAMP_DMG) then {_newobject sethit _x;};nil} count _hitpointsdmg;
};