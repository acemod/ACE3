if (!call (uiNamespace getVariable ["INTERCEPT_BOOT_DONE",{false}])) then { 
  #include "\z\intercept\rv\addons\core\boot.sqf"; 
  isNil compile "uiNamespace setVariable ['INTERCEPT_BOOT_DONE', compileFinal 'true'];"; 
}; 
 
//THISVAR = _this; 
//private _code =  str { 
//  private _this = THISVAR; 
//  #include "\A3\functions_f\initFunctions.sqf"; 
//}; 
//call compile (_code select [1, count _code-2]); 
_start = diag_tickTime; 
 
if (!isNil {_this}) then  { 
  _this call compile "Intercept_InitFunctions _this;"; 
} else { 
  call compile "diag_log [""ps2""]; Intercept_InitFunctions [];"; 
}; 
 
 
//if (!isNil {_this}) then  { 
//  _this call compile preProcessFileLineNumbers "\A3\functions_f\initFunctions.sqf"; 
//} else { 
//  call compile preProcessFileLineNumbers "\A3\functions_f\initFunctions.sqf"; 
//}; 
 
diag_log ["FUNC TIME ##########################",diag_tickTime - _start]; 
 
diag_log [count (allVariables uiNamespace),count call (uiNamespace getVariable "BIS_functions_list"),count call(uiNamespace getVariable "BIS_functions_listPreInit"),count call(uiNamespace getVariable "BIS_functions_listPostInit"),count call(uiNamespace getVariable "BIS_functions_listRecompile")]; 