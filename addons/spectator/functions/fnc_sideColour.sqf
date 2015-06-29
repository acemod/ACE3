/*
    Author:
    voiper

    Description:
    Determine side colour for spectator GUI.

    Arguments:
    0: Side <Scalar>

    Example:
    [0 call ace_spectator_fnc_sideColour;

    Return Value:
    Colour <Array>

    Public:
    No
*/

#include "script_component.hpp"
#define FACTOR 1.3
#define GETCOLOUR(a,b) (profileNameSpace getVariable [QUOTE(a), b])

PARAMS_1(_side);

_colour = switch _side do {
    case BLUFOR: {
        [
            GETCOLOUR('Map_BLUFOR_R', 0),
            GETCOLOUR('Map_BLUFOR_G', 0.3),
            GETCOLOUR('Map_BLUFOR_B', 0.6)
        ]
    };
    
    case OPFOR: {
        [
            GETCOLOUR('Map_OPFOR_R', 0.5),
            GETCOLOUR('Map_OPFOR_G', 0),
            GETCOLOUR('Map_OPFOR_B', 0)
        ]
    };
    
    case INDEPENDENT: {
        [
            GETCOLOUR('Map_Independent_R', 0),
            GETCOLOUR('Map_Independent_G', 0.5),
            GETCOLOUR('Map_Independent_B', 0)
        ]
    };
    
    case CIVILIAN: {
        [
            GETCOLOUR('Map_Civilian_R', 0.4),
            GETCOLOUR('Map_Civilian_G', 0),
            GETCOLOUR('Map_Civilian_B', 0.5)
        ]
    };
};

_colour set [0, (_colour select 0) * FACTOR];
_colour set [1, (_colour select 1) * FACTOR];
_colour set [2, (_colour select 2) * FACTOR];
_colour set [3, 1];

_colour