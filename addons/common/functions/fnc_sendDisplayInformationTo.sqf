/*
 * Author: Glowbal
 * Sends a display information hint to a receiver
 *
 * Arguments:
 * 0: receiver <OBJECT>
 * 1: title <STRING>
 * 2: content <ARRAY>
 * 3: type (optional) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_reciever", objNull], ["_title", ""], ["_content", ""], ["_type", 0], ["_parameters", []]];

if (isPlayer _reciever) then {
    if (!local _reciever) then {
        [_this, QFUNC(sendDisplayInformationTo), _reciever, false] call FUNC(execRemoteFnc);
    } else {
        if (isLocalized _title) then {
            _title = localize _title;
        };

        private "_localizationArray";
        _localizationArray = [_title];

        {
            _localizationArray pushBack _x;
            false
        } count _parameters;

        _title = format _localizationArray;

        {
            if (isLocalized _x) then {
                _localizationArray = [localize _x];

                {
                    _localizationArray pushBack _x;
                    false
                } count _parameters;

                _content set [_forEachIndex, format _localizationArray];
            };
        } forEach _content;

        [_title, _content, _type] call FUNC(displayInformation);
    };
};
