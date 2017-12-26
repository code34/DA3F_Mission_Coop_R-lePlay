/*
fn_loadData.sqf
Original Author  : Leg's.
Edit & adapte by [DA3F] Aroun Le BriCodeur
Merci à toi copain de m'avoir donné ce script il y a déjà bien longtemps...
Adaptation faites pour la save/load des items virtuel de la mission
et changement du tag des fichiers ainsi que la table SQL . nom des fichiers inchangé
Tag original : SFI
nom de table original : create
ajout de ce commentaire par moi même (Aroun) pour rendre à césar ce qui lui appartient ;)
*/
[] spawn
{
	while  {true} do
	{
		sleep (10*60);
		[0,"Save des states des bases"] remoteexeccall ["DA3F_fnc_hint",-2];
		{
			   _VarCrate 	= call compile _x;
			   _items 		= getItemCargo _VarCrate;
			   _weapons 	= getWeaponCargo _VarCrate;
			   _magazines 	= getMagazineCargo _VarCrate;
			   _backpacks 	= getBackpackCargo _VarCrate;
			   _itemsVirt	= _VarCrate getVariable "DA3F_StockItems";

			   [11,_x,_items] call DA3F_fnc_crateFunctions;
			   [12,_x,_weapons] call DA3F_fnc_crateFunctions;
			   [13,_x,_magazines] call DA3F_fnc_crateFunctions;
			   [14,_x,_backpacks] call DA3F_fnc_crateFunctions;
			   [14,_x,_backpacks] call DA3F_fnc_crateFunctions;
			   [26,_x,_itemsVirt] call DA3F_fnc_crateFunctions;

		}foreach Crate_List;
	};
};