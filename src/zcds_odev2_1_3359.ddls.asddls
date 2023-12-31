@AbapCatalog.sqlViewName: 'ZCDS_V1_3359'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Kerem Mert Yurdakul Odev 2 - CDS 1'
define view ZCDS_ODEV2_1_3359 as select from vbrp
inner join vbrk
    on vbrk.vbeln = vbrp.vbeln 
inner join mara
    on mara.matnr = vbrp.matnr
left outer join vbak
    on vbak.vbeln = vbrp.aubel
left outer join kna1
    on kna1.kunnr = vbak.kunnr
left outer join makt
    on makt.matnr = makt.matnr
    and makt.spras = $session.system_language{
    key vbrp.vbeln,
    key vbrp.posnr,
    vbak.kunnr,
    concat(kna1.name1,concat(' ',kna1.name2)) as kunnrAd,
    currency_conversion(
        amount => vbrp.netwr, 
        source_currency => vbrp.waerk, 
        target_currency => cast('EUR' as abap.cuky), 
        exchange_rate_date => vbrk.fkdat) as conversion_netwr,
    left(kna1.kunnr, 3) as left_kunnr,
    length(mara.matnr) as matnr_length,
    case vbrk.fkart
        when 'FAS' then 'Peşinat talebi iptali'
        when 'FAZ' then 'Peşinat talebi'
        else 'Fatura'
    end as Faturalama_Turu,
    vbrk.fkdat            
}
