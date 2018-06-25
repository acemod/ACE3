#include "script_component.hpp"
/*
 * Author: bux578
 * Switches back to the original player unit
 *
 * Arguments:
 * 0: Original player unit <OBJECT>
 * 1: Respawned unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_originalPlayerUnit, _currentUnit] call ace_switchunits_fnc_switchBack
 *
 * Public: Yes
 */

params ["_originalPlayerUnit"];

[_originalPlayerUnit] joinSilent GVAR(OriginalGroup);

[{
    params ["_args", "_pfhId"];
    _args params ["_originalPlayerUnit", "_currentUnit"];

    if (local _originalPlayerUnit) exitWith {
        selectPlayer _originalPlayerUnit;

        // deleteVehicle _currentUnit;

        // private _layer = "BIS_fnc_respawnCounter" call bis_fnc_rscLayer;
        // _layer cuttext ["","plain"];

        [_pfhId] call CBA_fnc_removePerFrameHandler;
    };
}, 0.2, _this] call CBA_fnc_addPerFrameHandler;
