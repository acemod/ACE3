#include "script_component.hpp"

{
    drawLine3D [(_x select 0), (_x select 1), [1,1,1,1]];
} forEach GVAR(debug_lines);
