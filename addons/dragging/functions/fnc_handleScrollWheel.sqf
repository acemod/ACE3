/*
 * Author: L-H, commy2
 *
 * Handles raising and lowering the dragged weapon to be able to place it on top of objects.
 *
 * Argument:
 * 0: Scroll amount (Number)
 *
 * Return value:
 * Handled or not. (Bool)
 */
#include "script_component.hpp"

// requires modifier key to be hold down
if (GETMVAR(ACE_Modifier,0) == 0) exitWith {false};

private "_unit";
_unit = ACE_player;

// EH is always assigned. Exit and don't overwrite input if not carrying
if !(_unit getVariable [QGVAR(isCarrying), false]) exitWith {false};

private "_scrollAmount";

_scrollAmount = _this select 0;

// move carried item 15 cm per scroll interval
_scrollAmount = _scrollAmount * 0.15;

private "_carriedItem";
_carriedItem = _unit getVariable [QGVAR(carriedObject), objNull];

//disabled for persons
if (_carriedItem isKindOf "CAManBase") exitWith {false};

private ["_position", "_maxHeight"];

_position = getPosATL _carriedItem;
_maxHeight = (_unit modelToWorldVisual [0,0,0]) select 2;

_position set [2, ((_position select 2) + _scrollAmount min (_maxHeight + 1.5)) max _maxHeight];

// move up/down object and reattach at current position
detach _carriedItem;
_carriedItem setPosATL _position;
_carriedItem attachTo [_unit];

true
