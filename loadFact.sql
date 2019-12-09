
-- Load FactInventory
insert into ChinookDW.dbo.FactInventory
    (TrackKey, ArtistKey, AlbumKey, GenreKey, MediaTypeKey)
select dt.TrackKey, dar.ArtistKey, dal.AlbumKey, dg.GenreKey, dmt.MediaTypeKey
from ChinookDW.dbo.DimTrack dt
    join ChinookDW.dbo.DimAlbum dal
    on dt.AlbumId = dal.AlbumID
    join ChinookDW.dbo.DimArtist dar
    on dal.ArtistId = dar.ArtistID
    join ChinookDW.dbo.DimGenre dg
    on dt.GenreId = dg.GenreID
    join ChinookDW.dbo.DimMediaType dmt
    on dt.MediaTypeId = dmt.MediaTypeID

-- Load FactBilling
SET IDENTITY_INSERT ChinookDW.dbo.FactBilling ON
GO
insert into ChinookDW.dbo.FactBilling
    (CustomerKey, EmployeeKey, TrackKey, InvoiceKey, InvoiceLineKey, UnitPrice, Quantity, Total)
select dc.CustomerKey, de.EmployeeKey, dt.TrackKey, di.InvoiceKey, dil.InvoiceLineKey, dt.UnitPrice, dil.Quantity, di.Total
from ChinookDW.dbo.DimDate dd
    join ChinookDW.dbo.DimInvoice di
    on dd.DateId = di.InvoiceID
    join ChinookDW.dbo.DimCustomer dc
    on dc.CustomerID = di.CustomerId
    join ChinookDW.dbo.DimEmployee de
    on de.EmployeeID = dc.SupportRepId
    join ChinookDW.dbo.DimInvoiceLine dil
    on di.InvoiceID = dil.InvoiceLineID
    join ChinookDW.dbo.DimTrack dt
    on dt.TrackID = dil.TrackId
GO
SET IDENTITY_INSERT ChinookDW.dbo.FactBilling OFF

-- Load FactBestSeller
insert into ChinookDW.dbo.FactBestSeller
    (InvoiceLineKey, DateKey, ArtistKey, AlbumKey, GenreKey, TrackKey, InvoiceKey, Quantity)
select dil.InvoiceLineKey, di.InvoiceKey, dar.ArtistKey, dal.AlbumKey, dg.GenreID, dt.TrackKey, di.InvoiceKey, dil.Quantity
from ChinookDW.dbo.DimInvoiceLine dil
    join ChinookDW.dbo.DimTrack dt
    on dt.TrackID = dil.TrackId
    join ChinookDW.dbo.DimAlbum dal
    on dal.AlbumID = dt.AlbumId
    join ChinookDW.dbo.DimArtist dar
    on dar.ArtistID = dal.ArtistId
    join ChinookDW.dbo.DimGenre dg
    on dg.GenreID = dt.GenreId
    join ChinookDW.dbo.DimInvoice di
    on di.InvoiceID = dil.InvoiceId
    join ChinookDW.dbo.DimDate dd
    on dd.DateId = di.InvoiceID