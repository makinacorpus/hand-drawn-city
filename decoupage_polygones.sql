/* 1. Création d'une table poly2line destinée à contenir les polygones transformés en linestring */

CREATE TABLE poly2line
(
  id serial NOT NULL,
  way geometry(LineString,900913),
  long_way geometry(LineString,900913),
  type text,
  CONSTRAINT poly2line_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE poly2line
  OWNER TO postgres;

/* 2. Mise en place d'une fonction pour agrandir proportionnellement les linestring */

CREATE OR REPLACE FUNCTION agrandir_ligne(ligne geometry)
RETURNS geometry AS $$
DECLARE A geometry;
DECLARE B geometry;
DECLARE azimuthA double precision;
DECLARE azimuthB double precision;
DECLARE length double precision;
DECLARE newlengthA double precision;
DECLARE newlengthB double precision;
DECLARE newA geometry;
DECLARE newB geometry;
BEGIN
	-- crée des points A et B aux extrémités de la ligne
	A := ST_STARTPOINT(ligne);
	B := ST_ENDPOINT(ligne);
	-- récupère 2 az : de B vers A, puis de A vers B 
	azimuthA := ST_AZIMUTH(B,A);
	azimuthB := ST_AZIMUTH(A,B);
	-- récupère la longueur entre les points A et B et définition d'une nouvelle longueur à ajouter
	length := ST_DISTANCE(A,B);
	newlengthA := (length/5)*random();
	newlengthB := (length/5)*random();
	-- crée un nouveau point A et un nouveau point B dans la direction déterminée et dans un rapport de 1/x de la longueur d'origine
	newA := ST_TRANSLATE(A, sin(azimuthA) * newlengthA, cos(azimuthA) * newlengthA);
	newB := ST_TRANSLATE(B, sin(azimuthB) * newlengthB, cos(azimuthB) * newlengthB);
	-- crée une ligne entre ces 2 nouveaux points
        RETURN ST_Makeline(newA,newB);
END;
$$  LANGUAGE plpgsql;

/* 3. Transformation des polygones de bâtiments (building IS NOT NULL) en linestring (dans la colonne "way") */

INSERT INTO poly2line (way)
SELECT ST_MakeLine(sp,ep)
FROM
   -- extract the endpoints for every 2-point line segment for each linestring
   (SELECT
      ST_PointN(geom, generate_series(1, ST_NPoints(geom)-1)) as sp,
      ST_PointN(geom, generate_series(2, ST_NPoints(geom)  )) as ep
    FROM
       -- extract the individual linestrings
      (SELECT (ST_Dump(ST_Boundary(way))).geom
       FROM planet_osm_polygon WHERE building IS NOT NULL
       ) AS linestrings
    ) AS segments





/* 4. Utilisation de la fonction pour insérer ces lignes modifiées dans la table poly2line (champ "long_way") */

/* 4.1 Application sur l'intégralité de la table */
UPDATE poly2line SET long_way=(agrandir_ligne(way));

/* 4.2 Application sur une ligne de test*/
--UPDATE poly2line SET long_way=(agrandir_ligne(way)) WHERE id='1970421';

/* 5. Test des valeurs : mesure de la longueur d'une ligne*/

--SELECT ST_DISTANCE(ST_STARTPOINT(way),ST_ENDPOINT(way)) as way, ST_DISTANCE(ST_STARTPOINT(long_way),ST_ENDPOINT(long_way)) as long_way FROM poly2line WHERE id='1970421';
