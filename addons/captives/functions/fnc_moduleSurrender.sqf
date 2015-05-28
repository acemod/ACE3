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
private ["_bisMouseOver", "_mouseOverObject"];

if (!_activated) exitWith {};

if (local _logic) then {
    if ((!isnull curatorcamera) && {((count curatorMouseOver) == 2) && {(curatorMouseOver select 1) == _logic}}) then {//in zeus interface and we placed the module
        _bisMouseOver = missionNamespace getVariable ["bis_fnc_curatorObjectPlaced_mouseOver", []];//bis caches the previous curatorMouseOver
        if ((count _bisMouseOver) == 2) then {//check what mouse was over before the module was placed
            _mouseOverObject = _bisMouseOver select 1;
            if ((_mouseOverObject isKindOf "CAManBase") && {(vehicle _mouseOverObject) == _mouseOverObject}) then {
                TRACE_2("Debug - module surrendering %1",_mouseOverObject,(name _mouseOverObject));
                if (alive _mouseOverObject) then {
                    if (!(_mouseOverObject getVariable [QGVAR(isSurrendering), false])) then {
                        ["SetSurrendered", [_mouseOverObject], [_mouseOverObject, true]] call EFUNC(common,targetEvent);
                    } else {
                        ["SetSurrendered", [_mouseOverObject], [_mouseOverObject, false]] call EFUNC(common,targetEvent);
                    };
                } else {
                    [LSTRING(Zeus_OnlyAlive)] call EFUNC(common,displayTextStructured);
                };
            } else {
                [LSTRING(Zeus_OnlyInfantry)] call EFUNC(common,displayTextStructured);
            };
        } else {
            [LSTRING(Zeus_NothingSelected)] call EFUNC(common,displayTextStructured);
        };
    } else {
        //an editor module
        //Modules run before postInit can instal the event handler, so we need to wait a little bit
        [{
            PARAMS_1(_units);
            {
                ["SetSurrendered", [_x], [_x, true]] call EFUNC(common,targetEvent);
            } forEach _units;
        }, [_units], 0.05, 0.05]call EFUNC(common,waitAndExecute);
    };

    deleteVehicle _logic;
};
