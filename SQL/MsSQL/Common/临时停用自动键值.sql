select * from tbltempData


insert into tblTempData
(Name)
values
('1234')
,('abcd')

set IDENTITY_INSERT tblTempData ON

insert into tblTempData
(ID,Name)
values
(5,'1234')
,(6,'abcd')

set IDENTITY_INSERT tblTempData OFF
