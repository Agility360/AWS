/*=========================================================================================
 * Written by: mcdaniel
 * Date:		July 2017
 *
 * Usage:	
 *=========================================================================================*/
use `agility360-db`

SELECT 	c.category_id,
		c.parent_id,
        c.industry_id,
		c.profession_id,
        c.is_system,
		c.description,
        q.question_id,
		q.seq,
        q.question,
        q.datatype_id,
		q.choices,
		q.is_descriptor
FROM 	categories c
        JOIN questions q ON (c.category_id = q.category_id)
;