#include "..\script_component.hpp"
/*
 * Author: johnb43, Dystopian
 * Sets corpse position and direction and ensures synchronization in multiplayer.
 * Must be executed globally.
 *
 * Arguments:
 * 0: Corpse <OBJECT>
 * 1: Direction <NUMBER>
 * 2: Position ATL <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, 90, getPosATL player] call ace_dragging_fnc_moveCorpse
 *
 * Public: No
 */

#define MAX_CHECK_FRAMES 50
#define POSITION_THRESHOLD 0.25

#define STATE_POSITION_SET 0
#define STATE_SYNC_PENDING 1
#define STATE_VERIFY 2

params ["_corpse", "_dir", "_posATL"];
TRACE_5("moveCorpse",_dir,getDir _corpse,_posATL,getPosATL _corpse,getPosATL _corpse distance _posATL);

if (isNull _corpse) exitWith {};

// Allow the corpse to be synced for JIP players
if (isServer) then {
    GVAR(movedCorpses) pushBackUnique _corpse;
};

// Sync the corpse with its position
private _fnc_syncCorpse = {
    _this awake true;
    [{
        _this awake false;
    }, _this] call CBA_fnc_execNextFrame;
};

// Check if the corpse is already close to the target
// If so, don't teleport
if (getPosATL _corpse distance _posATL < POSITION_THRESHOLD) exitWith {
    [_fnc_syncCorpse, _corpse] call CBA_fnc_execNextFrame;
};

// Set direction before position
_corpse setDir _dir;
_corpse setPosATL _posATL;
TRACE_3("initialMove",getDir _corpse,getPosATL _corpse,getPosATL _corpse distance _posATL);

if (getPosATL _corpse distance _posATL < POSITION_THRESHOLD) exitWith {
    [_fnc_syncCorpse, _corpse] call CBA_fnc_execNextFrame;
};

[{
    params ["_args", "_handle"];
    _args params ["_state", "_frameCounter", "_corpse", "_posATL", "_dir", "_fnc_syncCorpse"];

    if (
        _frameCounter > MAX_CHECK_FRAMES
        || {isNull _corpse}
        || {!isNull objectParent _corpse}
        || {_corpse call EFUNC(common,owned)}
    ) exitWith {
        TRACE_3("end",_frameCounter,isNull _corpse,isNull objectParent _corpse);
        _handle call CBA_fnc_removePerFrameHandler;
    };
    _args set [1, _frameCounter + 1];

    // Wait one frame after sync
    if (_state == STATE_SYNC_PENDING) exitWith {_args set [0, STATE_VERIFY]};

    if (getPosATL _corpse distance _posATL < POSITION_THRESHOLD) then {
        if (_state == STATE_POSITION_SET) then {
            _corpse call _fnc_syncCorpse;
            _args set [0, STATE_SYNC_PENDING];
        };
    } else {
        TRACE_4("retryMove",_frameCounter,getDir _corpse,getPosATL _corpse,getPosATL _corpse distance _posATL);
        _corpse setDir _dir;
        _corpse setPosATL _posATL;
        _args set [0, STATE_POSITION_SET];
    };
}, 0, [STATE_POSITION_SET, 1, _corpse, _posATL, _dir, _fnc_syncCorpse]] call CBA_fnc_addPerFrameHandler;
