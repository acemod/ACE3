#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Interaction menu opened, search for nearby artillery vehicles.
 *
 * Arguments:
 * 0: Menu Type (1 is self interaction) <NUMBER>
 *
 * Return Value:
 * Can Open <BOOL>
 *
 * Example:
 * [1] call ace_artillerytables_fnc_interactMenuOpened
 *
 * Public: No
 */

params ["_menuType"];
TRACE_1("interactMenuOpened",_menuType);

if (_menuType != 1) exitWith {};
if (!("ACE_artilleryTable" in (ace_player call EFUNC(common,uniqueItems)))) exitWith {};

private _vehicleAdded = ace_player getVariable [QGVAR(vehiclesAdded), []];
private _rangeTablesShown = ace_player getVariable [QGVAR(rangeTablesShown), []];
TRACE_2("searching for new vehicles",_vehicleAdded,_rangeTablesShown);

{
    private _vehicleCfg = configFile >> "CfgVehicles" >> typeOf _x;
    // config "ace_artillerytables_showRangetable" [0 disabled, 1 enabled] falls back to artilleryScanner
    private _showRangetable = if (isNumber (_vehicleCfg >> QGVAR(showRangetable))) then {
        getNumber (_vehicleCfg >> QGVAR(showRangetable))
    } else {
        getNumber (_vehicleCfg >> "artilleryScanner")
    };
    if ((_showRangetable == 1) && {!(_x in _vehicleAdded)}) then {
        private _vehicle = _x;
        private _turret = [];
        private _turretCfg = configNull; // find turret with artillery, will be one with primaryGunner = 1 (e.g. RHS PRP-3)
        {
            private _xTurretCfg = [_vehicleCfg, _x] call CBA_fnc_getTurret;
            if ((getNumber (_xTurretCfg >> "primaryGunner")) == 1) exitWith {
                _turret = _x;
                _turretCfg = _xTurretCfg;
            };
        } forEach allTurrets _vehicle;
        TRACE_3("",_vehicle,configName _vehicleCfg,_turret);
        if (isNull _turretCfg) exitWith { ERROR_1("no primaryGunner %1",configName _vehicleCfg); };
        if ((count _turret) != 1) then { WARNING_2("sub turret %1-%2",_typeOf,_turret); };

        private _weaponsTurret = _vehicle weaponsTurret _turret;
        if ((count _weaponsTurret) != 1) exitWith { WARNING_1("multiple weapons - %1",_typeOf); };
        private _weapon = _weaponsTurret select 0;

        private _turretAnimBody = getText (_turretCfg >> "animationSourceBody");
        private _turretAnimGun = getText (_turretCfg >> "animationSourceGun");

        // For artillery with detached camera (I_Truck_02_MRL_F) need to use animationSourcePhase
        // But that command won't always work, so fallback to animationPhase
        private _currentElevRad = _vehicle animationSourcePhase _turretAnimGun;
        if (isNil "_currentElevRad") then { _currentElevRad = _vehicle animationPhase _turretAnimGun; };
        private _currentTraverseRad = _vehicle animationSourcePhase _turretAnimBody;
        if (isNil "_currentTraverseRad") then { _currentTraverseRad = _vehicle animationPhase _turretAnimBody; };

        // Some turrets (MK6) have a neutralX rotation that we need to add to min/max config elevation to get actual limits
        private _weaponDir = _vehicle weaponDirection _weapon;
        private _turretRot = [vectorDir _vehicle, vectorUp _vehicle, deg _currentTraverseRad] call CBA_fnc_vectRotate3D;
        private _neutralX = (acos ((_turretRot vectorCos _weaponDir) min 1)) - (deg _currentElevRad); // vectorCos can return values outside of -1..1
        _neutralX = (round (_neutralX * 10)) / 10; // minimize floating point errors
        private _minElev = _neutralX + getNumber (_turretCfg >> "minElev");
        private _maxElev = _neutralX + getNumber (_turretCfg >> "maxElev");

        private _applyCorrections = if (isNumber (_vehicleCfg >> QGVAR(applyCorrections))) then {
            getNumber (_vehicleCfg >> QGVAR(applyCorrections))
        } else {
            getNumber (_vehicleCfg >> "artilleryScanner")
        };
        private _advCorrection = GVAR(advancedCorrections) && {_applyCorrections == 1};
        if ((missionNamespace getVariable [QEGVAR(mk6Mortar,airResistanceEnabled), false]) && {_vehicle isKindOf "Mortar_01_base_F"}) then {
            _advCorrection = true;
        };

         // check weapon and limits in case different vehicles use the same weapon (cammo variants should still produce the same array)
        private _info = [_weapon, _minElev, _maxElev, _advCorrection];

        _vehicleAdded pushBack _vehicle;
        ace_player setVariable [QGVAR(vehiclesAdded), _vehicleAdded];

        private _index = _rangeTablesShown pushBackUnique _info;
        TRACE_2("",_info,_index);
        if (_index != -1) then {
            private _statement = {
                params ["", "", "_info"];
                TRACE_1("interaction statement",_info);
                [FUNC(rangeTableOpen), _info] call CBA_fnc_execNextFrame; // delay a frame because of interaction menu closing dialogs
            };
            private _condition = {
                //IGNORE_PRIVATE_WARNING ["_player"];
                ("ACE_artilleryTable" in (_player call EFUNC(common,uniqueItems))) && {[_player, objNull, ["notOnMap", "isNotSitting", "isNotInside"]] call EFUNC(common,canInteractWith)}
            };
            private _displayName = format ["%1%2", getText (_vehicleCfg >> "displayName"),["","*"] select _advCorrection];
            private _action = [format ['QGVAR(%1)',_index], _displayName, QPATHTOF(UI\icon_rangeTable.paa), _statement, _condition, {}, _info] call EFUNC(interact_menu,createAction);
            [ace_player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call EFUNC(interact_menu,addActionToObject);
            TRACE_1("added action",_displayName);
            ace_player setVariable [QGVAR(rangeTablesShown), _rangeTablesShown];
        };
    };
} forEach (nearestObjects [ace_player, ["LandVehicle"], 25]);
