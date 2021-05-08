#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Handles carrying of plug
 *
 * Arguments:
 * 0: Unit carrying plug <OBJECT>
 * 1: Plug <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, plug] call ace_malyutka_fnc_carryPlugPFH
 *
 * Public: No
 */
params ["_unit", "_plug"];
private _originSuitcase = _plug getVariable QGVAR(origin);
private _rope = _originSuitcase getVariable QGVAR(plugRope);

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_rope", "_plug", "_suitcase"];

    private _exitCondition = !(
        !isNull _plug
        && !isNull _suitcase
        && { alive _unit }
        && {"" isEqualTo currentWeapon _unit || {_unit call EFUNC(common,isSwimming)}}
        && {[_unit, objNull, ["isNotInside", "isNotOnLadder", "isNotSwimming", "notOnMap"]] call EFUNC(common,canInteractWith)}
        && {"unconscious" isNotEqualTo toLower animationState _unit}
        && {!(_unit getVariable ["ACE_isUnconscious", false])}
    );

    if (_plug isNotEqualTo objNull && _suitcase isNotEqualTo objNull) then {
        _exitCondition = _exitCondition || (_plug getVariable QGVAR(dropped));
        _exitCondition = _exitCondition || ((_plug distance2d _suitcase) > MAX_WIRE_DISTANCE);
    };

    if (_exitCondition) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        call EFUNC(interaction,hideMouseHint);
        _unit setVariable [QGVAR(hint), []];
        _unit setVariable [QGVAR(carryingPlug), objNull];

        if ((_plug getVariable QGVAR(attachedControlBox)) isEqualTo objNull) then {
            detach _plug;
        };
        _plug setVariable [QGVAR(dropped), false];
    };

    private _hintLMB = "";
    private _hintRMB = localize ELSTRING(dragging,Drop);

    getCursorObjectParams params ["_cursorObject", "", "_distance"];
    if (!isNull _cursorObject && {_distance < ATTACH_DISTANCE}) then {
        if (
            _cursorObject isKindOf QGVAR(9m14_joystick) &&
            { ([_suitcase, _cursorObject] call FUNC(canAttachPlug)) }
        ) then {
            _hintLMB = localize LSTRING(attachPlug);
        };

        if (
            _cursorObject isKindOf QGVAR(9m14) &&
            { _cursorObject isEqualTo (_plug getVariable QGVAR(origin)) }
        ) then {
            _hintLMB = localize LSTRING(returnPlug);
        };
    };

    private _hint = [_hintLMB, _hintRMB];
    if (_hint isNotEqualTo (_unit getVariable [QGVAR(hint), []])) then {
        _unit setVariable [QGVAR(hint), _hint];
        _hint call EFUNC(interaction,showMouseHint);
    };

}, 0, [_unit, _rope, _plug, _originSuitcase]] call CBA_fnc_addPerFrameHandler;

