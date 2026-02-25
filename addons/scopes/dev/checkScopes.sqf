// [] call compileScript ["\z\ace\addons\scopes\dev\checkScopes.sqf"];


private _uniqueOptics = createHashMap;
private _optics = "getNumber (_x >> 'scope') > 0" configClasses (configFile >> "CfgWeapons");
_optics = _optics select {(getNumber (_x >> 'ItemInfo' >> 'type')) == 201};
_optics = _optics select {
    private _model = getText (_x >> "model");
    private _configOffset = getNumber (_x >> "ACE_ScopeHeightAboveRail");
    !(_uniqueOptics set [[toLower _model, _configOffset], true])
};
diag_log text format ["** Checking %1 scopes **", count _optics];

private _fnc_checkConfig = {
    params ["_config", ["_diag", false]];

    private _model = getText (_config >> "model");
    private _weaponObj = createSimpleObject [_model, [0, 0, 0], true];
    private _bestZoom = 1e6;
    private _bestOffset = 0;
    {
        private _xZoom = getNumber (_x >> "opticsZoomMin");
        private _xMem = getText (_x >> "memoryPointCamera");
        private _xOffset = 100 * ((_weaponObj selectionPosition _xMem) select 2); // convert to centimeters
        if (_xZoom < _bestZoom) then { // get offset for optic with highest magnification (lowest fov)
            _bestZoom = _xZoom;
            _bestOffset = _xOffset;
        };
        if (_diag) then {
            diag_log text format [" %1[%2] = %3 (%4)",configName _x, _xZoom, _xMem, _xOffset];
        };
    } forEach configProperties [_config >> "ItemInfo" >> "OpticsModes", "isClass _x"];
    deleteVehicle _weaponObj;
    _bestOffset
};
{
    private _config = _x;
    private _actualOffset = [_config, false] call _fnc_checkConfig;
    private _configOffset = getNumber (_config >> "ACE_ScopeHeightAboveRail");

    if ((abs (_actualOffset - _configOffset)) > 0.1) then {
        private _parent = configName inheritsFrom _config;
        diag_log text format ["Mismatch %1:%2 - Actual %3 vs Config %4", configName _config, _parent, _actualOffset, _configOffset];
        [_config, true] call _fnc_checkConfig;
    };
} forEach _optics;




private _uniqueRifles = createHashMap;
private _rifles = "getNumber (_x >> 'scope') > 0" configClasses (configFile >> "CfgWeapons");
_rifles = _rifles select {(getNumber (_x >> 'type')) == 1};
_rifles = _rifles select {
    private _model = getText (_x >> "model");
    private _configOffset = getNumber (_x >> "ACE_RailHeightAboveBore");
    !(_uniqueRifles set [[toLower _model, _configOffset], true])
};
diag_log text format ["** Checking %1 weapons **", count _rifles];

private _fnc_checkConfig = {
    params ["_config", ["_diag", false]];
    private _model = getText (_config >> "model");
    private _weaponObj = createSimpleObject [_model, [0, 0, 0], true];
    private _lod = (allLODs _weaponObj) # 0 # 2;
    private _xMemMuzzle = getText (_config >> "muzzlePos");
    private _xMemOptic = "proxy:\a3\data_f\proxies\weapon_slots\top.001";
    private _xPosMuzzle = _weaponObj selectionPosition _xMemMuzzle;
    private _xPosOptic = _weaponObj selectionPosition [_xMemOptic, _lod];
    if (_xPosOptic isEqualTo [0,0,0]) exitWith { -999 }; // e.g. akm has no proxy

    private _xOffset = 100 * ((_xPosOptic vectorDiff _xPosMuzzle) select 2);
    if (_diag) then {
        diag_log text format [" Muzzle %1 - Top %2", _xPosMuzzle, _xPosOptic];
    };
    deleteVehicle _weaponObj;
    _xOffset
};

{
    private _config = _x;
    private _slots = configProperties [_config >> "WeaponSlotsInfo", "isClass _x"];
    private _opticSlot = "CowsSlot";
    {
        if (getText (_x >> "linkProxy") == "\a3\data_f\proxies\weapon_slots\TOP") then {
            _opticSlot = configName _x;
        };
    } forEach _slots;
    if ((compatibleItems [configName _config, _opticSlot]) isEqualTo []) then { 
        diag_log text format ["note: %1 has no compatible items for %2", configName _config, _opticSlot];
        continue  // e.g. arifle_SDAR_F has no scopes
    };
    private _actualOffset = [_config, false] call _fnc_checkConfig;
    if (_actualOffset == -999) then { continue };
    private _configOffset = getNumber (_config >> "ACE_RailHeightAboveBore");

    if ((abs (_actualOffset - _configOffset)) > 0.1) then {
        private _parent = configName inheritsFrom _config;
        diag_log text format ["Mismatch %1:%2 - Actual %3 vs Config %4", configName _config, _parent, _actualOffset, _configOffset];
        [_config, true] call _fnc_checkConfig;
    };
} forEach _rifles;
