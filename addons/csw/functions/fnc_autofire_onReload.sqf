#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up the turret to be firable, and then fires the turret.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Reloaded Weapon <STRING>
 * 2: Reloaded Muzzle <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject addEventHandler ["Reloaded", ace_csw_fnc_autofire_onReload]
 *
 * Public: No
 */
params ["_csw", "_reloadedWeapon", "_reloadedMuzzle"];
private _autofire = _csw getVariable [QGVAR(autofire), false];
TRACE_5("csw reloaded",_csw,_reloadedWeapon,_autofire,gunner _csw,local gunner _csw);

private _init = _csw getVariable [QGVAR(initialising), false];

TRACE_1("init check",_init);
if (_init || !_autofire) exitWith {};

TRACE_1("autofiring",_csw);

private _agent = objNull;
if (isNull gunner _csw) then {
    // if there is no gunner, we want to spawn an agent to put into the muzzle so we can force fire the weapon
    _agent = createAgent ["B_Soldier_F", [0, 0, 0], [], 0, "NONE"];
    [QEGVAR(common,hideObjectGlobal), [_agent, true]] call CBA_fnc_serverEvent;
    _agent moveInGunner _csw;
    _agent disableAI "ALL";
    _agent enableSimulation false;
    TRACE_2("placing agent into csw",_csw,_agent);
};
_csw setVariable [QGVAR(autofire_agent), _agent, true];

[
    {
        params ["_csw", "_reloadedWeapon", "_reloadedMuzzle", "_enterTime"];
        private _turret = _csw unitTurret (gunner _csw);
        private _reloadPhase = (weaponState [_csw, _turret, _reloadedWeapon, _reloadedMuzzle]) select 6;
        TRACE_4("reload phase",_csw,gunner _csw,_reloadedMuzzle,_reloadPhase);
        _reloadPhase <= 0
    },
    {
        params ["_csw", "_reloadedWeapon", "_reloadedMuzzle", "_enterTime"];
        TRACE_4("firing after load",_csw,_reloadedWeapon,_reloadedMuzzle,CBA_missionTime - _enterTime);
        [QGVAR(autofire_fire), [_csw, _reloadedWeapon, _reloadedMuzzle], _csw, _csw unitTurret (gunner _csw)] call CBA_fnc_turretEvent;
    },
    [_csw, _reloadedWeapon, _reloadedMuzzle, CBA_missionTime]
] call CBA_fnc_waitUntilAndExecute;
