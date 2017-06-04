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

#include "script_component.hpp"
#define IMG_COMMANDER "a3\Ui_f\data\IGUI\Cfg\CommandBar\imageCommander_ca.paa"
#define IMG_DRIVER "a3\Ui_f\data\IGUI\Cfg\CommandBar\imageDriver_ca.paa"
#define IMG_GUNNER "a3\Ui_f\data\IGUI\Cfg\CommandBar\imageGunner_ca.paa"
#define IMG_CARGO "a3\Ui_f\data\IGUI\Cfg\CommandBar\imageCommander_ca.paa"

// Hide if no target, or target is a location or widget is toggled off
if (!GVAR(uiWidgetVisible) || {GVAR(camOnLocation)} || {isNull GVAR(camTarget)}) exitWith {CTRL_WIDGET ctrlShow false};

private _focus = GVAR(camTarget);

private _name = ([_focus] call EFUNC(common,getName)) select [0, NAME_MAX_CHARACTERS];
if !(isPlayer _focus) then { _name = format ["%1: %2", localize "str_player_ai", _name]; };

private _unitTypePicture = [_focus] call EFUNC(common,getVehicleIcon);
private _vehicleTypePicture = getText (configFile >> "CfgVehicles" >> typeOf vehicle _focus >> "Picture");
private _insigniaTexture = ["GetGroupTexture", [group _focus]] call BIS_fnc_dynamicGroups;

private _weapon = currentWeapon _focus;
private _weaponPicture = if (_weapon != "") then {
    getText (configFile >> "CfgWeapons" >> _weapon >> "Picture");
} else {
    if (_focus != vehicle _focus) then {
        if (commander vehicle _focus == _focus) exitWith {IMG_COMMANDER};
        if (driver vehicle _focus == _focus) exitWith {IMG_DRIVER};
        if (gunner vehicle _focus == _focus) exitWith {IMG_GUNNER};
        IMG_CARGO
    } else {""};
};

(getPlayerScores _focus) params [["_kills",0,[0]], ["_softKills",0,[0]], ["_armoredKills",0,[0]], ["_airKills",0,[0]], ["_deaths",0,[0]], ["_total",0,[0]]];

CTRL_WIDGET_NAME ctrlSetText _name;
CTRL_WIDGET_AVATAR ctrlSetText _insigniaTexture;
CTRL_WIDGET_KILLS ctrlSetText str _kills;
CTRL_WIDGET_LAND ctrlSetText str _softKills;
CTRL_WIDGET_ARMORED ctrlSetText str _armoredKills;
CTRL_WIDGET_AIR ctrlSetText str _airKills;
CTRL_WIDGET_DEATHS ctrlSetText str _deaths;
CTRL_WIDGET_TOTAL ctrlSetText str _total;
CTRL_WIDGET_WEAPON ctrlSetText _weaponPicture;

CTRL_WIDGET_UNIT ctrlSetText (["",_unitTypePicture] select (vehicle _focus == _focus));
CTRL_WIDGET_UNIT ctrlShow (vehicle _focus == _focus);
CTRL_WIDGET_VEHICLE ctrlSetText (["",_vehicleTypePicture] select (vehicle _focus != _focus));
CTRL_WIDGET_VEHICLE ctrlShow (vehicle _focus != _focus);

CTRL_WIDGET_WEAPON ctrlShow (_weaponPicture != "");
CTRL_WIDGET_WEAPON_BACK ctrlShow (_weaponPicture != "");

// Handle widget toggling
if !(ctrlShown CTRL_WIDGET) then {
    CTRL_WIDGET ctrlShow true;
};
