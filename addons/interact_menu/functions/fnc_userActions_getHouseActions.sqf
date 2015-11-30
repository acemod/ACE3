/*
 * Author: PabstMirror
 * Scans the buidling type for UserActions and Ladder mount points.
 *
 * Arguments:
 * 0: Building Classname <STRING>
 *
 * Return Value:
 * [[Array of MemPoints], [Array Of Actions]]
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_typeOfBuilding"];

private["_action", "_actionDisplayName", "_actionDisplayNameDefault", "_actionMaxDistance", "_actionOffset", "_actionPath", "_actionPosition", "_building", "_configPath", "_endIndex", "_iconImage", "_index", "_ladders", "_memPointIndex", "_memPoints", "_memPointsActions", "_startIndex"];

_searchIndex = GVAR(cachedBuildingTypes) find _typeOfBuilding;
if (_searchIndex != -1) exitWith {GVAR(cachedBuildingActionPairs) select _searchIndex};

_memPoints = [];
_memPointsActions = [];

//Get the offset for a memory point:
_fnc_getMemPointOffset = {
    params ["_memoryPoint"];
    _memPointIndex = _memPoints find _memoryPoint;
    _actionOffset = [0,0,0];
    if (_memPointIndex == -1) then {
        _memPoints pushBack _memoryPoint;
        _memPointsActions pushBack [];
    } else {
        _actionOffset set [2, 0.0254 * (count (_memPointsActions select _memPointIndex))];
    };
    _actionOffset
};

// Add UserActions for the building:
_fnc_userAction_Statement = {
    params ["_target", "_player", "_variable"];
    _variable params ["_actionStatement", "_actionCondition"];
    this = _target getVariable [QGVAR(building), objNull];
    call _actionStatement;
};
_fnc_userAction_Condition = {
    params ["_target", "_player", "_variable"];
    _variable params ["_actionStatement", "_actionCondition"];
    this = _target getVariable [QGVAR(building), objNull];
    if (isNull this) exitWith {false};
    call _actionCondition;
};

_configPath = configFile >> "CfgVehicles" >> _typeOfBuilding >> "UserActions";
for "_index" from 0 to ((count _configPath) - 1) do {
    _actionPath = _configPath select _index;

    _actionDisplayName = getText (_actionPath >> "displayName");
    _actionDisplayNameDefault = getText (_actionPath >> "displayNameDefault");
    _actionPosition = getText (_actionPath >> "position");
    _actionCondition = getText (_actionPath >> "condition");
    _actionStatement = getText (_actionPath >> "statement");
    _actionMaxDistance = getNumber (_actionPath >> "radius");

    if (_actionDisplayName == "") then {_actionDisplayName = (configName _x);};
    if (_actionPosition == "") then {ERROR("Bad Position");};
    if (_actionCondition == "") then {_actionCondition = "true";};
    if (_actionStatement == "") then {ERROR("No Statement");};

    _actionStatement = compile _actionStatement;
    _actionCondition = compile _actionCondition;
    _actionMaxDistance = _actionMaxDistance + 0.1; //increase range slightly
    _iconImage = "";

    //extension ~4x as fast:
    _iconImage =  "ace_parse_imagepath" callExtension _actionDisplayNameDefault;

    _actionOffset = [_actionPosition] call _fnc_getMemPointOffset;
    _memPointIndex = _memPoints find _actionPosition;

    _action = [(configName _actionPath), _actionDisplayName, _iconImage, _fnc_userAction_Statement, _fnc_userAction_Condition, {}, [_actionStatement, _actionCondition], _actionOffset, _actionMaxDistance, [false,false,false,false,true]] call EFUNC(interact_menu,createAction);
    (_memPointsActions select _memPointIndex) pushBack _action;
};

// Add Ladder Actions for the building:
_fnc_ladder_ladderUp = {
    params ["_target", "_player", "_variable"];
    _variable params ["_ladderIndex"];
    _building = _target getVariable [QGVAR(building), objNull];
    TRACE_3("Ladder Action - UP",_player,_building,_ladderIndex);
    _player action ["LadderUp", _building, _ladderIndex, 0];
};
_fnc_ladder_ladderDown = {
    params ["_target", "_player", "_variable"];
    _variable params ["_ladderIndex"];
    _building = _target getVariable [QGVAR(building), objNull];
    TRACE_3("Ladder Action - Down",_player,_building,_ladderIndex);
    _player action ["LadderDown", _building, _ladderIndex, 1];
};

_fnc_ladder_conditional = {
    params ["_target", "_player"];
    //(Check distance < 2) and (Don't show actions if on a ladder)
    ((_target distance _player) < 2) && {((getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState _player) >> "onLadder")) == 0)}
};

_ladders = getArray (configFile >> "CfgVehicles" >> _typeOfBuilding >> "ladders");
{
    _x params ["_ladderBottomMemPoint", "_ladderTopMemPoint"];

    _actionMaxDistance = 3; //interact_menu will check head -> target's offset; leave this high and do a precice distance check in condition

    _actionDisplayName = localize "str_action_ladderup";
    _iconImage = "\A3\ui_f\data\igui\cfg\actions\ladderup_ca.paa";
    //Ladder Up Action:
    _actionOffset = [_ladderBottomMemPoint] call _fnc_getMemPointOffset;
    _actionOffset = _actionOffset vectorAdd [0,0,1];
    _memPointIndex = _memPoints find _ladderBottomMemPoint;
    _action = [format ["LadderUp_%1", _forEachIndex], _actionDisplayName, _iconImage, _fnc_ladder_ladderUp, _fnc_ladder_conditional, {}, [_forEachIndex], _actionOffset, _actionMaxDistance, [false,false,false,false,true]] call EFUNC(interact_menu,createAction);
    (_memPointsActions select _memPointIndex) pushBack _action;

    _actionDisplayName = localize "str_action_ladderdown";
    _iconImage = "\A3\ui_f\data\igui\cfg\actions\ladderdown_ca.paa";
    //Ladder Down Action:
    _actionOffset = [_ladderTopMemPoint] call _fnc_getMemPointOffset;
    _actionOffset = _actionOffset vectorAdd [0,0,0.25];
    _memPointIndex = _memPoints find _ladderTopMemPoint;
    _action = [format ["LadderDown_%1", _forEachIndex], _actionDisplayName, _iconImage, _fnc_ladder_ladderDown, _fnc_ladder_conditional, {}, [_forEachIndex], _actionOffset, _actionMaxDistance, [false,false,false,false,true]] call EFUNC(interact_menu,createAction);
    (_memPointsActions select _memPointIndex) pushBack _action;

} forEach _ladders;

GVAR(cachedBuildingTypes) pushBack _typeOfBuilding;
GVAR(cachedBuildingActionPairs) pushBack [_memPoints, _memPointsActions];


[_memPoints, _memPointsActions]
