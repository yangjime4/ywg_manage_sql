DELETE from t_shop_subject
 WHERE url_id IN (SELECT url_id,count(url_id)
                                FROM t_shop_subject where url_id is not null
                               GROUP BY url_id
                              HAVING COUNT(url_id) > 1)
    and shop_id is null
