#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Inflames a unit.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ace_zeus_fnc_moduleBurn
 *
 * Public: No
 */

params ["_logic"];

if (!local _logic) exitWith {};

private _unit = attachedTo _logic;
deleteVehicle _logic;

switch (false) do {
    case (!isNull _unit): {
        [LSTRING(NothingSelected)] call FUNC(showMessage);
    };
    case (_unit isKindOf "CAManBase" && {getNumber (configOf _unit >> "isPlayableLogic") == 0}): {
        [LSTRING(OnlyInfantry)] call FUNC(showMessage);
    };
    case (["ace_fire"] call EFUNC(common,isModLoaded)): {
        [LSTRING(RequiresAddon)] call FUNC(showMessage);
    };
    default {
        [QEGVAR(fire,burn), [_unit, 5], _unit] call CBA_fnc_targetEvent;
    };
};
