/*
*
*       Dev'Arma 3 France
*       Mission Template
*       [DA3F] Aroun Le BriCodeur
*       fn_SetupPC.sqf
*       Action sur le PC
*
*/
_this allowDamage false;
_this enableSimulation false;
_this addAction["<t color='#01D585' size='1.3'>Boutique<t/>",{[0]call DA3F_fnc_ShopItemsVirt},nil,0,false,false,"","_this distance _target < 4"];
_this addAction["<t color='#01D585' size='1.3'>New Boutique<t/>",DA3F_fnc_Shop_New_VirtItems,"DA3F_Shop_Gen_Base",0,false,false,"","_this distance _target < 4"];
_this addAction["<t color='#01D585' size='1.3'>Spécialisation<t/>",DA3F_fnc_Shop_Specialisation,nil,0,false,false,"","_this distance _target < 4"];