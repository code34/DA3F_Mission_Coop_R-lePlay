/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Cfg_ShohVehinit.sqf
*
*/
private ["_deviseUtilise","_arrayVeh","_arrayMrkSp"];
_deviseUtilise = "€";// $ £
_DA3F_Whitelist_UID = ["UID_1","UID_2"]; // accès des shops whitlisté
_arrayVeh=
    [
	    ["Car",
	        ["B_Quadbike_01_F",250,50],
	        ["I_C_Van_02_transport_F",1100,500],
	        ["I_C_Van_02_vehicle_F",1100,500],
	        ["I_MRAP_03_F",1500,500],
	        ["I_G_Offroad_01_F",1400,200],
	        ["I_C_Offroad_02_unarmed_F",950,200],
	        ["B_MRAP_01_hmg_F",5400,200]
	    ],
	    ["Air",
	        ["I_C_Plane_Civil_01_F",3200,200],
	        ["C_Heli_light_01_ion_F",3200,200],
	        ["B_Heli_Light_01_F",3200,100],
	        ["B_Heli_Light_01_dynamicLoadout_F",25000,100],
	        ["B_Heli_Transport_01_F",35000,100],
	        ["B_Heli_Transport_03_F",47000,100],
	        ["B_T_VTOL_01_infantry_F",52000,100],
	        ["B_T_VTOL_01_vehicle_F",52000,100],
	        ["B_T_VTOL_01_armed_F",75000,100]
	    ],
	    ["Custom",
	        ["C_Heli_light_01_ion_F",3200,200],
	        ["B_Heli_Light_01_F",3200,100],
	        ["I_MRAP_03_F",1500,500],
	        ["I_G_Offroad_01_F",1400,200],
	        ["I_Truck_02_fuel_F",25000,200]
	    ]
    ];


_arrayMrkSp =
	[
		["DA3F_Mrk_Sp_loc_0","Base QG"],
		["DA3F_Mrk_Sp_loc_1","Caserne de repos"],
		["DA3F_Mrk_Sp_loc_2","Base secondaire"],
		["DA3F_Mrk_Sp_loc_3","Avant post d'Athira"]
	];


// Ajout d'une catégorie sur condition.
if ((getPlayerUID player) in _DA3F_Whitelist_UID) then {
	_arrayVeh pushBack ["Shop whitelist",
	        ["C_Heli_light_01_ion_F",1400,200],
	        ["B_Heli_Light_01_F",1700,100],
	        ["I_MRAP_03_F",1700,100]
	    ];
};

// Ajout un spawn sur condition.
if ((getPlayerUID player) in _DA3F_Whitelist_UID) then {
	_arrayMrkSp pushBack ["DA3F_Mrk_Sp_loc_4","Base avancé"];
};