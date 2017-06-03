// TODO: Header
#include "script_component.hpp"

private _loadoutName = ctrlText 170;
private _loadoutPylons = [];
{
    _loadoutPylons pushBack ((_x select 0) lbData (lbCurSel (_x select 0)));
} forEach GVAR(comboBoxes);

private _index = lbAdd [160, _loadoutName];
lbSetCurSel [160, _index];

private _aircraftLoadouts = profileNamespace getVariable [QGVAR(aircraftLoadouts), []];
_aircraftLoadouts pushBack [_loadoutName, _loadoutPylons, typeOf GVAR(currentAircraft)];
profileNamespace setVariable [QGVAR(aircraftLoadouts), _aircraftLoadouts];
