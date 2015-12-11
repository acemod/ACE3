// by commy2
#include "script_component.hpp"

params [["_filterName", "ERROR: No Name", [""]], ["_fncName", "", [""]]];

GVAR(customFilters) pushBack [_filterName, _fncName];
