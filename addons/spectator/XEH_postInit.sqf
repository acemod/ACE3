/*
    Author:
    voiper
*/

#include "script_component.hpp"

["SettingsInitialized", {
    if !GVAR(enabled) exitWith {};
    
    //check if respawn is set up properly
    _fail = if (getNumber (missionConfigFile >> "respawn") != 3 && getText (missionConfigFile >> "respawn") != "Base") then {true} else {false};
    if (_fail) exitWith {
        _text = "[ACE_Spectator] ERROR: This mission does not have respawn set up properly. Add 'respawn=3' or 'respawn=""BASE""' to description.ext.";
        systemChat _text;
        diag_log text _text;
    };
    
    if GVAR(endMission) then {
        [{
            if (player distance GVAR(penPos) < 200) then {
                if ({isPlayer _x && alive _x && (_x distance GVAR(penPos)) > 200} count allUnits == 0) then {
                    [["endDeath", false], "BIS_fnc_endMission"] call BIS_fnc_MP;
                    [_this select 1] call CBA_fnc_removePerFrameHandler;
                };
            };
        }, 2] call CBA_fnc_addPerFrameHandler;
    };
    
    if (isDedicated) exitWith {};
    
    call FUNC(penPos);

    {
        if (getMarkerPos _x isEqualTo [0,0,0]) then {
            _marker = createMarkerLocal [_x, [0,0]];
            _marker setMarkerShapeLocal "ICON";
        };
        
        _x setMarkerPosLocal GVAR(penPos);
    } forEach ["respawn_west", "respawn_east", "respawn_guerrila", "respawn_civilian"];

    GVAR(playerSide) = side (group player);
    
    if GVAR(tracking) then {
        [FUNC(checkUnits), 2] call CBA_fnc_addPerFrameHandler;
        [FUNC(trackUnits), 20] call CBA_fnc_addPerFrameHandler;
    };
    
    player addEventHandler ["Killed", {
        [player] joinSilent grpNull;
        if (isClass (configFile >> "CfgPatches" >> "ace_hearing")) then {EGVAR(hearing,disableVolumeUpdate) = true};
        _delay = getNumber (missionConfigFile >> "respawnDelay");
        _delay fadeSound 0;
        999999 cutText ["", "BLACK", _delay];
    }];

    player addEventHandler ["Respawn", {
        if (!isNil QGVAR(cam)) then {["Exit"] call FUNC(camera)};
        if (isClass (configFile >> "CfgPatches" >> "ace_hearing")) then {EGVAR(hearing,disableVolumeUpdate) = true};
        if (isClass (configFile >> "CfgPatches" >> "acre_sys_radio")) then {[true] call acre_api_fnc_setSpectator};
        if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {[player, true] call TFAR_fnc_forceSpectator};
        
        if !GVAR(modulePos) then {
            _corpse = _this select 1;
            if (!isNil "_corpse") then {
                if (!isNull _corpse) then {
                    GVAR(startingPos) = getPosATL _corpse;
                };
            };
        };
        
        player addEventHandler ["HandleDamage", {0}];
        [player] joinSilent grpNull;
        removeAllWeapons player;
        removeAllItems player;
        removeAllAssignedItems player;
        removeUniform player;
        removeVest player;
        player linkItem "ItemMap";
        player linkItem "ItemRadio";
        hideObjectGlobal player;
        
        if (surfaceisWater GVAR(penPos)) then {
            player forceAddUniform "U_B_Wetsuit";
            player addVest "V_RebreatherB";
        };
        
        player setPosATL GVAR(penPos);
        
        0 fadeSound 0;
        999999 cutText ["", "BLACK FADED", 0];
        ["Init", [true]] call FUNC(camera);
    }];

}] call EFUNC(common,addEventHandler);