/*
*
*		[DA3F]Aroun Le BriCodeur
*		DA3F_particules.sqf
*		Particule_party !
*
	*/
	private ["_unit","_pos","_ps1","_ps2","_posProxy","_fnc_CalculPos","_fnc_CalculLongPos","_DA3F_Fog_local_Long","_radius","_DA3F_Fog_local_S","_DA3F_Fog_local_0","_DA3F_Fog_local_1","_DA3F_Fog_local_Color","_DA3F_Fog_local_Long","_ppGrain","_ppColor"];
	_unit = player;
	_radius = 250;
	"mrk_rad" setMarkerSizeLocal [_radius,_radius];
	_fnc_CalculPos={
		_pos=selectRandom
		[
			 [(1 + random 5), (1 + random 5), random 1],
			 [(1 + random 5), (1 - random 5), random 1],
			 [(1 - random 5), (1 + random 5), random 1],
			 [(1 - random 5), (1 - random 5), random 1]
		];
		_pos
	};
	_fnc_CalculLongPos={
		_pos = selectRandom
		[
		[((getpos _unit)select 0)+(80 + random 150),((getpos _unit)select 1)+(80 + random 150),random 2],
		[((getpos _unit)select 0)-(80 + random 150),((getpos _unit)select 1)+(80 + random 150),random 2],
		[((getpos _unit)select 0)+(80 + random 150),((getpos _unit)select 1)-(80 + random 150),random 2],
		[((getpos _unit)select 0)-(80 + random 150),((getpos _unit)select 1)-(80 + random 150),random 2]
		];
		_pos
	};
	while {alive _unit} do {
		waitUntil {_unit distance getMarkerPos "mrk_rad"< _radius};


_ppGrain = ppEffectCreate ["filmGrain", 2050];
_ppColor = ppEffectCreate ["colorCorrections", 1550];
_ppGrain ppEffectEnable true;
_ppColor ppEffectEnable true;
_ppGrain ppEffectAdjust [1, 1, -0.01, [0, 0, 0, 0], [1.5, 1, 1.2, 0.4], [0.199, 0.387, 0.214, 0]];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, -0.01, [0, 0, 0, 0], [1.1, 1, 1.2, 0.4], [0.199, 0.587, 0.114, 0]];
_ppColor ppEffectCommit 10;
_ppGrain ppEffectCommit 10;
ppEffectCommitted _ppGrain;
ppEffectCommitted _ppColor;

	_pos =selectRandom[[((getpos _unit)select 0)+(random 50),((getpos _unit)select 1)+(random 50),0],[((getpos _unit)select 0)-(random 50),((getpos _unit)select 1)+(random 50),0],[((getpos _unit)select 0)+(random 50),((getpos _unit)select 1)-(random 50),0],[((getpos _unit)select 0)-(random 50),((getpos _unit)select 1)-(random 50),0]];
	_posProxy =selectRandom[[((getpos _unit)select 0)+(random 10),((getpos _unit)select 1)+(random 10),0],[((getpos _unit)select 0)-(random 10),((getpos _unit)select 1)+(random 10),0],[((getpos _unit)select 0)+(random 10),((getpos _unit)select 1)-(random 10),0],[((getpos _unit)select 0)-(random 10),((getpos _unit)select 1)-(random 10),0]];

/*
*
*	Cheminé
*
*/
if ((random 100)> 90) then{
	_ps1 = "#particlesource" createVehicleLocal _pos;
	_ps1 setParticleCircle [0, [0, 0, 0]];
	_ps1 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_ps1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 2, (8 + random 10), [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.2, 0.2, 0.2, 0.45], [0.35, 0.35, 0.35, 0.225], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _ps1];
	_ps1 setDropInterval 0.01;

	_ps2 = "#particlesource" createVehicleLocal _pos;
	_ps2 setParticleCircle [0, [0, 0, 0]];
	_ps2 setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_ps2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d", 8, 3, 1], "", "Billboard", 2, (8 + random 10), [0, 0, 0], [0, 0, 1.5], 0, 10, 7.9, 0.066, [1, 3, 6], [[0.33, 0.33, 0.33, 0.8], [0.66, 0.66, 0.66, 0.4], [1, 1, 1, 0]], [0.85], 1, 0, "", "", _ps2];
	_ps2 setDropInterval 0.01;

	_near = nearestObjects [_pos,["Car","Man"],2];
	{
		_x setDamage ((damage _x) + 0.3);
	} forEach _near;
};
	_pos = selectRandom
	[
		[((getpos _unit)select 0)+(random 50),((getpos _unit)select 1)+(random 50),0],
		[((getpos _unit)select 0)-(random 50),((getpos _unit)select 1)+(random 50),0],
		[((getpos _unit)select 0)+(random 50),((getpos _unit)select 1)-(random 50),0],
		[((getpos _unit)select 0)-(random 50),((getpos _unit)select 1)-(random 50),0]
	];

