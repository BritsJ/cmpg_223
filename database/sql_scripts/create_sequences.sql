-- Ensure you're using the correct database
USE Test;

---------------------------------------------------- 
--Create Sequences
--Creates all needed sequences for ID incrementation 
----------------------------------------------------
CREATE SEQUENCE Category_Id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NO CACHE
    NO CYCLE;

CREATE SEQUENCE Subcategory_Id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NO CACHE
    NO CYCLE;

CREATE SEQUENCE Stock_Id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NO CACHE
    NO CYCLE;

CREATE SEQUENCE Employee_Number_seq
    START WITH 1000
    INCREMENT BY 1
    MAXVALUE 9999
    NO CACHE
    NO CYCLE;

CREATE SEQUENCE Sale_Id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NO CACHE
    NO CYCLE;

CREATE SEQUENCE Sale_Item_Id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NO CACHE
    NO CYCLE;

CREATE SEQUENCE Client_Id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NO CACHE
    NO CYCLE;

CREATE SEQUENCE Equipment_Id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NO CACHE
    NO CYCLE;

CREATE SEQUENCE Job_Id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NO CACHE
    NO CYCLE;

CREATE SEQUENCE Job_Equipment_Id_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NO CACHE
    NO CYCLE;