-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public."FactSales"
(
    rowid integer NOT NULL,
    date_id integer NOT NULL,
    store_id integer NOT NULL,
    total_sales integer NOT NULL,
    PRIMARY KEY (rowid)
);

CREATE TABLE public."DimMonth"
(
    date_id integer NOT NULL,
    day_of_week integer NOT NULL,
    weekday_name "char" NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    month_name "char" NOT NULL,
    quarter integer NOT NULL,
    quarter_name "char" NOT NULL,
    PRIMARY KEY (date_id)
);

CREATE TABLE public."DimStore"
(
    store_id integer NOT NULL,
    country "char" NOT NULL,
    city "char" NOT NULL,
    PRIMARY KEY (store_id)
);

ALTER TABLE public."FactSales"
    ADD FOREIGN KEY (store_id)
    REFERENCES public."DimStore" (store_id)
    NOT VALID;


ALTER TABLE public."FactSales"
    ADD FOREIGN KEY (date_id)
    REFERENCES public."DimMonth" (date_id)
    NOT VALID;

END;
