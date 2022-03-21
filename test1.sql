CREATE FUNCTION    kp_import_check_passport( id_ IN numeric )
  RETURN varchar AS

  doc_sn_ sa.kt_doc.doc_sn%type;
  zkpo_   sa.kt_office.zkpo%type;

BEGIN

  SELECT min(d.doc_sn)
  INTO doc_sn_
  FROM kt_doc_ref dr ,kt_doc d
  WHERE dr.card_id = id_
  AND d.doc_id = dr.doc_id
  AND d.doc_type = dai2000_type.kp_getDOcTYpe(200)
  AND d.doc_id NOT IN (SELECT pasp_id FROM kt_doc_dov)
  AND d.doc_id not in (SELECT pasp_id FROM kt_card_add_person ap WHERE ap.card_id = id_);

  SELECT min(o.zkpo)
  INTO zkpo_
  FROM kt_office o
  WHERE o.office_id = id_;

  IF doc_sn_ is not null
  THEN RETURN doc_sn_;
  ELSE RETURN zkpo_;
  END IF;

END;