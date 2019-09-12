#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

// HitScream
GVAR(HitScreamNamespace) = [] call CBA_fnc_createNamespace;
GVAR(HitScreamNamespace) setVariable ["#default", "Male08ENG"];

GVAR(HitScreamNamespace) setVariable ["Male08ENG", [[
    ["A3\sounds_f\characters\human-sfx\P01\Low_hit_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Low_hit_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Low_hit_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Low_hit_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Low_hit_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P01\Mid_hit_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Mid_hit_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Mid_hit_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Mid_hit_4",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P01\Max_hit_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Max_hit_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Max_hit_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Max_hit_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P01\Max_hit_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male06ENG", [[
    ["A3\sounds_f\characters\human-sfx\P02\Low_hit_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Low_hit_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Low_hit_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Low_hit_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Low_hit_5",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Low_hit_6",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P02\Mid_hit_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Mid_hit_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Mid_hit_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Mid_hit_4",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P02\Max_hit_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Max_hit_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Max_hit_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P02\Max_hit_4",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male09ENG", [[
    ["A3\sounds_f\characters\human-sfx\P03\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P03\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P03\Hit_Low_3",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P03\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P03\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P03\Hit_Mid_3",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P03\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P03\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P03\Hit_Max_3",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male07ENG", [[
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P04\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male03GRE", [[
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P05\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male02ENGB", [[
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P06\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male01ENGB", [[
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P07\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male01GRE", [[
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P08\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male02ENG", [[
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P09\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male02GRE", [[
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P10\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male03ENG", [[
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P11\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male03ENGB", [[
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P12\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male04ENG", [[
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P13\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male05GRE", [[
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P14\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male06GRE", [[
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P15\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male04GRE", [[
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P16\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male05ENGB", [[
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P17\Hit_Max_5",3.1622777,1,80]
]]];

GVAR(HitScreamNamespace) setVariable ["Male05ENG", [[
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Low_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Low_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Low_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Low_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Low_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Mid_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Mid_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Mid_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Mid_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Mid_5",3.1622777,1,80]
], [
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Max_1",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Max_2",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Max_3",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Max_4",3.1622777,1,80],
    ["A3\sounds_f\characters\human-sfx\P18\Hit_Max_5",3.1622777,1,80]
]]];

// InjuredMoan
GVAR(InjuredMoanNamespace) = [] call CBA_fnc_createNamespace;
GVAR(InjuredMoanNamespace) setVariable ["#default", "Male08ENG"];

GVAR(InjuredMoanNamespace) setVariable ["Male08ENG", [[
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Low_5",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Low_6",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Low_7",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Low_8",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Mid_5",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Mid_6",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Mid_7",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Mid_8",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Max_1",1.5848932,1,20],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Max_2",1.5848932,1,20],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Max_3",1.5848932,1,20],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Max_4",1.5848932,1,20],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Max_5",1.5848932,1,20],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Max_6",1.5848932,1,20],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Max_7",1.5848932,1,20],
    ["A3\Sounds_F\characters\human-sfx\P01\Soundinjured_Max_8",1.5848932,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male06ENG", [[
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Low_5",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Low_6",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Low_7",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Low_8",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Mid_5",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Mid_6",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Mid_7",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Mid_8",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Max_5",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Max_6",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Max_7",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P02\Soundinjured_Max_8",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male09ENG", [[
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P03\Soundinjured_Max_4",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male07ENG", [[
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P04\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male03GRE", [[
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P05\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male02ENGB", [[
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P06\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male01ENGB", [[
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P07\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male01GRE", [[
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male02ENG", [[
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P09\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male02GRE", [[
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P10\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male03ENG", [[
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P11\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male03ENGB", [[
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P12\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male04ENG", [[
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P13\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male05GRE", [[
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P14\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male06GRE", [[
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P15\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male04GRE", [[
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P16\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male05ENGB", [[
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P17\Soundinjured_Max_5",1.7782794,1,20]
]]];

GVAR(InjuredMoanNamespace) setVariable ["Male05ENG", [[
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Low_1",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Low_2",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Low_3",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Low_4",1.4125376,1,10],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Low_5",1.4125376,1,10]
], [
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Mid_1",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Mid_2",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Mid_3",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Mid_4",1.5848932,1,15],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Mid_5",1.5848932,1,15]
], [
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Max_1",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Max_2",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Max_3",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Max_4",1.7782794,1,20],
    ["A3\Sounds_F\characters\human-sfx\P18\Soundinjured_Max_5",1.7782794,1,20]
]]];

ADDON = true;
