/*
 * Author: Glowbal
 *
 * Displays a message on locality of receiver
 *
 * Arguments:
 * 0: receiver (OBJECT)
 * 1: title (STRING)
 * 2: content (ARRAY)
 * 3: type (NUMBER)(Optional)
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_reciever","_title","_content","_type", "_parameters", "_localizationArray"];
params [
    ["_reciever",ObjNull,[ObjNull]],
    ["_title","",[""]],
    ["_content","",[""]],
    ["_type",0,[0]],
    ["_parameters",[],[[]]]
];

if (isPlayer _reciever) then {
    if (!local _reciever) then {
        [_this, QFUNC(sendDisplayMessageTo), _reciever, false] call EFUNC(common,execRemoteFnc);
    } else {

        if (isLocalized _title) then {
            _title = localize _title;
        };
        if (isLocalized _content) then {
            _content = localize _content;
        };

        _localizationArray = [_title];
        {
            _localizationArray pushback _x;
            true
        } count _parameters;
        _title = format _localizationArray;

        _localizationArray = [_content];
        {
            _localizationArray pushback _x;
            true
        } count _parameters;
        _content = format _localizationArray;

        [_title,_content,_type] call EFUNC(common,displayMessage);
    };
};
