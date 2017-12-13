/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       DA3F_Functions.h
*       déclaration des fonctions
*
*/  
class DA3F_Master
{
    tag="DA3F";
    class DA3F_init
    {
        file = "DA3F\Units";
            class init_Units {};
            class moneyEH {};
            class onPlayerKilled {};
            class onPlayerRespawn {};
            class SetupAction {};
            class Units_Interaction {};
            class Units_Interaction_valide {};
    };

    class DA3F_SQL
    {
        file = "DA3F\SQL";
            class File_transfert {};
            class result {};
            class init_Base {};
    };

    class DA3F_Save
    {
        file = "DA3F\save";
            class SaveStats {};
            class SaveVeh {};
            class Cnt_Items_Spe {};
    };

    class DA3F_Communiquation
    {
        file = "DA3F\DA3F_Coms";
            class Coms_Connexion {};
            class Coms_search {};
            class Coms_Apps {};
            class Coms_switch {};
            class Coms_CallCo {};
            class Coms_Target {};
            class Coms_Valide_Msg {};
    };
    
    class DA3F_Ennemy
    {
        file = "DA3F\Ennemy";
            class patrol {};
            class Spawn_Mrk_Units {};
            class Spawn_House_Units {};
    };

    class DA3F_init_Shops
    {
        file = "DA3F\Shops";
            class ShopVehinit {};
            class ShowList {};
            class ValideVehBuy {};
            class ShowCam {};
            class atmMenu {};
            class ShopItemsVirt {};
            class ShopItems_BuySell {};
            class Shop_Specialisation {};
            class Shop_Spe_BuySell {};
            class ShowDesc_Spe {};
            class Switch_Concess_Garage {};
    };

    class DA3F_initSpawn
    {
        file = "DA3F\Spawn";
            class SpawnMenu {};
            class SelectSpawnMap {};
            class SpawnValide {};
            class BackLobby {};
            class RespawnUnit {};
            class SpawnStartMenu {};
            class SpawnStartValide {};
            class addTempPos {};
            class SpawnTemp {};
            class SpawnTempPos {};
            class Spawn_loadCamera {};
            class Spawn_ResizePix {};
    };

    class DA3F_functions
    {
        file = "DA3F\functions";
            class numberText {};
            class statusBar {};
            class SetStats {};
            class jumpFnc {};
            class KeyBoard {};
            class SoundVolume {};
            class hint {};
            class SetupTV {};
            class SetupPC {};
            class UseItems {};
            class DepotCash {};
            class ForceVeh {};
            class fastfood {};
            class esc_Menu {};
            class countUnitOpenMap {};
            class ActTarget {};
            class LightGL {};
            class GiveMoney {};
            class SwitchSpe {};
            class GiveItems {};
            class Help_Me {};
            class NoCarbu_in_station {};
            class emptyFuel {};
            class EjectAir {};
            class Items_in_veh {};
            class AddActionToBase {};
            class WinKeysAction {};
            class Consult_Stats_Box_Citernes {};
    };
};