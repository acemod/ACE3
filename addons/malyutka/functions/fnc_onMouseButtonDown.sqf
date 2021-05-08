#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Handles mouse interaction when carrying plug
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, plug] call ace_malyutka_fnc_onMouseButtonDown
 *
 * Public: No
 */
params ["", "_button"];
private _unit = ACE_PLAYER;
private _plug = _unit getVariable [QGVAR(carryingPlug), objNull];

if (_button > 1 || _plug isEqualTo objNull) exitWith {

};

if (_button == 1) then {
    // RMB
    _plug setVariable [QGVAR(dropped), true];
} else {
    // LMB
    getCursorObjectParams params ["_cursorObject", "", "_distance"];
    if (!isNull _cursorObject && {_distance < ATTACH_DISTANCE}) then {
        if (
            _cursorObject isKindOf QGVAR(9m14_joystick) &&
            { ([_suitcase, _cursorObject] call FUNC(canAttachPlug)) }
        ) then {
            [_plug getVariable QGVAR(origin), _cursorObject] call FUNC(attachPlug);
            _plug setVariable [QGVAR(dropped), true];
        };

        if (
            _cursorObject isKindOf QGVAR(9m14) &&
            { _cursorObject isEqualTo (_plug getVariable QGVAR(origin)) }
        ) then {
            [_plug, _cursorObject] call FUNC(returnPlug);
        };
    };
};

