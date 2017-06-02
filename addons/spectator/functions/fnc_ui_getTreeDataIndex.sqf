/*
 * Author: Nelson Duarte, AACO
 * Function used to find a tree path of a unit
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_data", "", [""]]];

scopeName QGVAR(getTreeDataIndex);

// Make sure data is not empty
if (_data != "") then {
    private _ctrl = CTRL_LIST;

    // This also handles the locations list (_sideIndex = _locationIndex)
    for "_sideIndex" from 0 to ((_ctrl tvCount []) - 1) do {
        if (_ctrl tvData [_sideIndex] == _data) then {
            [_sideIndex] breakOut QGVAR(getTreeDataIndex);
        };
        for "_groupIndex" from 0 to ((_ctrl tvCount [_sideIndex]) - 1) do {
            if (_ctrl tvData [_sideIndex, _groupIndex] == _data) then {
                [_sideIndex, _groupIndex] breakOut QGVAR(getTreeDataIndex);
            };
            for "_unitIndex" from 0 to ((_ctrl tvCount [_sideIndex, _groupIndex]) - 1) do {
                if (_ctrl tvData [_sideIndex, _groupIndex, _unitIndex] == _data) then {
                    [_sideIndex, _groupIndex, _unitIndex] breakOut QGVAR(getTreeDataIndex);
                };
            };
        };
    };
};

[-1] // return empty path if not found (worst case)
