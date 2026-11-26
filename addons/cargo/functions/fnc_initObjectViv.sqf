#include "..\script_component.hpp"
/*
 * Author: Cathode88
 * Adds the "Load to ViV" action to a single object that was forced on via ace_cargo_fnc_setCanLoadViv.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_object"];

if (!hasInterface || {isNull _object}) exitWith {};

// Variable may have been set to false again since this event was queued
if !(_object getVariable [QGVAR(canLoadViv), false]) exitWith {};

// Already has the action on this machine, adding again would stack duplicate nodes
if (_object getVariable [QGVAR(vivActionAdded), false]) exitWith {};

// Already covered by fnc_initObject (classic cargo objects) or the expanded registration, adding again would duplicate the node
private _covered = (_object getVariable [QGVAR(canLoad), getNumber (configOf _object >> QGVAR(canLoad)) == 1]) || {
    GVAR(expandedVivObjectSupport) && {_object isKindOf "ThingX" || {_object isKindOf "StaticWeapon"}}
};

if (_covered) exitWith {};

_object setVariable [QGVAR(vivActionAdded), true]; // local only, each machine adds its own

[_object, 0, ["ACE_MainActions"], GVAR(loadVivAction)] call EFUNC(interact_menu,addActionToObject);
