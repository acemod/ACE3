#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * CBA Event: "ace_wardrobe_eh_say3d"
 * Function to use say3D
 * If not defined otherwise, the Pitch will be randomised between 95% to 105% 
 *
 * Arguments:
 * 0: Sound Source <OBJECT>
 * 1: CfgSound Classname or Parameter Array <STRING|ARRAY>
 * - 0: CfgSound Classname      <STRING>
 * - 1: distance in meters      <NUMBER> (default: 50)
 * - 2: pitch                   <NUMBER> (default: random from 0.95 to 1.05)
 * - 3: is Speech               <BOOL>   (default: false)
 * - 4: offset                  <NUMBER> (default: 0)
 * - 4: Simulate Speed of Sound <BOOL>   (default: false)
 *
 * Return Value:
 * none
 *
 * Example:
 * [player, "ace_horny_bonk"] call ace_wardrobe_fnc_say3d
 *
 * Public: No
 */

params [
    ["_source", objNull, [objNull]   ],
    ["_sound",  [""],    ["", []]   ]
];

if (_sound isEqualType [] && {_sound#0 == ""} || {_sound isEqualType "" && {_sound == ""}}) exitWith {};

_sound params [
"_className",
["_distance",        50,                [0]         ],
["_pitch",           0.95 + random 0.1, [0]         ],
["_isSpeech",        false,             [false, 0]  ],
["_offSet",          0,                 [0]         ],
["_simSpeedOfSound", false,             [false]     ]
];


_source say3D [_className, _distance, _pitch, _isSpeech, _offSet, _simSpeedOfSound];

nil
