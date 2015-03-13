#include "script_component.hpp"

//TODO: Fix NVG color
private ["_darkMap","_lightColor","_lightFill","_createLight","_gunlight","_nearObjects","_light"];

// @todo: Update the way to check for flashlights
_gunlight = isArray(configFile>> "CfgWeapons" >> currentWeapon player >>"ace_gunlight_classes") || {"ACE_MugLite" in weapons player};

// Default Values
_alphaBase = if (round overcast > 0.5) then { 0.90 } else { 0.85};
_alpha = _alphaBase min abs(sunOrMoon - 1);

_lightColor = [0,0,0,((_alpha*1.1) min 1)];
_lightFill = format["#(rgb,1,1,1)color(0,0,0,%1)",_alpha];
_darkMap = true;
_createLight = false;

// Check if player is not in a vehicle
if (vehicle ACE_player == ACE_player) then {
    // Player is not in a vehicle
    TRACE_1("NOT in vehicle","");
    _lightColor = [0,0,0,(_alpha*1.1)];
    _lightFill = format["#(rgb,1,1,1)color(0,0,0,%1)",_alpha];

    // check if player has NVG enabled
    if (currentVisionMode ACE_player == 1) then {
        // stick to nvg color
        _alpha = 0.8;
        _lightColor = [154/255,253/255,177/255,_alpha];
        _lightFill = "#(rgb,1,1,1)color(0.20,0.48,0.23,0.7)";
        TRACE_1("nvg on - green tint","");
    } else {

        if (_alpha < 0.05) exitWith {
            _darkMap = false;
        };

        // darken map, unless following cases are fulfilled
        // Priorities: Weapons flashlight, lamppost, fire, chemlight, flares

        // Check if player is near a campfires, lights or vehicles with lights on - 15m
        _nearObjects = [nearestObjects [ACE_player, ["All"], 15], {(inflamed _this) || (isLightOn _this)}] call EFUNC(common,filter);
        if (count (_nearObjects) > 0) then {
            _light = _nearObjects select 0;
            _alpha = (((((ACE_player distance _light) - 5)/10) max 0) min 1) min _alphaBase;
            _lightColor = [0,0,0,_alpha];
            _lightFill = format["#(rgb,1,1,1)color(0,0,0,%1)",_alpha];
            TRACE_1("player near campfire","");
        };

        // TODO: Illumination flares (timed)

        // Using chemlights
        _fnc_chemLight = {
            EXPLODE_2_PVT(_this,_no,_lc);

            if (count (_no) == 0) exitWith {};

            _light = _no select 0;
            _alpha = (((((player distance _light) - 2)/4) max 0) min 0.5);
            _lightColor = +_lc;
            _lightColor set [3, _alpha];
            _lightFill = format["#(rgb,1,1,1)color(%1,%2,%3,%4)",(_lightColor select 0),(_lightColor select 1),(_lightColor select 2),(_lightColor select 3)];
            TRACE_1("player near chemlight","");
        };

        _nearObjects = [ACE_player nearObjects ["Chemlight_red", 4], {alive _this}] call EFUNC(common,filter);
        [_nearObjects, [1,0,0,0]] call _fnc_chemLight;

        _nearObjects = [ACE_player nearObjects ["Chemlight_green", 4], {alive _this}] call EFUNC(common,filter);
        [_nearObjects, [0,1,0,0]] call _fnc_chemLight;

        _nearObjects = [ACE_player nearObjects ["Chemlight_blue", 4], {alive _this}] call EFUNC(common,filter);
        [_nearObjects, [0,0,1,0]] call _fnc_chemLight;

        _nearObjects = [ACE_player nearObjects ["Chemlight_yellow", 4], {alive _this}] call EFUNC(common,filter);
        [_nearObjects, [1,1,0,0]] call _fnc_chemLight;

        // Gun with light
        if (_gunlight) then {
            _darkMap = false;
            _createLight = true;
            TRACE_1("using gun light","");
        };
    };
} else {
    // Player is in a vehicle
    if ((vehicle ACE_player) isKindOf "Tank") exitWith {
        _darkMap = false;
        _createLight = false;
    };

    // check if vehicle is not of following type: parachute
    TRACE_1("in vehicle","");
    // check if player has NVG enabled
    if (currentVisionMode ACE_player == 1) then {
        // stick to nvg color
        _alpha = 0.8;
        _lightColor = [0,0.96,0,_alpha];
        _lightFill = "#(rgb,1,1,1)color(0,0.96,0,0.8)";
        TRACE_1("nvg on - green tint","");
    } else {
        // darken map if vehicle is kind of bicycle or motorbike or ATV or parachute or PBX boat
        if (vehicle ACE_player isKindOf "Bicycle" || {vehicle ACE_player isKindOf "Motorcycle"}) then {
            if (_gunlight) then {
                _darkMap = false;
                _createLight = true;
                TRACE_1("bright map - gun lights","");
            } else {
                _lightColor = [0,0,0,(_alpha*1.1)];
                _lightFill = format["#(rgb,1,1,1)color(0,0,0,%1)",_alpha];
                TRACE_1("darken map - no lights","");
            };
        } else {
            // do not darken map, but create a lightpoint at players eye pos to simulate dash light / flashlight usage to view map
            // do nothing if in a tank or apc
            _darkMap = false;
            _createLight = true;
            TRACE_1("using vehicle light","");
        };
    };
};
TRACE_4("",_darkMap,_lightColor,_lightFill,_createLight);

[_darkMap,_lightColor,_lightFill,_createLight]
