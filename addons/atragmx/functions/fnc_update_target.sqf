#include "script_component.hpp"

if (!isNil QUOTE(GVAR(windSpeed))) then
{
    ctrlSetText [300, Str(Round((GVAR(windSpeed) select GVAR(currentTarget)) * 100) / 100)];
};
if (!isNil QUOTE(GVAR(windDirection))) then
{
    ctrlSetText [310, Str(Round((GVAR(windDirection) select GVAR(currentTarget))))];
};
if (!isNil QUOTE(GVAR(inclinationAngle))) then
{
    ctrlSetText [320, Str(Round((GVAR(inclinationAngle) select GVAR(currentTarget))))];
};
if (!isNil QUOTE(GVAR(targetSpeed))) then
{
    ctrlSetText [330, Str(Round((GVAR(targetSpeed) select GVAR(currentTarget)) * 100) / 100)];
};
if (!isNil QUOTE(GVAR(targetRange))) then
{
    ctrlSetText [340, Str(Round((GVAR(targetRange) select GVAR(currentTarget))))];
};
