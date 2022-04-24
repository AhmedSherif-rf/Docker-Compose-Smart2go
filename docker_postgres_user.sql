CREATE TABLE public.comp_employee
(
    recid bigint NOT NULL,
    corporate_id character varying(255) COLLATE pg_catalog."default",
    contract_typeid bigint,
    deptid bigint,
    email character varying(255) COLLATE pg_catalog."default",
    expiredate timestamp without time zone,
    hourcost double precision,
    mobile_phone character varying(255) COLLATE pg_catalog."default",
    name character varying(255) COLLATE pg_catalog."default",
    first_name character varying(255) COLLATE pg_catalog."default",
    last_name character varying(255) COLLATE pg_catalog."default",
    parent_id bigint,
    password character varying(255) COLLATE pg_catalog."default",
    prefered_language character varying(255) COLLATE pg_catalog."default",
    skills character varying(255) COLLATE pg_catalog."default",
    smallimage bytea,
    statusid bigint,
    user_name character varying(255) COLLATE pg_catalog."default",
    workingdays character varying(255) COLLATE pg_catalog."default",
    acc_temp_locked_start_time timestamp without time zone,
    failed_login_counter bigint,
    gender character varying(255) COLLATE pg_catalog."default",
    image bytea,
    location_name character varying(255) COLLATE pg_catalog."default",
    login_type bigint,
    startworkinghour time without time zone,
    status_name character varying(255) COLLATE pg_catalog."default",
    temporary_locks_counter bigint,
    user_type bigint,
    workinghours bigint,
    CONSTRAINT comp_employee_pkey PRIMARY KEY (recid)
);

