/*
 * Author: 654wak654
 * Starts the pylon configuration.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_pylons_fnc_onButtonApply
 *
 * Public: No
 */
#include "script_component.hpp"

// Check for FRIES change
private _checkbox = CONTROL(ID_DIALOG) ID_CHECKBOX_FRIES;
if (ctrlShown _checkbox && {!((cbChecked _checkbox) isEqualTo (_checkbox getVariable QGVAR(originalState)))}) then {
    if (cbChecked _checkbox) then {
        [GVAR(currentAircraft)] call EFUNC(fastroping,equipFRIES);
    } else {
        [GVAR(currentAircraft)] call EFUNC(fastroping,cutRopes);
        private _fries = GVAR(currentAircraft) getVariable [QEGVAR(fastroping,FRIES), objNull];
        deleteVehicle _fries;
    };
    _checkbox setVariable [QGVAR(originalState), cbChecked _checkbox];
};

private _pylonsToConfigure = [];
{
    // Pick combo boxes where current selection doesn't match original selection
    if ((lbCurSel (_x select 0)) != (_x select 3)) then {
        _pylonsToConfigure pushBack _forEachIndex;
    };
} forEach GVAR(comboBoxes);

if (_pylonsToConfigure isEqualTo []) exitWith {};

[_pylonsToConfigure, 0] call FUNC(configurePylons);

// As a zeus you expect module dialogs to close once you click apply
if (GVAR(isCurator)) then {
    call FUNC(onButtonClose);
};
