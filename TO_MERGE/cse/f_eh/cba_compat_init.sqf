/**
 * cba_compat_init.sqf
 * @Descr: CBA compatability wrapper.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:  void
 * @PublicAPI: false
 */

cse_eh_cba_compat_local = if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then { {[_this,'local'] call cse_fnc_eventHandler_F;} } else {{}};
cse_eh_cba_compat_Respawn = if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then { {[_this,'respawn'] call cse_fnc_eventHandler_F;} } else {{}};
cse_eh_cba_compat_Killed = if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then { {[_this,'killed'] call cse_fnc_eventHandler_F;} } else {{}};
cse_eh_cba_compat_FiredNear = if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then { {[_this,'firedNear'] call cse_fnc_eventHandler_F;} } else {{}};
cse_eh_cba_compat_Fired = if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then { {[_this,'fired'] call cse_fnc_eventHandler_F;} } else {{}};
cse_eh_cba_compat_Take = if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then { {[_this,'Take'] call cse_fnc_eventHandler_F;} } else {{}};
cse_eh_cba_compat_Put = if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then { {[_this,'Put'] call cse_fnc_eventHandler_F;} } else {{}};
cse_eh_cba_compat_GetIn = if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then { {[_this,'GetIn'] call cse_fnc_eventHandler_F;} } else {{}};
cse_eh_cba_compat_GetOut = if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then { {[_this,'GetOut'] call cse_fnc_eventHandler_F;} } else {{}};
