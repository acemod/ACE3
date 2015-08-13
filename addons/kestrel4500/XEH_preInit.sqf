#include "script_component.hpp"

ADDON = false;

PREP(buttonPressed);
PREP(canShow);
PREP(collectData);
PREP(createKestrelDialog);
PREP(displayKestrel);
PREP(generateOutputData);
PREP(measureWindSpeed);
PREP(onCloseDialog);
PREP(onCloseDisplay);
PREP(restoreUserData);
PREP(storeUserData);
PREP(updateDisplay);
PREP(updateImpellerState);

ADDON = true;

FUNC(updateMemory) = {
    params ["_slot", "_value"];
    GVAR(MIN)   set [_slot, (GVAR(MIN) select _slot) min _value];
    GVAR(MAX)   set [_slot, _value max (GVAR(MAX) select _slot)];
    GVAR(TOTAL) set [_slot, (GVAR(TOTAL) select _slot) + _value];
};

FUNC(dayOfWeek) = {
    private "_table";
    params ["_year", "_month", "_day"];

    _table = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];
    if (_month < 3) then {
        _year = _year - 1;
    };
    (_year + floor(_year/4) - floor(_year/100) + floor(_year/400) + (_table select (_month - 1)) + _day) % 7
};
