#include "script_component.hpp"
/*
 * Author: alganthe
 * Internal function used by ace_ai_fnc_garrison to make the units move to the positions it picked.
 *
 * Arguments:
 * 0: Array of arrays <ARRAY>
 *    0: Unit needing to be placed <UNIT>
 *    1: Position the unit need to be placed at <POSITION>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [ [unit1, [10, 10, 10]], [unit2, [30, 30, 30]], [unitN, getPos player] ] call ace_ai_fnc_garrisonMove
 *
 * Public: No
*/

params [ ["_unitMoveList", nil, [[]]] ];

if (isNil "_unitMoveList") exitWith {};

// Start initial movement
private _unitMoveListUnits = (_unitMoveList apply {_x select 0});
[QGVAR(setBehaviour), [(_unitMoveListUnits select {leader _x == _x}), "AWARE"], _unitMoveListUnits] call CBA_fnc_targetEvent;
[QGVAR(AISection), [_unitMoveListUnits, ["FSM"], false], _unitMoveListUnits] call CBA_fnc_targetEvent;
[QGVAR(doMove), [_unitMoveList], _unitMoveListUnits] call CBA_fnc_targetEvent;
[QGVAR(enableAttack), [_unitMoveListUnits select {leader _x == _x}, false], _unitMoveListUnits] call CBA_fnc_targetEvent;

{
    _x setVariable [QGVAR(garrisonMove_failSafe), nil, true];
    _x setVariable [QGVAR(garrisonMove_unitPosMemory), nil, true];
} foreach _unitMoveListUnits;

// Avoid duplicate PFHs 
if (isNil QGVAR(garrison_moveUnitPFH)) then {
    missionNameSpace setVariable [QGVAR(garrison_moveUnitPFH), true, true];

    // PFH checking if the units have reached their destination
    [{
        params ["_args", "_pfhID"];

        private _unitMoveList = missionNameSpace getVariable [QGVAR(garrison_unitMoveList), []];

        // End PFH if all units are placed / unable to reach position
        if (_unitMoveList isEqualTo []) then {
            missionNameSpace setVariable [QGVAR(garrison_moveUnitPFH), nil, true];
            LOG("garrisonMove PFH: PFH finished it's job | deleting PFH");
            _pfhID call CBA_fnc_removePerFrameHandler;

        } else {
            {
                _x params  ["_unit", "_pos"];

                private _fnc_attemptFailed = {
                    if (_failSafeRemainingAttemps == 0 ) then {
                        _unit setVariable [QGVAR(garrisonMove_failSafe), nil, true];
                        _unit setVariable [QGVAR(garrisonMove_unitPosMemory), nil, true];
                        [QGVAR(unGarrison), [[_unit]], _unit] call CBA_fnc_targetEvent;
                        _unitMoveList deleteAt (_unitMoveList find _x);
                        LOG("garrisonMove PFH: all moving commands failed | restoring AI capabilities");

                    } else {
                        _unit setVariable [QGVAR(garrisonMove_failSafe), [_failSafeTimer + 15, _failSafeRemainingAttemps - 1]];
                        [QGVAR(doMove), [[[_unit, _pos]]], _unit] call CBA_fnc_targetEvent;
                        LOG("garrisonMove PFH unitReady: unit not close enough | Sending another doMove command");
                    };
                };

                private _fnc_attemptSuccessful = {
                    _unit setVariable [QGVAR(garrisonMove_failSafe), nil, true];
                    _unit setVariable [QGVAR(garrisonMove_unitPosMemory), nil, true];
                    _unit setVariable [QGVAR(garrisonned), true, true];
                    _unitMoveList deleteAt (_unitMoveList find _x);

                    [QGVAR(AISection), [[_unit], ["PATH"], false], _unit] call CBA_fnc_targetEvent;
                    [QGVAR(AISection), [[_unit], ["FSM"], true], _unit] call CBA_fnc_targetEvent;

                    if ({(_x select 0) in units _unit && {!isPlayer (_x select 0)}} count _unitMoveList == 0) then {
                        [QGVAR(enableAttack), [[_unit], true], _unit] call CBA_fnc_targetEvent;
                    };

                    LOG(format [ARR_2("garrisonMove PFH: unit in position | %1 units left", count _unitMoveList)]);
                };

                // Check if unit is alive or even existing
                if (!alive _unit || {_unit getVariable [QGVAR(garrisoned), false]}) then {
                    _unitMoveList deleteAt (_unitMoveList find _x);
                    LOG(format [ARR_2("garrisonMove PFH: unit dead, deleted or garrisoned via TP | %1 units left", count _unitMoveList)]);

                } else {
                    private _unitPos = getPos _unit;
                    if (surfaceisWater _unitPos) then {
                        _unitPos = getPosASL _unit;
                    } else {
                        _unitPos = getPosATL _unit;
                    };

                    if (unitReady _unit) then {
                        // Check for distance, doMove and AI are moody and may stop for no reason, within 6 meters and ready should be fine
                        if (_unitPos distance _pos < 1.5) then {
                            call _fnc_attemptSuccessful;

                        } else {
                            // Tell the unit to move if an order wasn't given within 30s, avoid doMove spam
                           (_unit getVariable [QGVAR(garrisonMove_failSafe), [CBA_missionTime, 5]]) params ["_failSafeTimer", "_failSafeRemainingAttemps"];

                            if (_failSafeTimer <= CBA_missionTime) then {
                                call _fnc_attemptFailed;
                            };
                        };
                    } else {
                        (_unit getVariable [QGVAR(garrisonMove_unitPosMemory), [CBA_missionTime, [0,0,0]]]) params ["_unitPosTimer", "_unitOldPos"];

                        // AI may sometimes not be able to report unitReady, this is to avoid the PFH running forever
                        switch true do { 
                            case ((_unitPos distance _pos) < 1.5) : {
                                call _fnc_attemptSuccessful;
                            };

                            case ((_unitPosTimer + 5) < CBA_missionTime && {_unitOldPos distance _unitPos < 0.5}) : {
                                call _fnc_attemptFailed;
                            };

                            case (_unitOldPos distance _unitPos < 0.5) : {};

                            default {
                                _unit setVariable [QGVAR(garrisonMove_unitPosMemory), [CBA_missionTime, _unitPos]];
                            }; 
                        };
                    };
                };
            } foreach _unitMoveList;

            missionNameSpace setVariable [QGVAR(garrison_unitMoveList), _unitMoveList, true];
        };
    }, 0.5, []] call CBA_fnc_addPerFrameHandler;
};
