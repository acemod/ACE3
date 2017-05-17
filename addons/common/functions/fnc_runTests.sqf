/*
 * Author: PabstMirror
 * Run test functions
 *
 * Arguments:
 * 0: Specifc addon to test <STRING><OPTIONAL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_common_fnc_runTests;
 * ["ace_fcs"] call ace_common_fnc_runTests;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_addon", "#all", [""]]];

private _startTime = diag_tickTime;
private _fails = [];
private _total = 0;

{
    private _xAddon = configName _x;
    if ((_addon == "#all") || {_addon == _xAddon}) then {
        INFO_1("Testing Addon [%1]", _xAddon);
        {
            _total = _total + 1;
            private _testName = configName _x;
            private _testFile = getText _x;
            INFO_3("Testing [%1 -> %2] (%3)", _xAddon, _testName, _testFile);
            private _return = ([nil] apply (compile preProcessFileLineNumbers _testFile)) select 0;
            if ((isNil "_return") || {!(_return isEqualTo true)}) then {
                systemChat format ["Test [%1->%2] Failed", _xAddon, _testName];
                diag_log text format ["----- Test %1 [Failed] -----", _testName];
                _fails pushBack _testName;
            } else {
                diag_log text format ["----- Test %1 [Passed] -----", _testName];
            };
        } forEach (configProperties [_x, "isText _x"]);
    };
} forEach (configProperties [configFile >> "ACE_Tests"]);

INFO_1("ace_common_fnc_runTests finished in %1 ms", (1000 * (diag_tickTime - _startTime)) toFixed 1);
INFO_2("[%1 / %2] Tests Passed", (_total - (count _fails)), _total);
if (!(_fails isEqualTo [])) then {
    INFO_1("Failed: %1", _fails);
};
