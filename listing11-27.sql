-- The RIGHT Way to Generate a Report, Making the Database Do the Work.

SELECT
    a.PRODUCT_ID,
    SUM( a.QTY_SOLD ) AS TOTAL_QTY,
    b.PRODUCT_COST,
    b.RETAIL_PRICE

FROM
    ORDERS a

LEFT JOIN
    PRODUCTS b ON b.PRODUCT_ID = a.PRODUCT_ID

WHERE
    ORDER_DATE BETWEEN '2008-01-01' AND '2008-01-31'

GROUP BY
    a.PRODUCT_ID,
    b.PRODUCT_COST,
    b.RETAIL_PRICE
