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
_reciever = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_title = [_this, 1, "",[""]] call BIS_fnc_Param;
_content =  [_this, 2, [""],[[""]]] call BIS_fnc_Param;
_type =  [_this, 3, 0,[0]] call BIS_fnc_Param;
_parameters = [_this, 4, [], [[]]] call BIS_fnc_Param;

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