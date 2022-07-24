#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Opens the rangetable and fills the charge listbox.
 *
 * Arguments:
 * 0: Weapon configname <STRING>
 * 1: Elevation Min (Deg) <NUMBER>
 * 2: Elevation Max (Deg) <NUMBER>
 * 3: Advanced Corrections Enabled <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["mortar_155mm_AMOS", -5, 80, true] call ace_artillerytables_fnc_rangeTableOpen
 *
 * Public: No
 */

params ["_weaponName", "_elevMin", "_elevMax", "_advCorrection"];
TRACE_4("rangeTableOpen",_weaponName,_elevMin,_elevMax,_advCorrection);

BEGIN_COUNTER(rangeTableOpen);

createDialog QGVAR(rangeTableDialog);
private _dialog = uiNamespace getVariable [QGVAR(rangeTableDialog), displayNull];
if (isNull _dialog) exitWith{ERROR("Dialog failed to open");};
private _ctrlChargeList = _dialog displayCtrl IDC_CHARGELIST;
_dialog setVariable [QGVAR(elevMin),_elevMin];
_dialog setVariable [QGVAR(elevMax),_elevMax];
_dialog setVariable [QGVAR(advCorrection),_advCorrection];
TRACE_2("created dialog",_dialog,_ctrlChargeList);

// Get Mags:
private _mags = [_weaponName] call CBA_fnc_compatibleMagazines;
if (_mags isEqualTo []) exitWith {WARNING_1("No Mags",_weaponName);};
private _magCfg = configFile >> "CfgMagazines";
private _magParamsArray = [];
_mags = _mags apply {
    private _initSpeed = getNumber (_magCfg >> _x >> "initSpeed");
    _magParamsArray pushBackUnique _initSpeed;
    private _airFriction = 0;
    if (_advCorrection) then {
        _airFriction = if (isNumber (_magCfg >> _x >> QGVAR(airFriction))) then { getNumber (_magCfg >> _x >> QGVAR(airFriction)) } else { DEFAULT_AIR_FRICTION };
    };
    _magParamsArray pushBackUnique _airFriction;
    [getText (_magCfg >> _x >> "displayNameShort"), getText (_magCfg >> _x >> "displayName"), _initSpeed, _airFriction]
};
_mags = _mags arrayIntersect _mags;
TRACE_2("",_magParamsArray,_mags);
if ((count _magParamsArray) == 2) then { // test if all magazines share the parameters
    _mags = [["", "All Magazines", (_mags select 0) select 2, (_mags select 0) select 3]]; // simplify
};

// Get Firemodes:
private _fireModes = getArray (configFile >> "CfgWeapons" >> _weaponName >> "modes");
_fireModes = (_fireModes apply {configFile >> "CfgWeapons" >> _weaponName >> _x}) select {1 == getNumber (_x >> "showToPlayer")};
_fireModes = _fireModes apply {[getNumber (_x >> "artilleryCharge"), configName _x]};
_fireModes sort true;
private _allSameCharge = ((count _fireModes) == 1) && {((_fireModes select 0) select 0) == 1};
TRACE_2("",_allSameCharge,_fireModes);

GVAR(magModeData) = [];
{
    _x params ["_xDisplayNameShort", "_xDisplayName", "_xInitSpeed", "_xAirFriction"];
    if (_allSameCharge) then {
        _ctrlChargeList lbAdd format ["%1", _xDisplayNameShort];
        _ctrlChargeList lbSetTooltip [count GVAR(magModeData), format ["%1\n%2 m/s\n%3", _xDisplayName, _xInitSpeed toFixed 1, _xAirFriction]];
        GVAR(magModeData) pushBack [_xInitSpeed, _xAirFriction];
    } else {
        {
            _x params ["_xModeCharge"];
            _ctrlChargeList lbAdd format ["[Charge %1] %2", _forEachIndex, _xDisplayNameShort]; // forEachIndex is from firemodes
            _ctrlChargeList lbSetTooltip [count GVAR(magModeData), format ["%1\n%2 m/s\n%3", _xDisplayName, (_xInitSpeed * _xModeCharge) toFixed 1, _xAirFriction]];
            GVAR(magModeData) pushBack [_xInitSpeed * _xModeCharge, _xAirFriction];
        } forEach _fireModes;
    };
} forEach _mags;


if (isNil QGVAR(lastElevationMode)) then {GVAR(lastElevationMode) = true;};
if (isNil QGVAR(lastTablePage)) then {GVAR(lastTablePage) = 0;};
if ((GVAR(lastTablePage) >= (count GVAR(magModeData))) || {GVAR(lastTablePage) < 0}) then { GVAR(lastTablePage) = 0; };

END_COUNTER(rangeTableOpen);
TRACE_2("trigger update",GVAR(lastElevationMode),GVAR(lastTablePage));
_ctrlChargeList lbSetCurSel GVAR(lastTablePage); // triggers call to FUNC(rangeTableUpdate)
