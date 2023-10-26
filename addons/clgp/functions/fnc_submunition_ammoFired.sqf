#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Generic handler for firing a clgp submuntion ammo
 *
 * Arguments:
 * FiredEH
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_clgp_fnc_submunition_ammoFired
 *
 * Public: No
 */

params ["_unit", "", "", "", "_ammo", "", "_projectile", "_gunner"];
if (!local _gunner) exitWith {};
if (isNull _projectile) exitWith {};
private _cfg = configOf _projectile;
TRACE_4("ammoFired local",_unit,_ammo,_projectile,_gunner);

// Get MissileGuidance args now
private _firedEH = +_this;
// Inject the submunition ammo into guidance args
_firedEH set [4, getText (_cfg >> "submunitionAmmo")];
private _guidanceArgs = _firedEH call EFUNC(missileguidance,onFiredDeferred);
if (_guidanceArgs isEqualTo []) exitWith { WARNING_1("no args %1",_projectile); };
_projectile setVariable [QGVAR(guidanceArgs), _guidanceArgs];

// On missile deploy start guidance/frag
_projectile addEventHandler ["SubmunitionCreated", {
    params ["_projectile", "_submunitionProjectile"];
    private _guidanceArgs = _projectile getVariable [QGVAR(guidanceArgs), []];
    private _canFrag = true;
    TRACE_4("SubmunitionCreated",_projectile,_submunitionProjectile,_guidanceArgs isNotEqualTo [],_canFrag);
    if (isNull _submunitionProjectile) exitWith {};

    if (_guidanceArgs isNotEqualTo []) then {
        // Inject the submunition projectile and time into guidance args
        _guidanceArgs params ["_firedEH", "", "", "", "_stateParams"];
        _firedEH set [6, _submunitionProjectile]; // _firedEH params ["","","","","","","_projectile"];
        _stateParams set [0, diag_tickTime]; // _stateParams params ["_lastRunTime"] 
        // Start missigle guidance  
        [EFUNC(missileguidance,guidancePFH), 0, _guidanceArgs] call CBA_fnc_addPerFrameHandler;
    };
    if (!isNil QEFUNC(frag,addPfhRound)) then {
        // Start frag tracking
        [_firedEH # 0, _firedEH # 4, _submunitionProjectile] call EFUNC(frag,addPfhRound);
    };
}];

// Trigger ammo when conditions are met
private _deployCondition = getText (_cfg >> QGVAR(deployCondition));
if (_deployCondition != "") then {
    _deployCondition = missionNamespace getVariable [_deployCondition, {ERROR("bad func"); true}];
    [{
        params ["_projectile", "", "_deployCondition"];
        if (isNull _projectile) exitWith { true };
        _this call _deployCondition
    }, {
        params ["_projectile"];
        if (isNull _projectile) exitWith { WARNING_1("null at trigger condition %1",_projectile); }; // ToDo
        TRACE_1("triggerAmmo",_projectile);
        triggerAmmo _projectile;
    }, [_projectile, _guidanceArgs, _deployCondition]] call CBA_fnc_waitUntilAndExecute;
};
