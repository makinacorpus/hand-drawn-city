#zones_buffer {
  	[landuse='industrial'] [zoom<=15] {
		polygon-pattern-file:url("images/trame-industrial-light.png");
    }
  	[landuse='commercial'] [zoom>=15] {
    	polygon-pattern-file:url("images/trame-commercial.jpg");
    	polygon-pattern-opacity:0.1;
  	}
}

#zones {
  	::outline1 {
    	line-smooth:2;
    	line-color:@crayon;
    	line-width:1;
    	[zoom>=15] {line-width:0.4;}
    	line-opacity:0.5;
    }
    ::outline2 [zoom<15] {
	   	line-smooth:3;
	   	line-color:@crayon;
     	line-width:0.8;
    	line-opacity:0.3;
    }
    [type='residential'] {
    	polygon-pattern-file:url("images/trame-residential.jpg");
    	polygon-pattern-opacity:0.3;
    	[zoom<15] {polygon-pattern-opacity:0.4;}
  	}
  	[type='commercial'] {
    	polygon-pattern-file:url("images/trame-commercial.jpg");
    	polygon-pattern-opacity:0.5;
    	[zoom<15] {polygon-pattern-opacity:0.5;}
  	}
  	[type='industrial'] {
    	polygon-pattern-file:url("images/trame-industrial.jpg");
    	polygon-pattern-opacity:0.5;
    	[zoom<15] {polygon-pattern-opacity:0.8;}
  	}
  	[type='natural'], [type='cemetery'] {
    	polygon-pattern-file:url("images/trame-natural.jpg");
    	polygon-pattern-opacity:0.8;
  	}
}

// filtre par zoom de tous les batiments
#buildings [zoom>=15] {
  	[type='habitat'] {
    	polygon-fill:@habitat;
    	polygon-opacity:0.3;
    	polygon-pattern-file: url("images/trame-crayon-inv-gauche.png");
    	polygon-pattern-comp-op:hard-light;
    	polygon-pattern-opacity:0.8;
	}
    [type='historique'] {
		polygon-fill:@historique;
    	polygon-opacity:0.7;
    	polygon-pattern-file: url("images/trame-crayon-inv-256.png");
    	polygon-pattern-comp-op:hard-light;
    	polygon-pattern-opacity:0.7;
	}
    [amenity='public_building'] {
		polygon-fill:@public;
    	polygon-opacity:0.5;
    	polygon-pattern-file: url("images/trame-crayon-inv-256.png");
    	polygon-pattern-comp-op:hard-light;
    	polygon-pattern-opacity:0.7;
	}
    [type='religion'] {
		polygon-fill:@religion;
    	polygon-opacity:0.5;
    	polygon-pattern-file: url("images/trame-crayon-inv.png");
    	polygon-pattern-comp-op:hard-light;
    	polygon-pattern-opacity:0.7;
	}
	::outline {
    	line-color: @building-line-color;
    	[zoom=15] {
      		line-color: lighten(@building-line-color,55%);
      		line-width: 0.3;
	    	line-opacity: 0.3;
      		line-smooth: 1.2;
    	}
    	[zoom=16] {
      		line-color: lighten(@building-line-color,60%);
      		line-width: 0.6;
	    	line-opacity: 0.5;
      		line-smooth: 1.2;
    	}
    	[zoom=17] {
      		line-color: lighten(@building-line-color,25%);
      		line-width: 0.8;
	    	line-opacity: 0.5;
      		line-smooth: 1;
    	}
    	[zoom>=18] {
      		line-color: lighten(@building-line-color,15%);
      		line-width: 0.5;
	    	line-opacity: 0.5;
      		line-smooth: 0.8;
    	}
    }
}

// couche buildings_lines
#buildings_lines [zoom>=15] {
  	::outline1 {
    	line-color: @building-line-color;
    	line-width: 0.3;
    	line-smooth: 0.2;
    	line-dasharray:5,0.8,2.5,4,5,3.5;
    	[zoom=15] {line-opacity: 0.3;}
    	[zoom=16] {line-opacity: 0.3;}
    	[zoom=17] {line-opacity: 0.3;}
    	[zoom=18] {line-opacity: 0.5;}
  	}
  	::outline2 {
    	line-color: @building-line-color;
    	line-width: 0.3;
    	line-smooth: 0.2;
    	[zoom=15] {line-opacity: 0.3;}
    	[zoom=16] {line-opacity: 0.3;}
    	[zoom=17] {line-opacity: 0.3;}
    	[zoom=18] {line-opacity: 0.5;}
  	}
  	::inner {
    	line-color:@building-line-color;
    	line-dasharray:3,1.5,7,1.5,5;
    	line-offset:-1;
    	line-width:0.5;
    	line-opacity:0.5;
    	line-smooth:0.1;
    	[zoom<=18] {line-opacity: 0.3;}
	}
}

// couche surfaces_eaux
#surfaces_eaux_buffer {
  	[zoom<=14] {
		polygon-pattern-file: url("images/trame-eau-leger.png");
    }
  	[zoom>14] [zoom<18] {
    	polygon-pattern-file: url("images/trame-eau-leger.png");
    	polygon-pattern-opacity:3;
    }
}

#surfaces_eaux [zoom<=14] {
	::outline1 {
    	line-color:lighten(@noir,15%);
    	line-width:0.5;
    	line-smooth:2;
    	line-opacity:0.3;
    }
  	::outline2 {
    	line-color:lighten(@noir,15%);
    	line-width:0.5;
    	line-smooth:1.5;
    	line-opacity:0.3;
    }
}

#surfaces_eaux {
  	//polygon-fill:#235D79;
  	polygon-pattern-file: url("images/trame-eau-dense.png");
  	polygon-pattern-opacity:0.8;
    	::outline1 {
    		line-color: lighten(@noir,50%);
    		line-width: 1;
    		line-opacity:0.5;
      		line-smooth:3;
   		}
  		::outline2 {
    		[zoom<=14] {line-width: 0.5; line-offset:1; line-opacity:0.4;}
    		[zoom>=15] {line-width: 2; line-offset:1.5; line-opacity:0.4;}
       		line-color:@rivage;
    		line-cap: round;
   		}
	  	::inner {
    		line-color: lighten(@noir,50%);
    		line-width: 0.2;
	    	line-opacity:0.2;
    		line-offset:-1;
    	}
}

// couche natural
#zones [type='cemetery'], #parcs [zoom>=15] {
  	::outline1 [zoom>14] {
    	line-color: @natural2;
    	line-width: 0.4;
   	}
  	::outline2 {
    	[zoom<=15] {line-width: 1.5; line-offset:1; line-opacity:0.4;}
    	[zoom>15] {line-width: 2; line-offset:1.5; line-opacity:0.4;}
       	line-color:@natural;
    	line-cap: round;
   	}
  	::outline3 {
    	line-color:@gris;
    	line-smooth:4;
    	line-width:0.8;
    }
  	polygon-pattern-file: url("images/trame-parcs.jpg");
	polygon-pattern-opacity:0.6;
}