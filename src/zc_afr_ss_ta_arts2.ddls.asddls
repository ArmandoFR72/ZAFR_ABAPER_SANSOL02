@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_AFR_SS_TA_ARTS2
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_AFR_SS_TA_ARTS2
{
  key Id,
  Descrip,
  Descadi,
  Color,
  Piezas,
  Stock,
  Url,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
