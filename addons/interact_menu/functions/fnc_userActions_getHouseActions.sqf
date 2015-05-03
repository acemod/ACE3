/*
 * Author: PabstMirror
 * Scans for nearby "Static" objects (buildings) and adds the UserActions to them.
 * Called when interact_menu starts rendering (from "interact_keyDown" event)
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


PARAMS_1(_typeOfBuilding);

_memPoints = [];
_memPointsActions = [];

_configPath = configFile >> "CfgVehicles" >> _typeOfBuilding >> "UserActions";

_fncStatement = {
    PARAMS_3(_target,_player,_variable);
    EXPLODE_2_PVT(_variable,_actionStatement,_actionCondition);
    this = _target getVariable [QGVAR(building), objNull];
    call _actionStatement;
};
_fncCondition = {
    PARAMS_3(_target,_player,_variable);
    EXPLODE_2_PVT(_variable,_actionStatement,_actionCondition);
    this = _target getVariable [QGVAR(building), objNull];
    call _actionCondition;
};

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
    _actionMaxDistance = _actionMaxDistance + 0.5; //increase range slightly
    _iconImage = "";

    //todo: extension? (~75% of time doing this string shit!)
    if (_actionDisplayNameDefault != "") then {
        //something like: "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />";
        //find the end [.paa']
        _endIndex = _actionDisplayNameDefault find ".paa'";
        if (_endIndex == -1) exitWith {};
        _startIndex = _endIndex - 1;
        _endIndex = _endIndex + 4;
        //work backwards to find the starting [']
        while {(_startIndex > 0) && {_iconImage == ""}} do {
            if ((_actionDisplayNameDefault select [_startIndex, 1]) == "'") then {
                _startIndex = _startIndex + 1;
                _iconImage = _actionDisplayNameDefault select [_startIndex, (_endIndex - _startIndex)];
            };
            _startIndex = _startIndex - 1;
        };
    };

    _memPointIndex = _memPoints find _actionPosition;
    _actionOffset = [0,0,0];
    if (_memPointIndex == -1) then {
        _memPointIndex = count _memPoints;
        _memPoints pushBack _actionPosition;
        _memPointsActions pushBack [];
    } else {
        _actionOffset set [2, 0.05 * (count (_memPointsActions select _memPointIndex))];
    };

    _action = [(configName _actionPath), _actionDisplayName, _iconImage, _fncStatement, _fncCondition, {}, [_actionStatement, _actionCondition], _actionOffset, _actionMaxDistance, [false,false,false,false,true]] call EFUNC(interact_menu,createAction);
    (_memPointsActions select _memPointIndex) pushBack _action;

};

[_memPoints, _memPointsActions]
