/*
 * Author: alganthe
 * Remove arsenal from an object
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

#include "script_component.hpp"

params ["_logic"];
if (!local _logic) exitWith {};

private _object = attachedTo _logic;
TRACE_3("moduleRemoveArsenal",_logic,_object,typeOf _object);

switch (true) do {
    case (isNull _object): {
        [LSTRING(NothingSelected)] call FUNC(showMessage);
    };
    case (isPlayer _object): {
        ["str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call FUNC(showMessage);
    };
    case (!alive _object): {
        [LSTRING(OnlyAlive)] call FUNC(showMessage);
    };
    default {

        if (["ACE_Arsenal"] call EFUNC(common,isModLoaded)) then {

            [_object, true, true] call EFUNC(arsenal,removeBox);
        } else {

            TRACE_1("Calling removeVirtualXXXCargo functions",_object);
            [_object, (_object call BIS_fnc_getVirtualItemCargo), true] call BIS_fnc_removeVirtualItemCargo;
            [_object, (_object call BIS_fnc_getVirtualWeaponCargo), true] call BIS_fnc_removeVirtualWeaponCargo;
            [_object, (_object call BIS_fnc_getVirtualMagazineCargo), true] call BIS_fnc_removeVirtualMagazineCargo;
            [_object, (_object call BIS_fnc_getVirtualBackpackCargo), true] call BIS_fnc_removeVirtualBackpackCargo;
        };
    };
};

deleteVehicle _logic;
