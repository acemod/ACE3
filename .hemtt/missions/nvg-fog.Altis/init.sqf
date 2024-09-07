for "_i" from 1 to 100 do {

    if (_i mod 10 == 0) then { continue };

    _obj = createVehicle ["Sign_Sphere10cm_F", [0,0,0]];

    _obj setObjectTexture [
        0,
        ["#(rgb,8,8,3)color(1,0,0,1)" ,"#(rgb,8,8,3)color(0,0,1,1)" ] select (_i mod 2 == 0)
        ];

	_obj attachTo [player, [
		2 - _i * 0.01,
		_i*1,
		1.2
		]];
};
for "_i" from 1 to 10 do {
	_obj = createVehicle ["SignAd_SponsorS_F", [0,0,0]];

    _obj setObjectTexture [
        0,
        format ['#(rgb,512,512,3)text(0,0,"ACE_Stencil",0.3,"#00000000","#690000","%1")',_i*10]
        ];


	_obj attachTo [player, [
		2 - _i * 0.1,
		_i*10,
		-1
		]];
};