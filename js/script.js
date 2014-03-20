// Afficher/Masquer les éléments de légende en fonction du niveau de zoom
function afficher(id) {
	document.getElementById(id).style.display="block";
}
function cacher(id) {
	document.getElementById(id).style.display="none";
}

// Afficher/Masquer la légende et les crédits via les onglets
function switch_tabs(show) {
	if(show=='legend') {
		content_legend.style.display="block";
		blc_tabs_legend.style.display="block";
		content_credits.style.display="none";
		blc_tabs_credits.style.display="none";
	}
	if (show=='credits') {
		content_legend.style.display="none";
		blc_tabs_legend.style.display="none";
		content_credits.style.display="block";
		blc_tabs_credits.style.display="block";
	}
}

// Déplacer le bloc Légende/Crédits
var draggable = document.getElementById('regle');
var options = {
	moveArea : document.getElementById('middle'),
	moveHoriz:false
};
dragOn.apply( draggable, options );
var draggable_legend = document.getElementById('bloc_legend_credits');
dragOn.apply( draggable_legend );

// Déplacement automatique du bloc Légende/Crédits au clic sur titre
function move_notes() {
	
	var blocnotes = document.getElementById("bloc_legend_credits");
	TweenLite.to(blocnotes, 1, {top:'30%',left:'75%', ease:Power2.easeOut});
}
document.getElementById('action-title').addEventListener('click', move_notes);

// Paramétrage de la carte
var map = L.map('map', { zoomControl:false, attributionControl:false, maxBounds: [[43.4848,1.6474],[43.6984,1.2196]]});
map.setView([43.6, 1.44], 13);

// Affichage de la carte tiles.cg44.makina-corpus.net
var tilesUrl = 'http://{s}.tiles.cg44.makina-corpus.net/toulouse-hand-drawn/{z}/{x}/{y}.png';
L.tileLayer(tilesUrl, {minZoom: 13, maxZoom: 19, subdomains: 'abde'}).addTo(map);
map.on("zoomend", function () {
	zoom = map.getZoom( );
	if ( zoom > 14 ) {
		javascript:afficher('places_district');
		javascript:afficher('bloc_buildings');
		javascript:cacher('places_city');
		javascript:cacher('places_town');
		javascript:cacher('places_village');
	}
	if ( zoom <= 14 ) {
		javascript:cacher('places_district');
		javascript:cacher('bloc_buildings');
		javascript:afficher('places_city');
		javascript:afficher('places_town');
		javascript:afficher('places_village');
	}
});