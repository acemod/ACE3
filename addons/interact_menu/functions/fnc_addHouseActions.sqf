/*
 * Author: PabstMirror
 * Scans for nearby "Static" objects (buildings) and adds the UserActions to them.
 * Called when interact_menu starts rendering (from "interact_keyDown" event)
 *
 * Arguments:
 * Interact Menu Type (0 - world, 1 - self) <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [0] call ace_interact_menu_fnc_addHouseActions
 *
 * Public: Yes
 */
#include "script_component.hpp"

PARAMS_1(_interactionType);

//Ignore self-interaction menu:
if (_interactionType != 0) exitWith {};
//Ignore when mounted:
if ((vehicle ACE_player) != ACE_player) exitWith {};

[{
    private ["_fncStatement", "_player", "_fncCondition", "_variable", "_theHouse", "_statement", "_condition", "_configPath", "_displayName", "_displayNameDefault", "_iconImage", "_position", "_maxDistance", "_helperObject", "_actionOffset", "_memPoint", "_object", "_count", "_helperPos", "_action"];
    PARAMS_2(_args,_pfID);
    EXPLODE_4_PVT(_args,_setPosition,_addedHelpers,_housesScaned,_houseBeingScaned);

    if (!EGVAR(interact_menu,keyDown)) then {
        {deleteVehicle _x;} forEach _addedHelpers;
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent Rare Error when ending mission with interact key down:
        if (isNull ace_player) exitWith {};

        //If player moved >5 meters from last pos, then rescan
        if (((getPosASL ace_player) distance _setPosition) < 5) exitWith {};

       // systemChat str _houseBeingScaned; 
        
        if (_houseBeingScaned isEqualTo []) then {
            _houseWasScaned = false;
            {
                _theHouse = _x;
                if (!(_theHouse in _housesScaned)) exitWith {
                    _houseWasScaned = true;
                    _housesScaned pushBack _x;
                    if ((typeOf _theHouse) != "") then {
                        _configPath = (configFile >> "CfgVehicles" >> (typeOf _theHouse));
                        if (isClass (_configPath >> "UserActions")) then {
                            _args set [3, [_theHouse, 0, []]];
                        };
                    };
                };
                // Need to scan fairly far, because houses are big. You can be 25m from center of building but right next to a door.
            } forEach nearestObjects [ace_player, ["Static"], 30];
            if (!_houseWasScaned) then {
                _args set [0, (getPosASL ace_player)];
            };
        } else {
            EXPLODE_3_PVT(_houseBeingScaned,_theHouse,_index,_houseHelpers);
            _configPath = configFile >> "CfgVehicles" >> (typeOf _theHouse) >> "UserActions";
            if (_index < ((count _configPath) - 1)) then {
                _actionPath = _configPath select _index;

                _fncStatement = {
                    PARAMS_3(_target,_player,_variable);
                    EXPLODE_3_PVT(_variable,_theHouse,_statement,_condition);
                    this = _theHouse; //this feels dirty
                    call _statement;
                };
                _fncCondition = {
                    PARAMS_3(_target,_player,_variable);
                    EXPLODE_3_PVT(_variable,_theHouse,_statement,_condition);
                    this = _theHouse; //this feels dirty
                    call _condition;
                };

                _displayName = getText (_actionPath >> "displayName");
                _displayNameDefault = getText (_actionPath >> "displayNameDefault");
                _position = getText (_actionPath >> "position");
                _condition = getText (_actionPath >> "condition");
                _statement = getText (_actionPath >> "statement");
                _maxDistance = getNumber (_actionPath >> "radius");

                if (_displayName == "") then {_displayName = (configName _x);};
                if (_position == "") then {ERROR("Bad Position");};
                if (_condition == "") then {_condition = "true";};
                if (_statement == "") then {ERROR("No Statement");};

                _statement = compile _statement;
                _condition = compile _condition;
                _maxDistance = _maxDistance + 0.1; //increase range slightly
                _iconImage = "";

                if (_displayNameDefault != "") then {
                    //something like: "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />";
                    //find the end [.paa']
                    _endIndex = _displayNameDefault find ".paa'";
                    if (_endIndex == -1) exitWith {};
                    _startIndex = _endIndex - 1;
                    _endIndex = _endIndex + 4;
                    //work backwards to find the starting [']
                    while {(_startIndex > 0) && {_iconImage == ""}} do {
                        if ((_displayNameDefault select [_startIndex, 1]) == "'") then {
                            _startIndex = _startIndex + 1;
                            _iconImage = _displayNameDefault select [_startIndex, (_endIndex - _startIndex)];
                        };
                        _startIndex = _startIndex - 1;
                    };
                };

                //Find a helper object, if one exists on the selection position
                _helperObject = objNull;
                _actionOffset = [0,0,0];
                {
                    EXPLODE_3_PVT(_x,_memPoint,_object,_count);
                    if (_memPoint == _position) exitWith {
                        _helperObject = _object;
                        //make sure actions don't overlap (although they are usualy mutually exclusive)
                        _actionOffset = [0,0,(_count * 0.05)];
                        _x set [2, (_count + 1)];
                    };
                } forEach _houseHelpers;

                if (isNull _helperObject) then {
                    _helperObject = "Sign_Sphere25cm_F" createVehicleLocal (getpos _theHouse);
                    _houseHelpers pushBack [_position, _helperObject, 1];
                    _helperPos = _theHouse modelToWorld (_theHouse selectionPosition _position);
                    //ASL/ATL bullshit:
                    if (surfaceIsWater _helperPos) then {
                        _helperObject setPosAslw _helperPos;
                    } else {
                        _helperObject setPos _helperPos;
                    };
                    _helperObject hideObject true;
                    _addedHelpers pushBack _helperObject;
                    TRACE_3("Making New Helper %1",_helperObject,_helperPos,_theHouse);
                };

                _action = [(configName _actionPath), _displayName, _iconImage, _fncStatement, _fncCondition, {}, [_theHouse, _statement, _condition], _actionOffset, _maxDistance] call EFUNC(interact_menu,createAction);
                [_helperObject, 0, [],_action] call EFUNC(interact_menu,addActionToObject);

                _index = _index + 1;
                _args set [3, [_theHouse, _index, _houseHelpers]];
            } else {
                _args set [3, []];
            };
        };
    };
}, 0, [((getPosASL ace_player) vectorAdd [-100,0,0]), [], [], []]] call CBA_fnc_addPerFrameHandler;
