/* Create table dbo.DimDate */
CREATE TABLE dbo.v_date_dimension (
   [DateKey]  int IDENTITY  NOT NULL
,  [InvoiceKey]  int   NOT NULL
,  [Date]  datetime   NOT NULL
,  [Week]  int   NULL
,  [Month]  int   NULL
,  [Quarter]  int   NULL
,  [Year]  int   NULL
, CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
( [DateKey] )
) ON [PRIMARY]
;

-- load data to dimdate
insert into ChinookDW.dbo.DimDate
(DateId, Date, Week, Month, Quarter, Year)
select distinct DateKey, Date, Week, Month, Quarter, Year
from stgDate.dbo.Sheet1$