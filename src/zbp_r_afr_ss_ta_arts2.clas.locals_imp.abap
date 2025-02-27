CLASS LHC_ZR_AFR_SS_TA_ARTS2 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrAfrSsTaArts2
        RESULT result,
      stockValidion FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrAfrSsTaArts2~stockValidion.
ENDCLASS.

CLASS LHC_ZR_AFR_SS_TA_ARTS2 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD stockValidion.

  DATA: failed_record   LIKE LINE OF failed-ZrAfrSsTaArts2,
        reported_record LIKE LINE OF reported-ZrAfrSsTaArts2.

        READ ENTITIES OF ZR_AFR_SS_TA_ARTS2 IN LOCAL MODE
        ENTITY ZrAfrSsTaArts2
        FIELDS ( Stock )
        WITH CORRESPONDING #( keys )
        RESULT DATA(IT_Art).
        LOOP AT IT_Art ASSIGNING FIELD-SYMBOL(<fs_art>).
             IF <fs_art>-Stock < 0 OR <fs_art>-Stock IS INITIAL.
                failed_record-%tky = <fs_art>-%tky.
                APPEND failed_record TO failed-ZrAfrSsTaArts2.

                reported_record-%tky = <fs_art>-%tky.
                reported_record-%msg =
                         new_message(
                                     id       = 'ZAFR_MSG_ARTICULOS'
                                     number   = '001'
                                     severity = if_abap_behv_message=>severity-error
                                     v1       =  <fs_art>-Stock
                                    ).
                APPEND reported_record TO reported-ZrAfrSsTaArts2.
             ENDIF.
        ENDLOOP.

  ENDMETHOD.

ENDCLASS.
