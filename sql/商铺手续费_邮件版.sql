SELECT *
  FROM (SELECT SUBSTR(A.TRADE_TIME, 1, 8) AS data_date,
               A.amount_source,
               SUM(A.TRADE_AMOUNT) / 100 as czje,
               count(1) as czbs,
               DECODE(A.amount_source,
                      '��������',
                      0,
                      '֧����',
                      SUM(A.TRADE_AMOUNT) / 100 * 2.5 / 1000,
                      '΢��֧��',
                      SUM(A.TRADE_AMOUNT) / 100 * 2.5 / 1000,
                      '�ֻ�֧����',
                      SUM(A.TRADE_AMOUNT) / 100 * 2.5 / 1000,
                      '����֧��',
                      SUM(A.TRADE_AMOUNT) / 100 * 2 / 1000,
                      '����',
                      SUM(A.TRADE_AMOUNT) / 100 * 3 / 1000) AS SXFZC
          FROM T_FM_TRADE A
         WHERE A.TRADE_CODE IN ('100', '200')
           AND A.TRADE_TIME LIKE TO_CHAR(SYSDATE - 1, 'YYYYMMDD') || '%'
         GROUP BY A.AMOUNT_SOURCE, SUBSTR(A.TRADE_TIME, 1, 8)
         ORDER BY A.AMOUNT_SOURCE)
UNION ALL
SELECT T.data_date, '�ϼ�', SUM(T.czje), SUM(T.czbs), SUM(T.SXFZC)
  FROM (SELECT SUBSTR(A.TRADE_TIME, 1, 8) AS data_date,
               A.amount_source,
               SUM(A.TRADE_AMOUNT) / 100 as czje,
               count(1) as czbs,
               DECODE(A.amount_source,
                      '��������',
                      0,
                      '֧����',
                      SUM(A.TRADE_AMOUNT) / 100 * 2.5 / 1000,
                      '΢��֧��',
                      SUM(A.TRADE_AMOUNT) / 100 * 2.5 / 1000,
                      '�ֻ�֧����',
                      SUM(A.TRADE_AMOUNT) / 100 * 2.5 / 1000,
                      '����֧��',
                      SUM(A.TRADE_AMOUNT) / 100 * 2 / 1000,
                      '����',
                      SUM(A.TRADE_AMOUNT) / 100 * 3 / 1000) AS SXFZC
          FROM T_FM_TRADE A
         WHERE A.TRADE_CODE IN ('100', '200')
           AND A.TRADE_TIME LIKE TO_CHAR(SYSDATE - 1, 'YYYYMMDD') || '%'
         GROUP BY A.AMOUNT_SOURCE, SUBSTR(A.TRADE_TIME, 1, 8)) T
 GROUP BY T.data_date
