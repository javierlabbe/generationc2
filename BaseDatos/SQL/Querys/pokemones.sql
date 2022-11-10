/*
 * NO existe PK
 * */

ALTER TABLE generationc2.mis_pokemones ADD id int primary key auto_increment NOT NULL; -- agregando columna ID a pokemones
ALTER TABLE pokemoneskanto ADD PRIMARY KEY (pokedex); -- Asignando pokedex como PK

-- relacionando tablas
ALTER TABLE mis_pokemones 
ADD FOREIGN KEY(pokedex) REFERENCES pokemonesKanto(pokedex);

/*
 * filtrar todos los pokemones que tengan la hab de fuego como principal
 * tipo1 fuego
 * en mis pokemones
 */

SELECT 
*
FROM mis_pokemones mp 
LEFT JOIN pokemoneskanto p ON mp.pokedex = p.pokedex 
WHERE p.tipo1 = 'fuego';

SELECT 
*
FROM mis_pokemones mp 
LEFT JOIN pokemoneskanto p ON mp.pokedex = p.pokedex 
WHERE p.tipo1 = 'veneno' and p.tipo2='veneno';

SELECT 
*
FROM mis_pokemones mp 
LEFT JOIN pokemoneskanto p ON mp.pokedex = p.pokedex 
WHERE p.nombre = 'Charmander';

SELECT 
*
FROM mis_pokemones mp 
LEFT JOIN pokemoneskanto p ON mp.pokedex = p.pokedex 
WHERE p.nombre = 'Charizard';

SELECT 
*
FROM pokemoneskanto p2
WHERE p2.tipo1 = 'agua' or p2.tipo2='agua';

SELECT 
*
FROM mis_pokemones mp 
LEFT JOIN pokemoneskanto p ON mp.pokedex = p.pokedex 
WHERE mp.lugar  = 'Estacion central';

SELECT 
*
FROM mis_pokemones mp 
LEFT JOIN pokemoneskanto p ON mp.pokedex = p.pokedex 
WHERE mp.lugar  LIKE 'San%';