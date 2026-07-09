-- OP-888: register the patient.full_record permission and grant it to the admin group. It gates the REST API
-- GET /patients/{code}/full-record (SecurityConfig) and the View Full Record button in AdmittedPatientBrowser
-- (checked via PermissionManager, like patient.export). P_ID_A / GP_ID are auto-increment, so no explicit id.
INSERT INTO OH_PERMISSIONS (P_NAME, P_DESCRIPTION, P_ACTIVE)
	VALUES ('patient.full_record', 'View a patient full record and all its linked data (GDPR right of access)', 1);

INSERT INTO OH_GROUPPERMISSION (GP_UG_ID_A, GP_P_ID_A, GP_ACTIVE)
	SELECT 'admin', P_ID_A, 1 FROM OH_PERMISSIONS WHERE P_NAME = 'patient.full_record';
