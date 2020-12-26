#include "script_component.hpp";


params ["_object", "_type", "_attackProfileMisc", "_lastProfileReturns", "_attackProfileFunction"];
_lastProfileReturns params ["_lastProfileReturnVector", "_lastProfileReturnPos"];

//PLACEHOLDER
/////
_functionReturns = +_lastProfileReturns;
/////
// private _functionReturns = [] call _attackProfileFunction;

_functionReturns params ["_functionReturnVector", "_functionReturnPos"];


[_functionReturnVector, _functionReturnPos];
