#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Shows whether an opened container can still be dragged and/or carried with its current contents.
 * Icons are added next to the container load bar and update while items are moved.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Container <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_dragging_fnc_handleInventoryOpened
 *
 * Public: No
 */

params ["_unit", "_target"];

if (_unit != ACE_player) exitWith {};

if (missionNamespace getVariable [QGVAR(skipInventory), false]) exitWith {};
// Only check the opened container, the secondary container is usually the ground next to it
if (
    isNull _target ||
    {_target isKindOf "CAManBase"} ||
    {!(
        (_target getVariable [QGVAR(canDrag), false] && {!(_target getVariable [QGVAR(ignoreWeightDrag), false])}) ||
        {_target getVariable [QGVAR(canCarry), false] && {!(_target getVariable [QGVAR(ignoreWeightCarry), false])}}
    )}
) exitWith {};

TRACE_1("inventory opened on movable container",_target);

// The inventory display is not created yet when the event fires
[{!isNull findDisplay IDD_INVENTORY}, {
    params ["_target"];

    private _display = findDisplay IDD_INVENTORY;
    private _ctrlLoad = _display displayCtrl IDC_GROUND_LOAD;
    private _ctrlFilter = _display displayCtrl IDC_GROUND_FILTER;

    (ctrlPosition _ctrlLoad) params ["_loadX", "_loadY", "_loadW", "_loadH"];

    // Use the filter's height as a grid unit, horizontal and vertical grid units are the same size on screen
    private _iconH = (ctrlPosition _ctrlFilter) select 3;
    private _iconW = _iconH * 0.75;
    private _iconY = _loadY + (_loadH - _iconH) / 2;

    private _icons = [];

    {
        _x params ["_canVar", "_ignoreVar", "_iconPath"];

        if (_target getVariable [_canVar, false] && {!(_target getVariable [_ignoreVar, false])}) then {
            private _ctrlIcon = _display ctrlCreate ["RscPictureKeepAspect", -1];
            _ctrlIcon ctrlSetText _iconPath;
            _ctrlIcon setVariable [QGVAR(isDrag), _canVar == QGVAR(canDrag)];
            _icons pushBack _ctrlIcon;
        };
    } forEach [
        [QGVAR(canDrag), QGVAR(ignoreWeightDrag), QPATHTOF(UI\icons\box_drag.paa)],
        [QGVAR(canCarry), QGVAR(ignoreWeightCarry), QPATHTOF(UI\icons\box_carry.paa)]
    ];

    // Shrink the load bar to make room for the icons
    private _iconsW = count _icons * _iconW;
    _ctrlLoad ctrlSetPositionW (_loadW - _iconsW - _iconW * 0.25);
    _ctrlLoad ctrlCommit 0;

    {
        _x ctrlSetPosition [_loadX + _loadW - _iconsW + _forEachIndex * _iconW, _iconY, _iconW, _iconH];
        _x ctrlCommit 0;
    } forEach _icons;

    [{
        params ["_args", "_pfhID"];
        _args params ["_display", "_target", "_icons"];

        if (isNull _display || {isNull _target}) exitWith {
            _pfhID call CBA_fnc_removePerFrameHandler;
        };

        private _weight = _target call FUNC(getWeight);

        // Weapon holders also have an item limit
        private _tooManyItems = ["WeaponHolder", "WeaponHolderSimulated"] findIf {_target isKindOf _x} != -1 &&
            {count (weaponCargo _target + magazineCargo _target + itemCargo _target) > MAX_DRAGGED_ITEMS};

        {
            private _isDrag = _x getVariable QGVAR(isDrag);
            private _maxWeight = [GETMVAR(ACE_maxWeightCarry,1E11), GETMVAR(ACE_maxWeightDrag,1E11)] select _isDrag;
            private _canMove = !_tooManyItems && {_weight <= _maxWeight};

            _x ctrlSetTextColor ([[0.9, 0.1, 0.1, 1], [1, 1, 1, 1]] select _canMove);
            _x ctrlSetTooltip format [
                "%1: %2 / %3%4",
                [LLSTRING(Carry), LLSTRING(Drag)] select _isDrag,
                _weight toFixed 0,
                _maxWeight toFixed 0,
                ["", " - " + LLSTRING(UnableToDrag)] select (!_canMove)
            ];
        } forEach _icons;
    }, 0, [_display, _target, _icons]] call CBA_fnc_addPerFrameHandler;
}, [_target], 5] call CBA_fnc_waitUntilAndExecute;
