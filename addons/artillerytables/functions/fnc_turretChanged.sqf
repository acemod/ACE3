#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Turret changed.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Turret <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ace_artillerytables_fnc_turretChanged
 *
 * Public: No
 */

params ["_player", "_turret"];
private _vehicle = vehicle _player;
private _typeOf = typeOf _vehicle;
TRACE_3("turretEH",_player,_turret,_typeOf);

private _enabled = (alive _player) && {_turret isEqualTo [0]}
&& { ((_vehicle getVariable [QGVAR(enabled), getNumber (configFile >> "CfgVehicles" >> _typeOf >> "artilleryScanner")]) in [1, true])};

if (GVAR(pfID) >= 0) then {
    TRACE_1("removing pfEH and display",GVAR(pfID));
    [GVAR(pfID)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfID) = -1;
    if (!isNull (uiNamespace getVariable [QGVAR(display), displayNull])) then {
        ([QGVAR(modeDisplay)] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
    };
};

if (_enabled) then {
    // Ugh, see FUNC(turretPFEH)
    private _useAltElevation = (["Mortar_01_base_F", "rhs_2b14_82mm_Base", "RHS_M252_Base", "CUP_B_M1129_MC_MK19_Desert"] findIf {_typeOf isKindOf _x}) > -1;

    private _weaponsTurret = _vehicle weaponsTurret _turret;
    if ((count _weaponsTurret) != 1) then { WARNING_1("multiple weapons - %1",typeOf _vehicle); };
    private _weapon = _weaponsTurret param [0, ""];

    #ifdef DEBUG_MODE_FULL
    private _ballisticsComputer = getNumber (configFile >> "CfgWeapons" >> _weapon >> "ballisticsComputer");
    private _elevationMode = getNumber (([_typeOf, _turret] call CBA_fnc_getTurret) >> "elevationMode");
    private _discreteDistance = getArray (([_typeOf, _turret] call CBA_fnc_getTurret) >> "discreteDistance");
    TRACE_4("",_weapon,_ballisticsComputer,_elevationMode,_discreteDistance);
    #endif

    private _fireModes = getArray (configFile >> "CfgWeapons" >> _weapon >> "modes");
    _fireModes = (_fireModes apply {configFile >> "CfgWeapons" >> _weapon >> _x}) select {1 == getNumber (_x >> "showToPlayer")};
    _fireModes = _fireModes apply {[getNumber (_x >> "artilleryCharge"), configName _x]};
    _fireModes sort true;
    _fireModes = _fireModes apply {_x select 1};

    GVAR(pfID) = [LINKFUNC(turretPFEH), 0, [_vehicle, _turret, _fireModes, _useAltElevation]] call CBA_fnc_addPerFrameHandler;
    TRACE_1("added pfEH",GVAR(pfID));
};
