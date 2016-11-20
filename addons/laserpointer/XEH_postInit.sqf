// by commy2
#include "script_component.hpp"

// fixes laser when being captured. Needed, because the selectionPosition of the right hand is used
[QEGVAR(captives,setHandcuffed), {if (_this select 1) then {(_this select 0) action ["ace_gunLightOff", _this select 0]};}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(nearUnits) = [];

#include "initKeybinds.sqf"

["ace_settingsInitialized", {
    //If not enabled, dont't add draw eventhandler or PFEH (for performance)
    if (!GVAR(enabled)) exitWith {};

    // @todo. Maybe move to common?
    [{
        // handle RHS / bugged vehicle slots
        private _camPosAGL = positionCameraToWorld [0,0,0];
        if !((_camPosAGL select 0) isEqualType 0) exitWith {};

        private _nearUnits = [];
        {
            _nearUnits append crew _x;
            if (count _nearUnits > 10) exitWith {
                _nearUnits resize 10;
            };
        } forEach nearestObjects [_camPosAGL, ["AllVehicles"], 50]; // when moving this, search also for units inside vehicles. currently breaks the laser in FFV

        GVAR(nearUnits) = _nearUnits;

    } , 5, []] call CBA_fnc_addPerFrameHandler;

    addMissionEventHandler ["Draw3D", {
        call FUNC(onDraw);
    }];
}] call CBA_fnc_addEventHandler;
