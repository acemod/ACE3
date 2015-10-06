/*
 * Author: Glowbal
 * Displays a message on locality of receiver
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
        [_this, QFUNC(sendDisplayMessageTo), _reciever, false] call FUNC(execRemoteFnc);
    } else {
        if (isLocalized _title) then {
            _title = localize _title;
        };

        if (isLocalized _content) then {
            _content = localize _content;
        };

        private "_localizationArray";
        _localizationArray = [_title];

        {
            _localizationArray pushBack _x;
            false
        } count _parameters;

        _title = format _localizationArray;

        _localizationArray = [_content];

        {
            _localizationArray pushBack _x;
            false
        } count _parameters;

        _content = format _localizationArray;

        [_title, _content, _type] call FUNC(displayMessage);
    };
};
