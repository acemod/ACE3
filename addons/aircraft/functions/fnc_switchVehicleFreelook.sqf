/*
 * Author: Dystopian
 * Controls Vehicle Freelook state. Called from vehicle player EH.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, vehicle player] call ace_aircraft_fnc_switchVehicleFreelook
 *
 * Public: No
 */
#include "script_component.hpp"

#include "\a3\ui_f\hpp\defineResincl.inc"
#define LB_FREELOOK_DISABLED 0
#define LB_FREELOOK_ENABLED  1

params ["_player", "_vehicle"];

if (!hasInterface) exitWith {};

disableSerialization;
private _displayMission = DISPLAY(IDD_MISSION);
if (isNull _displayMission) exitWith { // wait for mission start
    [{!isNull DISPLAY(IDD_MISSION)}, FUNC(switchVehicleFreelook), [_player, _vehicle]] call CBA_fnc_waitUntilAndExecute;
};

private _disableFreelook = 
    _vehicle isKindOf "Air"
    && {!(_vehicle isKindOf "ParachuteBase")}
    && { // check if pilot or copilot
        _player == driver _vehicle
        || {1 == getNumber (([_vehicle, _player call CBA_fnc_turretPath] call CBA_fnc_getTurret) >> "isCopilot")}
    }
;
if (_disableFreelook isEqualTo GVAR(isVehicleFreelookDisabled)) exitWith {};

private _displayInterrupt = DISPLAY(IDD_INTERRUPT);
// exit if in aircraft when option becomes enabled - otherwise arma crashes on ctrlActivate
if (!isNull _displayInterrupt) exitWith {};
_displayInterrupt = _displayMission createDisplay "RscDisplayInterrupt";
if (isNil "_displayInterrupt" || {isNull _displayInterrupt}) exitWith {hint "no Interrupt display"};

private _buttonGame = _displayInterrupt displayCtrl IDC_OPTIONS_GAMEOPTIONS;
if (isNull _buttonGame || "ButtonGame" != ctrlClassName _buttonGame) then {
    hint "no Game button";
} else {
    ctrlActivate _buttonGame;
    private _displayGameOptions = DISPLAY(IDD_GAMEOPTIONS);
    if (isNull _displayGameOptions) then {
        hint "no GameOptions display";
    } else {
        private _lbFreelook = _displayGameOptions displayCtrl IDC_OPTIONS_VEHICLEFREELOOK;
        if (isNull _lbFreelook || "ValueVehicleFreelook" != ctrlClassName _lbFreelook) then {
            hint "no VehicleFreelook listbox";
        } else {
            _lbFreelook lbSetCurSel ([LB_FREELOOK_ENABLED, LB_FREELOOK_DISABLED] select _disableFreelook);
            GVAR(isVehicleFreelookDisabled) = _disableFreelook;
        };
        _displayGameOptions closeDisplay 0;
    };
};

_displayInterrupt closeDisplay 0;
