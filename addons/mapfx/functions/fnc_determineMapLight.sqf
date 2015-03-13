#include "script_component.hpp"

private ["_darkenMap","_darkenColor","_createLight","_gunlight","_nearObjects","_light"];

// @todo: Update the way to check for flashlights
_gunlight = isArray(configFile>> "CfgWeapons" >> currentWeapon player >>"ace_gunlight_classes") || {"ACE_MugLite" in weapons player};

_fnc_blendColor = {
    EXPLODE_3_PVT(_this,_c1,_c2,_alpha);
    [(_c1 select 0) * (1 - _alpha) + (_c2 select 0) * _alpha,
     (_c1 select 1) * (1 - _alpha) + (_c2 select 1) * _alpha,
     (_c1 select 2) * (1 - _alpha) + (_c2 select 2) * _alpha,
     (_c1 select 3) * (1 - _alpha) + (_c2 select 3) * _alpha]
};

_lightTint = switch (true) do {
    case (daytime < 4 || dayTime >= 20) : {[0,0,0.2,1]};
    case (daytime < 5.5) : {[[0,0,0.4,1],   [0.8,0.2,0,1], (daytime - 4)/1.5 ] call _fnc_blendColor};
    case (daytime < 6.5) : {[[0.8,0.2,0,1], [1,1,1,1],      daytime - 5.5    ] call _fnc_blendColor};
    case (daytime < 17)  : { [1,1,1,1] };
    case (daytime < 18)  : {[[1,1,1,1],     [0.8,0.2,0,1],  daytime - 17   ] call _fnc_blendColor};
    case (daytime < 20)  : {[[0.8,0.2,0,1], [0,0,0.4,1],   (daytime - 18)/2] call _fnc_blendColor};
};

_lightLevel = switch (true) do {
    case (daytime < 4 || dayTime >= 20) : {0.08};
    case (daytime < 6) : {0.08 + (1 - 0.08) * (daytime - 4) / 2};
    case (daytime < 18): {1};
    case (daytime < 20): {1 + (0.08 - 1) * (daytime - 18) / 2};
};

_lightLevel = _lightLevel - 0.5 * (_lightLevel + 0.08) * ((overcast - 0.5) max 0);

_fnc_calcColor = {
    EXPLODE_2_PVT(_this,_c1,_lightLevel);

    _l = abs(_lightLevel - 0.5) / 0.5;

    if (_lightLevel < 0.5) then {
        [(_c1 select 0) * _l * _l * _l,
         (_c1 select 1) * _l * _l * _l,
         (_c1 select 2) * _l * _l * _l,
         (_c1 select 3) * (1 - _lightLevel)]
    } else {
        [(_c1 select 0) * (1 - _l) + _l,
         (_c1 select 1) * (1 - _l) + _l,
         (_c1 select 2) * (1 - _l) + _l,
         (_c1 select 3) * (1 - _lightLevel)]
    };
};

_darkenMap = true;
_createLight = false;

// check if player has NVG enabled
if (currentVisionMode ACE_player == 1) exitWith {
    // stick to nvg color
    _darkenMap = true;
    _darkenColor = [154/255,253/255,177/255,0.5];
    _createLight = false;

    [_darkenMap,_darkenColor,_createLight]
};

if (_lightLevel > 0.95) exitWith {
    [false, [1,1,1,0], false]
};


// Check if player is not in a vehicle
if (vehicle ACE_player == ACE_player) then {
    // Player is not in a vehicle
    TRACE_1("NOT in vehicle","");

    // darken map, unless following cases are fulfilled
    // Priorities: Weapons flashlight, lamppost, fire, chemlight, flares

    // Check if player is near a campfires, lights or vehicles with lights on - 15m
    _nearObjects = [nearestObjects [ACE_player, ["All"], 15], {(inflamed _this) || (isLightOn _this)}] call EFUNC(common,filter);
    if (count (_nearObjects) > 0) then {
        _light = _nearObjects select 0;
        _lightLevel = _lightLevel max (1 - (((((ACE_player distance _light) - 5)/10) max 0) min 1));
        TRACE_1("player near campfire","");
    };

    // TODO: Illumination flares (timed)

    // Using chemlights
    _fnc_chemLight = {
        EXPLODE_2_PVT(_this,_no,_lc);
        if (count (_no) == 0) exitWith {};

        _light = _no select 0;
        _ll = (1 - ((((ACE_player distance _light) - 2)/2) max 0)) * 0.4;
        if (_ll > _lightLevel) then {
            _lightLevel = _ll;
            _lightTint = +_lc;
            hint format ["%1 %2",ACE_player distance _light,_ll];
        };
        TRACE_1("player near chemlight","");
    };

    _nearObjects = [ACE_player nearObjects ["Chemlight_red", 4], {alive _this}] call EFUNC(common,filter);
    [_nearObjects, [1,0,0,1]] call _fnc_chemLight;

    _nearObjects = [ACE_player nearObjects ["Chemlight_green", 4], {alive _this}] call EFUNC(common,filter);
    [_nearObjects, [0,1,0,1]] call _fnc_chemLight;

    _nearObjects = [ACE_player nearObjects ["Chemlight_blue", 4], {alive _this}] call EFUNC(common,filter);
    [_nearObjects, [0,0,1,1]] call _fnc_chemLight;

    _nearObjects = [ACE_player nearObjects ["Chemlight_yellow", 4], {alive _this}] call EFUNC(common,filter);
    [_nearObjects, [1,1,0,1]] call _fnc_chemLight;

    // Gun with light
    if (_gunlight) then {
        _darkenMap = false;
        _createLight = true;
        TRACE_1("using gun light","");
    };

} else {
    // Player is in a vehicle
    if ((vehicle ACE_player) isKindOf "Tank") exitWith {
        _darkenMap = false;
        _createLight = false;
    };

    // check if vehicle is not of following type: parachute
    TRACE_1("in vehicle","");

    // darken map if vehicle is kind of bicycle or motorbike or ATV or parachute or PBX boat
    if (vehicle ACE_player isKindOf "Bicycle" || {vehicle ACE_player isKindOf "Motorcycle"}) then {
        if (_gunlight) then {
            _darkenMap = false;
            _createLight = true;
            TRACE_1("bright map - gun lights","");
        } else {
            _darkenColor = [0,0,0,(_alpha*1.1)];
            TRACE_1("darken map - no lights","");
        };
    } else {
        // do not darken map, but create a lightpoint at players eye pos to simulate dash light / flashlight usage to view map
        // do nothing if in a tank or apc
        _darkenMap = false;
        _createLight = true;
        TRACE_1("using vehicle light","");
    };

};

_darkenColor = [_lightTint, _lightLevel] call _fnc_calcColor;

TRACE_4("",_darkenMap,_darkenColor,_createLight);
[_darkenMap,_darkenColor,_createLight]
