#include "script_component.hpp"
/*
 * Author: Nelson Duarte, SilentSpike
 * Updates spectator UI unit info widget
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spectator_fnc_ui_updateWidget
 *
 * Public: No
 */
#define IMG_COMMANDER "a3\Ui_f\data\IGUI\Cfg\CommandBar\imageCommander_ca.paa"
#define IMG_DRIVER "a3\Ui_f\data\IGUI\Cfg\CommandBar\imageDriver_ca.paa"
#define IMG_GUNNER "a3\Ui_f\data\IGUI\Cfg\CommandBar\imageGunner_ca.paa"
#define IMG_CARGO "a3\Ui_f\data\IGUI\Cfg\CommandBar\imageCargo_ca.paa"
#define IMG_UNARMED "" // TODO: Find suitable unarmed icon

// Hide if no target or widget is toggled off
if (!GVAR(uiWidgetVisible) || {isNull GVAR(camFocus)}) exitWith {CTRL_WIDGET ctrlShow false};

private _focus = GVAR(camFocus);

private _name = ([_focus] call EFUNC(common,getName)) select [0, NAME_MAX_CHARACTERS];
if !(isPlayer _focus) then { _name = format ["%1: %2", localize "str_player_ai", _name]; };

private _unitTypePicture = "";
private _vehicleTypePicture = "";
private _vehiclePositionPicture = "";
if (_focus != vehicle _focus) then {
    _vehicleTypePicture = getText (configFile >> "CfgVehicles" >> typeOf vehicle _focus >> "Picture");

    _vehiclePositionPicture = switch (_focus) do {
        case (commander vehicle _focus): {IMG_COMMANDER};
        case (driver vehicle _focus): {IMG_DRIVER};
        case (gunner vehicle _focus): {IMG_GUNNER};
        default {IMG_CARGO};
    };
} else {
    _unitTypePicture = [_focus] call EFUNC(common,getVehicleIcon);
};


private _weapon = currentWeapon _focus;
private _weaponPicture = if (_weapon != "") then {
    getText (configFile >> "CfgWeapons" >> _weapon >> "Picture")
} else {
    IMG_UNARMED
};

private _throwable = (currentThrowable _focus) param [0,""];
private _throwablePicture = if (_throwable != "") then {
    getText (configFile >> "CfgMagazines" >> _throwable >> "Picture")
} else {
    IMG_UNARMED
};

(getPlayerScores _focus) params [
    ["_kills",0,[0]],
    ["_softKills",0,[0]],
    ["_armoredKills",0,[0]],
    ["_airKills",0,[0]],
    ["_deaths",0,[0]],
    ["_total",0,[0]]
];

CTRL_WIDGET_NAME ctrlSetText _name;
CTRL_WIDGET_KILLS ctrlSetText str _kills;
CTRL_WIDGET_LAND ctrlSetText str _softKills;
CTRL_WIDGET_ARMORED ctrlSetText str _armoredKills;
CTRL_WIDGET_AIR ctrlSetText str _airKills;
CTRL_WIDGET_DEATHS ctrlSetText str _deaths;
CTRL_WIDGET_TOTAL ctrlSetText str _total;

CTRL_WIDGET_WEAPON ctrlSetText _weaponPicture;
CTRL_WIDGET_THROWABLE ctrlSetText _throwablePicture;

CTRL_WIDGET_UNIT ctrlSetText _unitTypePicture;
CTRL_WIDGET_VEHICLE ctrlSetText _vehicleTypePicture;
CTRL_WIDGET_VEHICLE_POS ctrlSetText _vehiclePositionPicture;

// Handle widget toggling
if !(ctrlShown CTRL_WIDGET) then {
    CTRL_WIDGET ctrlShow true;
};
