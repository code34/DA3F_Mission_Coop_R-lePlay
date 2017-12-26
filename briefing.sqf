/*
[DA3F]Aroun Le BriCodeur (MCF)
briefing.sqf
*/
waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["Opfor","Opfor info"];
player createDiarySubject ["Mission","Objectif"];
player createDiarySubject ["TeamSpeak","TeamSpeak 3"];
player createDiarySubject ["Clavier","Raccourcis"];
player createDiarySubject ["Crédits","Historique"];
// <img image='wellDone_ca.paa' />

	player createDiaryRecord ["Opfor",
		[
			"Nombre d'ennemis sur la map",
				"
					<execute expression='call DA3F_fnc_countUnitOpenMap'>Compter les unités Opfor</execute>
				"
		]
	];

	player createDiaryRecord ["Clavier",
		[
			"Raccourcis des touches",
				"
					<br/>
					<br/>
					Volume = (9 - ç);
					<br/>
					Menu joueur = ² (Au dessus de TAB);
					<br/>
					Ejection pilote (Air) = Shift + H;
					<br/>
				"
		]
	];

	player createDiaryRecord ["TeamSpeak",
		[
			"Notre TeamSpeak 3",
				"
					<br/>
					ts3.devarma3france.fr:12517
					<br/><br/>
					Merci d'y être présent le bon déroulement des communications.
					<br/><br/>
					Demandez Aroun ou le staff [DA3F]
					<br/>
					pour toutes questions ou suggestions sur le serveur.
					<br/>
					Le teamspeak est aussi disponible sur la map <marker name='Credit_And_Name_2'>TeamSpeak</marker>
				"
		]
	];


	player createDiaryRecord ["Crédits",
		[
			"Pourquoi cette mission",
				"
					<br/>
					Cette mission est réalisé dans le but de faciliter le développement de mission Coop/RP
					<br/>
					Mais aussi d'avoir une source 100% FR permettant un support et une édition facile.
					<br />
					<img image='imgs\logoA3Custom.jpg' />
					<br/>
					Inutile de t'embêter à fouiller ton cache pour trouver les fichiers la mission est en open source si tu la veux ;) .
					<br/>
					<a href='https://github.com/Aroun31/Mission_Template/tree/master/DA3F_Coop_Mission_Template.Altis'>Link DA3F</a>
					<br/>
					J'autorise la modification des fichiers, n'hésite pas à partager ta version sur notre site :
					<br/>
					<a href='http://www.devarma3france.fr/' align='center' size='1' color='#3177EA'>Site Dev'Arma 3 France</a>
					<br/>
					En cas d'utilisation de mes fichiers hors de la mission merci d'ajouter le tag DA3F à vos crédits et de ne pas changer les signatures.
					<br/>
					En cas d'utilisation de mes fichiers hors de la mission, si la source vous est demandé merci de fournir le lien du github.
					<br/>
					Je partage mon travail merci de ne pas mettre de barrière à mon partage !!!
					<br/>
					Tu peux toi aussi participer donc n'hésite pas à proposer ton travail pour améliorer / évoluer la mission.
					<br/>
					Il ne s'agit pas d'être un grand dev', si tu sais configurer des shops ou faire des textures ou éditer une map,
					<br/>
					Tu peux poser ta pierre à l'édifice à ton tour.
					<br/>
					N'hésite pas à poser des questions si besoin sur notre forum ou sur notre TS.
					<br/>
					Merci à tous et ... Bon jeu !
				"
		]
	];
	player createDiaryRecord ["Crédits",

		[
			"Remerciement",
				"
					<br/>
					Merci à toute les personnes qui témoignent du soutient en vers le projet ou la DA3F en général
					<br/>
					Un grand MERCI aux contributeurs de la mission grâce à vous le projet évolue.
					<br/>
					Spécialement :
					<br/>
					- Dan Anderson
					- Code34
					- Da_St
				"
		]
	];