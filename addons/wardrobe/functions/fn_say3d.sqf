#include "../script_component.hpp"

/*
* Author: Zorn
* Function to execute say3d globally - triggered as 3cba event.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params [
    ["_source",     objNull,    [objNull]   ],
    ["_sound",      [""],        ["", []]   ]
];

if (_sound isEqualType [] && {_sound#0 == ""} || {_sound isEqualType "" && {_sound == ""}}) exitWith {};

_sound params [
"_className",
["_distance",        100,               [0]         ],
["_pitch",           0.95 + random 0.1, [0]         ],
["_isSpeech",        false,             [false, 0]  ],
["_offSet",          0,                 [0]         ],
["_simSpeedOfSound", false,             [false]     ]
];


_source say3D [_className, _distance, _pitch, _isSpeech, _offSet, _simSpeedOfSound];