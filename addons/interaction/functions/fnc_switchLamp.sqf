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

//if lamp is on turn it off
private _eventName = ["lampTurnOn", "lampTurnOff"] select _isOn;
if(local _lamp) then {
    [_eventName, [_lamp, _hitPointsDamage, DISABLED_LAMP_DMG]] call EFUNC(common,localEvent);
} else {
    [_eventName, [_lamp], [_lamp, _hitPointsDamage, DISABLED_LAMP_DMG]] call EFUNC(common,targetEvent);
};
_lamp setVariable ["ACE_lampOn", !_isOn, true];
