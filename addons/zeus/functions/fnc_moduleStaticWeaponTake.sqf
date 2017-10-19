/*
 * Author: PabstMirror
 * Adapted from BIS_fnc_packStaticWeapon (Dean "Rocket" Hall, reworked by Killzone_Kid)
 * Place on a unit in or near a static weapon to make them dissasemble and pickup the backpacks parts
 *
 * Arguments:
 * 0: Module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ace_zeus_fnc_moduleStaticWeaponTake
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic"];
if (!local _logic) exitWith {};

if (canSuspend) exitWith {[FUNC(moduleStaticWeaponTake), _this] call CBA_fnc_directCall;};

// Validate the module target
private _unit = effectiveCommander (attachedTo _logic);
private _group = group _unit;
TRACE_3("moduleStaticWeaponTake placed",_unit,typeOf _unit,typeOf _logic);

deleteVehicle _logic; // cleanup logic now, we just needed it to get the attached unit

if (isNull _unit) exitWith { [LSTRING(NothingSelected)] call FUNC(showMessage); };
if (!alive _unit) exitWith { [LSTRING(OnlyAlive)] call FUNC(showMessage); };
if (!(_unit isKindOf "CAManBase")) then { [LSTRING(OnlyInfantry)] call FUNC(showMessage); };
if (({[_x] call EFUNC(common,isPlayer)} count units _group) != 0) exitWith { ["str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call FUNC(showMessage); };

private _staticWeapon = vehicle _unit;
if (!(_staticWeapon isKindOf "StaticWeapon")) then {
    _staticWeapon = (_unit nearEntities ["StaticWeapon", 50]) param [0, objNull];
};
if ((!(_staticWeapon isKindOf "StaticWeapon")) ||
        {(locked _staticWeapon) >= 2} ||
        {(!isNull gunner _staticWeapon) && {(group gunner _staticWeapon) != _group}} ||
        {(count getArray(configFile >> "CfgVehicles" >> (typeOf _staticWeapon) >> "assembleInfo" >> "dissasembleTo")) != 2}) exitWith {
    TRACE_3("",typeOf _staticWeapon,locked _staticWeapon,crew _staticWeapon);
    [localize LSTRING(StaticWeapon_NoneNearby)] call FUNC(showMessage);
};
TRACE_2("",_staticWeapon,typeOf _staticWeapon);

private _gunner = gunner _staticWeapon;
private _assistant = objNull;
private _availableUnits = (units _group) select {(!isNull _x) && {[_x] call EFUNC(common,isAwake)} && {(vehicle _x) == _x}};
{
    if ((isNull _gunner) && {_x != _assistant}) then {_gunner = _x};
    if ((isNull _assistant) && {_x != _gunner}) then {_assistant = _x};
} forEach (_availableUnits select {(backpack _x) == ""});
{
    if ((isNull _gunner) && {_x != _assistant}) then {_gunner = _x};
    if ((isNull _assistant) && {_x != _gunner}) then {_assistant = _x};
} forEach _availableUnits;

TRACE_2("",_gunner,_assistant);
if ((isNull _gunner) || {isNull _assistant}) exitWith {
    [localize LSTRING(StaticWeapon_NeedAssistant)] call FUNC(showMessage);
};

[QGVAR(moduleStaticWeaponTake), [_gunner, _assistant, _staticWeapon, CBA_clientID], _group] call CBA_fnc_targetEvent;
