select * from users;

select email from users;

select substring(email from position('.' in email)) from users;

select substring(email from position('@' in email) + 1 for (length(email) - 4 - (position('@' in email)))) from users;

select * from users;

update users
set first_name = upper(first_name) where lower(substring(first_name from 2)) !=  substring(first_name from 2);

SELECT concat(substring(email from position('@' in email) + 1), '', char_length(
        substring(email from position('@' in email) + 1 for position('.com' in email) - (position('@' in email) + 1))))
FROM users;