CREATE TABLE public.sa_group
(
    recid bigint NOT NULL,
    created_by_company character varying(255) COLLATE pg_catalog."default",
    created_by_name character varying(255) COLLATE pg_catalog."default",
    creation_date timestamp without time zone,
    description character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    groupprimeid bigint,
    last_modified_by_name character varying(255) COLLATE pg_catalog."default",
    modification_date timestamp without time zone,
    name character varying(255) COLLATE pg_catalog."default",
    parent_group_id bigint,
    statusid bigint,
    gruop_type bigint,
    isdefault boolean,
    is_have_admin_prev boolean,
    status_name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT sa_group_pkey PRIMARY KEY (recid),
    CONSTRAINT fk8b0ibukfbcwc2hvigsjiqrx7x FOREIGN KEY (parent_group_id)
        REFERENCES public.sa_group (recid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.sa_user_group
(
    groupid bigint NOT NULL,
    userid bigint NOT NULL,
    CONSTRAINT fk5touj4ims6737u3rtrhyyeeey FOREIGN KEY (userid)
        REFERENCES public.comp_employee (recid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkna74pvjne8axloo0c9w3pkksw FOREIGN KEY (groupid)
        REFERENCES public.sa_group (recid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.configuration
(
    id bigint NOT NULL,
    key character varying(255) COLLATE pg_catalog."default",
    note character varying(255) COLLATE pg_catalog."default",
    value character varying(4000) COLLATE pg_catalog."default",
    CONSTRAINT configuration_pkey PRIMARY KEY (id)
);

INSERT INTO SA_GROUP (RECID, NAME, GRUOP_TYPE, ISDEFAULT, STATUSID) VALUES ('1', 'Company', '1', '1', '1');

INSERT INTO SA_GROUP (RECID, NAME, PARENT_GROUP_ID, GRUOP_TYPE, ISDEFAULT, STATUSID) VALUES ('2', 'Organization', '1', '2', '1', '1');

INSERT INTO SA_GROUP (RECID, NAME, GRUOP_TYPE, STATUSID ,ISDEFAULT,PARENT_GROUP_ID , is_have_admin_prev) VALUES ('3', 'Admin Group', '3','1' ,'1' ,'2' ,'1');

INSERT INTO SA_GROUP (RECID, NAME, GRUOP_TYPE, STATUSID ,ISDEFAULT,PARENT_GROUP_ID , is_have_admin_prev) VALUES ('4', 'Ldap users', '3', '1','0' , '2' ,'0');






    INSERT INTO comp_employee (
        recid,
        contract_typeid,
        email,
        hourcost,
        mobile_phone,
        name,
        first_name,
        last_name,
        password,
        prefered_language,
        statusid,
        user_name,
        workingdays,
        gender,
        location_name,
        status_name,
        corporate_id,
        deptid,
        parent_id,
        login_type,
        workinghours,
        startworkinghour
    ) VALUES (
        '1',
        '1',
        'yghandor@ntgclarity.com',
        '100',
        '01012135040',
        'Admin Admin',
        'Admin',
        'Admin',
        '   ',
        'Eng',
        '1',
        'admin',
        '1,2,3,4,5',
        'male',
        'Egypt',
        'active',
        '0',
        '0',
        '0',
        '0',
        '9',
        '02:03:04'
    );
    
     

INSERT INTO SA_USER_GROUP (GROUPID, USERID) VALUES ('3', '1');

-- INSERT INTO ADMIN_GROUP_PREV (GROUP_ID, ASSIGNED_GROUP_PERMISSION, AUTHORIZED_TO_CLOSETT, CLEAR_SITE_DATA, DEFAULT_GROUP_PERMISSION, EDIT_CHRONIC, GLOBAL_ALLOWED, GLOBAL_INCEDENTS, GROUP_DESCRIPTION, GROUP_NAME, GROUP_STATUS, LOGICAL_GROUP, MANAGED_SERVICE, NFM_GROUP, PERFORMANCE_DESK, REASSIGNMENT_PREVENT, ROOT_CAUSE_REQUIRED, SA_ALLOWED, SOC_TEAMS, TECH_IM, TEU_ASSIGNEE, TT_CLOSURE, VOICE_IM) VALUES ('1', 'Comm Approval', '1', '1', 'Finance', '1', '1', '1', 'Admin', 'Admin Group', 'Active', '0', '1', '0', '1', '1', '0', '1', '1', '1', '1', '0', '1');


INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (1, 'DEFAULT_LOGIN_TYPE', '2','0 database, 1 ldap, 2 smtp');

INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (2, 'LDAP_URL', 'ldap://192.168.3.95:389','Ldap url');
INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (3, 'LDAP_DOMAIN', 'ntgclarity.com','Ldap domain');
INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (4, 'LDAP_DEFAULT_GROUP', '4','Users login using ldap or mailserver will be add by defualt to this group');
INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (5, 'MAIL_HOST', 'markmail.ntgclarity.com','Host will be used to login using smtp');
INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (6, 'MAIL_PORT', '587','Port will be used in case of login using smtp');

INSERT INTO comp_employee (
        recid,
        contract_typeid,
        email,
        hourcost,
        mobile_phone,
        name,
        first_name,
        last_name,
        password,
        prefered_language,
        statusid,
        user_name,
        workingdays,
        gender,
        location_name,
        status_name,
        corporate_id,
        deptid,
        parent_id,
        login_type,
        workinghours,
        startworkinghour,
        user_type
    ) VALUES (
        '2',
        '1',
        'yghandor@ntgclarity.com',
        '100',
        '01012135040',
        'Admin Admin',
        'Admin',
        'Admin',
        '   ',
        'Eng',
        '1',
        'engine',
        '1,2,3,4,5',
        'male',
        'Egypt',
        'active',
        '0',
        '0',
        '0',
        '0',
        '9',
        '02:03:04',
        '1'
    );

INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (7, 'PASS_ENC_METHOD', 'Blowfish','Encryption Method');
INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (8, 'PASS_ENC_KEY', 'NTG1026_E','Encryption Key');

update comp_employee set password = '$2a$10$kOHRqDgOkkHq5/7zk15W7.pExOvYdmHXSYMqxZ2WtJD28d4Efl8ku' where password = '   ';

INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (9, 'MAX_FAILED_LOGIN', '3','Max User Failed Login Attempts');
INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (10, 'MAX_TEMPORARY_LOCKS', '3','Max User Account Locks');

INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (11, 'LOCKING_TIME_IN_MINUTES', '15','Account Locking Time in Minutes');

UPDATE comp_employee  SET User_name = substring(User_name ,1, position('@' IN User_name)-1)
where  User_Name like '%@%';

alter table configuration alter column value type varchar(4000) using value::varchar(4000);
INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (12, 'PASSWORD_REGEX', '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&])(?=.{8,})','Password Regex');
INSERT INTO CONFIGURATION (ID, KEY, VALUE,NOTE) VALUES (13, 'PASSWORD_REGEX_HINTS_MESSAGE', 'Password Must Be At Least 8 Characters and Can be Up-to 40 Characters
Password Must Contain at Least 1 Number
Password Must Contain at Least 1 Special Character
Password Must Contain at Least 1 Upper-Case Letter
Password Must Contain at Least 1 Lower-Case Letter','Password Regex Hints Message');

INSERT INTO configuration(
	id, key, note, value)
	VALUES (14, 'MAIL_PORT_SSL', 'Enable SSL for login using smtp', 'false');
	
INSERT INTO configuration(
	id, key, note, value)
	VALUES (15, 'MAIL_DOMAIN', 'User domain for login using smtp', null);
	