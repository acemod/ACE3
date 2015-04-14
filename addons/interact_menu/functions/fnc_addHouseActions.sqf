/*
 * Author: PabstMirror
 * When interact_menu starts rendering (from "interact_keyDown" event)
 *
 * Arguments:
 * Interact Menu Type (0 - world, 1 - self) <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [0] call ace_logistics_wirecutter_fnc_interactEH
 *
 * Public: Yes
 */
#include "script_component.hpp"

PARAMS_1(_interactionType);

//Ignore self-interaction menu
if (_interactionType != 0) exitWith {};

//for performance only do stuff it they have a wirecutter item
//(if they somehow get one durring keydown they'll just have to reopen)
// if (!("ACE_wirecutter" in (items ace_player))) exitWith {};

systemChat "starting";

[{
    private ["_fncStatement", "_attachedFence", "_fncCondition", "_helper"];
    PARAMS_2(_args,_pfID);
    EXPLODE_3_PVT(_args,_setPosition,_addedHelpers,_housesScaned);

    if (!EGVAR(interact_menu,keyDown)) then {
        {deleteVehicle _x;} forEach _addedHelpers;
        [_pfID] call CBA_fnc_removePerFrameHandler;
    } else {
        // Prevent Rare Error when ending mission with interact key down:
        if (isNull ace_player) exitWith {};

        //If player moved >5 meters from last pos, then rescan
        if (((getPosASL ace_player) distance _setPosition) < 5) exitWith {};

        _fncStatement = {
            PARAMS_3(_dummyTarget,_player,_attachedFence);
            [_player, _attachedFence] call FUNC(cutDownFence);
        };
        _fncCondition = {
            PARAMS_3(_dummyTarget,_player,_attachedFence);
            ((!isNull _attachedFence) && {(damage _attachedFence) < 1} && {("ACE_wirecutter" in (items _player))})
        };


        {
            _theHouse = _x;
            if (!(_theHouse in _housesScaned)) then {
                _housesScaned pushBack _x;
                if ((typeOf _theHouse) != "") then {
                    _configPath = (configFile >> "CfgVehicles" >> (typeOf _theHouse));
                    if (isClass (_configPath >> "UserActions")) then {
                        _houseHelpers = [];


                        systemChat format ["Looking At %1 [%2]", _theHouse, (typeOf _theHouse)];
                        {
                            _displayName = getText (_x >> "displayName");
                            _position = getText (_x >> "position");
                            _condition = getText (_x >> "condition");
                            _statement = getText (_x >> "statement");

                            _helperObject = objNull;
                            _actionOffset = [0,0,0];
                            {
                                EXPLODE_3_PVT(_x,_memPoint,_object,_count);
                                if (_memPoint == _position) exitWith {
                                    _helperObject = _object;
                                    _offset = [0,0,(_count * 0.1)];
                                    _x set [2, (_count + 1)];
                                };
                            } forEach _houseHelpers;

                            if (isNull _helperObject) then {
                                _helperObject = "Sign_Sphere25cm_F" createVehicleLocal (getpos _theHouse);
                                _houseHelpers pushBack [_position, _helperObject, 1];
                                _helperPos = _theHouse modelToWorld (_theHouse selectionPosition _position);
                                //double check ASL/ATL bullshit
                                _helperObject setPos _helperPos;
                                _helperObject hideObject true;
                                _addedHelpers pushBack _helperObject;
                                diag_log text format ["Making New Helper %1", [_helperObject, _helperPos, _theHouse]];
                            };

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

                            _variable = [_theHouse, compile _statement, compile _condition];
                            
                            _action = [(configName _x), _displayName, "", _fncStatement, _fncCondition, {}, _variable, _actionOffset, 5] call EFUNC(interact_menu,createAction);
                            [_helperObject, 0, [],_action] call EFUNC(interact_menu,addActionToObject);

                        } foreach configproperties [(_configPath >> "UserActions")];
                    };
                };
            };
        } forEach nearestObjects [ace_player, ["Static"], 25];

        _args set [0, (getPosASL ace_player)];
    };
}, 0.1, [((getPosASL ace_player) vectorAdd [-100,0,0]), [], []]] call CBA_fnc_addPerFrameHandler;
