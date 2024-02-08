#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Creates vehicle detach actions for attached ropes.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Detach actions <ARRAY>
 *
 * Example:
 * cursorObject call ace_towing_fnc_getDetachActions
 *
 * Public: No
 */
params ["_vehicle"];

private _statement = {
    params ["", "_player", "_hook"];
    [_player, _hook] call FUNC(detachRope);
};

private _parentHooks = _vehicle getVariable [QGVAR(parentHooks), []];
private _childHooks = _vehicle getVariable [QGVAR(childHooks), []];

(_parentHooks + _childHooks) apply {
    private _hook = _x;
    _hook getVariable QGVAR(vars) params ["_hookParent", "_hookChild"];
    private _partner = [_hookParent, _hookChild] select (_vehicle == _hookParent);
    private _partnerName = getText (configOf _partner >> "displayName");
    private _partnerOwnerName = [_partner, true] call EFUNC(common,getName);
    if (_partnerOwnerName != "") then {
        _partnerName = format ["%1, %2", _partnerName, _partnerOwnerName];
    };
    private _name = format ["%1 (%2)", LLSTRING(detach), _partnerName];
    private _icon = [_partner] call EFUNC(common,getVehicleIcon);
    private _action = [format ["%1", _hook], _name, _icon, _statement, {true}, {}, _hook] call EFUNC(interact_menu,createAction);
    [_action, [], _vehicle]
}
