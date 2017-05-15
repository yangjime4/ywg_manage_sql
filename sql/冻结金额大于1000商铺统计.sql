select mu.login_id as �û��ʺ�,
       sb.boothno as ̯λ��,
       fa.freeze_amount / 100 as ������,
       so.real_name as �ͷ�
  from t_fm_account fa, t_mm_user mu, t_shop s, t_shop_booth sb,t_sys_operator so
 where fa.user_id = mu.user_id
   and fa.user_id = s.user_id
   and s.booth_id = sb.id
   and FREEZE_AMOUNT >= 100000
   and s.create_user=so.login_name
