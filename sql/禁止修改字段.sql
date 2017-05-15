CREATE OR REPLACE TRIGGER trg_update
   BEFORE update of CREATETIME ON t_ad_keywords 
   for each row
BEGIN
    raise_application_error (num      => -20000,
                             msg      =>    '此字段不允许修改'
                              );
END;
