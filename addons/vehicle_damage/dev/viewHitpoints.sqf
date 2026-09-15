[{
    private _targets = lineIntersectsWith [eyePos ACE_PLAYER, AGLToASL screenToWorld [0.5, 0.5], vehicle ACE_PLAYER, ACE_PLAYER, true];
    if (_targets isEqualTo []) exitWith {};
    private _target = _targets select -1;

    (getAllHitPointsDamage _target) params ["_hitpointNames", "_selectionNames", "_damages"];
    {
        if (_x isEqualTo "") then { continue };
        private _relativePosition = _target selectionPosition _x;
        if (_relativePosition isEqualTo [0, 0, 0]) then { continue };
        private _position = _target modelToWorldVisualWorld _relativePosition;
        private _damage = _damages select _forEachIndex;

        drawIcon3D [
            "\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa",
            [
                (vectorLinearConversion [0, 1, 1 - _damage, [1, 0, 0], [1, 1, 1]]) + [1],
                [1, 1, 1, 1]
            ],
            ASLToAGL _position,
            0.6,
            0.6,
            0,
            format ["%1=%2", _x, _damage],
            true,
            0.022,
            "PuristaLight"
        ];
    } forEach _selectionNames;
}] call CBA_fnc_addPerFrameHandler;
