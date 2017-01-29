// by commy2
#include "script_component.hpp"

// fixes laser when being captured. Needed, because the selectionPosition of the right hand is used
[QEGVAR(captives,setHandcuffed), {if (_this select 1) then {(_this select 0) action ["ace_gunLightOff", _this select 0]};}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(nearUnits) = [];

["ace_settingsInitialized", {
    //If not enabled, dont't add draw eventhandler or PFEH (for performance)

    if (!GVAR(enabled)) exitWith {
        ["CBA_switchAttachment", {
            params ["_unit", "_prevItem", "_newItem", "_currWeaponType"];
            TRACE_4("CBA_switchAttachment eh",_unit,_prevItem,_newItem,_currWeaponType);
            if ((getNumber (configFile >> "CfgWeapons" >> _newItem >> "ACE_laserpointer")) > 0) then {
                TRACE_1("removing ACE_laserpointer",getNumber (configFile >> "CfgWeapons" >> _newItem >> "ACE_laserpointer"));
                switch (_currWeaponType) do {
                    case 0: {
                        _unit removePrimaryWeaponItem _newItem;
                        _unit addPrimaryWeaponItem _prevItem;
                    };
                    case 1: {
                        _unit removeHandgunItem _newItem;
                        _unit addHandgunItem _prevItem;
                    };
                    case 2: {
                        _unit removeSecondaryWeaponItem _newItem;
                        _unit addSecondaryWeaponItem _prevItem;
                    };
                };
                // Using hint as it will clear the message from CBA_accessory_fnc_switchAttachment
                hintSilent (localize "STR_A3_OPTIONS_DISABLED");
            };
        }] call CBA_fnc_addEventHandler;
    };

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
