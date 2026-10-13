#include "..\script_component.hpp"
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

// Check for FRIES change
private _checkbox = CONTROL(ID_DIALOG) ID_CHECKBOX_FRIES;
if (ctrlShown _checkbox && {(cbChecked _checkbox) isNotEqualTo (_checkbox getVariable QGVAR(originalState))}) then {
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
    _x params ["_combo", "", "_button", "_originalIndex"];
    private _currentTurret = [GVAR(currentAircraft), _forEachIndex] call EFUNC(common,getPylonTurret);
    private _turret = _button getVariable [QGVAR(turret), _currentTurret];
    if (_currentTurret isEqualTo [-1]) then {_currentTurret = [];};
    if (_turret isEqualTo [-1]) then {_turret = [];};

    // Configure pylons when either the magazine or its assigned turret changes
    if ((lbCurSel _combo) != _originalIndex || {_turret isNotEqualTo _currentTurret}) then {
        _pylonsToConfigure pushBack _forEachIndex;
    };
} forEach GVAR(comboBoxes);

if (_pylonsToConfigure isEqualTo []) exitWith {};

[_pylonsToConfigure, 0] call FUNC(configurePylons);

// As a zeus you expect module dialogs to close once you click apply
if (GVAR(isCurator)) then {
    call FUNC(onButtonClose);
};
