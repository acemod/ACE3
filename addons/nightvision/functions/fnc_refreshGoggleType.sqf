#include "script_component.hpp"
/*
 * Author: Dslyecxi, PabstMirror
 * Determines night vision source (player/vehicle) - Updates UI based on type.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_nightvision_fnc_refreshGoggleType
 *
 * Public: No
 */

TRACE_1("refreshGoggleType",_this);

if (!GVAR(running)) exitWith {};

// Defaults (good for most vehicles/binoculars)
private _borderImage = "";
private _eyeCups = false;
private _hideHex = true;
private _nvgGen = 3;
private _blurRadius = -1;

if (alive ACE_player) then {
    private _vehicle = vehicle ACE_player;
    if (_vehicle == ACE_player) exitWith {
        if ((cameraView == "GUNNER") && {currentWeapon _unit != ""} && {binocular ACE_player == currentWeapon ACE_player}) exitWith {
            TRACE_1("souce: binocular",binocular ACE_player); // Source is from player's binocular (Rangefinder/Vector21bNite)
            GVAR(source) = "bino";
        };
        TRACE_1("source: hmd",GVAR(playerHMD)); // Source is player's HMD (or possibly a NVG scope, but no good way to detect that)
        GVAR(source) = "hmd";
        private _config = configFile >> "CfgWeapons" >> GVAR(playerHMD);
        if (!isClass _config) exitWith {};

        // Only use border if there is no modelOptics
        if ((getText (_config >> "modelOptics")) == "") then {
            _borderImage = getText (_config >> QGVAR(border));
            _eyeCups = ((getNumber (_config >> QGVAR(eyeCups))) == 1);
            _hideHex = (getNumber (_config >> QGVAR(hideHex))) == 1;
            if (isNumber (_config >> QGVAR(bluRadius))) then {_blurRadius = getNumber (_config >> QGVAR(bluRadius));};
        };
        if (isNumber (_config >> QGVAR(generation))) then {_nvgGen = getNumber (_config >> QGVAR(generation));};
    };
    
    if (_vehicle isKindOf "Air") exitWith {
        TRACE_1("source: vehicle - defaults",typeOf _vehicle);
        GVAR(source) = "air";
    };

    if (_vehicle isKindOf "Tank") exitWith {
        if (cameraView == "GUNNER") then {
            if ([ACE_player] call CBA_fnc_isTurnedOut) then {
                if ((currentWeapon ACE_player != "") && {binocular ACE_player == currentWeapon ACE_player}) then {
                    TRACE_1("souce: binocular",binocular ACE_player);
                    GVAR(source) = "bino";
                } else {
                    TRACE_1("source: hmd",GVAR(playerHMD));
                    GVAR(source) = "hmd";                 
                };
            } else {
                GVAR(source) = "tank";
                TRACE_1("source: vehicle - defaults",typeOf _vehicle);
            };                    
        } else {
            TRACE_1("source: hmd",GVAR(playerHMD));
            GVAR(source) = "hmd";       
        };
    };
    
    //If nothing else has exited by now, player must be in some other vehicle like a static weapon/car.
    //Check camera view. If not in gunner, use hmds.
    if (cameraView == "GUNNER") then {
        //Check for turned out, using binos/personal nvgs.
        if ([ACE_player] call CBA_fnc_isTurnedOut) then {
            if ((currentWeapon ACE_player != "") && {binocular ACE_player == currentWeapon ACE_player}) then {
                TRACE_1("souce: binocular",binocular ACE_player);
                GVAR(source) = "bino";
            } else {
                TRACE_1("source: hmd",GVAR(playerHMD));
                GVAR(source) = "hmd";            
            };
        } else {
            
            private _turret = ACE_player call CBA_fnc_turretPath;
            private _turretConfig = [_vehicle, _turret] call CBA_fnc_getTurret;

            //Check if turret has its own source of NV. If not, use hmds. Used for techies.
            if ((isNumber (_turretConfig >> "optics")) && {(getNumber (_turretConfig >> "optics")) == 0}) exitWith {
                GVAR(source) = "gun-hmd";
                TRACE_1("source: hmd on turret",GVAR(playerHMD));                
            };
            //If static weapon, check if turret has built in nightvision. To work out when player is using  HMD NV, e.g. m2 browning machinegun static weapon.
            if (_vehicle iskindof "StaticWeapon") exitWith {
                if ((isArray (_turretConfig >> "OpticsIn" >> "ViewOptics" >> "VisionMode")) && {("NVG" in (getarray (_turretConfig >> "OpticsIn" >> "ViewOptics" >> "VisionMode")))} ) then { 
                    GVAR(source) = "static";
                    TRACE_1("source: static - defaults",typeOf _vehicle);
                } else {
                    GVAR(source) = "gun-hmd";
                    TRACE_1("source: hmd on turret",GVAR(playerHMD));
                };
                
            };
            if (_vehicle iskindof "Car") exitWith {
                GVAR(source) = "car";
                TRACE_1("source: car",typeOf _vehicle);
            };
            TRACE_1("source: undefined vehicle - defaults",typeOf _vehicle);
        };                    
    } else {
        TRACE_1("source: hmd",GVAR(playerHMD));
        GVAR(source) = "hmd";
    };
};

