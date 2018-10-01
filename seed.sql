DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS users;


create table cars (
	id INT,
	make VARCHAR(50),
	model VARCHAR(50),
	year VARCHAR(50),
  user_id int REFERENCES user(id)
);

create table users (
	id INT,
	name VARCHAR(50),
	job VARCHAR(50),
	number VARCHAR(50)
);

insert into cars (id, name, job, number) values (1, 'Jo-ann Saer', 'Community Outreach Specialist', '935-655-3981');
insert into cars (id, name, job, number) values (2, 'Tiff Bodycomb', 'Recruiter', '566-112-9384');
insert into cars (id, name, job, number) values (3, 'Tory Vassel', 'Accountant III', '935-808-8331');
insert into cars (id, name, job, number) values (4, 'Zelig Readings', 'Senior Cost Accountant', '605-111-8419');
insert into cars (id, name, job, number) values (5, 'Verge Mc Meekin', 'Quality Control Specialist', '771-844-0346');
insert into cars (id, name, job, number) values (6, 'Viviyan Wibberley', 'VP Sales', '401-221-4567');
insert into cars (id, name, job, number) values (7, 'Shellysheldon Colenutt', 'Dental Hygienist', '944-569-4204');
insert into cars (id, name, job, number) values (8, 'Germain Hawsby', 'Administrative Assistant IV', '635-110-8590');
insert into cars (id, name, job, number) values (9, 'Gustavus Peak', 'VP Sales', '542-426-8300');
insert into cars (id, name, job, number) values (10, 'Verna Nourse', 'Chemical Engineer', '706-266-5105');

insert into users (id, make, model, year) values (1, 'Dodge', 'Charger', 2006);
insert into users (id, make, model, year) values (2, 'Chevrolet', 'Express 1500', 2001);
insert into users (id, make, model, year) values (3, 'Toyota', 'RAV4', 1997);
insert into users (id, make, model, year) values (4, 'Mitsubishi', 'Pajero', 1995);
insert into users (id, make, model, year) values (5, 'Toyota', 'RAV4', 2011);
insert into users (id, make, model, year) values (6, 'Dodge', 'Stratus', 2004);
insert into users (id, make, model, year) values (7, 'Hyundai', 'Accent', 2013);
insert into users (id, make, model, year) values (8, 'BMW', 'X6', 2011);
insert into users (id, make, model, year) values (9, 'Toyota', 'Tercel', 1993);
insert into users (id, make, model, year) values (10, 'Cadillac', 'Escalade ESV', 2004);
