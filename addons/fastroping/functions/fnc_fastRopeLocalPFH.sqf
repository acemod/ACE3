#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Local PerFrameHandler during fast roping.
 *
 * Arguments:
 * 0: PFH arguments <ARRAY>
 * 1: PFH handle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[_unit, _vehicle, _rope, _ropeIndex], 0] call ace_fastroping_fnc_fastRopeLocalPFH
 *
 * Public: No
 */
params ["_arguments", "_pfhHandle"];
_arguments params ["_unit", "", "_rope", "", "_timeToPlayRopeSound"];
_rope params ["", "", "", "_dummy", "_hook"];

//Wait until the unit is actually outside of the helicopter
if (vehicle _unit != _unit) exitWith {};

// dummy lost hook
if (isNull _hook) exitWith {
    TRACE_1("Hook lost, dropping and exiting pfeh",_unit);

    [_unit, "", 2] call EFUNC(common,doAnimation);
    _unit setVectorUp [0, 0, 1];

    [_pfhHandle] call CBA_fnc_removePerFrameHandler;
};

//Start fast roping
if (animationState _unit != "ACE_FastRoping") exitWith {
    _unit disableCollisionWith _dummy;
    _unit attachTo [_dummy, [0, 0, -1.45]];
    [_unit, "ACE_FastRoping", 2] call EFUNC(common,doAnimation);
};


//End of fast rope
if (isNull attachedTo _unit) exitWith {
    TRACE_1("exit pfeh",_unit);
    [_unit, "", 2] call EFUNC(common,doAnimation);
    _unit setVectorUp [0, 0, 1];

    if (_unit == ACE_player) then {
        playSound QGVAR(Thud);
    };

    [_pfhHandle] call CBA_fnc_removePerFrameHandler;
};

if (_unit == ACE_player && {diag_tickTime > _timeToPlayRopeSound}) then {
    _arguments set [4, (_timeToPlayRopeSound + 1)];
    playSound QGVAR(Rope);
};
