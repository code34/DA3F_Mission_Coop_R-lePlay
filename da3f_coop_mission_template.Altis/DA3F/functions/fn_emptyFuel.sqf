/*
      Thanks to Acidcorp sharing on altiseliferpg.com, script adapter after Mokomoko
      Date: 08.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
      Thanks you Mokomoko
*/

private["_veh_Units","_fuelLast","_fuelEnMoins","_ValFuel"];

sleep 1;

_ValFuel = 100;

while{true} do
{
    _veh_Units = (vehicle player);

    if(isEngineOn _veh_Units && ((driver _veh_Units) == player) && (_veh_Units != player) && ((speed _veh_Units)> 0.2) ) then
    {
		_fuelLast = fuel vehicle player;
		//waitUntil {!alive _veh_Units || (fuel _veh_Units) != _fuelLast};
		sleep 1;

		_veh_Units = (vehicle player);

		switch (typeOf (_veh_Units)) do {
			case "C_Plane_Civil_01_F": 			{ _ValFuel = 50; };
			case "B_Heli_Light_01_F": 			{ _ValFuel = 500; };
			case "B_Heli_Light_01_armed_F": 	{ _ValFuel = 500; };
			case "C_IDAP_Heli_Transport_02_F": 	{ _ValFuel = 500; };
			case "B_Heli_Transport_01_F": 		{ _ValFuel = 500; };
			case "O_Heli_Light_02_unarmed_F":	{ _ValFuel = 500; };
			case "O_Heli_Transport_04_F":		{ _ValFuel = 500; };
			case "B_Heli_Transport_03_unarmed_F":{ _ValFuel = 500; };
			case "I_Heli_light_03_unarmed_F":	{ _ValFuel = 500; };
			case "B_Heli_Transport_01_camo_F": 	{ _ValFuel = 600; };
			case "I_Truck_02_medical_F": 		{ _ValFuel = 600; };
			case "O_Truck_03_medical_F": 		{ _ValFuel = 600; };
			case "C_Van_01_transport_F": 		{ _ValFuel = 600; };
			case "O_MRAP_02_F": 				{ _ValFuel = 500; };
			case "C_Hatchback_01_sport_F": 		{ _ValFuel = 700; };
			case "C_Hatchback_01": 				{ _ValFuel = 500; };
			case "B_Truck_01_medical_F": 		{ _ValFuel = 600; };
			case "I_Truck_02_transport_F": 		{ _ValFuel = 600; };
			case "B_Truck_01_transport_F": 		{ _ValFuel = 600; };
			case "O_Truck_03_transport_F": 		{ _ValFuel = 600; };
			case "O_Truck_03_covered_F": 		{ _ValFuel = 600; };
			case "B_Truck_01_box_F": 			{ _ValFuel = 600; };
			case "C_SUV_01_F": 					{ _ValFuel = 400; };
			case "B_Truck_01_covered_F": 		{ _ValFuel = 600; };
			case "O_Truck_03_device_F": 		{ _ValFuel = 600; };
			case "C_Offroad_01_F":				{ _ValFuel = 550;};
			case "B_Quadbike_01_F": 			{ _ValFuel = 450;};
			case "C_Kart_01_Blu_F": 			{ _ValFuel = 700; };
			case "C_Kart_01_Fuel_F": 			{ _ValFuel = 700; };
			case "C_Kart_01_Red_F": 			{ _ValFuel = 700; };
			case "C_Kart_01_Vrana_F": 			{ _ValFuel = 700; };
			default { _ValFuel = 350;};
		};
		if (_veh_Units isKindOf "air") then {_ValFuel = _ValFuel /2};
		_fuelEnMoins = ((_ValFuel/100)*(_fuelLast - (fuel _veh_Units)));

		//hint parseText format["%1, %2 au lieu de %3 %4 %5",(fuel _veh_Units),_fuelEnMoins,(_fuelLast - (fuel _veh_Units)),_ValFuel,_fuelLast];

		_veh_Units setFuel ((fuel _veh_Units) - _fuelEnMoins);

        if(fuel _veh_Units < 0.3 && fuel _veh_Units > 0.28) then
        {
            hint "Véhicule en réserve ! Allez faire le plein dans une station !";
        }
        else
        {
            if(fuel _veh_Units < 0.03) then
            {
                hint "Tu peux toujours essayer de pisser dans le réservoir, mais je te conseil d'aller dans une station !";
            };
        };

    } else {
		sleep 2;
	};
	sleep 0.3;
};
systemChat "MCF Carburant Accru OK !";