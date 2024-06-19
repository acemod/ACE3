#include "..\script_component.hpp"

private _daytime = dayTime;
private _hours = floor _daytime;			
private _minutes = floor ((_daytime - _hours) * 60);
private _seconds = floor ((((_daytime - _hours) * 60) - _minutes) * 60);

[_hours, _minutes, _seconds]

