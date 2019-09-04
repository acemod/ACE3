#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Turret changed, determine if we are in the gunner seat of an artillery vehicle.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Turret <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, [0]] call ace_artillerytables_fnc_turretChanged
 *
 * Public: No
 */

params ["_player", "_turret"];
private _vehicle = vehicle _player;
private _typeOf = typeOf _vehicle;
private _vehicleCfg = configFile >> "CfgVehicles" >> _typeOf;

// config "ace_artillerytables_showGunLaying" [0 disabled, 1 enabled, 2 enabled w/ alt elevationMode] falls back to artilleryScanner
private _showGunLaying = if (isNumber (_vehicleCfg >> QGVAR(showGunLaying))) then {
    getNumber (_vehicleCfg >> QGVAR(showGunLaying))
} else {
    getNumber (_vehicleCfg >> "artilleryScanner")
};
TRACE_4("turretChanged",_player,_typeOf,_turret,_showGunLaying);

if (GVAR(pfID) >= 0) then {
    TRACE_1("removing pfEH and display",GVAR(pfID));
    [GVAR(pfID)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfID) = -1;
    if (!isNull (uiNamespace getVariable [QGVAR(display), displayNull])) then {
        ([QGVAR(modeDisplay)] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
    };
};

if ((alive _player) && {_showGunLaying > 0} && {_player == gunner _vehicle}) then {
    private _turretCfg = [_typeOf, _turret] call CBA_fnc_getTurret;
    private _turretAnimBody = getText (_turretCfg >> "animationSourceBody");
    private _useAltElevation = (_showGunLaying == 2); // StaticMortars need elevation calculated differently, see FUNC(turretPFEH)

    // If the memory point is invalid, then the turret will always use real weapon dir (e.g. CUP BM21)
    private _memoryPointGunnerOptics = getText (_turretCfg >> "memoryPointGunnerOptics");
    private _invalidGunnerMem = (_vehicle selectionPosition [_memoryPointGunnerOptics, "Memory"]) isEqualTo [0,0,0];
    if (_invalidGunnerMem) then { INFO_3("[%1-%2] turret's memoryPointGunnerOptics invalid [%3]",typeOf _vehicle,_turret,_memoryPointGunnerOptics); };

    private _weaponsTurret = _vehicle weaponsTurret _turret;
    if ((count _weaponsTurret) != 1) then { WARNING_2("not singular weapon in turret - %1 - %2",_typeOf,_turret); };
    private _weapon = _weaponsTurret param [0, ""];

    private _fireModes = getArray (configFile >> "CfgWeapons" >> _weapon >> "modes");
    _fireModes = (_fireModes apply {configFile >> "CfgWeapons" >> _weapon >> _x}) select {1 == getNumber (_x >> "showToPlayer")};
    _fireModes = _fireModes apply {[getNumber (_x >> "artilleryCharge"), configName _x]};
    _fireModes sort true;
    _fireModes = _fireModes apply {_x select 1};

    GVAR(pfID) = [LINKFUNC(turretPFEH), 0, [_vehicle, _turret, _fireModes, _useAltElevation, _turretAnimBody, _invalidGunnerMem]] call CBA_fnc_addPerFrameHandler;
    TRACE_4("added pfEH",GVAR(pfID),_useAltElevation,_turretAnimBody,_invalidGunnerMem);

    #ifdef DEBUG_MODE_FULL
    private _ballisticsComputer = getNumber (configFile >> "CfgWeapons" >> _weapon >> "ballisticsComputer");
    private _elevationMode = getNumber (_turretCfg >> "elevationMode");
    private _discreteDistance = getArray (_turretCfg >> "discreteDistance");
    TRACE_4("",_weapon,_ballisticsComputer,_elevationMode,_discreteDistance);
    #endif
};
