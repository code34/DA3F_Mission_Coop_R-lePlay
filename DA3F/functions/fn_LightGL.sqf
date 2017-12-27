/*
[DA3F] Aroun Le BriCodeur
Light sur logic de jeu
_DA3F=this call DA3F_fnc_LightGL;

// Pour DA_ST (Test Editeur)
// mets ça dans un objet en ayant un fichier "fn_LightGL.sqf" en racine de la mission (à côté de mission.sqm)
_DA3F=this execVM "fn_LightGL.sqf";
*/
_this spawn{
_values = 100;
while {true} do
	{
	waitUntil {sleep 1;(player distance _this< _values)};
    private _obj = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
    _obj setObjectTextureGlobal [0,""];
    _obj enableSimulation false;
    _obj setPos getPos _this;
    private _light = "#lightpoint" createVehicleLocal [0,0,0];
    _light lightAttachObject [_obj,[0,0,2.2]];
    _light setLightColor [250,190,50];
    _light setLightAmbient [0.5,0.7,0.5];
    _light setLightDayLight false;
    _light setLightIntensity 10;
    _light setLightFlareSize 0.3;
    _light setLightFlareMaxDistance 20;
	waitUntil
        {
        sleep (0.3 + (random 0.3));
        if ((random 100)<50) then
            [{
           //     _light setLightIntensity (2 + (round (random 4)));
                _light setLightIntensity (3+random 1);
                _light setLightAmbient [0.5,0.6,0.5];
            },{
                _light setLightIntensity 1;
                _light setLightAmbient [0,0,0];
            }];
            (player distance _this > _values)
        };

		{
			deleteVehicle _x;
		} forEach [_light,_obj];
    };
};