/*
*
*	Brouillard
*
*/
		_DA3F_Fog_local_1 = "#particlesource" createVehicleLocal _pos;
		if (vehicle player != player) then {_DA3F_Fog_local_1 attachto [vehicle player,[0,0,0]];} else {_DA3F_Fog_local_1 attachto [player,[0,0,0]];};
		_DA3F_Fog_local_1 setParticleCircle [0, [5, -5, 2]];
		_DA3F_Fog_local_1 setParticleRandom [0, [0.25, 0.25, 0], [-3, 3, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_DA3F_Fog_local_1 setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 2, 5, call _fnc_CalculPos, call _fnc_CalculPos, 25, 20.5, 7.9, 0.095, [15, (8 + random 10), 7],
		[
			[0.8+random 0.2, 0.7+random 0.3, 0.7+random 0.3, 0.01+random 0.05],
			[1, 1, 1, 0.1],
			[1, 1, 1, 0]
		],
		[0.08],
		1,
		0,
		"",
		"",
		_DA3F_Fog_local_1];
		_DA3F_Fog_local_1 setDropInterval 0.5;



		_DA3F_Fog_local_S = "#particlesource" createVehicleLocal getposatl player;
		if (vehicle player != player) then {_DA3F_Fog_local_S attachto [vehicle player,[0,0,0]];} else {_DA3F_Fog_local_S attachto [player,[0,0,0]];};
		_DA3F_Fog_local_S setParticleCircle [0, [5, -5, 2]];
		_DA3F_Fog_local_S setParticleRandom [0, [0.25, 0.25, 0], [-3, 3, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_DA3F_Fog_local_S setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 1, call _fnc_CalculPos, call _fnc_CalculPos, 15, 10.5, 7.9, 0.075, [3, 5, 7], [[1, 1, 1, 0.01+random 0.05], [1, 1, 1, 0.1], [1, 1, 1, 0]], [0.08], 1, 0, "", "",vehicle player];
		_DA3F_Fog_local_S setDropInterval 0.5;


		_DA3F_Fog_local_Long = "#particlesource" createVehicleLocal call _fnc_CalculLongPos;
/*		if (vehicle player != player) then {_DA3F_Fog_local_Long attachto [vehicle player,[0,0,0]];} else {_DA3F_Fog_local_Long attachto [player,[0,0,0]];};*/
		_DA3F_Fog_local_Long setParticleCircle [0, [5, -5, 2]];
		_DA3F_Fog_local_Long setParticleRandom [0, [0.25, 0.25, 0], [-3, 3, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_DA3F_Fog_local_Long setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 1, call _fnc_CalculPos, call _fnc_CalculPos, 15, 10.5, 7.9, 0.075, [3, 5, 7], [[1, 1, 1, 0.01+random 0.05], [1, 1, 1, 0.1], [1, 1, 1, 0]], [0.08], 1, 0, "", "",_DA3F_Fog_local_Long];
		_DA3F_Fog_local_Long setDropInterval 0.8;



		_posProxy = selectRandom[
		[((getpos _unit)select 0)+(random 10),((getpos _unit)select 1)+(random 10),0],
		[((getpos _unit)select 0)-(random 10),((getpos _unit)select 1)+(random 10),0],
		[((getpos _unit)select 0)+(random 10),((getpos _unit)select 1)-(random 10),0],
		[((getpos _unit)select 0)-(random 10),((getpos _unit)select 1)-(random 10),0]
		];

		_DA3F_Fog_local_0 = "#particlesource" createVehicleLocal _posProxy;
		if (vehicle player != player) then {_DA3F_Fog_local_0 attachto [vehicle player,[0,0,0]];} else {_DA3F_Fog_local_0 attachto [player,[0,0,0]];};
		_DA3F_Fog_local_0 setParticleCircle [0, [5, -5, 2]];
		_DA3F_Fog_local_0 setParticleRandom [0, [0.25, 0.25, 0], [-3, 3, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_DA3F_Fog_local_0 setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 1, call _fnc_CalculPos, call _fnc_CalculPos, 15, 10.5, 7.9, 0.075, [3, 5, 7],
		[
		[1, 0.8, 0.8, 0.01+random 0.05],
		[1, 1, 1, 0.1], //1, 0.8, 0.8, 0.01+random 0.05
		[1, 1, 1, 0]],
		[0.12], // anim speed
		 1, 0, "", "",_DA3F_Fog_local_0];
		_DA3F_Fog_local_0 setDropInterval 0.5;

		_posProxy =selectRandom[[((getpos _unit)select 0)+(random 10),((getpos _unit)select 1)+(random 10),0],[((getpos _unit)select 0)-(random 10),((getpos _unit)select 1)+(random 10),0],[((getpos _unit)select 0)+(random 10),((getpos _unit)select 1)-(random 10),0],[((getpos _unit)select 0)-(random 10),((getpos _unit)select 1)-(random 10),0]];
/*
*
*	Brouillard Color
*
*/
		_DA3F_Fog_local_Color = "#particlesource" createVehicleLocal _posProxy;
		if (vehicle player != player) then {_DA3F_Fog_local_Color attachto [vehicle player,call _fnc_CalculLongPos];} else {_DA3F_Fog_local_Color attachto [player,call _fnc_CalculLongPos];};
		_DA3F_Fog_local_Color setParticleCircle [0, [5, -5, 2]];
		_DA3F_Fog_local_Color setParticleRandom [0, [0.25, 0.25, 0], [-3, 3, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_DA3F_Fog_local_Color setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 1, call _fnc_CalculPos, call _fnc_CalculPos, 15, 10.5, 7.9, 0.075, [3, 5, 7],
		[
		[1, 0.7+random 0.3, 0.7+random 0.3, 0.01+random 0.05],
		[1, 1, 1, 0.1],
		[1, 1, 1, 0]],
		[0.11], 1, 0, "", "",_DA3F_Fog_local_Color];
		_DA3F_Fog_local_Color setDropInterval 0.6;

if ((random 100)> 90) then {
	if (_unit distance getMarkerPos "mrk_rad" < _radius)then {
		_DA3F_Fog_local_2 = "#particlesource" createVehicleLocal (getpos vehicle player);
	//	if (vehicle player != player) then {_DA3F_Fog_local_2 attachto [vehicle player];} else {_DA3F_Fog_local_2 attachto [player];};
		_DA3F_Fog_local_2 setParticleCircle [0, [5, 3, 0]];
		_DA3F_Fog_local_2 setParticleRandom [0, [0, 0, 0], [0, 0, 0],0,0, [0, 0, 0,0], 0, 0];
		_DA3F_Fog_local_2 setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 5, 20, [0, 0, 0], [-1, 1, 0], 220, 15.15, 12.9, 0.01, [30, 30, 30],
		 [
		 [1, 0.8, 0.8, 0.05], //color
		 [1, 1, 1, 0.05+random 0.05],
		 [1, 1, 1, 0]],
		 [0.08], 1, 180, "", "", _DA3F_Fog_local_2];
		_DA3F_Fog_local_2 setDropInterval 1.5;
	};
};

if (_unit distance getMarkerPos "mrk_rad"> _radius OR !(alive _unit)) exitWith {

	_ppGrain ppEffectAdjust [1, 1, -0.01, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];
	_ppColor ppEffectAdjust [1, 1, -0.01, [0, 0, 0, 0], [0, 0, 0, 0], [0,0,0, 0]];
	_ppColor ppEffectCommit 3;
	_ppGrain ppEffectCommit 3;

	_ppGrain ppEffectEnable false;
	_ppColor ppEffectEnable false;

	ppEffectDestroy [_ppGrain, _ppColor];

		if !(isNil "_DA3F_Fog_local_2") then {
			deleteVehicle _DA3F_Fog_local_2;
			_DA3F_Fog_local_2 = nil;
		};

		if !(isNil "_ps1") then {
			deleteVehicle _ps1;
			_ps1 = nil;
		};

		if !(isNil "_ps2") then {
			deleteVehicle _ps2;
			_ps2 = nil;
		};

		{
			deleteVehicle _x;
			_x = nil;
		} forEach [_DA3F_Fog_local_S,_DA3F_Fog_local_0,_DA3F_Fog_local_1,_DA3F_Fog_local_Color,_DA3F_Fog_local_Long];
};

sleep (3 + random 2);

	if !(isNil "_DA3F_Fog_local_2") then {
		deleteVehicle _DA3F_Fog_local_2;
		_DA3F_Fog_local_2 = nil;
	};

		if !(isNil "_ps1") then {
			deleteVehicle _ps1;
			_ps1 = nil;
		};

		if !(isNil "_ps2") then {
			deleteVehicle _ps2;
			_ps2 = nil;
		};

		{
			deleteVehicle _x;
			_x = nil;
		} forEach [_DA3F_Fog_local_S,_DA3F_Fog_local_0,_DA3F_Fog_local_1,_DA3F_Fog_local_Color,_DA3F_Fog_local_Long];

};