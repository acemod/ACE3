/*
 * Author: mharis001
 * Zeus module function to make unit a suicide bomber.
 *
 * Arguments:
 * 0: Unit that is suicide bomber <OBJECT>
 * 1: Activation side <SIDE> (default: west)
 * 2: Activation radius <NUMBER> (default: 10)
 * 3: Explosion size (0 - Small, 1 - Medium, 2 - Large) <NUMBER> (default: 0)
 * 4: Auto seek <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, west, 10, 0, true] call ace_zeus_fnc_moduleSuicideBomber
 *
 * Public: No
 */
#include "script_component.hpp"

#define EXPLOSIVES ["R_TBG32V_F", "M_Mo_120mm_AT", "Bo_GBU12_LGB"]
#define DISTANCE_FAR 15
#define DISTANCE_CLOSE 2
#define MOVE_TIME 10
#define SCANNING_PERIOD 1

#ifdef DEBUG_MODE_FULL
    #define SCANNING_PERIOD 0
#endif

TRACE_1("params",_this);

if (isNull (_this select 0)) exitWith {};

// Prevent another suicide bomber module being attached
_unit setVariable [QGVAR(suicideBomber), true, true];

// One time behaviour changes
if (_autoSeek) then {
    [QEGVAR(ai,setUnitPos), [_unit, "UP"], _unit] call CBA_fnc_targetEvent;
    [QEGVAR(ai,setSpeedMode), [_unit, "FULL"], _unit] call CBA_fnc_targetEvent;
    [QEGVAR(ai,setBehaviour), [[_unit], "CARELESS"], _unit] call CBA_fnc_targetEvent;
    [QEGVAR(ai,setCombatMode), [_unit, "BLUE"], _unit] call CBA_fnc_targetEvent;
    [QEGVAR(ai,AISection), [[_unit], ["TARGET", "AUTOTARGET"], false], _unit] call CBA_fnc_targetEvent;
    [QEGVAR(ai,allowFleeing), [_unit, 0], _unit] call CBA_fnc_targetEvent;
};

// Run PFH to make unit a suicide bomber
[{
    params ["_args", "_pfhID"];
    _args params [["_unit", objNull], ["_activationSide", west], ["_activationRadius", 10], ["_explosionSize", 0], ["_autoSeek", false]];

    // Unit deleted or killed
    if (isNull _unit || {!alive _unit}) exitWith {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
        LOG("Unit deleted or killed, PFH removed");
    };

    if (!([_unit] call EFUNC(common,isAwake))) exitWith {};

    // Detonation
    private _nearObjects = (_unit nearObjects _activationRadius) select {side _x == _activationSide && {_x != _unit} && {alive _x}};
    if !(_nearObjects isEqualTo []) then {
        createVehicle [EXPLOSIVES select _explosionSize, _unit, [], 0, "CAN_COLLIDE"];
        [_pfhID] call CBA_fnc_removePerFrameHandler;
        LOG("Explosion created, PFH removed");
    };

    // Auto Seek
    if (!_autoSeek) exitWith {};

    private _memory = _unit getVariable [QGVAR(suicideBomber_memory), [nil, CBA_missionTime]];
    _memory params ["_lastMove", "_lastTime"];

    private _range = 100 + 100 * (_unit skillFinal "spotDistance"); // 100-200
    private _nearestObjects = nearestObjects [_unit, [], _range] select {side _x == _activationSide && {_x != _unit} && {alive _x}};

    #ifdef DEBUG_MODE_FULL
        if !(isNil "_lastMove") then {
            drawLine3D [_unit modelToWorldVisual [0, 0, 1], _lastMove, [1, 0, 0, 1]];
        };
        for "_i" from 0 to 35 do {
            drawLine3D [(_unit getRelPos [_range, _i * 10]) vectorAdd [0, 0, 1], (_unit getRelPos [_range, (_i + 1) * 10]) vectorAdd [0, 0, 1], [0, 1, 0, 1]];
        };
        for "_i" from 0 to 35 do {
            drawLine3D [(_unit getRelPos [_activationRadius, _i * 10]) vectorAdd [0, 0, 1], (_unit getRelPos [_activationRadius, (_i + 1) * 10]) vectorAdd [0, 0, 1], [0, 0, 1, 1]];
        };
        for "_i" from 0 to 359 do {
            if (_i >= linearConversion [_lastTime - MOVE_TIME, _lastTime, CBA_missionTime, 0, 359, true]) then {
                drawLine3D [(_unit getRelPos [2, _i]) vectorAdd [0, 0, 1], (_unit getRelPos [2, _i + 1]) vectorAdd [0, 0, 1], [1, 1, 0, 1]];
            };
        };
    #endif

    if (_nearestObjects isEqualTo []) exitWith {};

    // Get relative position close to target to avoid bug where AI wont path to a certain position
    private _moveToPos = (_nearestObjects select 0) getPos [1, random 360];

    if (isNil "_lastMove" || // No move given yet
        {_lastMove distance _moveToPos > DISTANCE_FAR} || // New target is too far from last move
        {_lastMove distance _unit < DISTANCE_CLOSE} || // Unit has reached last move
        {CBA_missionTime >= _lastTime} // Too much time passed between last move (also acts as a fail-safe if unit gets stuck)
    ) then {
        [QEGVAR(ai,doMove), [[[_unit, _moveToPos]]], _unit] call CBA_fnc_targetEvent;
        _unit setVariable [QGVAR(suicideBomber_memory), [_moveToPos, CBA_missionTime + MOVE_TIME]];
        TRACE_2("Moving unit",_moveToPos,CBA_missionTime);
    };
}, SCANNING_PERIOD, _this] call CBA_fnc_addPerFrameHandler;
