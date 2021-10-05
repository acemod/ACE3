// by commy2
#include "script_component.hpp"

// fixes laser when being captured. Needed, because the selectionPosition of the right hand is used
[QEGVAR(captives,setHandcuffed), {if (_this select 1) then {(_this select 0) action ["GunLightOff", _this select 0]};}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(nearUnits) = [];
GVAR(index) = -1;
GVAR(laserClassesCache) = [] call CBA_fnc_createNamespace;
GVAR(redLaserUnits) = [];
GVAR(greenLaserUnits) = [];

["CBA_settingsInitialized", {
    // If not enabled, dont't add draw eventhandler or PFEH (for performance)
    if (!GVAR(enabled)) exitWith {
        ["CBA_attachmentSwitched", {
            params ["_unit", "_prevItem", "_newItem", "_currWeaponType"];
            TRACE_4("CBA_attachmentSwitched eh",_unit,_prevItem,_newItem,_currWeaponType);
            if ((getNumber (configFile >> "CfgWeapons" >> _newItem >> "ACE_laserpointer")) > 0) then {
                TRACE_1("removing ACE_laserpointer",getNumber (configFile >> "CfgWeapons" >> _newItem >> "ACE_laserpointer"));
                [1, "prev"] call CBA_accessory_fnc_switchAttachment;
            };
        }] call CBA_fnc_addEventHandler;
    };

    [{
        private _oldNearUnits = GVAR(nearUnits);
        GVAR(nearUnits) = call FUNC(getNearUnits);

        // remove units that moved away
        {
            GVAR(redLaserUnits) deleteAt (GVAR(redLaserUnits) find _x);
            GVAR(greenLaserUnits) deleteAt (GVAR(greenLaserUnits) find _x);
        } forEach (_oldNearUnits - GVAR(nearUnits));
    }, 5, []] call CBA_fnc_addPerFrameHandler;


    private _fnc_processUnit = {
        params ["_unit"];

        private _weapon = currentWeapon _unit;
        if (!(_unit isFlashlightOn _weapon)) exitWith {
            GVAR(redLaserUnits) deleteAt (GVAR(redLaserUnits) find _unit);
            GVAR(greenLaserUnits) deleteAt (GVAR(greenLaserUnits) find _unit);
        };

        private _laser = [(_unit weaponAccessories _weapon) select 1] param [0, ""];
        if (_laser isEqualTo "") exitWith {
            GVAR(redLaserUnits) deleteAt (GVAR(redLaserUnits) find _unit);
            GVAR(greenLaserUnits) deleteAt (GVAR(greenLaserUnits) find _unit);
        };

        private _laserID = GVAR(laserClassesCache) getVariable _laser;

        if (isNil "_laserID") then {
            _laserID = getNumber (configFile >> "CfgWeapons" >> _laser >> "ACE_laserpointer");
            GVAR(laserClassesCache) setVariable [_laser, _laserID];
        };
        TRACE_3("",_weapon,_laser,_laserID);

        if (_laserID isEqualTo 1) exitWith {
            GVAR(redLaserUnits) pushBackUnique _unit;
            GVAR(greenLaserUnits) deleteAt (GVAR(greenLaserUnits) find _unit);
        };

        if (_laserID isEqualTo 2) exitWith {
            GVAR(greenLaserUnits) pushBackUnique _unit;
            GVAR(redLaserUnits) deleteAt (GVAR(redLaserUnits) find _unit);
        };
    };

    // custom scheduler
    [{
        params ["_fnc_processUnit"];

        ACE_player call _fnc_processUnit;

        GVAR(index) = GVAR(index) + 1;
        private _unit = GVAR(nearUnits) param [GVAR(index), objNull];

        if (isNull _unit) exitWith {
            GVAR(index) = -1;
        };

        _unit call _fnc_processUnit;
    }, 0.1, _fnc_processUnit] call CBA_fnc_addPerFrameHandler;

    addMissionEventHandler ["Draw3D", {call FUNC(onDraw)}];
}] call CBA_fnc_addEventHandler;
