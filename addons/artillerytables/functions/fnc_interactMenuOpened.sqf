#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Interaction menu opened, search for nearby artillery vehicles.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Can Open <BOOL>
 *
 * Example:
 * [bob, bob] call ace_artillerytables_fnc_interactMenuOpened
 *
 * Public: No
 */

params ["_menuType"];
TRACE_1("interactMenuOpened",_menuType);

if (_menuType != 1) exitWith {};
// if (!("ACE_artilleryTable" in (ace_player call EFUNC(common,uniqueItems)))) exitWith {};

private _vehicleAdded = ace_player getVariable [QGVAR(vehiclesAdded), []];
private _rangeTablesShown = ace_player getVariable [QGVAR(rangeTablesShown), []];

TRACE_2("",_vehicleAdded,_rangeTablesShown);

{
    private _vehicle = _x;
    private _typeOf = typeOf _vehicle;
    private _enabled = _vehicle getVariable [QGVAR(enabled), getNumber (configFile >> "CfgVehicles" >> _typeOf >> "artilleryScanner")];
    TRACE_3("",_vehicle,_typeOf,_enabled);

    if ((_enabled in [1,true]) && {!(_vehicle in _vehicleAdded)}) then {
        private _vehicle = _vehicle;
        private _weaponsTurret = _vehicle weaponsTurret [0];
        if ((count _weaponsTurret) != 1) exitWith { WARNING_1("multiple weapons - %1",_typeOf); };
        private _weapon = _weaponsTurret select 0;

        private _weaponDir = _vehicle weaponDirection _weapon;
        private _turretRot = [vectorDir _vehicle, vectorUp _vehicle, (180 / PI) * (_vehicle animationPhase "mainTurret")] call FUNC(rotateVector3d);
        private _neutralX = acos (_turretRot vectorDotProduct _weaponDir) - (180 / PI) * (_vehicle animationPhase "mainGun");
        _neutralX = (round (_neutralX * 10)) / 10; // minimize floating point errors

        private _turretCfg = [_typeOf, [0]] call CBA_fnc_getTurret;
        private _minElev = _neutralX + getNumber (_turretCfg >> "minElev");
        private _maxElev = _neutralX + getNumber (_turretCfg >> "maxElev");

        private _advCorrection = GVAR(advancedCorrections) && {(getNumber (configFile >> "CfgVehicles" >> _typeOf >> QGVAR(skipCorrections))) != 1};

        private _info = [_weapon, _minElev, _maxElev, _advCorrection]; // in case multiple vehicle types use the same weapon

        _vehicleAdded pushBack _vehicle;
        ace_player setVariable [QGVAR(vehiclesAdded), _vehicleAdded];

        private _index = _rangeTablesShown pushBackUnique _info;
        TRACE_2("",_info,_index);
        if (_index != -1) then {
            private _statement = {
                params ["", "", "_info"];
                TRACE_1("interaction statement",_info);
                [{
                    _this call FUNC(rangeTableOpen); // delay a frame because of interaction menu closing dialogs
                }, _info] call CBA_fnc_execNextFrame;
            };
            private _condition = {
                //IGNORE_PRIVATE_WARNING ["_player"];
                // ("ACE_artilleryTable" in (_player call EFUNC(common,uniqueItems)))
                // && {[_player, objNull, ["notOnMap", "isNotSitting"]] call EFUNC(common,canInteractWith)}
                true
            };
            private _displayName = format ["%1%2", getText (configFile >> "CfgVehicles" >> _typeOf >> "displayName"),["","*"] select _advCorrection];
            private _action = [format ['QGVAR(%1)',_index], _displayName, QPATHTOF(UI\icon_rangeTable.paa), _statement, _condition, {}, _info] call EFUNC(interact_menu,createAction);
            private _ret = [ace_player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call EFUNC(interact_menu,addActionToObject);
            TRACE_1("added action",_ret);
            ace_player setVariable [QGVAR(rangeTablesShown), _rangeTablesShown];
        };
    };
} forEach (nearestObjects [ace_player, ["LandVehicle"], 25]);


