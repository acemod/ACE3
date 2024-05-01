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
TRACE_1("damageWheelsAndEngine",_vehicle);

// Vehicle needs to be local and vulnerable
if !(local _vehicle && {isDamageAllowed _vehicle}) exitWith {};

// --- burn tyres
private _fnc_isWheelHitPoint = {
    params ["_selectionName"];
    // wheels must use a selection named "wheel_X_Y_steering" for PhysX to work
    _selectionName select [0, 6] == "wheel_" && {
        _selectionName select [count _selectionName - 9] == "_steering"
    } // return
};

private _config = configOf _vehicle >> "HitPoints";

{
    private _wheelSelection = getText (_config >> _x >> "name");

    if (_wheelSelection call _fnc_isWheelHitPoint) then {
        private _wheelPosition = _vehicle modelToWorld (_vehicle selectionPosition _wheelSelection);

        if (_position distance _wheelPosition < EFFECT_SIZE * 2) then {
            _vehicle setHit [_wheelSelection, 1];
        };
    };
} forEach (getAllHitPointsDamage _vehicle param [0, []]);

// Burn car engines only
if (_vehicle isKindOf "Wheeled_APC_F") exitWith {};

private _engineSelection = getText (_config >> "HitEngine" >> "name");
private _enginePosition = _vehicle modelToWorld (_vehicle selectionPosition _engineSelection);

if (_position distance _enginePosition < EFFECT_SIZE * 2) then {
    _vehicle setHit [_engineSelection, 1];

    if (["ace_cookoff"] call EFUNC(common,isModLoaded)) then {
        private _enabled = _vehicle getVariable [QEGVAR(cookoff,enable), EGVAR(cookoff,enable)];
        if (_enabled in [2, true] || {_enabled isEqualTo 1 && {fullCrew [_vehicle, "", false] findIf {isPlayer (_x select 0)} != -1}}) then {
            _vehicle call EFUNC(cookoff,engineFire);
        };
    };
};
