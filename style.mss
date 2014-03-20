Map { font-directory: url(./fonts); }

#fond {
  ::outline {
    line-color: @gris;
    line-width: 2;
    line-join: round;
  }
  polygon-pattern-file: url("images/trame.png");
    ::folds {
		polygon-pattern-file: url(images/paperfolds_512.png);
      	polygon-pattern-comp-op: color-burn;
	}
}

#etiq_villes [zoom<=14] {
  	[place='city'] {
    	point-file:url("images/post-it-rose-167.png");
  		point-allow-overlap:true;
    	point-opacity:0.9;
 	}
  	[place='town'] {
    	[random<=1] {point-file:url("images/post-it-bleu-105-a.png");}
    	[random>1] [random<=3] {point-file:url("images/post-it-bleu-105-b.png");}
    	[random=3] {point-file:url("images/post-it-bleu-105-c.png");}
    	[random=4] {point-file:url("images/post-it-bleu-105-d.png");}
    	[random=5] {point-file:url("images/post-it-bleu-105-e.png");}
    	[random=6] {point-file:url("images/post-it-bleu-105-f.png");}
    	[random>6] [random<9] {point-file:url("images/post-it-bleu-105-g.png");}
    	[random>=9] {point-file:url("images/post-it-bleu-105-h.png");}
  		point-allow-overlap:true;
    	point-opacity:0.9;
    	[long='oui'] {point-transform:"scale(1.3,1)";}
  	}
  	[place='village'] {
    	[random<=1] {point-file:url("images/post-it-vert-84-a.png");}
    	[random>1] [random<=3] {point-file:url("images/post-it-vert-84-b.png");}
    	[random=3] {point-file:url("images/post-it-vert-84-c.png");}
    	[random=4] {point-file:url("images/post-it-vert-84-d.png");}
    	[random=5] {point-file:url("images/post-it-vert-84-e.png");}
    	[random=6] {point-file:url("images/post-it-vert-84-f.png");}
    	[random>6] [random<9] {point-file:url("images/post-it-vert-84-g.png");}
    	[random>=9] {point-file:url("images/post-it-vert-84-h.png");}
  		point-allow-overlap:true;
    	point-opacity:0.9;
    	[long='oui'] {point-transform:"scale(1.2,1)";}
  	}
}

#noms_villes [zoom<=14] {
	text-allow-overlap:true;
  	text-name:"[name].replace('é','e').replace('ô','o').replace('à','a').replace('-',' ')";
	text-face-name: 'TEN O CLOCK Regular';
  	[place='city'] {text-size:30; text-wrap-width:65;}
  	[place='town'] {text-size:20; text-wrap-width:65;}
  	[place='village'] {text-size:15; text-wrap-width:30;}
}

#etiq_quartiers [zoom>14] [zoom<19] {
  	[random<=1] {point-file:url("images/post-it-orange-105-a.png");}
    [random>1] [random<=3] {point-file:url("images/post-it-orange-105-b.png");}
    [random=3] {point-file:url("images/post-it-orange-105-c.png");}
    [random=4] {point-file:url("images/post-it-orange-105-d.png");}
    [random=5] {point-file:url("images/post-it-orange-105-e.png");}
    [random=6] {point-file:url("images/post-it-orange-105-f.png");}
    [random>6] [random<9] {point-file:url("images/post-it-orange-105-g.png");}
    [random>=9] {point-file:url("images/post-it-orange-105-h.png");}
  	point-allow-overlap:true;
  	point-opacity:0.9;
    [long_mot='oui'] {point-transform:"scale(1.2,1)";}
    [length<9] {point-transform:"scale(1,0.8)";}
  	[length>15] {point-transform:"scale(1,1.3)";}
}

#noms_quartiers [zoom>14] [zoom<19] {
  	text-allow-overlap:true;
  	text-wrap-width:15;
  	//text-name:"[name].replace('é','e').replace('ô','o').replace('à','a').replace('-',' ')";
  	text-name:"[name].replace('-',' ')";
	text-face-name: 'DK Crayon Crumble Regular';
  	text-fill:lighten(@noir,20%);
  	text-line-spacing:-5;
  	text-size:25;
}

#noms_batiments [type!='autres'] [zoom>=17] {
  	[zoom=17] [way_area>5000] {
		point-file:url("images/gomme-1ligne.png");
  		point-allow-overlap:true;
    	point-opacity:0.8;
    }
  	[zoom=18] {
		point-file:url("images/gomme-1ligne.png");
    	[longueur>20] {point-file:url("images/gomme-2lignes.png");}
  		point-allow-overlap:true;
    	point-opacity:0.8;
    }
  	[zoom=19] {
		point-file:url("images/gomme-1ligne.png");
    	[longueur>20] {point-file:url("images/gomme-2lignes.png");}
  		point-allow-overlap:true;
    	point-opacity:0.8;
    }
}

#noms_batiments [type!='autres'] [zoom>=17] {
  	[zoom=17] [way_area>5000] {
	    text-allow-overlap:true;
    	text-wrap-width:70;
  		text-name:"[name].replace('-',' ')";
  		text-fill:@noir;
    	text-opacity:1;
  		text-halo-fill:fadeout(#c8c8c8,30%);
  		text-halo-radius:0.5;
    	text-face-name: 'DK Crayon Crumble Regular';
    	text-size:25;
    }
  	[zoom=18] {
    	text-allow-overlap:true;
  		text-wrap-width:70;
  		text-name:"[name].replace('-',' ')";
  		text-fill:lighten(@noir,20%);
  		text-halo-fill:@gris;
  		text-halo-radius:0.5;
    	text-face-name: 'DK Crayon Crumble Regular';
    	text-size:25;
  	}
  	[zoom=19] {
    	text-allow-overlap:true;
	    text-wrap-width:70;
  		text-name:"[name].replace('-',' ')";
  		text-fill:lighten(@noir,20%);
  		text-halo-fill:@gris;
  		text-halo-radius:0.5;
    	text-face-name: 'DK Crayon Crumble Regular';
    	text-size:25;
  	}
}

#noms_eaux {
  	[waterway='river'] {
		text-name:"[name]";
  		text-fill:lighten(@noir,20%);
  		text-halo-fill:@gris;
  		text-halo-radius:2;
    	text-face-name: 'DK Crayon Crumble Regular';
  		text-placement:line;
  		[zoom>=13] { text-min-distance: 250; text-size:20;}
  		[zoom>=15] { text-min-distance: 300; text-size:30;}
    }
  	[waterway='canal'] [zoom>18] {
		text-name:"[name]";
  		text-fill:lighten(@noir,20%);
  		text-halo-fill:@gris;
  		text-halo-radius:2;
    	text-face-name: 'DK Crayon Crumble Regular';
  		text-placement:line;
  		[zoom>=13] { text-min-distance: 100; text-size:10;}
  		[zoom>=15] { text-min-distance: 200; text-size:20;}
    }
}
#routes[type='routes_principales'][zoom>16] {
	text-name:"[name]";
  	text-face-name: 'DK Crayon Crumble Regular';
    text-size:18;
  	text-placement:line;
  	text-min-distance:200;
  	text-opacity:0.8;
}

#routes[type='routes_secondaires'][zoom>=18] {
	text-name:"[name]";
  	text-face-name: 'DK Crayon Crumble Regular';
    text-size:16;
  	text-placement:line;
  	text-min-distance:300;
  	text-opacity:0.8;
}