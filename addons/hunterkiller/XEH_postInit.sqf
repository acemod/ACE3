#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(overrideModePressed) = 0;

["ACE3 Equipment", QGVAR(override), "Commander Override",
{
    GVAR(overrideModePressed) = 1;
}, {
    GVAR(overrideModePressed) = 0;
},
[16, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // Q

["ACE3 Equipment", QGVAR(overrideHigh), "Commander Override (high precision)",
{
    GVAR(overrideModePressed) = 2;
}, {
    GVAR(overrideModePressed) = 0;
},
[16, [true, false, false]], false, 0] call CBA_fnc_addKeybind; // ctrl+Q


DFUNC(pfeh) = {
    params ["_args", "_pfID"];
    _args params ["_player", "_playerTurret", "_vehicle", "_masterTurret", "_puppetTurret"];
    private _overrideMode = _vehicle getVariable [QGVAR(overrideMode), 0];

    if (_playerTurret isEqualTo _masterTurret) then {
        if (GVAR(overrideModePressed) == 2) then {
            private _lookDir = eyeDirection _vehicle; // assume obsTurret = masterTurret
            // ToDo: limit sync to just _puppet netID
            // ToDo: limitUpdate rate if no change
            _vehicle setVariable [QGVAR(overrieLookDir), _lookDir, true]; 
        };
        if (GVAR(overrideModePressed) != _overrideMode) then {
            _vehicle setVariable [QGVAR(overrideMode), GVAR(overrideModePressed), true];
            TRACE_1("updating mode",GVAR(overrideModePressed));
            playSound "ACE_Sound_Click";
        };
    } else {
        if (_overrideMode > 0) then {
            _vehicle enableDirectionStabilization [true, _puppetTurret];

            // private _dir = [_vehicle, _masterTurret] call CBA_fnc_turretDir; // doesn't work...

            private _eyePos = eyePos _vehicle;
            private _lookDir = eyeDirection _vehicle;   
            if (_overrideMode == 2) then {
                _lookDir = _vehicle getVariable [QGVAR(overrieLookDir), [0,0,1]];
            };

            private _lookPoint = _eyePos vectorAdd (_lookDir vectorMultiply 1000);

            _vehicle lockCameraTo [_lookPoint, _puppetTurret];
            // QGVAR(rsc) cutText ["OVERRIDE", "PLAIN DOWN"];
            hintSilent "OVERRIDE";
        } else {
            if (_vehicle directionStabilizationEnabled _puppetTurret) then {
                // QGVAR(rsc) cutText ["---", "PLAIN DOWN"];
                hintSilent "";
                TRACE_1("stopping override",_puppetTurret);
                _vehicle enableDirectionStabilization [false, _puppetTurret];
            };
        };
    };

};

GVAR(pfID) = -1;
["turret", {
    params ["_player", "_playerTurret"];
    if (GVAR(pfID) > -1) then {
        TRACE_1("PFEH Stopping",GVAR(pfID));
        [GVAR(pfID)] call CBA_fnc_removePerFrameHandler;
        GVAR(pfID) = -1;
    };
    if (_playerTurret isEqualTo []) exitWith {};
    
    private _vehicle = vehicle _player;
    private _config = (configOf _vehicle) >> "ace_hk";
    TRACE_3("turret eh",_player,_playerTurret,typeOf _vehicle);
    if ((getNumber (_config >> "enabled")) != 1) exitWith {};

    private _masterTurret = getArray (_config >> "master");
    private _puppetTurret = getArray (_config >> "puppet");

    if (_playerTurret in [_masterTurret, _puppetTurret]) then {
        GVAR(pfID) = [DFUNC(pfeh), 0, [_player, _playerTurret, _vehicle, _masterTurret, _puppetTurret]] call CBA_fnc_addPerFrameHandler;
        TRACE_1("PFEH Started",GVAR(pfID));
    };
}, true] call CBA_fnc_addPlayerEventHandler;

