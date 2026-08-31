#include "..\script_component.hpp"
/*
 * Author: L-H, commy2, Smith
 * Handles rotation of object to unload.
 *
 * Arguments:
 * 0: Scroll amount <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1.2 call ace_csw_fnc_handleScrollWheel
 *
 * Public: No
 */

if (GVAR(deployPFH) == -1) exitWith {};

params ["_scrollAmount"];

private _deployedItem = GVAR(tripodPreviewObject);

if (!CBA_events_control) then {
    private _player = ACE_player;

    // Raise/lower
    // Move deployed item 10 cm per scroll interval
    _scrollAmount = _scrollAmount * 0.1;

    private _position = getPosASL _deployedItem;
    private _maxHeight = (_player modelToWorldVisualWorld [0, 0, 0]) select 2;

    _position set [2, ((_position select 2) + _scrollAmount min (_maxHeight + 1.5)) max _maxHeight];

    // Move up/down object and reattach at current position
    detach _deployedItem;

    // Uses this method of selecting position because setPosATL did not have immediate effect
    private _positionChange = _position vectorDiff (getPosASL _deployedItem);
    private _selectionPosition = _player worldToModel (ASLToAGL getPosWorld _deployedItem);
    _selectionPosition = _selectionPosition vectorAdd _positionChange;
    _deployedItem attachTo [_player, _selectionPosition];

    // Reset the deploy direction
    private _direction = _deployedItem getVariable [QGVAR(deployDirection_temp), 0];
    _deployedItem setDir _direction;
} else {
    // Rotate
    private _direction = _deployedItem getVariable [QGVAR(deployDirection_temp), 0];
    _scrollAmount = _scrollAmount * 10;
    _direction = _direction + _scrollAmount;

    _deployedItem setDir _direction;
    _deployedItem setVariable [QGVAR(deployDirection_temp), _direction];
};
