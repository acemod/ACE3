#include "..\script_component.hpp"
/*
 * Author: JetfireBlack
 * Checks if respirator interactions should be shown based on equipment combinations
 *
 * Arguments:
 * 0: Mode <STRING>
 *
 * Return Value:
 * Should interaction be shown? <BOOL>
 *
 * Example:
 * "combo" call ace_goggles_fnc_respiratorConditions
 *
 * Public: No
 */
 
private _unit = ACE_player;

if (!local _unit) exitWith {false};

private _mode = _this;

private _goggles        = goggles _unit;
private _backpack       = backpackContainer _unit;
private _backpackType   = backpack _unit;
private _objectTextures = getObjectTextures _backpack;
private _showAction     = false;

// retrieve paired respirator and add to cache if not present.
private _respiratorPair = GVAR(respiratorPairs) getOrDefault [_goggles, getText (configFile >> "CfgGlasses" >> _goggles >> "ACE_RespiratorFilterPair"), true];

// retrieve paired backpacks with textures and add to cache if not present.
private _respiratorHoseList = GVAR(respiratorHoseList) getOrDefault [_goggles, createHashMapFromArray getArray (configFile >> "CfgGlasses" >> _goggles >> "ACE_RespiratorHoseList"), true];

// fallback for backpacks with hoses without valid mask (like when switching goggles)
private _respiratorHoseTextures = GVAR(respiratorHoseTextures) getOrDefault [_backpackType, getArray (configFile >> "CfgVehicles" >> _backpackType >> "ACE_RespiratorHoseTextures"), true];

_fnc_checkHose = {
    private _hoseConnected = false;
    {
        if (_x isEqualType 0) then {continue};
        if (_objectTextures#_forEachIndex isNotEqualTo "") exitWith {_hoseConnected = true};
    } forEach (GVAR(respiratorHoseList) get _goggles getOrDefault [_backpackType, GVAR(respiratorHoseTextures) get _backpackType]);
    _hoseConnected;
};

switch _mode do {
    // only show when appropriate respirator and backpack are worn
    case "combo": {
        if !(_backpackType in _respiratorHoseList) exitWith {};
        if (call _fnc_checkHose) exitWith {};
        _showAction = true;
    };
    // always show when wearing mask with filters
    case "mask": {
        if (_respiratorPair isEqualTo "") exitWith {};
        if (call _fnc_checkHose) exitWith {};
        _showAction = true;
    };
    // shown only when hose is present regardless of respirator (Arma does not dynamically remove the hose)
    case "hose": {
        if !(call _fnc_checkHose) exitWith {};
        _showAction = true;
    };
    default {};
};
_showAction;
