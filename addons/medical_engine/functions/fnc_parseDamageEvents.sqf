#include "script_component.hpp"
/*
 * Author:gandjustas
 * Parses saved HandleDamage events to separate hits
 *
 * Arguments:
 * Array of HandleDamage events [[_hitPointIndex, _damage, _source, _instigator, _ammo]]
 *
 * Return Value:
 * Array of parsed hits [[_frameNo, _structuralDamage, _source, _instigator, _ammo, _hitpointDamages]]
 *
 * Public: No
 */
 
params ["_unit"];

/*
 * Grammar for HandleDamage event stream
 * - STRUCTURAL - event with hitPointIndex==-1
 * - HEAD - event with hitPointIndex==2
 * - HPS - sequence (1 or more) of events with increacing hitPointIndex, hitPointIndex >= 0
 *
 * Ordinal hits if target or shooter is not local: ((STRUCTURAL,HPS){N}) where N - count Hit events will be rised by this projectile
 * Ordinal hits if target and shooter is local: ((HEAD{1,2},STRUCTURAL?){N},(STRUCTURAL,HPS?){N}) 
 * STRUCTURAL in prefix can be missed if newDamage==0 for hitPointIndex==-1
 * 
 * Environmental (source is null) or die-in-exploded-vehicle events: (STRUCTURAL)
 * Large explosions and vehicle crew hits can rise ordinal hit and environmental event streams
 */

#define IDX 0
#define DMG 1
#define SRC 2
#define AMM 4

#define STRUCTURAL -1
#define HEAD 2


private _result = [];

private _event = _this deleteAt 0;
#define CONSUME _event = _this deleteAt 0
#define PEEK(n) (_this select n)
#define EOF (isNil { _event })

// _this fromat [[_hitPointIndex, _damage, _source, _instigator, _ammo]]
while { not EOF } do {
    if (_event#IDX == HEAD) then {
        // Consume HEAD prefix 
        CONSUME;

        // Peek following STRUCTURAL damage event
        if (not EOF and _event#IDX == STRUCTURAL) then {
            // Check STRUCTURAL event is not start of hit, it's followed by HEAD or STRUCTURAL damage event 
            if (count _this > 0 and {
                PEEK(0)#IDX == STRUCTURAL or {
                    PEEK(0)#IDX == HEAD and count _this > 1 and { PEEK(1)#IDX in [STRUCTURAL, HEAD] }
                }
            }) then {
                CONSUME;
            };
        };        
    } else {
        // Parse hit, start with STRUCTURAL damage event
        if (_event#IDX == STRUCTURAL) then {
            private _hit = [diag_frameNo];
            _hit append (_event select [DMG, (count _event) - 1]);

            private _idx = _event#IDX;
            private _src = _event#SRC;
            private _ammo = _event#AMM;
            CONSUME;

            private _hpDamages = [];
            // Consume events with same source and ammo with increacing hitPointIndex
            while { not EOF and { 
                _event#IDX > _idx and _event#SRC isEqualTo _src and _event#AMM isEqualTo _ammo
            }} do {
                if (_event#DMG > 0) then {
                    _hpDamages set [_event#IDX, _event#DMG];
                };
                _idx = _event#IDX;
                CONSUME;
            };
            _hit pushBack _hpDamages;

            _result pushBack _hit;             
        } else {
            ERROR_1("Error parsing HandleDamage events %1",_event);
            CONSUME;
        };
    };
};

_result
