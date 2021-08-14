#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Called per frame. Handles current unit state for attaching a rope to two vehicles
 *
 * Arguments:
 * 0: Unit wanting to start towing <OBJECT>
 * 1: Vehicle to tow from <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_towing_fnc_startTow
 *
 * Public: No
 */
params ["_args", "_handle"];
_args params ["_state", "_unit", "_parent", "_rope", "_length", "_ropeClass"];

private _exitCondition = !(
    (alive GVAR(attachHelper)) &&
    { alive _target } &&
    { alive _unit } &&
    { "" isEqualTo currentWeapon _unit || { _unit call EFUNC(common,isSwimming) }} &&
    { [_unit, objNull, [INTERACTION_EXCEPTIONS]] call EFUNC(common,canInteractWith) } &&
    { "unconscious" isNotEqualTo toLower animationState _unit } &&
    { !(_unit getVariable ["ACE_isUnconscious", false]) }
);

if (_exitCondition) then {
    _state = TOW_STATE_CANCEL;
};

switch (_state) do {
    case TOW_STATE_ATTACH_PARENT: {
        TRACE_2("state attach parent",_unit,_parent);
        [_unit, _parent, objNull, objNull] call FUNC(attachRopePFH);

        if (GVAR(canAttach) && { GVAR(mouseLeft) }) then {
            _args set [0, TOW_STATE_ATTACH_CHILD];
            _rope = ropeCreate [_parent, _parent worldToModelVisual ASLtoAGL getPosASLVisual GVAR(attachHelper), _length];
            [GVAR(attachHelper), [0, 0, 0]] ropeAttachTo _rope;

            _args set [3, _rope];
        };

        if (GVAR(mouseRight)) then {
            _args set [0, TOW_STATE_CANCEL];
        };
    };
    case TOW_STATE_ATTACH_CHILD: {
        TRACE_3("state attach child",_unit,_parent,_rope);
        [_unit, objNull, _parent, _rope] call FUNC(attachRopePFH);

        if (GVAR(canAttach) && { GVAR(mouseLeft) }) then {
            _args set [0, TOW_STATE_ATTACH];
        };

        if (GVAR(mouseRight)) then {
            _args set [0, TOW_STATE_CANCEL];
        };
    };
    case TOW_STATE_ATTACH: {
        TRACE_3("state attach",GVAR(attachHelper),_parent,_rope);
        private _child = GVAR(attachHelper) getVariable [QGVAR(object), objNull];
        private _relativeAttachPos = _child worldToModelVisual ASLtoAGL getPosASLVisual GVAR(attachHelper);

        TRACE_3("child&pos",_parent,_child,_relativeAttachPos);

        if (_child isEqualTo _parent) exitWith {
            _args set [0, TOW_STATE_CANCEL];
            ERROR_MSG("_child isEqualTo _parent");
        };

        [QGVAR(setTowParent), [_parent, _child], _parent] call CBA_fnc_targetEvent;
        [QGVAR(lockVehicle), [_child, true]] call CBA_fnc_globalEvent;

        GVAR(attachHelper) ropeDetach _rope;
        [_child, _relativeAttachPos] ropeAttachTo _rope;

        private _hook = createVehicle [QGVAR(hook), [0, 0, 0], [], 0, "NONE"];
        _hook attachTo [_child, _relativeAttachPos];

        _hook setVariable [QGVAR(parent), _parent, true];
        _hook setVariable [QGVAR(child), _child, true];
        _child setVariable [QGVAR(rope), _rope, true];
        _child setVariable [QGVAR(hook), _hook, true];

        _hook setVariable [QGVAR(ropeClass), _ropeClass, true];

        _child setVariable [QGVAR(towing), true, true];
        _parent setVariable [QGVAR(towing), true, true];

        _parent setVariable [QGVAR(ropeBreakEventHandler), _parent addEventHandler ["RopeBreak", {
            params ["_parent", "_rope", "_child"];

            [objNull, _parent, _child] call FUNC(detach);

            _parent removeEventHandler ["RopeBreak", _parent getVariable QGVAR(ropeBreakEventHandler)];
            _parent setVariable [QGVAR(ropeBreakEventHandler), -1];
        }], true];

        _args set [0, TOW_STATE_CLEANUP];
    };
    case TOW_STATE_CANCEL: {
        TRACE_1("state cancel",_rope);
        ropeDestroy _rope;
        [_unit, _ropeClass, true] call CBA_fnc_addItem;
        _args set [0, TOW_STATE_CLEANUP];
    };
    case TOW_STATE_CLEANUP: {
        TRACE_2("state cleanup",GVAR(attachHelper),_handle);
        deleteVehicle GVAR(attachHelper);
        [_handle] call CBA_fnc_removePerFrameHandler;
        call EFUNC(interaction,hideMouseHint);
    };
};

