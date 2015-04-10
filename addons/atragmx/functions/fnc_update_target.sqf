#include "script_component.hpp"

if (!isNil QGVAR(windSpeed)) then
{
    ctrlSetText [300, Str(Round((GVAR(windSpeed) select GVAR(currentTarget)) * 100) / 100)];
};
if (!isNil QGVAR(windDirection)) then
{
    ctrlSetText [310, Str(Round((GVAR(windDirection) select GVAR(currentTarget))))];
};
if (!isNil QGVAR(inclinationAngle)) then
{
    ctrlSetText [320, Str(Round((GVAR(inclinationAngle) select GVAR(currentTarget))))];
};
if (!isNil QGVAR(targetSpeed)) then
{
    ctrlSetText [330, Str(Round((GVAR(targetSpeed) select GVAR(currentTarget)) * 100) / 100)];
};
if (!isNil QGVAR(targetRange)) then
{
    ctrlSetText [340, Str(Round((GVAR(targetRange) select GVAR(currentTarget))))];
};
