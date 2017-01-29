// by commy2
#include "script_component.hpp"

// fixes laser when being captured. Needed, because the selectionPosition of the right hand is used
[QEGVAR(captives,setHandcuffed), {if (_this select 1) then {(_this select 0) action ["ace_gunLightOff", _this select 0]};}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(nearUnits) = [];
GVAR(index) = -1;
GVAR(laserClassesCache) = [] call CBA_fnc_createNamespace;
GVAR(redLaserUnits) = [];
GVAR(greenLaserUnits) = [];

#include "initKeybinds.sqf"

["ace_settingsInitialized", {
    // if not enabled, dont't add draw eventhandler or PFEH (for performance)
    if !(GVAR(enabled)) exitWith {};

    [{
        GVAR(nearUnits) = call FUNC(getNearUnits);
    }, 5, []] call CBA_fnc_addPerFrameHandler;

    // custom scheduler
    [{
        GVAR(index) = GVAR(index) + 1;
        private _unit = GVAR(nearUnits) param [GVAR(index), objNull];

        if (isNull _unit) exitWith {
            GVAR(index) = -1;
            GVAR(redLaserUnits) = [];
            GVAR(greenLaserUnits) = [];
        };

        private _weapon = currentWeapon _unit;
        private _laser = (_unit weaponAccessories _weapon) select 1;

        if (_laser != "") then {
            private _laserID = GVAR(laserClassesCache) getVariable _laser;

            if (isNil "_laserID") then {
                _laserID = getNumber (configFile >> "CfgWeapons" >> _laser >> "ACE_laserpointer");
                GVAR(laserClassesCache) setVariable [_laser, _laserID];
            };

            if (_unit isFlashlightOn _weapon) then {
                if (_laserID isEqualTo 1) exitWith {
                    GVAR(redLaserUnits) pushBackUnique _unit;
                };

                if (_laserID isEqualTo 2) exitWith {
                    GVAR(greenLaserUnits) pushBackUnique _unit;
                };
            };
        };
    }, 0.1, []] call CBA_fnc_addPerFrameHandler;

    addMissionEventHandler ["Draw3D", FUNC(onDraw)];
}] call CBA_fnc_addEventHandler;
