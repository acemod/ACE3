#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Damage a vehicle's wheels and engine.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Incendiary position AGL <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, position cursorObject] call ace_grenades_fnc_damageEngineAndWheels
 *
 * Public: No
 */

params ["_vehicle", "_position"];
TRACE_2("damageWheelsAndEngine",_vehicle,_position);

// Vehicle needs to be local and vulnerable
if !(local _vehicle && {isDamageAllowed _vehicle}) exitWith {};

{
    // If wheel is close enough to incendiary, burn it
    if (_position distance (_vehicle modelToWorld (_vehicle selectionPosition _x)) < EFFECT_SIZE * 2) then {
        _vehicle setHit [_x, 1];
    };
} forEach ((_vehicle call EFUNC(common,getWheelHitPointsWithSelections)) select 1);

// Burn car engines only
if (_vehicle isKindOf "Wheeled_APC_F") exitWith {};

private _engineSelection = getText (configOf _vehicle >> "HitPoints" >> "HitEngine" >> "name");
private _enginePosition = _vehicle modelToWorld (_vehicle selectionPosition _engineSelection);

if (_position distance _enginePosition < EFFECT_SIZE * 2) then {
    _vehicle setHit [_engineSelection, 1];

    if (["ace_cookoff"] call EFUNC(common,isModLoaded)) then {
        [QEGVAR(cookoff,engineFireServer), _vehicle] call CBA_fnc_serverEvent;
    };
};
