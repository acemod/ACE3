#include "script_component.hpp"
/*
 * Author: commy2
 * On map main draw (may be any of the map controls)
 *
 * Arguments:
 * 0: Map control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_map_fnc_onDrawMap
 *
 * Public: No
 */

params ["_mapCtrl"];
private _display = ctrlParent _mapCtrl;

(_display displayCtrl 1016) ctrlShow GVAR(mapShowCursorCoordinates);

// hide clock when no watch in inventory, or whatever never ever
(_display displayCtrl 101) ctrlShow GVAR(hasWatch);

if (GVAR(updateActiveMap)) then {
    {
        TRACE_2("update",GVAR(activeMapTypeIDC),_x);
        private _ctrlMap = _display displayCtrl _x;
        if (_x == GVAR(activeMapTypeIDC)) then {
            _ctrlMap ctrlShow true;
            _ctrlMap setVariable [QEGVAR(mapEventHandlers,active), true];
        } else {
            _ctrlMap ctrlShow false;
            _ctrlMap setVariable [QEGVAR(mapEventHandlers,active), false];
        };
    } forEach getArray (configFile >> "RscDisplayMainMap" >> QEGVAR(mapEventHandlers,IDCs));
    GVAR(updateActiveMap) = false;
};

if (GVAR(activeMapTypeIDC) != 51) then {
    // update default map to the new maps position and scale to ensure marker placement works
    private _ctrlVanillaMap = _display displayCtrl 51;
    private _ctrlActiveMap = _display displayCtrl GVAR(activeMapTypeIDC);  // the currently active map
    if (ctrlMapAnimDone _ctrlVanillaMap) then {
        private _ctrlPos = ctrlPosition _ctrlVanillaMap;
        private _centerScreen = [_ctrlPos#0 + _ctrlPos#2 / 2, _ctrlPos#1 + _ctrlPos#3 / 2];
        private _centerPos = _ctrlActiveMap ctrlMapScreenToWorld _centerScreen;
        private _scale = ctrlMapScale _ctrlActiveMap;
        _ctrlVanillaMap ctrlMapAnimAdd [0.01, _scale, _centerPos];
        ctrlMapAnimCommit _ctrlVanillaMap;
    };
};
