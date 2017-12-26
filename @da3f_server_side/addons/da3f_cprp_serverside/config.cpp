class DefaultEventhandlers;
class CfgPatches {
    class da3f_cprp_serverside {
        units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "da3f_cprp_serverside.pbo";
        author = "[DA3F] Aroun Le BriCodeur";
    };
};

/*
Extract Altis Life, Moi et le SQL ... 
Donc par facilité j'ai pris ce dont j'avais besoin
Alors pour le coup merci Tonic
*/
 
class CfgFunctions {
    class MySQL_Database {
        tag = "DB";
        class MySQL
        {
            file = "\da3f_cprp_serverside\DA3F\MySQL";
            class numberSafe {};
            class mresArray {};
            class queryRequest{};
            class asyncCall{};
            class insertRequest{};
            class updateRequest{};
            class mresToArray {};
            class insertVehicle {};
            class bool {};
            class mresString {};
            class updatePartial {};
            class UpdateVehicle {};
            class GetVehInGarage {};
        };
    };

    class DA3F_CpRp_server {
        tag = "DA3F";
        class DA3F_Start
        {
            file = "\da3f_cprp_serverside\DA3F\DA3F_SQL";
            class request {};
            class Stats_Base {};
            class Save_Update {};
            class vehicleDelete {};
            class cleanMap {};
        };
        
        class DA3F_Stockage {
            file = "\da3f_cprp_serverside\DA3F\DA3F_Stockage";
            class crateFunctions {};
            class SetData {};
            class loadData {};
        };
    };
};