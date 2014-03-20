// Routes

#aerodrome {
  	polygon-pattern-file:url("images/trame-gris.jpg");
    polygon-pattern-opacity:1;
  	::outline1 {
    	line-smooth:3;
	   	line-color:@crayon;
     	line-width:0.8;
    	line-opacity:0.3;
    }
}

#routes [type='routes_principales'] [zoom<15] {
    line-color:@routes;
	line-opacity:0.3;
    line-smooth: 15;
    line-width: 0.3;
}

#routes [type='routes_secondaires'] {
    [zoom>13] [zoom<15] {
		line-color:@routes;
		line-opacity:0.1;
      	line-smooth: 15;
      	line-width: 0.3;
    }
}

#ponts [zoom>14] {
  	::outline {
    	line-color: @gris;
    	line-opacity:0.9;
    	line-width: 0.4;
    	line-smooth: 8;
    }
  	::inner {
    	line-color: @gris;
    	line-opacity:0.8;
    	line-width: 0.3;
    	line-smooth: 5;
    	line-offset:-1;
    	line-dasharray:5,0.8,2.5,4,5,3.5;
    }
  	polygon-fill:@gris;
  	polygon-opacity:0.9;
  	polygon-pattern-file: url("images/trame-crayon-inv-256.png");
}

#ponts-ligne {
	line-color:red;
  	line-width:3;
}
  
// Voies ferrées
#rail_tram [zoom>=15], #rail_train [zoom>=15] {
    ::line, ::hatch { line-color: lighten(@noir,30%); }
    ::line {
    	[zoom=15] {line-width:0.4; line-smooth:7; line-opacity:0.5;}
    	[zoom>15] {line-width:0.6; line-smooth:7; line-opacity:0.5;}
 	}
    ::hatch {
    	[zoom=15] {line-width: 1; line-dasharray: 1, 24; line-opacity:0.3;}
    	[zoom>15] {line-width: 2; line-dasharray: 1, 24; line-opacity:0.5;}
    }
}