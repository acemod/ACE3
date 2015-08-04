/**
 * fn_sendDisplayInformationTo.sqf
 * @Descr: Sends a display information hint to a receiver
 * @Author: Glowbal
 *
 * @Arguments: [receiver OBJECT, title STRING, content ARRAY (An array with strings), type NUMBER (Optional)]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_reciever","_title","_content","_type", "_parameters", "_localizationArray"];

params[["_reciever",ObjNull,[ObjNull]],["_title","",[""]],["_content","",[""]],["_type",0,[0]],["_parameters",[],[[]]]];

if (isPlayer _reciever) then {
    if (!local _reciever) then {
        [_this, QFUNC(sendDisplayInformationTo), _reciever, false] call EFUNC(common,execRemoteFnc);
    } else {
        if (isLocalized _title) then {
            _title = localize _title;
        };
        _localizationArray = [_title];
        {
            _localizationArray pushback _x;
        } forEach _parameters;
        _title = format _localizationArray;

        {
            if (isLocalized _x) then {
                _localizationArray = [localize _x];
                {
                    _localizationArray pushback _x;
                } forEach _parameters;

                _content set [_foreachIndex, format _localizationArray];
            };

        }foreach _content;

        [_title,_content,_type] call EFUNC(common,displayInformation);
    };
};
