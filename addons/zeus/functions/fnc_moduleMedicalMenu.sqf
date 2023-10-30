#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Opens the medical menu for the unit
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call ace_zeus_fnc_moduleMedicalMenu
 *
 * Public: No
 */

params ["_logic"];

if !(local _logic) exitWith {};

private _unit = attachedTo _logic;
deleteVehicle _logic;

switch (false) do {
    case !(isNull _unit): {
        [LSTRING(NothingSelected)] call FUNC(showMessage);
    };
    case (_unit isKindOf "CAManBase"): {
        [LSTRING(OnlyInfantry)] call FUNC(showMessage);
    };
    case (["ace_medical_gui"] call EFUNC(common,isModLoaded)): {
        [LSTRING(RequiresAddon)] call FUNC(showMessage);
    };
    case ([objNull, _unit] call EFUNC(medical_gui,canOpenMenu)): {
        [LSTRING(MedicalMenuDisabled)] call FUNC(showMessage);
    };
    default {
        [_unit] call EFUNC(medical_gui,openMenu);
    };
};
