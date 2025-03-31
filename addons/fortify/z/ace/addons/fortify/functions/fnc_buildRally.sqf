#include "script_component.hpp"
/*
 * Author: Kingsley
 * Checks whether the given player can build a rally point.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Example:
 * [player] call ace_fortify_fnc_BuildRally
 *
 * Public: Yes
 */

// Parameter Init
params ["_unit"];
private _cooldown = CBA_MissionTime - ace_lastRally;

// Check cooldown
if(ace_lastRally > 0 && _cooldown < ace_fortify_rallyCooldown) exitWith {
	["",("RP: Cooldown " + str((round (_cooldown - ace_fortify_rallyCooldown)*-1)) + "s")] spawn sr_support_fnc_infoMessage;
};
// Check friendly close
private _friendlies = _unit nearEntities [["CAManBase","Car","Tank"], 5];
if (({([side _x, playerSide] call BIS_fnc_sideIsFriendly)} count _friendlies) < 2) exitWith {
    ["","RP: No Friendlies nearby"] spawn sr_support_fnc_infoMessage;
};

// Check enemies close
private _enemies = _unit nearEntities [["CAManBase","Car","Tank"], ace_fortify_rallyDistance];
if (({!([side _x, playerSide] call BIS_fnc_sideIsFriendly)} count _enemies) > 0) exitWith {
    ["","RP: Enemies too close"] spawn sr_support_fnc_infoMessage;
};

// Check and update resources
private _remain = ace_trenches_trenchSupplies - ace_fortify_rallyCosts;
if (_remain < 0) exitWith {
    ["","RP: Not enough Resources"] spawn sr_support_fnc_infoMessage;
};

// Unit Animation
_unit playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";

// Progress Bar
[2, [_unit,_remain], {
    
    // Parameter Init
    params ["_args","_elapsedTime","_totalTime","_errorCode"];
    _args params ["_unit","_remain"];

    // Update Supplies
    ace_trenches_trenchSupplies = _remain;
    publicVariable "ace_trenches_trenchSupplies";

    // Create Rally
    private _position = _unit getPos [0.5, direction _unit];
    private _rally = "ACE_RallyPoint" createVehicle _position;
    _rally setPos _position;
    _rally setVariable ["ace_fortify_CTIME",CBA_missionTime,true];

    // Update Global Time Stamp
    ace_lastRally = CBA_MissionTime;
    publicVariable "ace_lastRally";

    // Condition and code for deletion
    [{{!([side _x, playerSide] call BIS_fnc_sideIsFriendly)} count (_this nearEntities [["CAManBase","Car","Tank"],  ace_fortify_rallyDistance]) > 0}, {
        deleteVehicle _this;
    }, _rally, ace_fortify_rallyTimer, {deleteVehicle _this;}] call CBA_fnc_waitUntilAndExecute;
},{
        // Cancel Progress
        ["","RP: Canceled"] spawn sr_support_fnc_infoMessage;
}, "Placing Rally Point"] call ace_common_fnc_progressBar;


