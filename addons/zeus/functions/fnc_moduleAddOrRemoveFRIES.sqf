#include "script_component.hpp"
/*
 * Author: 654wak654
 * Add/Removes FRIES from a helicopter.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleAddOrRemoveFRIES
 *
 * Public: No
 */

params ["_logic"];

if !(local _logic) exitWith {};

if !(["ace_fastroping"] call EFUNC(common,isModLoaded)) then {
    [LSTRING(RequiresAddon)] call FUNC(showMessage);
} else {
    (GETMVAR(BIS_fnc_curatorObjectPlaced_mouseOver,[""])) params ["_mouseOverType", "_mouseOverUnit"];

    if (_mouseOverType != "OBJECT") then {
        [LSTRING(NothingSelected)] call FUNC(showMessage);
    } else {
        if !(alive _mouseOverUnit) then {
            [LSTRING(OnlyAlive)] call FUNC(showMessage);
        } else {
            private _config = configFile >> "CfgVehicles" >> typeOf _mouseOverUnit;
            private _displayName = getText (_config >> "displayName");
            if !(isNumber (_config >> QEGVAR(fastroping,enabled))) then {
                [LSTRING(NotFastRopeCompatible), _displayName] call FUNC(showMessage);
            } else {
                private _fries = GETVAR(_mouseOverUnit,EGVAR(fastroping,FRIES),objNull);
                if (isNull _fries) then {
                    [QGVAR(equipFries), [_mouseOverUnit]] call CBA_fnc_serverEvent;
                } else {
                    if ([_mouseOverUnit] call EFUNC(fastroping,canCutRopes)) then {
                        [LSTRING(CantRemoveFRIES), _displayName] call FUNC(showMessage);
                    } else {
                        [_mouseOverUnit] call EFUNC(fastroping,cutRopes);
                        deleteVehicle _fries;
                    };
                };
            };
        };
    };
};

deleteVehicle _logic;
