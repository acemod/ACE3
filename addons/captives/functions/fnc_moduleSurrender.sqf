/*
 * Author: PabstMirror
 * Module Function to make a unit surrender (can be called from editor, or placed with zeus)
 *
 * Arguments:
 * 0: The Module Logic Object <OBJECT>
 * 1: synced objects <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * Called from module
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_logic,_units,_activated);

if (!_activated) exitWith {};

if (local _logic) then {
    if ((!isnull curatorcamera) && {((count curatorMouseOver) == 2) && {(curatorMouseOver select 1) == _logic}}) then {//in zeus interface and we placed the module
        _bisMouseOver = missionNamespace getVariable ["bis_fnc_curatorObjectPlaced_mouseOver", []];//bis caches the previous curatorMouseOver
        if ((count _bisMouseOver) == 2) then {//check what mouse was over before the module was placed
            _mouseOverObject = _bisMouseOver select 1;
            if ((_mouseOverObject isKindOf "CAManBase") && {(vehicle _mouseOverObject) == _mouseOverObject}) then {
                systemChat format ["Debug - module surrendering %1", (name _mouseOverObject)];
                [_mouseOverObject, true] call FUNC(setSurrendered);

                if (!(_mouseOverObject getVariable [QGVAR(isSurrendering), false])) then {
                    ["SetSurrendered", [_mouseOverObject], [_mouseOverObject, true]] call EFUNC(common,targetEvent);
                } else {
                    ["SetSurrendered", [_mouseOverObject], [_mouseOverObject, false]] call EFUNC(common,targetEvent);
                };

            } else {
                systemChat format ["Only use on dismounted inf"];
            };
        } else {
            systemChat format ["Nothing under mouse"];
        };
    } else {//an editor module
        {
            systemChat format ["Debug - module surrendering %1", (name _x)];
            [_x, true] call FUNC(setSurrendered);
        } forEach _units;
    };

    deleteVehicle _logic;
};
