#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles firing the 40mm pike grenade (shell)
 *
 * Arguments:
 * FiredEH
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_pike_fnc_ammoFired
 *
 * Public: No
 */

params ["_unit", "", "", "", "_ammo", "", "_projectile", "_gunner"];
TRACE_4("ammoFired",_unit,_ammo,_projectile,_gunner);

if (!local _gunner) exitWith {};
if (isNull _projectile) exitWith {};

// Get MissileGuidance args now
private _firedEH = +_this;
// Inject the submuntion ammo into guidance args
_firedEH set [4, getText (configFile >> "CfgAmmo" >> _ammo >> "submunitionAmmo")];
private _guidanceArgs = _firedEH call EFUNC(missileguidance,onFiredDeffered);
_projectile setVariable [QGVAR(guidanceArgs), _guidanceArgs];

// On missile deploy start guidance
_projectile addEventHandler ["SubmunitionCreated", {
    params ["_projectile", "_submunitionProjectile"];
    TRACE_2("SubmunitionCreated",_projectile,_submunitionProjectile);

    private _guidanceArgs = _projectile getVariable [QGVAR(guidanceArgs), []];
    if (_guidanceArgs isEqualTo []) exitWith { ERROR_1("bad args %1",_projectile); };
    // Inject the submuntion projectile and time into guidance args
    _guidanceArgs params ["_firedEH", "", "", "", "_stateParams"];
    _firedEH set [6, _submunitionProjectile]; // _firedEH params ["","","","","","","_projectile"];
    _stateParams set [0, diag_tickTime]; // _stateParams params ["_lastRunTime"]

    [EFUNC(missileguidance,guidancePFH), 0, _guidanceArgs] call CBA_fnc_addPerFrameHandler;
    if (!isNil QEFUNC(frag,addPfhRound)) then {
        [_firedEH # 0, _firedEH # 4, _submunitionProjectile] call EFUNC(frag,addPfhRound);
    };

    #ifdef DEBUG_MODE_FULL
    [{
        params ["_time", "_projectile"];
        if (isNull _projectile) exitWith {true};
        systemChat format ["%1 - %2", CBA_missionTime - _time, vectorMagnitude velocity _projectile];
        false
    }, {}, [CBA_missionTime, _submunitionProjectile]] call CBA_fnc_waitUntilAndExecute;
    #endif
}];

// Trigger motor after ~4 meter delay (could also use config `triggerTime`)
[{
    params ["_projectile"];
    if (isNull _projectile) exitWith { WARNING_1("null %1",_projectile); };
    triggerAmmo _projectile;
}, [_projectile], 0.1] call CBA_fnc_waitAndExecute;
