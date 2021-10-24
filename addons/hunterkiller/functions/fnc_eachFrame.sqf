#include "script_component.hpp"
/*
 * Author: PabstMirror
 * x
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Turret <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [0]] call ace_hunterkiller_fnc_eachFrame
 *
 * Public: No
 */

params ["_args", "_pfID"];
_args params ["_player", "_playerTurret", "_vehicle", "_masterTurret", "_puppetTurret", "_lookDirLast", "_lookStarted", "_lookStable"];

// GUI
private _puppetLookAt = _vehicle getVariable [QGVAR(puppetLookAt), []];
if ((_puppetLookAt isEqualTo []) && {_lookDirLast isNotEqualTo []}) then {
    _lookDirLast = [];
    _args set [5, _puppetLookAt];
    QGVAR(text) cutText ["", "PLAIN"];
};

if (_playerTurret isEqualTo _masterTurret) then {
    // --- Player in Master Turret

    if (GVAR(masterOverridePressed)) then {
        GVAR(masterOverridePressed) = false;
        // CBA_fnc_turretDir has problems on commander turrets, we can just use eyeDirection to get high precision turret dir
        // The accuracy is higher here because the turret is local to us
        _lookDirLast = eyeDirection _vehicle; // assume masterTurret is the obsTurret
        _args set [5, _lookDirLast];
        _vehicle setVariable [QGVAR(puppetLookAt), _lookDirLast, true];
        TRACE_1("sending puppetLookAt",_lookDirLast);
        playSound "ACE_Sound_Click";
        QGVAR(text) cutText [format ["<br/><br/><br/><br/><br/><t color='#ff0000' size='1.25'>[%1]</t>", LLSTRING(commanderOverride)], "PLAIN", -1, false, true];
    };
} else {
    // --- Player in Puppet Turret

    if (_puppetLookAt isEqualTo []) exitWith {
        if (_vehicle directionStabilizationEnabled _puppetTurret) then {
            // Because we have modified the turret's configs we always need to run this code once
            TRACE_1("automaticly disabling directionStabilization",_puppetTurret);
            _vehicle enableDirectionStabilization [false, _puppetTurret];
        };
    };

    if (_puppetLookAt isNotEqualTo _lookDirLast) then {
        TRACE_1("Starting turretLook",_puppetLookAt);
        playSound "ACE_Sound_Click";
        QGVAR(text) cutText [format ["<br/><br/><br/><br/><br/><t color='#ff0000' size='1.25'>[%1]</t>", "Commander Override"], "PLAIN", -1, false, true];

        _lookDirLast = _puppetLookAt;
        _args set [5, _lookDirLast];
        _lookStarted = CBA_missionTime;
        _args set [6, _lookStarted];
        _lookStable = -1;
        _args set [7, _lookStable];

        _vehicle enableDirectionStabilization [true, _puppetTurret];
    };

    private _eyePos = eyePos _vehicle;
    private _lookPoint = _eyePos vectorAdd (_puppetLookAt vectorMultiply 5000);
    _vehicle lockCameraTo [_lookPoint, _puppetTurret];

    private _currentDirPol = [_vehicle, _puppetTurret] call CBA_fnc_turretDir; // [az,el]
    private _currentDir = ([1] + _currentDirPol) call CBA_fnc_polar2vect;
    private _angleOffset = acos (_puppetLookAt vectorCos _currentDir);

    private _canExit = false; 
    if (_lookStable < 0) then {
        if (_angleOffset < 0.5) then {
            TRACE_1("turret reached dir",_angleOffset);
            _lookStable = CBA_missionTime;
            _args set [7, _lookStable];
        };
    } else {
        _canExit = (CBA_missionTime - _lookStable) > 0.33;
    };


    private _timeSpent = CBA_missionTime - _lookStarted; // Limit max time (in-case turret broke or can't actually reach desination)
    if (_canExit || {_timeSpent > 6}) then {
        TRACE_2("finished turretLook",_angleOffset,_timeSpent);
        _vehicle enableDirectionStabilization [false, _puppetTurret];
        _vehicle setVariable [QGVAR(puppetLookAt), nil, true];
    };
};
