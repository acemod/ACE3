#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Generic handler for firing a clgp submuntion ammo. Called from the ammo's fired EH.
 *
 * Arguments:
 * FiredEH
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_missile_clgp_fnc_submunition_ammoFired
 *
 * Public: No
 */

params ["_unit", "", "", "", "_ammo", "", "_projectile", "_gunner"];
if (!local _gunner) exitWith {};
if (isNull _projectile) exitWith {};
TRACE_4("ammoFired local",typeOf _unit,_ammo,_projectile,_gunner);
private _ammoCfg = configOf _projectile;

// Get MissileGuidance args now
private _firedEH = +_this;
// Inject the submunition ammo into guidance args
_firedEH set [4, getText (_ammoCfg >> "submunitionAmmo")];
private _guidanceArgs = _firedEH call EFUNC(missileguidance,onFiredGetArgs);
if (_guidanceArgs isEqualTo []) then { WARNING_1("no args %1",_projectile); };
_projectile setVariable [QGVAR(guidanceArgs), _guidanceArgs];

// On missile deploy start guidance
_projectile addEventHandler ["SubmunitionCreated", LINKFUNC(submunition_submunitionCreated)];

// Trigger ammo when conditions are met
private _deployCondition = getText (_ammoCfg >> QGVAR(deployCondition));
if (_deployCondition != "") then {
    _deployCondition = missionNamespace getVariable [_deployCondition, { ERROR("bad func"); true} ];
    [{
        params ["_projectile", "", "_deployCondition"];
        if (isNull _projectile) exitWith { true };
        call _deployCondition
    }, {
        params ["_projectile"];
        if (isNull _projectile) exitWith { TRACE_1("null at trigger condition %1",_projectile); };
        TRACE_1("triggerAmmo",_projectile);
        triggerAmmo _projectile;
    }, [_projectile, _guidanceArgs, _deployCondition]] call CBA_fnc_waitUntilAndExecute;
};
