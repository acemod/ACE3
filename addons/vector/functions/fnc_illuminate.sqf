/*
 * Author: commy2
 *
 *
 * Arguments:
 * 0: String <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["5"] call ace_vector_fnc_illuminate
 *
 * Public: No
 */

#include "script_component.hpp"

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

if (_this select 0) then {
    {
        if (ctrlIDC _x != 170) then {
            private _string = ctrlText _x;
            private _index = _string find ".paa";

            if (_index != -1 && {_string find "_illum.paa" == -1}) then {
                _string = toArray _string;
                _string resize _index;

                _x ctrlSetText format ["%1_illum.paa", toString _string];
            };
        };
    } forEach allControls _dlgVector;
} else {
    {
        if (ctrlIDC _x != 170) then {
            private _string = ctrlText _x;
            private _index = _string find "_illum.paa";

            if (_index != -1) then {
                _string = toArray _string;
                _string resize _index;

                _x ctrlSetText format ["%1.paa", toString _string];
            };

        };
    } forEach allControls _dlgVector;
};
