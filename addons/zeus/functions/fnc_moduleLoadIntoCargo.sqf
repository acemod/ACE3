#include "script_component.hpp"
/*
 * Author: 654wak654
 * Loads the object module is placed on into selected vehicle.
 *
 * Arguments:
 * 0: Module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleLoadIntoCargo
 *
 * Public: No
 */

if (canSuspend) exitWith {[FUNC(moduleLoadIntoCargo), _this] call CBA_fnc_directCall;};

params ["_logic"];

if !(local _logic) exitWith {};

private _cargo = attachedTo _logic;

deleteVehicle _logic;

if !(missionNamespace getVariable [QEGVAR(cargo,enable), false]) exitWith {
    [LSTRING(RequiresAddon)] call FUNC(showMessage);
};
if (isNull _cargo) exitWith {
    [LSTRING(NothingSelected)] call FUNC(showMessage);
};
if (!alive _cargo) exitWith {
    [LSTRING(OnlyAlive)] call FUNC(showMessage);
};

[
    _cargo,
    {
        params ["_successful", "_cargo", "_mousePosASL"];
        if (!_successful) exitWith {};

        private _holder = (nearestObjects [ASLToAGL _mousePosASL, EGVAR(cargo,cargoHolderTypes), 5, true]) param [0, objNull]; // 2d distance search
        if (isNull _holder) exitWith {
            [LSTRING(NothingSelected)] call FUNC(showMessage);
        };
        if (!alive _holder) exitWith {
            [LSTRING(OnlyAlive)] call FUNC(showMessage);
        };

        private _displayName = [_cargo] call EFUNC(common,getName);
        if ([_cargo, _holder, true] call EFUNC(cargo,loadItem)) then {
            private _loadedItem = [localize ELSTRING(cargo,LoadedItem), "<br/>", " "] call CBA_fnc_replace;
            private _holderDisplayName = [_holder] call EFUNC(common,getName);
            [_loadedItem, _displayName, _holderDisplayName] call FUNC(showMessage);
        } else {
            private _loadingFailed = [localize ELSTRING(cargo,LoadingFailed), "<br/>", " "] call CBA_fnc_replace;
            [_loadingFailed, _displayName] call FUNC(showMessage);
        };
    },
    localize LSTRING(ModuleLoadIntoCargo_DisplayName),
    "a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa"
] call FUNC(getModuleDestination);
