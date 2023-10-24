@AbapCatalog.sqlViewName: 'ZCDS_VIEW1_3359'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Örnek CDS 1'
define view ZCDS_EXAMPLE1_3359 as select from ekpo
inner join ekko
    on ekpo.ebeln = ekko.ebeln 
left outer join mara
    on mara.matnr = ekpo.matnr
left outer join makt
    on makt.matnr = mara.matnr
left outer join lfa1
    on lfa1.lifnr = ekko.lifnr
    {
    
key ekpo.ebeln,
key ekpo.ebelp,
    ekpo.matnr,
    makt.maktx,
    ekpo.werks,
    ekpo.lgort,
    ekpo.meins,
    lfa1.lifnr,
    lfa1.name1,
    concat(lfa1.stras,concat(' ',lfa1.mcod3)) as satici_adresi
}
where makt.spras = $session.system_language;
