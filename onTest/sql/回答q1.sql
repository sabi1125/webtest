select users.name,users.birthday,users.gender from users inner join user_label on users.id = user_label.user_id where user_label.label_id = 1 and user_label.label_id <> 3 and month(birthday) between '03' and '05' and gender='male';




