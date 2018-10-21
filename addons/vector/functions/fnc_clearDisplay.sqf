#include "script_component.hpp"
/*
 * Author: commy2
 * Clears the vectors control items.
 *
 * Arguments:
 * 0: "azimuth" or "distance" <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["azimuth"] call ace_vector_fnc_clearDisplay
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

switch (_this select 0) do {
    case ("azimuth"): {
        (_dlgVector displayCtrl 1315) ctrlSetText "";
        (_dlgVector displayCtrl 1316) ctrlSetText "";
        (_dlgVector displayCtrl 1317) ctrlSetText "";
        (_dlgVector displayCtrl 1318) ctrlSetText "";
        (_dlgVector displayCtrl 1319) ctrlSetText "";
    };

    case ("distance"): {
        (_dlgVector displayCtrl 1310) ctrlSetText "";
        (_dlgVector displayCtrl 1311) ctrlSetText "";
        (_dlgVector displayCtrl 1312) ctrlSetText "";
        (_dlgVector displayCtrl 1313) ctrlSetText "";
        (_dlgVector displayCtrl 1314) ctrlSetText "";
    };
};
