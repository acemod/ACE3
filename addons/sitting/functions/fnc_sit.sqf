#include "..\script_component.hpp"
/*
 * Author: Jonpas, vabene1111
 * Makes the player sit down.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 * 1: Player <OBJECT>
 * 2: Seat Position <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_sitting_fnc_sit
 * [cursorObject, player, 0] call ace_sitting_fnc_sit
 *
 * Public: No
 */

params ["_seat", "_player", ["_seatPos", 0]];
TRACE_3("sit",_seat,_player,_seatPos);

// Overwrite weird position, because Arma decides to set it differently based on current animation/stance...
_player switchMove "amovpknlmstpsraswrfldnon";

// Add scroll-wheel action to release object
private _actionID = _player addAction [
    format ["<t color='#FFFF00'>%1</t>", LLSTRING(Stand)],
    QUOTE((_this select 0) call FUNC(stand)),
    nil,
    20,
    false,
    true,
    "GetOut",
    QUOTE(call FUNC(canStand))
];

// Read config
private _configFile = configOf _seat;
private _sitDirection = (getDir _seat) + (_seat getVariable [QXGVAR(sitDirection), getNumber (_configFile >> QXGVAR(sitDirection))]);
private _sitPositionAll = _seat getVariable [QXGVAR(sitPosition), getArray (_configFile >> QXGVAR(sitPosition))];
private _multiSitting = (_sitPositionAll select 0) isEqualType [];

private _sitPosition = _sitPositionAll;
if (_multiSitting) then {
    _sitPosition = _sitPosition select _seatPos;
};

// Get random animation and perform it (before moving player to ensure correct placement)
[_player, [_seat] call FUNC(getRandomAnimation), 2] call EFUNC(common,doAnimation); // Correctly places when using non-transitional animations
[_player, "", 1] call EFUNC(common,doAnimation); // Correctly applies animation's config values (such as disallow throwing of grenades, intercept keybinds... etc).

TRACE_2("Sit pos and dir",_sitPosition,_sitDirection);

// Set direction and position
_player setDir _sitDirection;
//modelToWorld returns AGL
_player setPosASL (AGLToASL (_seat modelToWorld _sitPosition));

// Set variables, save seat object on player
_player setVariable [QGVAR(sittingStatus), [_seat, _actionID, _seatPos]];

// Prevent multiple people sitting on one seat
private _seatsClaimed = _seat getVariable [QGVAR(seatsClaimed), []];
// Initialize claimed seats if first time sitting on it
if (_seatsClaimed isEqualTo []) then {
    _seatsClaimed resize [count _sitPositionAll, objNull];
};
_seatsClaimed set [_seatPos, _player];
_seat setVariable [QGVAR(seatsClaimed), _seatsClaimed, true];

// Also prevent dragging/carrying
if !([_seat] call EFUNC(common,owned)) then {
    [_player, _seat] call EFUNC(common,claim);
};

// Automatically stand up if interrupted
private _seatPosOrig = getPosASL _seat;
private _seatDistOrig = (getPosASL _player) distance _seat;
[{
    params ["_args", "_pfhId"];
    _args params ["_player", "_seat", "_seatPos", "_seatPosOrig", "_seatDistOrig"];

    // Remove PFH if not sitting any more
    if (isNil {_player getVariable QGVAR(sittingStatus)}) exitWith {
        [_pfhId] call CBA_fnc_removePerFrameHandler;
        TRACE_1("Remove PFH",_player getVariable [ARR_2(QGVAR(sittingStatus),false)]);

        if (!alive _seat) exitWith {};

        // Allow sitting on this seat again
        private _seatsClaimed = _seat getVariable [QGVAR(seatsClaimed), []];
        _seatsClaimed set [_seatPos, objNull];
        _seat setVariable [QGVAR(seatsClaimed), _seatsClaimed, true];

        // Unclaim...
        [objNull, _seat] call EFUNC(common,claim);

        // ...but have a remaining unit reclaim ownership immediately
        private _index = _seatsClaimed findIf {!isNull _x};

        if (_index == -1) exitWith {};

        [_seatsClaimed select _index, _seat] call EFUNC(common,claim);
    };

    // Stand up if chair gets deleted or moved
    if (!alive _seat ||
        {getPosASL _player distance _seatPosOrig > _seatDistOrig + 0.5} ||
        {((getPosASL _seat) vectorDistance _seatPosOrig) > 0.01}
    ) exitWith {
        _player call FUNC(stand);
        TRACE_2("Chair moved",getPosASL _seat,_seatPosOrig);
    };
}, 0, [_player, _seat, _seatPos, _seatPosOrig, _seatDistOrig]] call CBA_fnc_addPerFrameHandler;

["ace_satDown", [_player, _seat, _seatPos]] call CBA_fnc_localEvent;
