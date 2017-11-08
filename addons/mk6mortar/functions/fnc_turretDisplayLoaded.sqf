/*
 * Author: PabstMirror
 * Called when the mk6's in game UI is loaded.  Hides rangefinder data if it is disabled.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [rsc,"Mk6Mortar"] call ace_mk6mortar_fnc_turretDisplayLoaded
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_display", "_rscType"];
TRACE_2("params",_display,_rscType);

if (_rscType != "Mk6Mortar") exitWith {};
if (isNull _display) exitWith {};

#define CTRL_CA_OPTICSPITCH (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_OPTICSPITCH")
#define CTRL_CA_OPTICSZOOM (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_OPTICSZOOM")
#define CTRL_CA_SOLUTION_TEXT (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_SOLUTION_TEXT")
#define CTRL_CA_DISTANCE_TEXT (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_DISTANCE_TEXT")
#define CTRL_CA_DISTANCE (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_DISTANCE")
#define CTRL_CA_TIME_TEXT (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_TIME_TEXT")
#define CTRL_CA_TIME (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_TIME")
#define CTRL_CA_ELEV_NEED_TEXT (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_ELEV_NEED_TEXT")
#define CTRL_CA_RANGEELEMENTS_GROUP (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_RangeElements_group")

#define CTRL_CA_HEADING (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_Heading")
#define CTRL_CA_ELEV (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_ELEV")
#define CTRL_CA_ELEV_NEED (configFile >> "RscInGameUI" >> "ACE_Mk6_RscWeaponRangeArtillery" >> "CA_IGUI_elements_group" >> "controls" >> "CA_ELEV_NEED")

private _fnc_hideControl = {
    params ["_path", "_hideCtrl"];
    private _idc = getNumber (_path >> "IDC");
    private _pos = [];
    if (_hideCtrl) then {
        _pos = [-9,-9,0,0];
    } else {
        {
            if (isNumber (_path >> _x)) then {
                _pos pushBack (getNumber (_path >> _x));
            } else {
                _pos pushBack (call compile (getText (_path >> _x)));
            };
        } forEach ["x", "y", "w", "h"];
    };
    (_display displayCtrl _idc) ctrlSetPosition _pos;
    (_display displayCtrl _idc) ctrlCommit 0;
};

{
    [_x, (!GVAR(allowComputerRangefinder))] call _fnc_hideControl;
} forEach [CTRL_CA_OPTICSPITCH, CTRL_CA_OPTICSZOOM, CTRL_CA_SOLUTION_TEXT, CTRL_CA_DISTANCE_TEXT, CTRL_CA_DISTANCE, CTRL_CA_TIME_TEXT, CTRL_CA_TIME, CTRL_CA_ELEV_NEED_TEXT, CTRL_CA_RANGEELEMENTS_GROUP];

//Always hide these, handled by the mil convertions PFEH in handlePlayerVehChanged
[CTRL_CA_HEADING, true] call _fnc_hideControl;
[CTRL_CA_ELEV, true] call _fnc_hideControl;
[CTRL_CA_ELEV_NEED, true] call _fnc_hideControl;