//Note: Don't care about car/static/UAV sources at this time, only used for identifying them in the fnc_pfeh.sqf for fog multiplier. They have their own overlays.
switch GVAR(source) do {
    case "hmd" : {
        private _config = configFile >> "CfgWeapons" >> GVAR(playerHMD);
        if (!isClass _config) exitWith {};
        // Only use border if there is no modelOptics
        if ((getText (_config >> "modelOptics")) == "") then {
            _borderImage = getText (_config >> QGVAR(border));
            _eyeCups = ((getNumber (_config >> QGVAR(eyeCups))) == 1);
            _hideHex = (getNumber (_config >> QGVAR(hideHex))) == 1;
            if (isNumber (_config >> QGVAR(bluRadius))) then {_blurRadius = getNumber (_config >> QGVAR(bluRadius));};
        };
        if (isNumber (_config >> QGVAR(generation))) then {_nvgGen = getNumber (_config >> QGVAR(generation));};
    };
    //Differentiated here so can scale nvg overlay and detect turret ironsight blurring in fnc_pfeh.sqf.
    case "gun-hmd" : {
        private _config = configFile >> "CfgWeapons" >> GVAR(playerHMD);
        if (!isClass _config) exitWith {};
        if ((getText (_config >> "modelOptics")) == "") then {
            _borderImage = getText (_config >> QGVAR(border));
            _eyeCups = ((getNumber (_config >> QGVAR(eyeCups))) == 1);
            _hideHex = (getNumber (_config >> QGVAR(hideHex))) == 1;
            if (isNumber (_config >> QGVAR(bluRadius))) then {_blurRadius = getNumber (_config >> QGVAR(bluRadius));};
        };
        if (isNumber (_config >> QGVAR(generation))) then {_nvgGen = getNumber (_config >> QGVAR(generation));};
    };
    case "bino" : {
        private _config = configFile >> "CfgWeapons" >> (binocular ACE_player);
        if (!isClass _config) exitWith {};
        if (isNumber (_config >> QGVAR(generation))) then {_nvgGen = getNumber (_config >> QGVAR(generation));};
        _borderImage = getText (_config >> QGVAR(border));
    };
    case "air" : {
        private _config = configFile >> "CfgWeapons" >> GVAR(playerHMD);
        _borderImage = getText (_config >> QGVAR(border));
        _eyeCups = ((getNumber (_config >> QGVAR(eyeCups))) == 1);
        _hideHex = (getNumber (_config >> QGVAR(hideHex))) == 1;
        if (isNumber (_config >> QGVAR(bluRadius))) then {_blurRadius = getNumber (_config >> QGVAR(bluRadius));};
        if (isNumber (_config >> QGVAR(generation))) then {_nvgGen = getNumber (_config >> QGVAR(generation));};
    };
};




#ifdef DEBUG_MODE_FULL
systemChat format ["NVG Refresh - Border: %1", _borderImage];
systemChat format ["NVG Source: %1",GVAR(source)];
systemChat format ["EyeCups: %1, HideHex %2, NVGen: %3, BluRadius: %4", _eyeCups, _hideHex, _nvgGen, _blurRadius];
#endif

GVAR(nvgBlurRadius) = _blurRadius;
GVAR(nvgGeneration) = _nvgGen;

// Setup border and hex image based on NVG config:
private _scale = (call EFUNC(common,getZoom)) * 1.12513;
//Forced a bit of nvg overlay scaling when player in turret ironsight but using their hmd.
if (GVAR(source) == "gun-hmd") then {
    _scale = _scale * 1.2;
};

private _borderImageCtrl = (uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1001;
private _trippleHeadLeft = (uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1002;
private _trippleHeadRight = (uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1003;
if (_borderImage == "") then {
    _borderImageCtrl ctrlShow false;
    _trippleHeadLeft ctrlShow false;
    _trippleHeadRight ctrlShow false;
    GVAR(defaultPositionBorder) = [];
} else {
    _borderImageCtrl ctrlShow true;
    _trippleHeadLeft ctrlShow true;
    _trippleHeadRight ctrlShow true;

    _borderImageCtrl ctrlSetText _borderImage;
    _borderImageCtrl ctrlSetFade ([.15, 0] select _eyeCups);

    #define BORDER_SIZE 3
    GVAR(defaultPositionBorder) = [safezoneX - (((BORDER_SIZE * 0.75) * safezoneH) - safezoneW) / 2, safezoneY - ((BORDER_SIZE - 1) / 2) * safezoneH, (BORDER_SIZE * 0.75) * safezoneH, BORDER_SIZE * safezoneH];
    [_borderImageCtrl, GVAR(defaultPositionBorder), _scale] call FUNC(scaleCtrl);
};

private _hexCtrl = (uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1000;
if (_hideHex) then {
    _hexCtrl ctrlShow false;
} else {
    _hexCtrl ctrlShow true;
    // _hexCtrl ctrlSetText QPATHTOF(data\nvg_mask_hexes.paa);
    _hexCtrl ctrlSetText QPATHTOF(data\nvg_mask_hexes_thin.paa);

    #define HEX_SIZE 1.5
    GVAR(defaultPositionHex) = [safezoneX - (((HEX_SIZE * 0.75) * safezoneH) - safezoneW) / 2, safezoneY - ((HEX_SIZE - 1) / 2) * safezoneH, (HEX_SIZE * 0.75) * safezoneH, HEX_SIZE * safezoneH];
    [_hexCtrl, GVAR(defaultPositionHex), _scale] call FUNC(scaleCtrl);
};

// Trigger full ppEffects update next time run in the PFEH:
GVAR(nextEffectsUpdate) = -1;
