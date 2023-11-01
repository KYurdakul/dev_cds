@AbapCatalog.sqlViewName: 'ZCDS_V2_3359'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Kerem Mert Yurdakul Odev 2 - CDS 2'
define view ZCDS_ODEV2_2_3359 as select from ZCDS_ODEV2_1_3359 as z1
    inner join vbrk on z1.vbeln = vbrk.vbeln
{ key z1.vbeln,
  sum( z1.conversion_netwr ) as toplam_net,
  z1.kunnrAd,
  count( distinct z1.vbeln ) as toplam_fatura_adt,
  division( cast(sum( z1.conversion_netwr ) as abap.curr( 10, 2 )), 
            cast(count( distinct z1.vbeln ) as abap.int4), 2 ) as ort_miktar,
  left(vbrk.fkdat, 4 ) as fatura_yil,
  substring(vbrk.fkdat, 5, 2 ) as fatura_ay,
  substring(vbrk.fkdat, 7, 2 ) as fatura_gun,
  left(vbrk.inco2_l, 3 ) as incoterm
}
group by
z1.vbeln,
z1.conversion_netwr,
z1.kunnrAd,
vbrk.fkdat,
vbrk.inco2_l;
