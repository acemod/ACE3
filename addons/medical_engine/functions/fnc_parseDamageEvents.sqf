#include "script_component.hpp"
/*
 * Author:gandjustas
 * Parses saved HandleDamage events to separate hits
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
 
params ["_unit"];

/*
 * Grammar for HandleDamage event stream
 * - structural - event with hitPointIndex==-1
 * - head - event with hitPointIndex==2
 * - hps - sequence (1 or more) of events with increacing hitPointIndex, hitPointIndex >= 0
 *
 * Ordinal hits if target or shooter is not local: ((structural,hps){N}) where N - count Hit events will be rised by this projectile
 * Ordinal hits if target and shooter is local: ((head,structural?){N},(structural,hps){N}) 
 * structural in prefix can be missed if newDamage==0 for hitPointIndex==-1
 * 
 * Environmental (source is null) or die-in-exploded-vehicle events: (structural)
 * Large explosions and vehicle crew hits can rise ordinal hit and environmental event streams
 */


// Format of saved events [[_hitPointIndex, _damage, _source, _instigator, _ammo]]
private _events = _unit getVariable [QGVAR(events), []];
private _newHits = [];

while { count _events > 0 } do {
    private _i = count _events;
    private _hpDamages = [];
    private _event = [];
    private _cnt = 0;

    // Read events from end, until hitPointIndex==-1
    while { 
        _i = _i-1;
        _event = _events select _i; 
        _cnt = _cnt + 1;
        _event#0 > -1					
    } do {
        if(_event#1 > 0) then {
            _hpDamages set [_event#0,_event#1];													
        };
    };
    // Save read events as Hit
    _events deleteRange [_i, _cnt];
    private _newHit = [diag_frameNo];
    _newHit append (_event select [1,4]);
    _newHit pushBack _hpDamages;

    //Hit format [_frameNo, _damage, _source, _instigator, _ammo, _hpDamages]
    _newHits pushBack _newHit; 

    // Try to consume head prefix from start of stream 
    if(count _events > 0 && {_events#0#0 == 2}) then {
        _events deleteAt 0;

        // Peeking following structural event
        if (count _events > 0 && {_events#0#0 == -1}) then {
            // Checking structural event is not start of hit, it's followed by head or structural event
            if(count _events == 1 or {
                _events#1#0 == -1 or _events#1#0 == 2
            }) then {
                _events deleteAt 0;
            };
        };			
    };
};

// Add parsed hits to collection, remove old hits not complemented by Hit event
if( count _newHits > 0) then {
    private _hits = _unit getVariable [QGVAR(hits), []];
    reverse _newHits;
    _hits = _hits select {_x#0 + 100 < diag_frameNo};
    _hits append _newHits;

    _unit setVariable [QGVAR(hits), _hits];
};