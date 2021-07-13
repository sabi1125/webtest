question 2:

select count(*) from reservation join staffs on staffs.id = reservation.staff_id where reservation.start_at between '2021/7/7  09:00:00' and '2021/7/7  09:00:00' and staffs.name = 'スタッフA';
select count(*) from reservation join staffs on staffs.id = reservation.staff_id where reservation.start_at between '2021/7/7  09:00:00' and '2021-07-07 11:50:00' and staffs.name = 'スタッフA';
