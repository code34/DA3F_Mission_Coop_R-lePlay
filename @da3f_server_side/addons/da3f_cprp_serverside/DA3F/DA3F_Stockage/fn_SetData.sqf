/*
fn_SetData.sqf
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
#define Items_Cfg(TYPE,Class,SETTING) TYPE(missionConfigFile >> "DA3F_Cfg_Items_virt" >> Class >> SETTING)
	{
		_query = format ["SELECT Name FROM stockage WHERE Name='%1'",_x];
		_name = [_query,2] call DB_fnc_asyncCall;
		_name = format _name;
		if !(_name in crate_list) then {
			_query = format ["INSERT INTO stockage (Name, Items,Weapons,Magazines,Backpacks,VirtItems) VALUES('%1', '""[]""', '""[]""', '""[]""', '""[]""', '""[[],0]""')",_x];
		    [_query,1] call DB_fnc_asyncCall;
		};
	}foreach Crate_List;

	sleep 5;

	{
		_crate = call compile (Crate_List select _foreachindex);
		clearItemCargoGlobal _crate;
		clearWeaponCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;

		_resultItems 		= [21,_x,""] call DA3F_fnc_crateFunctions;

		_resultWeapons 		= [22,_x,""] call DA3F_fnc_crateFunctions;

		_resultMagazines 	= [23,_x,""] call DA3F_fnc_crateFunctions;

		_resultBackpackss 	= [24,_x,""] call DA3F_fnc_crateFunctions;

		_resultItemsVirt 	= [25,_x,""] call DA3F_fnc_crateFunctions;

			if ((_resultItems select 0) isEqualType []) then {

				_items = _resultItems select 0 select 0;
				_itemsNB = _resultItems select 0 select 1;
				{
					_item = _x;
					if (_x == "") exitWith {};
					_quantity = _itemsNB select _foreachindex;

					_crate addItemCargoGlobal [_item,_quantity];
				}foreach _items;
			};

		sleep 0.02;

			if ((_resultMagazines select 0) isEqualType []) then {

				_items = _resultMagazines select 0 select 0;
				_itemsNB = _resultMagazines select 0 select 1;
				{
					_item = _x;
					if (_x == "") exitWith {};
					_quantity = _itemsNB select _foreachindex;

					_crate addMagazineCargoGlobal [_item,_quantity];
				}foreach _items;
			};

		sleep 0.02;

			if ((_resultWeapons select 0) isEqualType []) then {
				_items = _resultWeapons select 0 select 0;
				_itemsNB = _resultWeapons select 0 select 1;
				{
					_item = _x;
					if (_x == "") exitWith {};
					_quantity = _itemsNB select _foreachindex;

					_crate addweaponCargoGlobal [_item,_quantity];
				}foreach _items;
			};

		sleep 0.02;

			if ((_resultBackpackss select 0) isEqualType []) then {
				_items = _resultBackpackss select 0 select 0;
				_itemsNB = _resultBackpackss select 0 select 1;
				{
					_item = _x;
					if (_x == "") exitWith {};
					_quantity = _itemsNB select _foreachindex;

					_crate addBackpackCargoGlobal [_item,_quantity];
				}foreach _items;
			};


		sleep 0.02;
		_ret= [];
		_total = 0;
			if ((_resultItemsVirt select 0) isEqualType []) then {
				_arrItems = _resultItemsVirt select 0 select 0;
				_PoidTotal = _resultItemsVirt select 0 select 1;
				_items = _arrItems select 0 select 0;
				_itemsNB = _arrItems select 0 select 1;

				{
					_items = _x select 0;
					_itemsNB = _x select 1;
					_ret pushBack [_items,_itemsNB];
					_CfgItemPoids = Items_Cfg(getNumber,_items,"poids");
					_total = _total + (_CfgItemPoids*_itemsNB);
			//		if (_x == "") exitWith {};
			//		_quantity = _itemsNB select _foreachindex;

				}foreach _arrItems;
				diag_log format ["****************************",nil];
				diag_log format ["******stockage Virtuel******",nil];
				diag_log format ["%1 - %2", _arrItems, _PoidTotal];
				diag_log format ["****************************",nil];
					_crate setVariable ["DA3F_StockItems",[_ret,_total],true];
			};


	}foreach Crate_List;


	[] call DA3F_fnc_loadData;
};