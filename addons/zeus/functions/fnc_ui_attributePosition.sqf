/*
 * Author: SilentSpike
 * Initalises the `position` zeus module attribute
 *
 * Arguments:
 * 0: position controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_attributePosition
 *
 * Public: No
 */
#include "script_component.hpp"

//Generic Init:
params ["_control"];
private _display = ctrlParent _control;
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);

_control ctrlRemoveAllEventHandlers "setFocus";

//Specific on-load stuff:
private _map = _control controlsGroupCtrl 26469;

// Centre map on the logic initially
_map ctrlMapAnimAdd [0, ctrlMapScale _map, _logic];
ctrlMapAnimCommit _map;

private _fnc_onDraw = {
    params ["_map"];

    private _display = ctrlParent _map;
    private _pos = GETVAR(_display,GVAR(position),[]);
    private _radius = GETVAR(_display,GVAR(radius),0);

    if !(_pos isEqualTo []) then {
        // Works alongside radius attribute
        if (_radius == 0) then {
            _map drawIcon ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [0,0,0,1], _pos, 19, 19, 0, "", 0, 0];
        } else {
            _map drawEllipse [_pos, _radius, _radius, 0, [0,0,0,1], ""];
        };
    };
};

private _fnc_onMapClick = {
    params ["_map","_button"];

    if (_button == 0) then {
        private _display = ctrlParent _map;
        SETVAR(_display,GVAR(position),_pos);
    };
};

SETVAR(_display,GVAR(position),getPos _logic);
_map ctrlAddEventHandler ["draw",_fnc_onDraw];
_map ctrlAddEventHandler ["mouseButtonDown",_fnc_onMapClick];
