//script_bcs_macros.hpp

#define BCS_FIELD_DEFAULT	0
#define BCS_FIELD_NUMBER	1
#define BCS_FIELD_GRID	 	2

#define BCS_REQUIRE_FALSE	1
#define BCS_REQUIRE_TRUE	2
#define BCS_REQUIRE_IGNORE	-1

#define BCSLOG(text)	text call FUNC(bcsLog);
#define BCSWARN(text)	text call FUNC(bcsLogWarn);
#define BCSERROR(text)	text call FUNC(bcsLogError);

#define CHECKVALUE(name,idc,error,warn)	GVAR(TESTVAL) = (ctrlText idc);\
											if(GVAR(TESTVAL)=="") then {\
												if(error) exitWith {\
													GVAR(validateError) = true;\
													BCSERROR(name + " is undefined");\
												};\
												if(warn) then {\
													if(warn) then {\
														BCSWARN(name + " is undefined");\
													};\
												};\
											}
											
#define REQUIREVALUE(name,idc)				CHECKVALUE(name,idc,true,false)

#define STOREVALWARN(storeArray,name,idc)	CHECKVALUE(name,idc,false,true);\
											storeArray set[idc, GVAR(TESTVAL)]
											
#define STOREVAL(storeArray,name,idc)		CHECKVALUE(name,idc,false,false);\
											storeArray set[idc, GVAR(TESTVAL)]
											
#define STOREREQVAL(storeArray,name,idc)	CHECKVALUE(name,idc,true,false);\
											storeArray set[idc, GVAR(TESTVAL)]
											
#define GETVALUE(storeArray,idc)			(storeArray select idc)

#define SETVALUE(idc,storeArray)			(ctrlSetText [idc, (storeArray select idc)])	
