/**
 * fn_sendDisplayMessageTo.sqf
 * @Descr: Displays a message on locality of receiver
 * @Author: Glowbal
 *
 * @Arguments: [receiver OBJECT, title STRING, content STRING, type NUMBER (Optional)]
 * @Return: void
 * @PublicAPI: true
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
        }foreach _parameters;
        _title = format _localizationArray;

        _localizationArray = [_content];
        {
            _localizationArray pushback _x;
        }foreach _parameters;
        _content = format _localizationArray;

        [_title,_content,_type] call EFUNC(common,displayMessage);
    };
};
