#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Opens the rangetable and fills the charge listbox.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_artillerytables_fnc_rangeTableOpen
 *
 * Public: No
 */

params ["_weaponName", "_elevMin", "_elevMax", "_advCorrection"];
TRACE_3("rangeTableOpen",_weaponName,_elevMin,_elevMax);

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
private _firstSpeed = getNumber (_magCfg >> (_mags select 0) >> "initSpeed");
private _allSame = true;
_mags = _mags apply {
    private _initSpeed = getNumber (_magCfg >> _x >> "initSpeed");
    if (_initSpeed != _firstSpeed) then {_allSame = false};
    [getText (_magCfg >> _x >> "displayNameShort"), _initSpeed]
};
if (_allSame) then { _mags = [["-", _firstSpeed]]; };
TRACE_2("",_allSame,_mags);

// Get Firemodes:
private _fireModes = getArray (configFile >> "CfgWeapons" >> _weaponName >> "modes");
_fireModes = (_fireModes apply {configFile >> "CfgWeapons" >> _weaponName >> _x}) select {1 == getNumber (_x >> "showToPlayer")};
_fireModes = _fireModes apply {[getNumber (_x >> "artilleryCharge"), configName _x]};
_fireModes sort true;
private _allSameCharge = ((count _fireModes) == 1);
TRACE_2("",_allSameCharge,_fireModes);

private _index = 0;
{
    _x params ["_xMagName", "_xMagInitSpeed"];
    if (_allSameCharge) then {
        _ctrlChargeList lbAdd format ["%1", _xMagName];
        _ctrlChargeList lbSetTooltip [_index, format ["%1 m/s",_xMagInitSpeed toFixed 1]];
        _ctrlChargeList lbSetData [_index, str (_xMagInitSpeed)];
        _index = _index + 1;
    } else {
        {
            _x params ["_xArtilleryCharge"];
            _ctrlChargeList lbAdd format ["%1 Charge: %2", _xMagName, _forEachIndex]; // forEachIndex is for firemodes
            _ctrlChargeList lbSetTooltip [_index, format ["%1 m/s", (_xMagInitSpeed * _xArtilleryCharge) toFixed 1]];
            _ctrlChargeList lbSetData [_index, str (_xMagInitSpeed * _xArtilleryCharge)];
            _index = _index + 1;
        } forEach _fireModes;
    };
} forEach _mags;

if (_index == 0) exitWith {ERROR_1("no modes %1",_weaponName);};

if (isNil QGVAR(lastElevationMode)) then {GVAR(lastElevationMode) = true;};
if (isNil QGVAR(lastCharge)) then {GVAR(lastCharge) = 0;};
if ((GVAR(lastCharge) >= _index) || {GVAR(lastCharge) < 0}) then { GVAR(lastCharge) = 0; };

TRACE_2("",GVAR(lastElevationMode),GVAR(lastCharge));
_ctrlChargeList lbSetCurSel GVAR(lastCharge); // triggers call to FUNC(rangeTableUpdate)
