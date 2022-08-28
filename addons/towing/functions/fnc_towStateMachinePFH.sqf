#include "script_component.hpp"
/*
 * Author: Dani (TCVM)
 * Called per frame. Handles current unit state for attaching a rope to two vehicles.
 *
 * Arguments:
 * 0: PFEH Args <ARRAY>
 * 1: PFID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[],0]] call ace_towing_fnc_towStateMachinePFH
 *
 * Public: No
 */
params ["_args", "_handle"];
_args params ["_state", "_unit", "_parent", "_rope", "_length", "_ropeClass"];

private _exitCondition = !(
    (alive GVAR(attachHelper)) &&
    { alive _parent } &&
    { alive _unit } &&
    { "" isEqualTo currentWeapon _unit || { _unit call EFUNC(common,isSwimming) }} &&
    { [_unit, objNull, [INTERACTION_EXCEPTIONS]] call EFUNC(common,canInteractWith) } &&
    { "unconscious" isNotEqualTo toLower animationState _unit } &&
    { !(_unit getVariable ["ACE_isUnconscious", false]) } &&
    { ACE_player == _unit }
);

if (_exitCondition && {_state < TOW_STATE_CANCEL}) then {
    _state = TOW_STATE_CANCEL;
};

switch (_state) do {
    case TOW_STATE_ATTACH_PARENT: {
        // TRACE_2("state attach parent",_unit,_parent);
        [_unit, _parent, objNull, objNull, [0, 0, 0], _length] call FUNC(attachRopePFH);

        if (GVAR(canAttach) && { GVAR(mouseLeft) }) then {
            _args set [0, TOW_STATE_ATTACH_CHILD];
            // can't use unit hand because rope doesn't change position when hand moving
            // can't use createVehicleLocal because rope can be non-local (like parent) and it must be attached to global vehicle
            GVAR(helper) = createVehicle [QGVAR(helper), [0, 0, 0], [], 0, "CAN_COLLIDE"];
            GVAR(helper) attachTo [_unit, [0,0,0], "LeftHand", true];
            _rope = ropeCreate [_parent, _parent worldToModelVisual ASLtoAGL getPosASLVisual GVAR(attachHelper), GVAR(helper), [0,0,0], _length];
            _args set [3, _rope];
        };

        if (GVAR(mouseRight) || GVAR(cancel)) then {
            _args set [0, TOW_STATE_CANCEL];
            GVAR(cancel) = false;
        };
    };
    case TOW_STATE_ATTACH_CHILD: {
        // TRACE_3("state attach child",_unit,_parent,_rope);
        [_unit, objNull, _parent, _rope, getPosASLVisual _rope, _length] call FUNC(attachRopePFH);

        if (GVAR(canAttach) && { GVAR(mouseLeft) }) then {
            _args set [0, TOW_STATE_ATTACH];
        };

        if (GVAR(mouseRight) || GVAR(cancel)) then {
            _args set [0, TOW_STATE_CANCEL];
            GVAR(cancel) = false;
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

        if (GVAR(cancel)) exitWith {
            _args set [0, TOW_STATE_CANCEL];
            GVAR(cancel) = false;
        };

        detach GVAR(helper);
        // can't delete GVAR(helper) without ropeDetach which requires local rope (==parent), so pass it to owner
        if (isNull (_child getVariable [QGVAR(parent), objNull])) then {
            [QGVAR(attachVehicles), [_parent, _child, _relativeAttachPos, _rope, GVAR(helper)]] call CBA_fnc_globalEvent;
        } else {
            [QGVAR(ropeAttachTo), [_child, _relativeAttachPos, _rope, GVAR(helper)], _parent] call CBA_fnc_targetEvent;
        };

        private _hookParent = createVehicle [QGVAR(hook), [0, 0, 0], [], 0, "CAN_COLLIDE"];
        _hookParent attachTo [_parent, _parent worldToModelVisual ASLtoAGL getPosASLVisual _rope];

        private _hook = createVehicle [QGVAR(hook), [0, 0, 0], [], 0, "CAN_COLLIDE"];
        _hook attachTo [_child, _relativeAttachPos];

        _hook setVariable [QGVAR(parent), _parent, true];
        _hook setVariable [QGVAR(child), _child, true];
        _hook setVariable [QGVAR(rope), _rope, true];
        _hook setVariable [QGVAR(ropeClass), _ropeClass, true];
        _hook setVariable [QGVAR(hookParent), _hookParent, true];

        _hookParent setVariable [QGVAR(hook), _hook, true];
        _rope setVariable [QGVAR(hook), _hook, true];

        private _childParentHooks = _child getVariable [QGVAR(parentHooks), []];
        _childParentHooks pushBack _hook;
        _child setVariable [QGVAR(parentHooks), _childParentHooks, true];

        private _parentChildHooks = _parent getVariable [QGVAR(childHooks), []];
        _parentChildHooks pushBack _hook;
        _parent setVariable [QGVAR(childHooks), _parentChildHooks, true];

        _args set [0, TOW_STATE_CLEANUP];
    };
    case TOW_STATE_CANCEL: {
        TRACE_1("state cancel",_rope);
        if !(isNull _rope) then {
            detach GVAR(helper);
            deleteVehicle GVAR(helper);
            ropeDestroy _rope;
        };
        [_unit, _ropeClass, true] call CBA_fnc_addItem;
        _args set [0, TOW_STATE_CLEANUP];
        GVAR(cancel) = false;

        (localize LSTRING(canceled)) call CBA_fnc_notify;
    };
    case TOW_STATE_CLEANUP: {
        TRACE_2("state cleanup",GVAR(attachHelper),_handle);
        deleteVehicle GVAR(attachHelper);
        [_handle] call CBA_fnc_removePerFrameHandler;
        ["MouseButtonDown", GVAR(onMouseButtonDownEHID)] call CBA_fnc_removeDisplayHandler;
        _unit setVariable [QGVAR(hint), []];
        call EFUNC(interaction,hideMouseHint);
    };
};
