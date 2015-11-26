/*
 * Author: Original by BIS(Josef Zemanek), rewritten by PabstMirror
 * Offers a fatigue system more like pre-1.54
 *
 * Arguments:
 * 0: Player unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ace_fatigue_fnc_legacyFatigue
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#define ENABLE_PERFORMANCE_COUNTERS
#include "script_component.hpp"

#define TIME_FULL_CALC 0.5
#define TIME_UPDATE_STAMINA 0.1

params ["_unit"];
TRACE_1("params",_unit);

_unit enableAimPrecision false;

[{
    BEGIN_COUNTER(all);
    params ["_args", "_pfID"];
    _args params ["_unit", "_lastFastRun", "_lastFullRun", "_scriptedChangePerSecond", "_scriptedChangeDone", "_lastPos", "_lastStamina", "_exhaustionEnd"];

    if ((isNull _unit) || {!alive _unit} || {_unit != ACE_player}) exitWith {
        TRACE_1("null/dead/notplayer",_unit);
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    private _timeDiff = ACE_time - _lastFastRun; //time since last tick
    _args set [1, ACE_time]; //update _lastFastRun

    if (_timeDiff == 0) exitWith {END_COUNTER(all);};

    //Smootly decrease stamina over time (short fast code that is run often)
    if (_scriptedChangePerSecond != 0) then {
        private _changeInStamina = _timeDiff * _scriptedChangePerSecond;
        _unit setStamina (((getStamina _unit) + _changeInStamina) max 0);
        _scriptedChangeDone = _scriptedChangeDone + _changeInStamina;
        _args set [4, _scriptedChangeDone];
        // TRACE_3("tick",getStamina _unit,_changeInStamina,_scriptedChangeDone);
    };

    //Don't run the full calculation every time:
    if (ACE_time > (_lastFullRun + TIME_FULL_CALC)) then {
        BEGIN_COUNTER(full);
        _timeDiff = ACE_time - _lastFullRun; //time since last full calc
        _args set [2, ACE_time]; //update _lastFullRun

        //Get diff in position (checking that both this and last positions were spent on the ground)
        private _posDiff = [0,0,0];
        if ((_unit == (vehicle _unit)) && {isTouchingGround _unit}) then {
            if (!(_lastPos isEqualTo [])) then {
                _posDiff = (getPosASL _unit) vectorDiff _lastPos;
            };
            _args set [5, (getPosASL _unit)];
        } else {
            _args set [5, []];
        };

        private _curStamina = getStamina _unit;
        //The real (unscripted) change in stamina (cap incase of mission scripted modification):
        private _staminaChangePerSecond = (((_curStamina - _lastStamina - _scriptedChangeDone) / _timeDiff) max -2) min 2;
        _args set [4, 0]; //update _scriptedChangeDone
        _args set [6, _curStamina]; //update _lastStamina

        private _defaultStamina = getNumber (configFile >> "CfgMovesFatigue" >> "staminaDuration");
        private _maxStamina = _defaultStamina - (_defaultStamina * load _unit);
  
        TRACE_5("stamina",_maxStamina,_curStamina,_lastStamina,_scriptedChangeDone,_staminaChangePerSecond);

        if (_curStamina <= (_maxStamina * GVAR(canNoLongerRun))) then {
            if !(isForcedWalk _unit) then {
                TRACE_4("forceWalk true",_unit,_curStamina,_maxStamina,GVAR(canNoLongerRun));
                [_unit, "Fatigue", true] call EFUNC(common,setForceWalkStatus);
                _exhaustionEnd = ACE_time + GVAR(runCooldownAfterExhaustion);
                _args set [7, _exhaustionEnd];
                setStaminaScheme "Exhausted";
            };
        } else {
            if ((isForcedWalk _unit) && {ACE_time > _exhaustionEnd}) then {
                TRACE_4("forceWalk false",_unit,_curStamina,_maxStamina,GVAR(canNoLongerRun));
                [_unit, "Fatigue", false] call EFUNC(common,setForceWalkStatus);
                setStaminaScheme "FastDrain";
            };
            if (_curStamina <= (_maxStamina * GVAR(canNoLongerSprint))) then {
                if (isSprintAllowed _unit) then {
                    TRACE_4("allowSprint false",_unit,_curStamina,_maxStamina,GVAR(canNoLongerSprint));
                    _unit allowSprint false;
                    setStaminaScheme "FastDrain";
                };
            } else {
                if !(isSprintAllowed _unit) then {
                    TRACE_4("allowSprint true",_unit,_curStamina,_maxStamina,GVAR(canNoLongerSprint));
                    _unit allowSprint true;
                    setStaminaScheme "Default";
                };
            };
        };

        //Add scripted modifiers:
        
        //Get the coefficent for the "real" stamina change include lessening the effects of load:
        private _staminaCoefficent = if (_staminaChangePerSecond < 0) then {
            (_unit getVariable [QGVAR(staminaDrainMultiplier), GVAR(staminaDrainMultiplier)]) * (1 + ((GVAR(loadEffectOnMaxStamina) - 1) * (load _unit)));
        } else {
            (_unit getVariable [QGVAR(staminaRecoveryMultiplier), GVAR(staminaRecoveryMultiplier)]);
        };
        _scriptedChangePerSecond = (_staminaCoefficent - 1) * _staminaChangePerSecond; //The change needed so encounted stamina change matches expected
        _staminaChangePerSecond = _staminaCoefficent * _staminaChangePerSecond; //The "effective" stamina change after applying coefficent
        TRACE_4("Modifying real stamina / loss",load _unit,_staminaCoefficent,_scriptedChangePerSecond,_staminaChangePerSecond);


        //Handle change in terrain
        if ((vectorMagnitude _posDiff) > 0.25) then {
            private _gradient = ((tan ((_posDiff select 2) atan2 ([0,0,0] distance2D _posDiff))) min 1) max -1; //eg 0.2 for a 20% gradient
            if ((_gradient < -0.3) || {_gradient > 0.5}) then {
                // --- ignore terrain gradients below sprinting threshold???
                private _extraChangeFromTerrain = (-5 * abs (_staminaChangePerSecond * _gradient));
                TRACE_3("Terain effects",_posDiff,_gradient,_extraChangeFromTerrain);
                _scriptedChangePerSecond = _scriptedChangePerSecond + _extraChangeFromTerrain;
            };
        };

        //Handle Drag/Carry
        if (!isNull (_unit getVariable [QEGVAR(dragging,draggedObject), objNull])) then {
            private _drainFromDragging = _maxStamina * linearConversion [0, _maxStamina, _curStamina, -0.01, -0.05, true];
            TRACE_2("Dragging something",_unit,_drainFromDragging);
            _scriptedChangePerSecond = _scriptedChangePerSecond + _drainFromDragging;
        };
        if (!isNull (_unit getVariable [QEGVAR(dragging,carriedObject), objNull])) then {
            private _drainFromCarrying = _maxStamina * linearConversion [0, _maxStamina, _curStamina, -0.015, -0.075, true];
            TRACE_2("Carrying something",_unit,_drainFromCarrying);
            _scriptedChangePerSecond = _scriptedChangePerSecond + _drainFromCarrying;
        };

        _args set [3, _scriptedChangePerSecond];

        // --- slow down animations based on stamina level
        private _animSpeedCoef = linearConversion [0, (_maxStamina * 0.8), _curStamina, 0.6, 1, true];
        private _maxSlowdown = getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit >> "relSpeedMin");
        if ((_maxSlowdown > 0) && {_maxSlowdown > _animSpeedCoef}) then {_animSpeedCoef = _maxSlowdown}; // --- respect maximum slowdown of a given animation defined in config
        _unit setAnimSpeedCoef _animSpeedCoef;

        // --- weapon sway
        private _aimPrecision = (getAnimAimPrecision _unit) + linearConversion [0, _maxStamina, _curStamina, 5, 0, true];
        _unit setCustomAimCoef _aimPrecision;

        TRACE_5("end",_scriptedChangePerSecond,_curStamina,_maxStamina,_animSpeedCoef,_aimPrecision);
        END_COUNTER(full);
    };
    END_COUNTER(all);
}, TIME_UPDATE_STAMINA, [_unit, ACE_time, ACE_time, 0, 0, [], _curStamina, 10e10]] call CBA_fnc_addPerFrameHandler;
