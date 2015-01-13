
cse_fnc_spawn_ieds_IED = compile preprocessFile "cse\cse_sys_ieds\fnc_spawn_ieds.sqf";
cse_fnc_spawn_chain_IED = compile preprocessFile "cse\cse_sys_ieds\fnc_spawn_chain.sqf";
cse_fnc_link_chain_IED = compile preprocessFile "cse\cse_sys_ieds\fnc_link_chain.sqf";
cse_fnc_thor3_detection_IED = compile preprocessFile "cse\cse_sys_ieds\fnc_thor3_detection.sqf";
cse_fnc_triggerManGotVisual_IED = compile preprocessFile "cse\cse_sys_ieds\fnc_triggerManGotVisual.sqf";


cse_fnc_checkIEDActivated_IED = compile preprocessFile "cse\cse_sys_ieds\fnc_checkIEDActivated.sqf";
cse_fnc_checkPressurePlateActivated_IED = compile preprocessFile "cse\cse_sys_ieds\fnc_checkPressurePlateActivated.sqf";
cse_fnc_checkRadioTriggered_IED = compile preprocessFile "cse\cse_sys_ieds\fnc_checkRadioTriggered.sqf";



cse_fnc_spotterFlee_IED = compile preprocessFile "cse\cse_sys_ieds\spotter\fnc_spotterFlee.sqf";
cse_fnc_spotterBehaviour_IED = compile preprocessFile "cse\cse_sys_ieds\spotter\fnc_spotterBehaviour.sqf";


cse_fnc_searchGround_IED = compile preprocessFile "cse\cse_sys_ieds\fnc_searchGround.sqf";

cse_fnc_broadcastTHOR3Sound = {
	(_this select 0) say3D "beep";
};