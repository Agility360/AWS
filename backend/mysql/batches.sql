/*=========================================================================================
 * Written by: mcdaniel
 * Date:		July 2017
 *
 * Usage:	
 *=========================================================================================*/
use `agility360-db`

SELECT 	c.category_id,
		c.description,
        q.question_id,
		q.seq,
        q.question,
        q.datatype_id,
		q.choices
FROM 	batches b
		JOIN batch_categories bc ON (b.batch_id = bc.batch_id)
		JOIN categories c ON (bc.category_id = c.category_id)
        JOIN questions q ON (c.category_id = q.category_id)
WHERE	(c.is_system = 1) 
ORDER BY c.category_id, q.seq
;