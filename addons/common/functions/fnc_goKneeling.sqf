/*
 * Author: commy2
 * Move unit to kneeling position.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (_unit == vehicle _unit && stance _unit != "PRONE") then {
    _animation = switch (currentWeapon _unit) do {
        case "": {"AmovPknlMstpSnonWnonDnon"};
        case (primaryWeapon _unit): {"AmovPknlMstpSlowWrflDnon"};
        case (secondaryWeapon _unit): {"AmovPknlMstpSrasWlnrDnon"};
        case (handgunWeapon _unit): {"AmovPknlMstpSlowWpstDnon"};
        case (binocular _unit): {"AmovPknlMstpSoptWbinDnon"};
        default {nil};
    };

    if (isNil "_animation") exitWith {};

    [_unit, _animation] call FUNC(doAnimation);
};
