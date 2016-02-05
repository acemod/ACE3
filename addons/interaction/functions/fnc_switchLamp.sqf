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
 * lamp call ace_interaction_fnc_switchLamp
 *
 * Public: No
 */
#include "script_component.hpp"

#define DISABLED_LAMP_DMG 0.95

params ["_lamp"];

_isOn = _lamp getVariable ["ACE_lampOn", true];
private _reflectors = "true" configClasses (configfile >> "CfgVehicles" >> (typeof _lamp) >> "Reflectors");
private _hitPointsDamage = [];
{
    private _hitPoint = getText (_x >> "hitpoint");
    _hitPointsDamage pushback [_hitPoint, _lamp getHit _hitPoint];
    nil
} count _reflectors;

if(_isOn) then {
    //turn off this lamp
    {_lamp sethit [_x select 0, (_x select 1) max DISABLED_LAMP_DMG];nil} count _hitPointsDamage;
} else {
    //turn on this lamp
    {if((_x select 1) == DISABLED_LAMP_DMG) then {_lamp sethit [_x select 0, 0];};nil} count _hitPointsDamage;
};
_lamp setVariable ["ACE_lampOn", !_isOn, true];
