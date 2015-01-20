#include "script_component.hpp"

if (!isNil ("cse_ab_ATragMX_windSpeed")) then
{
	ctrlSetText [300, Str(Round((cse_ab_ATragMX_windSpeed select cse_ab_ATragMX_currentTarget) * 100) / 100)];
};
if (!isNil ("cse_ab_ATragMX_windDirection")) then
{
	ctrlSetText [310, Str(Round((cse_ab_ATragMX_windDirection select cse_ab_ATragMX_currentTarget)))];
};
if (!isNil ("cse_ab_ATragMX_inclinationAngle")) then
{
	ctrlSetText [320, Str(Round((cse_ab_ATragMX_inclinationAngle select cse_ab_ATragMX_currentTarget)))];
};
if (!isNil ("cse_ab_ATragMX_targetSpeed")) then
{
	ctrlSetText [330, Str(Round((cse_ab_ATragMX_targetSpeed select cse_ab_ATragMX_currentTarget) * 100) / 100)];
};
if (!isNil ("cse_ab_ATragMX_targetRange")) then
{
	ctrlSetText [340, Str(Round((cse_ab_ATragMX_targetRange select cse_ab_ATragMX_currentTarget)))];
};
