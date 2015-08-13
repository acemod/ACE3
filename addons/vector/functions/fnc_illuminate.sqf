// by commy2
#include "script_component.hpp"

private "_dlgVector";

disableSerialization;
_dlgVector = GETUVAR(ACE_dlgVector,displayNull);

if (_this select 0) then {
    {
        if (ctrlIDC _x != 170) then {
            private ["_string", "_index"];

            _string = ctrlText _x;
            _index = _string find ".paa";

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
            private ["_string", "_index"];

            _string = ctrlText _x;
            _index = _string find "_illum.paa";

            if (_index != -1) then {
                _string = toArray _string;
                _string resize _index;

                _x ctrlSetText format ["%1.paa", toString _string];
            };

        };
    } forEach allControls _dlgVector;
};
