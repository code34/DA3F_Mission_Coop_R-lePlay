/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_Spawn_loadCamera.sqf
*
*/
_this spawn {
private ["_marker","_NameSp"];
disableSerialization;
_marker 	= _this select 0;
_NameSp 	= _this select 1;
//_cnt = count (_shopCfg select _select select 1);
((findDisplay 1091217) displayCtrl 1100) ctrlSetStructuredText parseText format ["<t color='#0082BA' align='left' size='1.5'>%1<t/>",_NameSp];
_tri=[];
_altitudeCam = 100;
_Camera_DA3F       	= (findDisplay 1091217) displayCtrl 1201;
_Camera_DA3F ctrlSetText "#(argb,512,512,1)r2t(DA3F_CamStructure3DBuild,1)";
if(!isPiPEnabled) exitWith {hint "PIP désactivé";};
		_oldObj = player getVariable "DA3F_Build_Obj";
		if !(isNil "_oldObj") then {
			detach _oldObj;
			deleteVehicle _oldObj;
		player setVariable ["DA3F_Build_Obj",nil,false];
		};
	//	_realName = getText (configFile / "CfgVehicles" / _t / "displayName");
		_base3D = "Sign_Sphere10cm_F" createVehicleLocal [0,0,500];
		_base3D setObjectTexture [0,""];
		_base3D allowDamage false;
		_base3D setPos getMarkerPos _marker;
		DA3F_ObjSpawnCam = _base3D;
		player setVariable ["DA3F_Build_Obj",_base3D,false];
if(isNil "DA3F_SpawnCam") then [{
DA3F_SpawnCam = "camera" camCreate [0,0,0];
DA3F_SpawnCam cameraEffect ["Internal", "Back", "DA3F_CamStructure3DBuild"];
DA3F_SpawnCam camcommit 0;
"rtt" setPiPEffect [0];
[]spawn {
		waitUntil {!dialog};
		DA3F_SpawnCam cameraEffect ["terminate", "back"];
		camDestroy DA3F_SpawnCam;
};
  0 spawn
{
    // Until we left the visualization.
    for "_i" from 0 to 1 step 0 do {
        if (isNull DA3F_SpawnCam) exitWith {};
        private ["_object","_distanceCam","_azimuthCam"];

        // Waiting for a view object.
        waitUntil {!isNull DA3F_ObjSpawnCam};

        _object = DA3F_ObjSpawnCam;

        _distanceCam = 300 * (
                [boundingBoxReal _object select 0 select 0, boundingBoxReal _object select 0 select 2]
            distance
                [boundingBoxReal _object select 1 select 0, boundingBoxReal _object select 1 select 2]
        );
        _azimuthCam = 0;

        DA3F_SpawnCam camSetTarget _object;
        DA3F_SpawnCam camSetPos (_object modelToWorld [_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 0.33]);
        DA3F_SpawnCam camCommit 0;

        // Rotation around the object.
        for "_i" from 0 to 1 step 0 do {
            if (!(DA3F_ObjSpawnCam isEqualTo _object)) exitWith {};
            _azimuthCam = _azimuthCam + 1.00;

            DA3F_SpawnCam camSetPos (_object modelToWorld [_distanceCam * sin _azimuthCam, _distanceCam * cos _azimuthCam, _distanceCam * 0.33]);
            DA3F_SpawnCam camCommit 0.09;

            sleep 0.09;
        };
    };
};
},{
DA3F_SpawnCam cameraEffect ["terminate", "back"];
camDestroy DA3F_SpawnCam;
DA3F_SpawnCam = "camera" camCreate [0,0,0];
DA3F_SpawnCam cameraEffect ["Internal", "Back", "DA3F_CamStructure3DBuild"];
DA3F_SpawnCam camcommit 0;
"rtt" setPiPEffect [0];
	DA3F_SpawnCam camSetPos [((getPos _base3D)select 0),((getPos _base3D)select 1)+ 5,((getPos _base3D)select 2)+ _altitudeCam];
	DA3F_SpawnCam camSetTarget [((getPos _base3D)select 0),((getPos _base3D)select 1),((getPos _base3D)select 2)+0.5];
	DA3F_SpawnCam camCommit 0;
		waitUntil {!dialog};
		DA3F_SpawnCam cameraEffect ["terminate", "back"];
		camDestroy DA3F_SpawnCam;
		}];
  };