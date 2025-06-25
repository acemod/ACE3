#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Equips an aircraft with a marking laser.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [plane] call ace_markinglaser_fnc_onAircraftInit
 *
 * Public: No
 */

params ["_aircraft"];
TRACE_2("onAircraftInit",_aircraft,typeOf _aircraft);

// Assume enabled by default
if !(_aircraft getVariable [QGVAR(enabled), true]) exitWith {};

private _config = configOf _aircraft;
private _turretData = [_config] call FUNC(findTurret);
private _hasPilotCamera = getNumber (_config >> "PilotCamera" >> "controllable") > 0;

if ((_turretData isEqualTo []) && {!_hasPilotCamera}) exitWith {
    _aircraft setVariable [QGVAR(enabled), false];
    INFO_1("Class %1 does not have a pilot camera nor a turret that could be equipped with an IR marking laser.",configName _config);
};

_aircraft setVariable [QGVAR(enabled), true];
_aircraft setVariable [QGVAR(smoothing), []];

if (_turretData isEqualTo []) then {
    TRACE_1("pilot",_turretData);
    // Use pilot camera if no turrets are available
    _aircraft setVariable [QGVAR(turretInfo), [-1]];
} else {
    TRACE_1("turret",_turretData);
    _turretData params ["_turretPath"];
    _aircraft setVariable [QGVAR(turretInfo), _turretPath];
};


TRACE_1("Add interaction",_aircraft);
private _condition = {
    if !(_target getVariable [QGVAR(enabled), false]) exitWith {false};
    private _controlledUnit = [ACE_player, ACE_controlledUAV # 1] select (unitIsUAV _target);
    private _turretInfo = _target getVariable [QGVAR(turretInfo), []];
    private _canTurnOn = _controlledUnit == _target turretUnit _turretInfo;
    _canTurnOn
};

private _getChildren = {
    private _statement = {
        _target setVariable [QGVAR(laserMode), _actionParams, true];
    };
    private _current = _target getVariable [QGVAR(laserMode), 0];
    [[MODE_OFF, LELSTRING(common,disabled)], [MODE_ON, LELSTRING(common,enabled)], [MODE_FLASH, LLSTRING(Flashing)]] apply {
        _x params ["_mode", "_text"];
        if (_current == _mode) then { _text = ">" + _text };
        [[str _mode, _text, "", _statement, {true}, {}, _mode] call EFUNC(interact_menu,createAction), [], _target]
    }
};
private _actionBase = [QGVAR(actionBase), LLSTRING(Name), "", {}, _condition, _getChildren] call EFUNC(interact_menu,createAction);
private _basePath = [_aircraft, 1, ["ACE_SelfActions"], _actionBase] call EFUNC(interact_menu,addActionToObject);
