/*
 * Author: Jonpas
 * Sits down the player.
 *
 * Arguments:
 * 0: Seat <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [seat, player] call ace_sitting_fnc_sit;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_actionID", "_configFile", "_sitDirection", "_sitPosition", "_seatPosOrig"];

params ["_seat", "_player"];

// Overwrite weird position, because Arma decides to set it differently based on current animation/stance...
_player switchMove "amovpknlmstpsraswrfldnon";

// Add scroll-wheel action to release object
_actionID = _player addAction [
    format ["<t color='#FFFF00'>%1</t>", localize LSTRING(Stand)],
    QUOTE((_this select 0) call FUNC(stand)),
    nil,
    20,
    false,
    true,
    "GetOut",
    QUOTE(_this call FUNC(canStand))
];

// Read config
_configFile = configFile >> "CfgVehicles" >> typeOf _seat;
_sitDirection = (getDir _seat) + getNumber (_configFile >> QGVAR(sitDirection));
_sitPosition = getArray (_configFile >> QGVAR(sitPosition));

// Get random animation and perform it (before moving player to ensure correct placement)
[_player, call FUNC(getRandomAnimation), 2] call EFUNC(common,doAnimation); // Correctly places when using non-transitional animations
[_player, "", 1] call EFUNC(common,doAnimation); // Correctly applies animation's config values (such as disallow throwing of grenades, intercept keybinds... etc).

// Set direction and position
_player setDir _sitDirection;
// No need for ATL/ASL as modelToWorld returns in format position
_player setPos (_seat modelToWorld _sitPosition);

// Set variables, save seat object on player
_player setVariable [QGVAR(isSitting), [_seat, _actionID]];
_seat setVariable [QGVAR(seatOccupied), true, true]; // To prevent multiple people sitting on one seat


// Add automatical stand PFH in case of interruptions
_seatPosOrig = getPosASL _seat;
[{
    params ["_args", "_pfhId"];
    _args params ["_player", "_seat", "_seatPosOrig"];

    // Remove PFH if not sitting any more
    if (isNil {_player getVariable QGVAR(isSitting)}) exitWith {
        [_pfhId] call CBA_fnc_removePerFrameHandler;
        TRACE_1("Remove PFH",_player getVariable [ARR_2(QGVAR(isSitting), false)]);
    };

    //  Stand up if chair gets deleted or moved
    if (isNull _seat || !((getPosASL _seat) isEqualTo _seatPosOrig)) exitWith {
        _player call FUNC(stand);
        TRACE_2("Chair moved",getPosASL _seat,_seatPosOrig);
    };
}, 0, [_player, _seat, _seatPosOrig]] call CBA_fnc_addPerFrameHandler;
