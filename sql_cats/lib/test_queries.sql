EXPLAIN ANALYZE SELECT cats.breed
FROM
  cats  
WHERE
  cats.name = 'Noel';

EXPLAIN ANALYZE SELECT toys.name
FROM
  cats
JOIN
  cattoys ON cats.id = cattoys.cat_id
JOIN 
  toys ON toys.id = cattoys.toy_id  
WHERE
  cats.name = 'Freyja';

EXPLAIN ANALYZE SELECT toys.name, cats.name
FROM
  cats
JOIN
  cattoys ON cats.id = cattoys.cat_id
JOIN 
  toys ON toys.id = cattoys.toy_id  
WHERE
  cats.color = 'Red'
AND
  toys.color = 'Red';

 EXPLAIN SELECT 
    *
  FROM 
    cats 
  WHERE
    cats.color = 'Red'
  UNION
  SELECT 
   *
  FROM 
    toys
  WHERE 
    toys.color = 'Red';


  EXPLAIN SELECT 
    c.name AS cat_name, t.name AS toy_name
  FROM 
    cats AS c 
  JOIN
    cattoys ON c.id = cattoys.cat_id
  JOIN 
    toys AS t ON t.id = cattoys.toy_id 
  WHERE
    t.color = 'Red'
  OR 
    c.color = 'Red';

  EXPLAIN ANALYZE SELECT 
    toys.name
  FROM 
    toys 
  JOIN cattoys 
    ON toys.id = cattoys.toy_id
  JOIN cats
    ON cats.id = cattoys.cat_id
  WHERE 
    cats.breed = 'British Shorthair';

EXPLAIN SELECT
  toys.name
FROM
  toys
WHERE
  price < 10;