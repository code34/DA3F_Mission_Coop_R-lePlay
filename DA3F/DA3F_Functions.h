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
            class result {};
            class customInventory {};
            class Appli {}; // Menu I
            class Give {}; // Menu I
            class GiveCash {}; // Menu I
            class Use {}; // Menu I
            class SaveUnit {}; // Menu I
    };
    class DA3F_Master_Admin
    {
        file = "DA3F\admin";
            class init_AdminMenu {};
            class SwitchAction {};
            class Teleport {};
    };

    class DA3F_Farm
    {
        file = "DA3F\area_ressources";
            class Pompe_interaction {};
            class Expoitation_Petrol {};
            class Expoitation_Petrol_InfoVeh {};
            class Expoitation_Petrol_Veh {};
            class move_Mouse {};
    };

    class DA3F_Base
    {
        file = "DA3F\Base";
            class Pnj_Portier {};
            class init_Base {};
            class AddActionToBase {};
            class showInventory {};
            class init_FuelStation {};
            class ShowInfoVehFuel {};
            class refuel {};
    };

    class DA3F_SQL
    {
        file = "DA3F\SQL";
            class File_transfert {};
    };

    class DA3F_Save
    {
        file = "DA3F\save";
            class SaveStats {};
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
            class Delete_Units {};
            class Start_Mission {};
    };

    class DA3F_ConcessGarage
    {
        file = "DA3F\vehicules";
            class Concess {};
            class garage {};
            class NearVeh {};
            class ShowCam {};
            class ShowList {};
            class ValideVehBuy {};
            class vehicleInGarage {};
            class VehGoGarage {};
            class GetMyVehGarage {};
            class CreateVehicle {};
            class showInfoVeh {};
            class reparation {};
            class ActionVeh {};
            class ValideVehAction {};
            class IdentifVeh {};
            class InventoryVirtVeh {};
    };

    class DA3F_init_Shops
    {
        file = "DA3F\Shops";
            class ShopVehinit {};
            class atmMenu {};
            class ShopItemsVirt {};
            class ShopItems_BuySell {};
            class Shop_Specialisation {};
            class Shop_Spe_BuySell {};
            class ShowDesc_Spe {};
            class Switch_Concess_Garage {};
            class Shop_New_VirtItems {};
    };

    class DA3F_shopcustom
    {
        file = "DA3F\DA3F_ShopCustom";
            class SC_init {};
            class SC_Panier {};
            class SC_showList {};
            class SC_showItems {};
            class SC_MajPanier {};
            class SC_Maj_txt_Panier {};
            class SC_ValideCmd {};
            class SC_Livraison {};
            class SC_ClearPanier {};
            class SC_Switch {};
            class SC_Count {};
            class SC_Infos_Items {};
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
            class DelTempPos {};
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
            class WinKeysAction {};
            class Consult_Stats_Box_Citernes {};
            class Buy_selectionStockage {};
            class TransfertValide {};
            class Transfert_Target {};
            class Transfert_Target_1 {};
            class A3_Icons {};
            class ClearZone {};
            class TargetIdentity {};
            class Progresse {};
            class Add_Ret_Items {};
            class NoPilote {};
            class ZoneDeRadion {};
            class Globalsound {};
    };
};