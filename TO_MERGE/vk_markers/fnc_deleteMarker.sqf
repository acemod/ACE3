// #define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_2(_name,_mods);

if (isServer) then {
	GVAR(deleted_markers) pushBack _name;
	publicVariable QGVAR(deleted_markers);
};
deleteMarkerLocal _name;
deleteMarkerLocal format ["%1_size",_name];
deleteMarkerLocal format ["%1_text",_name];
{
	deleteMarkerLocal format ["%1_%2",_name,_x];
	TRACE_2("Deleted",_name,_x);
} forEach _mods;
