#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(pfeh) = -1;
["CBA_settingsInitialized", {
    TRACE_1("CBA_settingsInitialized",GVAR(enabled));
    ["vehicle", LINKFUNC(enterVehicle), true] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;




// for testing
["CUP_BTR80_Common_Base", "InitPost", {
    (_this select 0) setVariable ["ace_viewports_viewports", 
        [
            ["view_0","",[0.734863,0.143927,-0.291199],45,[0.734863,0.143927,-0.466199],0.75,["compartment1"],["cargo"]],
            ["view_1","",[0.950684,-0.00122738,-0.344391],90,[0.950684,-0.00122738,-0.519391],0.75,["compartment1"],["cargo"]],
            ["view_2","",[0.932129,-0.729811,-0.319],90,[0.932129,-0.729811,-0.494],0.75,["compartment1"],["cargo"]],
            ["view_3","",[-0.963379,-0.749183,-0.351501],-90,[-0.963379,-0.749183,-0.526501],0.75,["compartment1"],["cargo"]],
            ["view_4","",[-0.973145,0.0148516,-0.364868],-90,[-0.973145,0.0148516,-0.539868],0.75,["compartment1"],["cargo"]],
            ["view_5","",[-0.73584,0.119176,-0.291229],-45,[-0.73584,0.119176,-0.466229],0.75,["compartment1"],["cargo"]]
        ]
    ];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["CUP_BTR90_Base", "InitPost", {
    (_this select 0) setVariable ["ace_viewports_viewports", 
        [
            ["view_0","",[0.533417,2.4613,-0.309951],0,[0.533417,2.4613,-0.484951],0.75,["compartment1"],["cargo"]],
            ["view_1","",[0.877106,2.38684,-0.306068],30,[0.877106,2.38684,-0.481068],0.75,["compartment1"],["cargo"]],
            ["view_2","",[1.04312,0.0909424,-0.281996],60,[1.04312,0.0909424,-0.456996],0.75,["compartment1"],["cargo"]],
            ["view_3","",[1.03799,-0.928223,-0.282196],80,[1.03799,-0.928223,-0.457196],0.75,["compartment1"],["cargo"]],
            ["view_4","",[-0.90097,-0.913086,-0.282192],-80,[-0.90097,-0.913086,-0.457192],0.75,["compartment1"],["cargo"]],
            ["view_5","",[-0.939301,0.109985,-0.281992],-60,[-0.939301,0.109985,-0.456992],0.75,["compartment1"],["cargo"]]
        ]
    ];
}, nil, ["CUP_BTR90_HQ_Base"], true] call CBA_fnc_addClassEventHandler;

["CUP_M2Bradley_Base", "InitPost", {
    (_this select 0) setVariable ["ace_viewports_viewports", 
        [
            ["view_0","",[0.987915,-0.324707,-0.0673385],70,[0.987915,-0.324707,-0.242338],0.75,[],["cargo"]],
            ["view_1","",[0.90979,-0.970215,-0.043139],120,[0.90979,-0.970215,-0.218139],0.75,[],["cargo"]],
            ["view_2","",[0.328003,-1.87402,-0.0408039],160,[0.328003,-1.87402,-0.215804],0.75,[],["cargo"]],
            ["view_3","",[-0.357178,-1.89063,-0.0480237],175,[-0.357178,-1.89063,-0.223024],0.75,[],["cargo"]],
            ["view_4","",[-0.752075,-1.87061,-0.0522318],190,[-0.752075,-1.87061,-0.227232],0.75,[],["cargo"]],
            ["view_5","",[-0.936401,-0.0942383,-0.107764],-75,[-0.936401,-0.0942383,-0.282764],1,[],["cargo"]],
            ["SLD","screen",[0,0,0.05],[0,0],[0.729126,-0.191597,-0.573349],5,[],["cargo"]]
        ]
    ];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;
