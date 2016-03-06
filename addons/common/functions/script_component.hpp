#include "\z\ace\addons\common\script_component.hpp"

#define VALIDHASH(hash)    (IS_ARRAY(hash) && {(count hash) >= 2} && {IS_ARRAY(hash select 0)} && {IS_ARRAY(hash select 1)})
#define ERROR(msg)    throw msg + format[" @ %1:%2", _callFrom, _lineNo]
#define HANDLECATCH    diag_log text _exception; assert(exception=="")

#define ERRORDATA(c)    private ["_callFrom", "_lineNo"];\
                        _callFrom = "";\
                        _lineNo = -1;\
                        if((count _this) > c) then {\
                            _callFrom = _this select c;\
                            _lineNo = _this select c+1;\
                        };
