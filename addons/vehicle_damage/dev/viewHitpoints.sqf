[{
    private _targets = lineIntersectsWith [eyePos ACE_PLAYER, AGLToASL screenToWorld [0.5, 0.5], vehicle ACE_PLAYER, ACE_PLAYER, true];
    if (_targets isEqualTo []) exitWith {};
    private _target = _targets select -1;
    private _center = _target modelToWorldVisualWorld getCenterOfMass _target;

    private _selections = (_target selectionNames "HitPoints") select { (_target selectionPosition [_x, "HitPoints"]) isNotEqualTo [0, 0, 0] };
    {
        private _position = _center vectorAdd (_target selectionPosition [_x, "HitPoints"]);
        private _damage = _target getHitPointDamage _x;

        drawIcon3D [
            "\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa",
            vectorLinearConversion [0, 1, _damage, [1, 0, 0, 1], [1, 1, 1, 1]],
            ASLToAGL _position,
            0.2,
            0.2,
            0,
            "",
            2
        ];
    } forEach _selections;
}] call CBA_fnc_addPerFrameHandler;