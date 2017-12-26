#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2
// #define HC HC_DA3F // On en est pas la.

class CfgRemoteExec {
        class Functions {
            mode = 1;
            jip = 0;
        /* DA3F Mission Template */
            F(DA3F_fnc_hint,ANYONE)
            F(DA3F_fnc_teleport,ANYONE)
            F(DA3F_fnc_ActTarget,ANYONE)
            F(DA3F_fnc_Coms_Target,CLIENT)
            F(DA3F_fnc_result,CLIENT)
            F(DA3F_fnc_GetMyVehGarage,CLIENT)
            
        /* Server Side */
            F(DB_fnc_GetVehInGarage,SERVER)
            F(DB_fnc_UpdateVehicle,SERVER)
            F(DB_fnc_insertVehicle,SERVER)
            F(DA3F_fnc_request,SERVER)
            F(DA3F_fnc_Save_Update,SERVER)
            F(DA3F_fnc_SetData,SERVER)
            
        /* fnc BIS */
            F(bis_fnc_reviveinitaddplayer,ANYONE)
            F(bis_fnc_execvm,ANYONE)
            F(bis_fnc_call,ANYONE)
        };

    class Commands {
        mode = 1;
        jip = 0;

        F(addHandgunItem,ANYONE)
        F(addMagazine,ANYONE)
        F(addPrimaryWeaponItem,ANYONE)
        F(addWeapon,ANYONE)
        F(setFuel,ANYONE)
    };
};
