#include "script_component.hpp"

private ["_outputData"];

_outputData = call cse_ab_Kestrel4500_fnc_generate_output_data;

ctrlSetText [74100, _outputData select 0];
ctrlSetText [74200, _outputData select 1];

ctrlSetText [74300, _outputData select 2];
ctrlSetText [74301, _outputData select 3];
ctrlSetText [74302, _outputData select 4];

ctrlSetText [74303, _outputData select 5];
ctrlSetText [74304, _outputData select 6];
ctrlSetText [74305, _outputData select 7];

ctrlSetText [74400, _outputData select 8];
ctrlSetText [74401, _outputData select 9];
