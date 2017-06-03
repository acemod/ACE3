// TODO: Header
#include "script_component.hpp"

private _selection = lbText [160, lbCurSel 160];

lbDelete [160, lbCurSel 160];

private _aircraftLoadouts = profileNamespace getVariable [QGVAR(aircraftLoadouts), []];
FILTER(_aircraftLoadouts,(_x select 0) != _selection);
profileNamespace setVariable [QGVAR(aircraftLoadouts), _aircraftLoadouts];
