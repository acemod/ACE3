/*
 * Author: Original by Josef Zemanek
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

// --- variables init

diag_log text format ["HERE %1", _unit];

_this spawn {
    params ["_unit"];
    TRACE_1("params",_unit);
    _defaultStamina = getNumber (configFile >> "CfgMovesFatigue" >> "staminaDuration");
    _runCD = getNumber (configFile >> "CfgMovesFatigue" >> "staminaCooldown");
    _exhaustionEnd = 10e10;

    sleep 1;

    while {TRUE} do {
        waitUntil {(local _unit && vehicle _unit == _unit) || isNull _unit || !alive _unit};
        if (isNull _unit || !alive _unit) exitWith {};
        _unit enableAimPrecision FALSE;
        _calcRem = 0;
        while {local _unit && alive _unit && !isNull _unit && vehicle _unit == _unit} do {
            _maxStamina = _defaultStamina - (_defaultStamina * load _unit);
            _noSprintLim = _maxStamina / 2;		// --- sprint treshold
            _noRunLim = 0;				// --- run treshold

            _tmout = 0.5;
            if !(isPlayer _unit) then {_tmout = 5 + random 5};	// --- longer timeout for AIs (performance tweak)

            // --- disable run / sprint based on stamina level

            if (getStamina _unit <= _noRunLim) then {
                if !(isForcedWalk _unit) then {
                    _unit forceWalk TRUE;
                    _exhaustionEnd = time + _runCD;
                    setStaminaScheme "Exhausted";
                };
            } else {
                if (isForcedWalk _unit && time > _exhaustionEnd) then {
                    _unit forceWalk FALSE;
                    setStaminaScheme "FastDrain";
                };
                if (getStamina _unit <= _noSprintLim) then {
                    if (isSprintAllowed _unit) then {
                        _unit allowSprint FALSE;
                        setStaminaScheme "FastDrain";
                    };
                } else {
                    if !(isSprintAllowed _unit) then {
                        _unit allowSprint TRUE;
                        setStaminaScheme "Default";
                    };
                };
            };

            _prevPos = getPosASL _unit;
            _prevStamina = (getStamina _unit) - _calcRem;
            if (_unit getVariable ["BIS_fatigueSlowDrain", FALSE]) then {
                sleep _tmout;
            } else {
                waitUntil {!(_unit getVariable ["BIS_fatigueSlowDrain", FALSE])};
            };
            sleep _tmout;
            if (!alive _unit || isNull _unit) exitWith {};
            _curPos = getPosASL _unit;
            _curStamina = getStamina _unit;
            _prevASL = _prevPos select 2;
            _staminaDiff = _prevStamina - _curStamina;

            // --- calculate & apply extended stamina drain based on terrain gradient

            if (_prevPos distance _curPos > 0.25) then {
                _curASL = _curPos select 2;
                _diffZ = _prevASL - _curASL;
                _diffZ = _diffZ;
                _grad = tan (_diffZ atan2 ([_prevPos, _curPos] call BIS_fnc_distance2D));
                if (_grad > -0.3 && _grad < 0.5 ) then {_grad = 0};	// --- ignore terrain gradients below sprinting threshold
                _addedDrain = abs (_staminaDiff * _grad * 10);
                if (isPlayer _unit) then {
                    _unit setVariable ["BIS_fatigueSlowDrain", TRUE];
                    _calcRem = _addedDrain;
                    _slowDrainScr = [_unit, _addedDrain, _tmout] spawn {
                        params ["_unit", "_drain", "_tmout"];
                        _tmout = (_tmout * 0.9);
                        _steps = 5;
                        for [{_i = 0}, {_i < _drain}, {_i = _i + (_drain / _steps)}] do {
                            _drainNow = (_drain / _steps);
                            player setStamina ((getStamina player) - _drainNow);
                            sleep (_tmout / _steps);
                        };
                    };
                    _unit setVariable ["BIS_fatigueSlowDrain", FALSE];
                } else {
                    _unit setStamina (_curStamina - _addedDrain);
                    _calcRem = 0;
                };
                //_unit setStamina (_curStamina - _addedDrain);
            };

            // --- slow down animations based on stamina level

            _animSpeedCoef = 0.6 + (0.4 * (_curStamina / _maxStamina));
            _maxSlowdown = getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState player >> "relSpeedMin");
            if (_maxSlowdown > 0 && _maxSlowdown > _animSpeedCoef) then {_animSpeedCoef = _maxSlowdown};	// --- respect maximum slowdown of a given animation defined in config
            _unit setAnimSpeedCoef _animSpeedCoef;

            // --- weapon sway

            _staminaPerc = _curStamina / _maxStamina;
            _stanceAimPrecision = getAnimAimPrecision player;
            _unit setCustomAimCoef (5 - (_staminaPerc * 5) + _stanceAimPrecision);
        };
        if !(alive _unit) exitWith {};
    };
};