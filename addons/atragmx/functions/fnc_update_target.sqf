#include "script_component.hpp"

if (!isNil ("GVAR(ATragMX_windSpeed)")) then
{
    ctrlSetText [300, Str(Round((GVAR(ATragMX_windSpeed) select GVAR(ATragMX_currentTarget)) * 100) / 100)];
};
if (!isNil ("GVAR(ATragMX_windDirection)")) then
{
    ctrlSetText [310, Str(Round((GVAR(ATragMX_windDirection) select GVAR(ATragMX_currentTarget))))];
};
if (!isNil ("GVAR(ATragMX_inclinationAngle)")) then
{
    ctrlSetText [320, Str(Round((GVAR(ATragMX_inclinationAngle) select GVAR(ATragMX_currentTarget))))];
};
if (!isNil ("GVAR(ATragMX_targetSpeed)")) then
{
    ctrlSetText [330, Str(Round((GVAR(ATragMX_targetSpeed) select GVAR(ATragMX_currentTarget)) * 100) / 100)];
};
if (!isNil ("GVAR(ATragMX_targetRange)")) then
{
    ctrlSetText [340, Str(Round((GVAR(ATragMX_targetRange) select GVAR(ATragMX_currentTarget))))];
};
