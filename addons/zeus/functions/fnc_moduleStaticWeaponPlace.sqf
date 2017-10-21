/*
 * Author: PabstMirror
 * Adapted from BIS_fnc_packStaticWeapon (Dean "Rocket" Hall, reworked by Killzone_Kid)
 * Place on a unit in a group carrying static weapon backpacks to make them setup the weapon
 *
 * Arguments:
 * 0: Module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ace_zeus_fnc_moduleStaticWeaponPlace
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic"];
if (!local _logic) exitWith {};

if (canSuspend) exitWith {[FUNC(moduleStaticWeaponPlace), _this] call CBA_fnc_directCall;};

// Validate the module target
private _unit = effectiveCommander (attachedTo _logic);
private _group = group _unit;
TRACE_3("moduleStaticWeaponPlace placed",_unit,typeOf _unit,typeOf _logic);

deleteVehicle _logic; // cleanup logic now, we just needed it to get the attached unit

if (isNull _unit) exitWith { [LSTRING(NothingSelected)] call FUNC(showMessage); };
if (!alive _unit) exitWith { [LSTRING(OnlyAlive)] call FUNC(showMessage); };
if (!(_unit isKindOf "CAManBase")) then { [LSTRING(OnlyInfantry)] call FUNC(showMessage); };
if (({[_x] call EFUNC(common,isPlayer)} count units _group) != 0) exitWith { ["str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call FUNC(showMessage); };

private _gunner = objNull;
private _assistant = objNull;
private _availableUnits = [_unit]; // try to seach attached unit first
_availableUnits append ((units _group) select {(!isNull _x) && {_unit != _x}});
_availableUnits = _availableUnits select {([_x] call EFUNC(common,isAwake)) && {(vehicle _x) == _x}};

{
    if ((unitBackpack _x) isKindOf "Weapon_Bag_Base") exitWith {_gunner = _x};
} forEach _availableUnits;

if (isNull _gunner) exitWith { [localize LSTRING(StaticWeapon_NotCarrying)] call FUNC(showMessage); };
private _cfgBase = configFile >> "CfgVehicles" >> (backpack _gunner) >> "assembleInfo" >> "base";
private _compatibleBases = if (isText _cfgBase) then {[getText _cfgBase]} else {getArray _cfgBase};
{
    private _xUnit = _x;
    if (({(unitBackpack _xUnit) isKindOf _x} count _compatibleBases) > 0) exitWith {_assistant = _xUnit};
} forEach _availableUnits;

if (isNull _assistant) exitWith { [localize LSTRING(StaticWeapon_NotCarrying)] call FUNC(showMessage); };
TRACE_2("",_gunner,_assistant);


[_gunner, {
    params ["_successful", "_gunner", "_mousePosASL"];
    TRACE_3("getModuleDestination return",_successful,_gunner,_mousePosASL);
    
    if ((!_successful) || {!alive _gunner}) exitWith {};
    [QGVAR(moduleStaticWeaponPlace), [_gunner, _mousePosASL, CBA_clientID], _gunner] call CBA_fnc_targetEvent;
}, (localize LSTRING(StaticWeapon_SetDirection))] call FUNC(getModuleDestination);

