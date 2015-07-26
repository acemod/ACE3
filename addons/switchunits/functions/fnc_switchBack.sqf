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
 * [_originalPlayerUnit, _currentUnit] call FUNC(switchBack)
 *
 * Public: Yes
 */

#include "script_component.hpp"

PARAMS_1(_originalPlayerUnit);

[_originalPlayerUnit] joinSilent GVAR(OriginalGroup);

DFUNC(pfhSwitchBack) = {
    PARAMS_2(_args,_pfID);
    EXPLODE_2_PVT(_args,_originalPlayerUnit,_currentUnit);

    if (local _originalPlayerUnit) exitWith {
        selectPlayer _originalPlayerUnit;
        deleteVehicle _currentUnit;

        _layer = "BIS_fnc_respawnCounter" call bis_fnc_rscLayer;
        _layer cuttext ["","plain"];

        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };
};

[FUNC(pfhSwitchBack), 0.2, _this] call CBA_fnc_addPerFrameHandler;
