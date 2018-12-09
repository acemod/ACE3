#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
/*
 * Author: Dystopian
 * Toggles Vehicle Freelook game option.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_vehicles_fnc_toggleVehicleFreelook
 *
 * Public: No
 */

disableSerialization;
private _displayMission = DISPLAY(IDD_MISSION);
if (isNull _displayMission) exitWith {};

private _displayInterrupt = DISPLAY(IDD_INTERRUPT);
if (isNull _displayInterrupt) then {
    _displayInterrupt = _displayMission createDisplay "RscDisplayInterrupt";
};
if (isNil "_displayInterrupt" || {isNull _displayInterrupt}) exitWith {ERROR("no Interrupt display")};

private _value = -1;

private _buttonGame = _displayInterrupt displayCtrl IDC_OPTIONS_GAMEOPTIONS;
if (isNull _buttonGame || "ButtonGame" != ctrlClassName _buttonGame) then {
    ERROR("no Game button");
} else {
    ctrlActivate _buttonGame;
    private _displayGameOptions = DISPLAY(IDD_GAMEOPTIONS);
    if (isNull _displayGameOptions) then {
        ERROR("no GameOptions display");
    } else {
        private _lbFreelook = _displayGameOptions displayCtrl IDC_OPTIONS_VEHICLEFREELOOK;
        if (isNull _lbFreelook || "ValueVehicleFreelook" != ctrlClassName _lbFreelook) then {
            ERROR("no VehicleFreelook listbox");
        } else {
            if (2 != lbSize _lbFreelook) then {
                ERROR("too many listbox values");
            } else {
                _lbFreelook lbSetCurSel (1 - lbCurSel _lbFreelook);
                _value = lbCurSel _lbFreelook;
            };
        };
        _displayGameOptions closeDisplay 0;
    };
};

_displayInterrupt closeDisplay 0;

if (_value >= 0) then {
    [format [
        "%1 %2",
        localize "STR_A3_RscDisplayGameOptions_VehicleFreelook",
        [localize "STR_A3_OPTIONS_DISABLED", localize "STR_A3_OPTIONS_ENABLED"] select _value
    ]] call EFUNC(common,displayTextStructured);
};
