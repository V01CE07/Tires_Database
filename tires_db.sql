--
-- PostgreSQL database dump
--

-- Dumped from database version 11.17 (Debian 11.17-astra.se1)
-- Dumped by pg_dump version 14.5

-- Started on 2022-11-10 22:48:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 200 (class 1259 OID 31495)
-- Name: Agent; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Agent" (
    "ID" integer NOT NULL,
    "Title" character varying,
    "AgentTypeID" integer,
    "Address" character varying NOT NULL,
    "INN" character varying,
    "KPP" character varying NOT NULL,
    "DirectorName" character varying NOT NULL,
    "Phone" character varying,
    "Email" character varying NOT NULL,
    "Logo" character varying NOT NULL,
    "Priority" integer
);


--
-- TOC entry 201 (class 1259 OID 31508)
-- Name: AgentPriorityHistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AgentPriorityHistory" (
    "ID" integer NOT NULL,
    "AgentID" integer,
    "ChangeDate" date,
    "PriorityValue" integer
);


--
-- TOC entry 196 (class 1259 OID 31472)
-- Name: AgentType; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."AgentType" (
    "ID" integer NOT NULL,
    "Title" character varying,
    "Image" character varying NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 31518)
-- Name: Material; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Material" (
    "ID" integer NOT NULL,
    "Title" character varying(100) NOT NULL,
    "CountinPack" integer NOT NULL,
    "Unit" character varying(10) NOT NULL,
    "CountinStock" real,
    "MinCount" real NOT NULL,
    "Description" character varying,
    "Cost" numeric(10,2) NOT NULL,
    "Image" character varying(100),
    "MaterialTypeID" integer NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 31531)
-- Name: MaterialCountHistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."MaterialCountHistory" (
    "ID" integer NOT NULL,
    "MaterialID" integer,
    "ChangeDate" date,
    "CountValue" real
);


--
-- TOC entry 204 (class 1259 OID 31541)
-- Name: MaterialSupplier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."MaterialSupplier" (
    "MaterialID" integer NOT NULL,
    "SupplierID" integer NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 31480)
-- Name: MaterialType; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."MaterialType" (
    "ID" integer NOT NULL,
    "Title" character varying(50) NOT NULL,
    "DefectedPercent" real NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 31558)
-- Name: Product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Product" (
    "ID" integer NOT NULL,
    "Title" character varying(100) NOT NULL,
    "ProductTypeID" integer,
    "ArticleNumber" character varying(10) NOT NULL,
    "Description" character varying,
    "Image" character varying(100),
    "ProductionPersonCount" integer,
    "ProductionWorkshopNumber" integer,
    "MinCostForAgent" numeric(10,2) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 31571)
-- Name: ProductCostHistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductCostHistory" (
    "ID" integer NOT NULL,
    "ProductID" integer,
    "ChangeDate" date,
    "CostValue" real
);


--
-- TOC entry 207 (class 1259 OID 31581)
-- Name: ProductMaterial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductMaterial" (
    "ProductID" integer NOT NULL,
    "MaterialID" integer NOT NULL,
    "Count" real
);


--
-- TOC entry 208 (class 1259 OID 31598)
-- Name: ProductSale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductSale" (
    "ID" integer NOT NULL,
    "AgentID" integer,
    "ProductID" integer,
    "SaleDate" date,
    "ProductCount" integer
);


--
-- TOC entry 198 (class 1259 OID 31485)
-- Name: ProductType; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ProductType" (
    "ID" integer NOT NULL,
    "Title" character varying(50) NOT NULL,
    "DefectedPercent" real NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 31613)
-- Name: Shop; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Shop" (
    "ID" integer NOT NULL,
    "Title" character varying,
    "Address" character varying NOT NULL,
    "AgentID" integer
);


--
-- TOC entry 199 (class 1259 OID 31490)
-- Name: Supplier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Supplier" (
    "ID" integer NOT NULL,
    "Title" character varying(150),
    "INN" character varying(12),
    "StartDate" date,
    "QualityRating" integer NOT NULL,
    "SupplierType" character varying(20) NOT NULL
);


--
-- TOC entry 3028 (class 0 OID 31495)
-- Dependencies: 200
-- Data for Name: Agent; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3029 (class 0 OID 31508)
-- Dependencies: 201
-- Data for Name: AgentPriorityHistory; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3024 (class 0 OID 31472)
-- Dependencies: 196
-- Data for Name: AgentType; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3030 (class 0 OID 31518)
-- Dependencies: 202
-- Data for Name: Material; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Material" VALUES (1, 'резина для зимы 0x3', 4, ' м', 726, 46, NULL, 37293.00, NULL, 1);
INSERT INTO public."Material" VALUES (2, 'резина для зимы 1x0', 5, ' кг', 929, 48, NULL, 43046.00, NULL, 1);
INSERT INTO public."Material" VALUES (3, 'резина для зимы 1x3', 9, ' м', 84, 50, NULL, 27823.00, NULL, 1);
INSERT INTO public."Material" VALUES (4, 'резина для зимы 2x3', 3, ' м', 344, 12, NULL, 53323.00, NULL, 1);
INSERT INTO public."Material" VALUES (5, 'резина для зимы 3x1', 9, ' кг', 690, 24, NULL, 25844.00, NULL, 1);
INSERT INTO public."Material" VALUES (6, 'резина для зимы 3x3', 2, ' кг', 275, 28, NULL, 31356.00, NULL, 1);
INSERT INTO public."Material" VALUES (7, 'резина для лета 0x1', 9, ' кг', 127, 17, NULL, 23936.00, NULL, 1);
INSERT INTO public."Material" VALUES (8, 'резина для лета 0x2', 4, ' кг', 753, 33, NULL, 9069.00, NULL, 1);
INSERT INTO public."Material" VALUES (9, 'резина для лета 1x0', 5, ' м', 234, 32, NULL, 25499.00, NULL, 1);
INSERT INTO public."Material" VALUES (10, 'резина для лета 2x1', 2, ' м', 561, 39, NULL, 47610.00, NULL, 1);
INSERT INTO public."Material" VALUES (11, 'резина для лета 2x2', 2, ' м', 542, 20, NULL, 54298.00, NULL, 1);
INSERT INTO public."Material" VALUES (12, 'резина для лета 3x3', 6, ' м', 652, 28, NULL, 6764.00, NULL, 1);
INSERT INTO public."Material" VALUES (13, 'резина для льда 0x1', 5, ' м', 964, 34, NULL, 53394.00, NULL, 1);
INSERT INTO public."Material" VALUES (14, 'резина для льда 0x2', 2, ' кг', 816, 21, NULL, 48785.00, NULL, 1);
INSERT INTO public."Material" VALUES (15, 'резина для льда 1x3', 2, ' кг', 286, 39, NULL, 23551.00, NULL, 1);
INSERT INTO public."Material" VALUES (16, 'резина для льда 2x0', 6, ' м', 86, 8, NULL, 24767.00, NULL, 1);
INSERT INTO public."Material" VALUES (17, 'резина для льда 3x3', 7, ' кг', 909, 35, NULL, 23174.00, NULL, 1);
INSERT INTO public."Material" VALUES (18, 'резина для пустыни 0x3', 8, ' м', 761, 7, NULL, 8094.00, NULL, 1);
INSERT INTO public."Material" VALUES (19, 'резина для пустыни 1x1', 6, ' кг', 120, 21, NULL, 11642.00, NULL, 1);
INSERT INTO public."Material" VALUES (20, 'резина для пустыни 1x2', 9, ' кг', 496, 36, NULL, 24876.00, NULL, 1);
INSERT INTO public."Material" VALUES (21, 'резина для пустыни 1x3', 5, ' кг', 222, 9, NULL, 21546.00, NULL, 1);
INSERT INTO public."Material" VALUES (22, 'резина для пустыни 2x0', 5, ' кг', 769, 14, NULL, 17425.00, NULL, 1);
INSERT INTO public."Material" VALUES (23, 'резина для пустыни 2x1', 10, ' кг', 918, 12, NULL, 34518.00, NULL, 1);
INSERT INTO public."Material" VALUES (24, 'резина для пустыни 2x3', 5, ' м', 103, 38, NULL, 55679.00, NULL, 1);
INSERT INTO public."Material" VALUES (25, 'резина для пустыни 3x2', 1, ' м', 931, 43, NULL, 5854.00, NULL, 1);
INSERT INTO public."Material" VALUES (26, 'резина для пустыни 3x3', 9, ' м', 840, 11, NULL, 5144.00, NULL, 1);
INSERT INTO public."Material" VALUES (27, 'Шипы для зимы 0x1', 3, ' г', 255, 25, NULL, 6484.00, NULL, 2);
INSERT INTO public."Material" VALUES (28, 'Шипы для зимы 2x0', 3, ' шт', 466, 8, NULL, 34841.00, NULL, 2);
INSERT INTO public."Material" VALUES (29, 'Шипы для зимы 3x0', 6, ' г', 192, 48, NULL, 9260.00, NULL, 2);
INSERT INTO public."Material" VALUES (30, 'Шипы для зимы 3x3', 4, ' г', 652, 33, NULL, 15159.00, NULL, 2);
INSERT INTO public."Material" VALUES (31, 'Шипы для лета 0x1', 2, ' кг', 974, 35, NULL, 28825.00, NULL, 2);
INSERT INTO public."Material" VALUES (32, 'Шипы для лета 2x0', 1, ' г', 68, 43, NULL, 8206.00, NULL, 2);
INSERT INTO public."Material" VALUES (33, 'Шипы для лета 2x2', 4, ' г', 15, 10, NULL, 44506.00, NULL, 2);
INSERT INTO public."Material" VALUES (34, 'Шипы для лета 3x1', 6, ' кг', 184, 40, NULL, 51974.00, NULL, 2);
INSERT INTO public."Material" VALUES (35, 'Шипы для лета 3x2', 1, ' г', 547, 11, NULL, 43288.00, NULL, 2);
INSERT INTO public."Material" VALUES (36, 'Шипы для льда 0x0', 2, ' кг', 585, 37, NULL, 21188.00, NULL, 2);
INSERT INTO public."Material" VALUES (37, 'Шипы для льда 0x1', 2, ' шт', 147, 8, NULL, 49557.00, NULL, 2);
INSERT INTO public."Material" VALUES (38, 'Шипы для льда 1x0', 10, ' г', 914, 22, NULL, 25538.00, NULL, 2);
INSERT INTO public."Material" VALUES (39, 'Шипы для льда 1x1', 7, ' г', 335, 33, NULL, 48279.00, NULL, 2);
INSERT INTO public."Material" VALUES (40, 'Шипы для льда 2x0', 4, ' шт', 214, 15, NULL, 17996.00, NULL, 2);
INSERT INTO public."Material" VALUES (41, 'Шипы для льда 2x1', 10, ' шт', 634, 25, NULL, 23287.00, NULL, 2);
INSERT INTO public."Material" VALUES (42, 'Шипы для льда 2x2', 1, ' г', 479, 22, NULL, 13077.00, NULL, 2);
INSERT INTO public."Material" VALUES (43, 'Шипы для льда 2x3', 10, ' шт', 237, 7, NULL, 27105.00, NULL, 2);
INSERT INTO public."Material" VALUES (44, 'Шипы для льда 3x0', 9, ' г', 885, 5, NULL, 52272.00, NULL, 2);
INSERT INTO public."Material" VALUES (45, 'Шипы для льда 3x1', 8, ' г', 123, 43, NULL, 42668.00, NULL, 2);
INSERT INTO public."Material" VALUES (46, 'Шипы для льда 3x2', 3, ' г', 470, 26, NULL, 6511.00, NULL, 2);
INSERT INTO public."Material" VALUES (47, 'Шипы для пустыни 0x1', 4, ' шт', 612, 24, NULL, 55689.00, NULL, 2);
INSERT INTO public."Material" VALUES (48, 'Шипы для пустыни 0x2', 4, ' г', 792, 46, NULL, 8571.00, NULL, 2);
INSERT INTO public."Material" VALUES (49, 'Шипы для пустыни 3x1', 4, ' г', 37, 43, NULL, 27104.00, NULL, 2);
INSERT INTO public."Material" VALUES (50, 'Шипы для пустыни 3x2', 2, ' г', 923, 19, NULL, 28748.00, NULL, 2);


--
-- TOC entry 3031 (class 0 OID 31531)
-- Dependencies: 203
-- Data for Name: MaterialCountHistory; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3032 (class 0 OID 31541)
-- Dependencies: 204
-- Data for Name: MaterialSupplier; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3025 (class 0 OID 31480)
-- Dependencies: 197
-- Data for Name: MaterialType; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."MaterialType" VALUES (1, 'Резина', 0);
INSERT INTO public."MaterialType" VALUES (2, 'Шипы', 0);


--
-- TOC entry 3033 (class 0 OID 31558)
-- Dependencies: 205
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Product" VALUES (1, 'Диск R15 Лето', 1, '347427', NULL, NULL, 1, 1, 5071.00);
INSERT INTO public."Product" VALUES (2, 'Диск R16 Кованый', 1, '440075', NULL, 'productstire_25.jpg', 3, 9, 9068.00);
INSERT INTO public."Product" VALUES (3, 'Диск R16 Лето', 1, '251201', NULL, NULL, 3, 10, 8149.00);
INSERT INTO public."Product" VALUES (4, 'Диск R16 Липучка', 1, '435703', NULL, NULL, 5, 2, 9934.00);
INSERT INTO public."Product" VALUES (5, 'Диск R17 Зима', 1, '343841', NULL, NULL, 3, 9, 12768.00);
INSERT INTO public."Product" VALUES (6, 'Диск R17 Лето', 1, '400508', NULL, 'productstire_24.jpg', 1, 4, 12941.00);
INSERT INTO public."Product" VALUES (7, 'Диск R17 Липучка', 1, '282569', NULL, 'productstire_42.jpg', 5, 5, 12356.00);
INSERT INTO public."Product" VALUES (8, 'Диск R18 Зима', 1, '255211', NULL, 'productstire_21.jpg', 1, 6, 13239.00);
INSERT INTO public."Product" VALUES (9, 'Диск R18 Лето', 1, '317858', NULL, 'productstire_52.jpg', 5, 3, 8435.00);
INSERT INTO public."Product" VALUES (10, 'Диск R19 Зима', 1, '358851', NULL, 'productstire_16.jpg', 5, 6, 5695.00);
INSERT INTO public."Product" VALUES (11, 'Диск R19 Лето', 1, '243152', NULL, 'productstire_0.jpg', 1, 9, 6264.00);
INSERT INTO public."Product" VALUES (12, 'Диск R19 Липучка', 1, '318661', NULL, NULL, 1, 6, 5544.00);
INSERT INTO public."Product" VALUES (13, 'Диск R20 Зима', 1, '252453', NULL, NULL, 4, 9, 14526.00);
INSERT INTO public."Product" VALUES (14, 'Диск R20 Лето', 1, '300047', NULL, 'productstire_56.jpg', 3, 10, 10323.00);
INSERT INTO public."Product" VALUES (15, 'Диск R20 Липучка', 1, '447543', NULL, 'productstire_3.jpg', 4, 8, 11661.00);
INSERT INTO public."Product" VALUES (16, 'Диск R21 Зима', 1, '250714', NULL, 'productstire_11.jpg', 5, 5, 8762.00);
INSERT INTO public."Product" VALUES (17, 'Диск R21 Кованый', 1, '299085', NULL, 'productstire_61.jpg', 3, 3, 4757.00);
INSERT INTO public."Product" VALUES (18, 'Диск R21 Лето', 1, '449834', NULL, 'productstire_35.jpg', 4, 8, 2698.00);
INSERT INTO public."Product" VALUES (19, 'Диск R22 Зима', 1, '453650', NULL, 'productstire_22.jpg', 5, 3, 11459.00);
INSERT INTO public."Product" VALUES (20, 'Диск R22 Кованый', 1, '388520', NULL, 'productstire_19.jpg', 3, 2, 7498.00);
INSERT INTO public."Product" VALUES (21, 'Диск R22 Лето', 1, '406411', NULL, 'productstire_23.jpg', 2, 4, 2904.00);
INSERT INTO public."Product" VALUES (22, 'Диск R22 Липучка', 1, '418286', NULL, 'productstire_4.jpg', 4, 2, 10670.00);
INSERT INTO public."Product" VALUES (23, 'Запаска R14 Зима', 2, '440993', NULL, NULL, 5, 2, 6020.00);
INSERT INTO public."Product" VALUES (24, 'Запаска R14 Кованый', 2, '412235', NULL, 'productstire_47.jpg', 4, 6, 12891.00);
INSERT INTO public."Product" VALUES (25, 'Запаска R14 Лето', 2, '448396', NULL, 'productstire_32.jpg', 1, 5, 12878.00);
INSERT INTO public."Product" VALUES (26, 'Запаска R15 Зима', 2, '251241', NULL, NULL, 3, 10, 3874.00);
INSERT INTO public."Product" VALUES (27, 'Запаска R15 Кованый', 2, '327657', NULL, 'productstire_64.jpg', 2, 8, 8667.00);
INSERT INTO public."Product" VALUES (28, 'Запаска R15 Лето', 2, '348910', NULL, 'productstire_50.jpg', 1, 9, 4969.00);
INSERT INTO public."Product" VALUES (29, 'Запаска R15 Липучка', 2, '237228', NULL, 'productstire_18.jpg', 3, 8, 5510.00);
INSERT INTO public."Product" VALUES (30, 'Запаска R16 Зима', 2, '394413', NULL, 'productstire_49.jpg', 3, 10, 12679.00);
INSERT INTO public."Product" VALUES (31, 'Запаска R16 Кованый', 2, '432234', NULL, NULL, 3, 7, 13556.00);
INSERT INTO public."Product" VALUES (32, 'Запаска R17 Кованый', 2, '372287', NULL, 'productstire_57.jpg', 5, 3, 5808.00);
INSERT INTO public."Product" VALUES (33, 'Запаска R17 Лето', 2, '331576', NULL, 'productstire_39.jpg', 3, 8, 4803.00);
INSERT INTO public."Product" VALUES (34, 'Запаска R17 Липучка', 2, '327883', NULL, 'productstire_10.jpg', 2, 2, 12332.00);
INSERT INTO public."Product" VALUES (35, 'Запаска R18 Лето', 2, '305509', NULL, 'productstire_41.jpg', 1, 3, 5192.00);
INSERT INTO public."Product" VALUES (36, 'Запаска R18 Липучка', 2, '279256', NULL, 'productstire_53.jpg', 4, 5, 9759.00);
INSERT INTO public."Product" VALUES (37, 'Запаска R19 Зима', 2, '254860', NULL, NULL, 2, 5, 5568.00);
INSERT INTO public."Product" VALUES (38, 'Запаска R19 Кованый', 2, '390434', NULL, 'productstire_46.jpg', 5, 8, 14258.00);
INSERT INTO public."Product" VALUES (39, 'Запаска R19 Лето', 2, '283112', NULL, 'productstire_33.jpg', 3, 4, 3362.00);
INSERT INTO public."Product" VALUES (40, 'Запаска R19 Липучка', 2, '438383', NULL, NULL, 3, 1, 12000.00);
INSERT INTO public."Product" VALUES (41, 'Запаска R20 Зима', 2, '241577', NULL, 'productstire_51.jpg', 2, 6, 9125.00);
INSERT INTO public."Product" VALUES (42, 'Запаска R20 Кованый', 2, '249737', NULL, NULL, 5, 5, 7509.00);
INSERT INTO public."Product" VALUES (43, 'Запаска R20 Липучка', 2, '335226', NULL, NULL, 1, 2, 9988.00);
INSERT INTO public."Product" VALUES (44, 'Запаска R21 Зима', 2, '365509', NULL, NULL, 5, 6, 14556.00);
INSERT INTO public."Product" VALUES (45, 'Запаска R21 Лето', 2, '299112', NULL, 'productstire_43.jpg', 2, 8, 3694.00);
INSERT INTO public."Product" VALUES (46, 'Запаска R21 Липучка', 2, '247470', NULL, 'productstire_62.jpg', 1, 2, 10139.00);
INSERT INTO public."Product" VALUES (47, 'Запаска R22 Зима', 2, '268886', NULL, NULL, 3, 2, 13471.00);
INSERT INTO public."Product" VALUES (48, 'Запаска R22 Кованый', 2, '341800', NULL, NULL, 2, 4, 5447.00);
INSERT INTO public."Product" VALUES (49, 'Запаска R22 Липучка', 2, '328305', NULL, 'productstire_13.jpg', 2, 1, 10116.00);
INSERT INTO public."Product" VALUES (50, 'Запаска R23 Зима', 2, '394768', NULL, 'productstire_8.jpg', 1, 9, 13019.00);
INSERT INTO public."Product" VALUES (51, 'Колесо R14 Кованый', 3, '429265', NULL, NULL, 3, 6, 11838.00);
INSERT INTO public."Product" VALUES (52, 'Колесо R15 Кованый', 3, '376388', NULL, NULL, 3, 4, 9439.00);
INSERT INTO public."Product" VALUES (53, 'Колесо R16 Лето', 3, '337577', NULL, 'productstire_2.jpg', 1, 9, 10161.00);
INSERT INTO public."Product" VALUES (54, 'Колесо R16 Липучка', 3, '263261', NULL, NULL, 4, 1, 14521.00);
INSERT INTO public."Product" VALUES (55, 'Колесо R17 Зима', 3, '381949', NULL, NULL, 4, 6, 5902.00);
INSERT INTO public."Product" VALUES (56, 'Колесо R17 Лето', 3, '332936', NULL, 'productstire_28.jpg', 2, 1, 11145.00);
INSERT INTO public."Product" VALUES (57, 'Колесо R17 Липучка', 3, '281537', NULL, NULL, 1, 2, 4365.00);
INSERT INTO public."Product" VALUES (58, 'Колесо R18 Зима', 3, '387609', NULL, 'productstire_9.jpg', 1, 4, 3445.00);
INSERT INTO public."Product" VALUES (59, 'Колесо R18 Кованый', 3, '241659', NULL, 'productstire_15.jpg', 4, 10, 11509.00);
INSERT INTO public."Product" VALUES (60, 'Колесо R18 Лето', 3, '412238', NULL, 'productstire_14.jpg', 2, 7, 13892.00);
INSERT INTO public."Product" VALUES (61, 'Колесо R18 Липучка', 3, '332858', NULL, 'productstire_12.jpg', 3, 7, 14804.00);
INSERT INTO public."Product" VALUES (62, 'Колесо R19 Лето', 3, '298778', NULL, 'productstire_38.jpg', 1, 10, 7493.00);
INSERT INTO public."Product" VALUES (63, 'Колесо R19 Липучка', 3, '440973', NULL, 'productstire_5.jpg', 4, 4, 8439.00);
INSERT INTO public."Product" VALUES (64, 'Колесо R20 Зима', 3, '427198', NULL, NULL, 4, 10, 2397.00);
INSERT INTO public."Product" VALUES (65, 'Колесо R20 Кованый', 3, '445217', NULL, 'productstire_1.jpg', 3, 10, 9569.00);
INSERT INTO public."Product" VALUES (66, 'Колесо R20 Лето', 3, '434626', NULL, 'productstire_31.jpg', 5, 8, 11959.00);
INSERT INTO public."Product" VALUES (67, 'Колесо R20 Липучка', 3, '363664', NULL, NULL, 1, 8, 12681.00);
INSERT INTO public."Product" VALUES (68, 'Колесо R21 Лето', 3, '276905', NULL, NULL, 1, 2, 10343.00);
INSERT INTO public."Product" VALUES (69, 'Колесо R21 Липучка', 3, '403378', NULL, 'productstire_55.jpg', 3, 10, 3626.00);
INSERT INTO public."Product" VALUES (70, 'Шина R14 Кованый', 4, '274477', NULL, 'productstire_34.jpg', 5, 5, 9527.00);
INSERT INTO public."Product" VALUES (71, 'Шина R14 Лето', 4, '330951', NULL, 'productstire_29.jpg', 4, 7, 6786.00);
INSERT INTO public."Product" VALUES (72, 'Шина R14 Липучка', 4, '331598', NULL, 'productstire_17.jpg', 4, 1, 13879.00);
INSERT INTO public."Product" VALUES (73, 'Шина R15 Зима', 4, '312952', NULL, NULL, 2, 5, 4039.00);
INSERT INTO public."Product" VALUES (74, 'Шина R15 Кованый', 4, '274665', NULL, 'productstire_63.jpg', 2, 10, 13101.00);
INSERT INTO public."Product" VALUES (75, 'Шина R15 Липучка', 4, '349418', NULL, 'productstire_48.jpg', 1, 4, 6393.00);
INSERT INTO public."Product" VALUES (76, 'Шина R16 Зима', 4, '300433', NULL, NULL, 4, 2, 2570.00);
INSERT INTO public."Product" VALUES (77, 'Шина R16 Кованый', 4, '421321', NULL, NULL, 1, 2, 14691.00);
INSERT INTO public."Product" VALUES (78, 'Шина R16 Лето', 4, '437927', NULL, NULL, 3, 6, 7181.00);
INSERT INTO public."Product" VALUES (79, 'Шина R16 Липучка', 4, '320970', NULL, 'productstire_60.jpg', 1, 2, 2264.00);
INSERT INTO public."Product" VALUES (80, 'Шина R17 Зима', 4, '291319', NULL, 'productstire_54.jpg', 2, 4, 6426.00);
INSERT INTO public."Product" VALUES (81, 'Шина R17 Кованый', 4, '299692', NULL, 'productstire_58.jpg', 3, 10, 11463.00);
INSERT INTO public."Product" VALUES (82, 'Шина R17 Лето', 4, '354738', NULL, 'productstire_20.jpg', 2, 10, 11329.00);
INSERT INTO public."Product" VALUES (83, 'Шина R17 Липучка', 4, '280863', NULL, NULL, 4, 8, 11695.00);
INSERT INTO public."Product" VALUES (84, 'Шина R18 Зима', 4, '444280', NULL, 'productstire_44.jpg', 4, 6, 13168.00);
INSERT INTO public."Product" VALUES (85, 'Шина R18 Кованый', 4, '275809', NULL, 'productstire_40.jpg', 4, 10, 3258.00);
INSERT INTO public."Product" VALUES (86, 'Шина R18 Лето', 4, '425463', NULL, NULL, 4, 10, 11625.00);
INSERT INTO public."Product" VALUES (87, 'Шина R18 Липучка', 4, '319450', NULL, NULL, 3, 6, 4951.00);
INSERT INTO public."Product" VALUES (88, 'Шина R19 Зима', 4, '444141', NULL, NULL, 2, 8, 2741.00);
INSERT INTO public."Product" VALUES (89, 'Шина R19 Кованый', 4, '291359', NULL, 'productstire_27.jpg', 5, 10, 14682.00);
INSERT INTO public."Product" VALUES (90, 'Шина R19 Лето', 4, '335030', NULL, NULL, 4, 10, 4870.00);
INSERT INTO public."Product" VALUES (91, 'Шина R19 Липучка', 4, '341034', NULL, 'productstire_36.jpg', 1, 5, 13063.00);
INSERT INTO public."Product" VALUES (92, 'Шина R20 Кованый', 4, '330937', NULL, 'productstire_45.jpg', 3, 1, 10928.00);
INSERT INTO public."Product" VALUES (93, 'Шина R20 Липучка', 4, '348553', NULL, NULL, 2, 2, 3508.00);
INSERT INTO public."Product" VALUES (94, 'Шина R21 Зима', 4, '398710', NULL, 'productstire_7.jpg', 2, 2, 9378.00);
INSERT INTO public."Product" VALUES (95, 'Шина R21 Кованый', 4, '329576', NULL, 'productstire_59.jpg', 2, 2, 7989.00);
INSERT INTO public."Product" VALUES (96, 'Шина R21 Лето', 4, '266521', NULL, 'productstire_6.jpg', 4, 1, 10561.00);
INSERT INTO public."Product" VALUES (97, 'Шина R21 Липучка', 4, '308647', NULL, 'productstire_26.jpg', 4, 6, 12830.00);
INSERT INTO public."Product" VALUES (98, 'Шина R22 Зима', 4, '382661', NULL, NULL, 1, 2, 10373.00);
INSERT INTO public."Product" VALUES (99, 'Шина R22 Кованый', 4, '416324', NULL, 'productstire_30.jpg', 2, 8, 13841.00);
INSERT INTO public."Product" VALUES (100, 'Шина R22 Лето', 4, '406784', NULL, 'productstire_37.jpg', 3, 5, 14692.00);


--
-- TOC entry 3034 (class 0 OID 31571)
-- Dependencies: 206
-- Data for Name: ProductCostHistory; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3035 (class 0 OID 31581)
-- Dependencies: 207
-- Data for Name: ProductMaterial; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."ProductMaterial" VALUES (2, 33, 18);
INSERT INTO public."ProductMaterial" VALUES (2, 34, 13);
INSERT INTO public."ProductMaterial" VALUES (2, 50, 16);
INSERT INTO public."ProductMaterial" VALUES (6, 45, 15);
INSERT INTO public."ProductMaterial" VALUES (7, 20, 5);
INSERT INTO public."ProductMaterial" VALUES (7, 21, 11);
INSERT INTO public."ProductMaterial" VALUES (7, 39, 8);
INSERT INTO public."ProductMaterial" VALUES (7, 45, 4);
INSERT INTO public."ProductMaterial" VALUES (8, 34, 19);
INSERT INTO public."ProductMaterial" VALUES (10, 9, 9);
INSERT INTO public."ProductMaterial" VALUES (10, 40, 2);
INSERT INTO public."ProductMaterial" VALUES (10, 41, 8);
INSERT INTO public."ProductMaterial" VALUES (11, 17, 8);
INSERT INTO public."ProductMaterial" VALUES (11, 40, 5);
INSERT INTO public."ProductMaterial" VALUES (15, 46, 14);
INSERT INTO public."ProductMaterial" VALUES (19, 1, 8);
INSERT INTO public."ProductMaterial" VALUES (19, 9, 8);
INSERT INTO public."ProductMaterial" VALUES (19, 17, 11);
INSERT INTO public."ProductMaterial" VALUES (20, 17, 1);
INSERT INTO public."ProductMaterial" VALUES (21, 5, 3);
INSERT INTO public."ProductMaterial" VALUES (22, 5, 10);
INSERT INTO public."ProductMaterial" VALUES (22, 14, 14);
INSERT INTO public."ProductMaterial" VALUES (22, 38, 4);
INSERT INTO public."ProductMaterial" VALUES (24, 1, 11);
INSERT INTO public."ProductMaterial" VALUES (24, 4, 18);
INSERT INTO public."ProductMaterial" VALUES (24, 5, 16);
INSERT INTO public."ProductMaterial" VALUES (24, 17, 6);
INSERT INTO public."ProductMaterial" VALUES (24, 33, 15);
INSERT INTO public."ProductMaterial" VALUES (24, 36, 1);
INSERT INTO public."ProductMaterial" VALUES (24, 46, 9);
INSERT INTO public."ProductMaterial" VALUES (25, 25, 7);
INSERT INTO public."ProductMaterial" VALUES (29, 34, 10);
INSERT INTO public."ProductMaterial" VALUES (29, 46, 19);
INSERT INTO public."ProductMaterial" VALUES (30, 10, 4);
INSERT INTO public."ProductMaterial" VALUES (30, 18, 3);
INSERT INTO public."ProductMaterial" VALUES (33, 30, 5);
INSERT INTO public."ProductMaterial" VALUES (34, 9, 14);
INSERT INTO public."ProductMaterial" VALUES (34, 32, 9);
INSERT INTO public."ProductMaterial" VALUES (35, 27, 13);
INSERT INTO public."ProductMaterial" VALUES (35, 33, 8);
INSERT INTO public."ProductMaterial" VALUES (35, 35, 13);
INSERT INTO public."ProductMaterial" VALUES (38, 5, 6);
INSERT INTO public."ProductMaterial" VALUES (39, 8, 8);
INSERT INTO public."ProductMaterial" VALUES (39, 18, 13);
INSERT INTO public."ProductMaterial" VALUES (39, 42, 11);
INSERT INTO public."ProductMaterial" VALUES (45, 1, 4);
INSERT INTO public."ProductMaterial" VALUES (45, 20, 19);
INSERT INTO public."ProductMaterial" VALUES (49, 32, 8);
INSERT INTO public."ProductMaterial" VALUES (53, 1, 14);
INSERT INTO public."ProductMaterial" VALUES (53, 2, 2);
INSERT INTO public."ProductMaterial" VALUES (53, 49, 11);
INSERT INTO public."ProductMaterial" VALUES (56, 3, 20);
INSERT INTO public."ProductMaterial" VALUES (56, 11, 3);
INSERT INTO public."ProductMaterial" VALUES (56, 14, 5);
INSERT INTO public."ProductMaterial" VALUES (56, 36, 4);
INSERT INTO public."ProductMaterial" VALUES (58, 1, 10);
INSERT INTO public."ProductMaterial" VALUES (58, 40, 5);
INSERT INTO public."ProductMaterial" VALUES (58, 48, 14);
INSERT INTO public."ProductMaterial" VALUES (59, 11, 8);
INSERT INTO public."ProductMaterial" VALUES (59, 35, 16);
INSERT INTO public."ProductMaterial" VALUES (59, 47, 20);
INSERT INTO public."ProductMaterial" VALUES (60, 10, 10);
INSERT INTO public."ProductMaterial" VALUES (60, 11, 4);
INSERT INTO public."ProductMaterial" VALUES (60, 38, 9);
INSERT INTO public."ProductMaterial" VALUES (61, 6, 5);
INSERT INTO public."ProductMaterial" VALUES (61, 20, 6);
INSERT INTO public."ProductMaterial" VALUES (61, 30, 12);
INSERT INTO public."ProductMaterial" VALUES (61, 34, 14);
INSERT INTO public."ProductMaterial" VALUES (63, 8, 15);
INSERT INTO public."ProductMaterial" VALUES (63, 24, 5);
INSERT INTO public."ProductMaterial" VALUES (63, 50, 5);
INSERT INTO public."ProductMaterial" VALUES (66, 15, 14);
INSERT INTO public."ProductMaterial" VALUES (70, 4, 9);
INSERT INTO public."ProductMaterial" VALUES (70, 7, 14);
INSERT INTO public."ProductMaterial" VALUES (70, 37, 14);
INSERT INTO public."ProductMaterial" VALUES (70, 47, 10);
INSERT INTO public."ProductMaterial" VALUES (71, 48, 12);
INSERT INTO public."ProductMaterial" VALUES (72, 3, 3);
INSERT INTO public."ProductMaterial" VALUES (72, 6, 3);
INSERT INTO public."ProductMaterial" VALUES (72, 30, 10);
INSERT INTO public."ProductMaterial" VALUES (72, 32, 9);
INSERT INTO public."ProductMaterial" VALUES (75, 4, 2);
INSERT INTO public."ProductMaterial" VALUES (82, 40, 6);
INSERT INTO public."ProductMaterial" VALUES (84, 2, 14);
INSERT INTO public."ProductMaterial" VALUES (84, 23, 9);
INSERT INTO public."ProductMaterial" VALUES (91, 2, 5);
INSERT INTO public."ProductMaterial" VALUES (91, 21, 19);
INSERT INTO public."ProductMaterial" VALUES (91, 25, 13);
INSERT INTO public."ProductMaterial" VALUES (91, 34, 12);
INSERT INTO public."ProductMaterial" VALUES (92, 8, 11);
INSERT INTO public."ProductMaterial" VALUES (92, 20, 5);
INSERT INTO public."ProductMaterial" VALUES (94, 25, 3);
INSERT INTO public."ProductMaterial" VALUES (94, 37, 4);
INSERT INTO public."ProductMaterial" VALUES (96, 3, 11);
INSERT INTO public."ProductMaterial" VALUES (96, 4, 3);
INSERT INTO public."ProductMaterial" VALUES (97, 20, 18);
INSERT INTO public."ProductMaterial" VALUES (97, 22, 2);
INSERT INTO public."ProductMaterial" VALUES (97, 30, 13);
INSERT INTO public."ProductMaterial" VALUES (97, 32, 16);
INSERT INTO public."ProductMaterial" VALUES (100, 19, 14);


--
-- TOC entry 3036 (class 0 OID 31598)
-- Dependencies: 208
-- Data for Name: ProductSale; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3026 (class 0 OID 31485)
-- Dependencies: 198
-- Data for Name: ProductType; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."ProductType" VALUES (1, 'Диск', 0);
INSERT INTO public."ProductType" VALUES (2, 'Запаска', 0);
INSERT INTO public."ProductType" VALUES (3, 'Колесо', 0);
INSERT INTO public."ProductType" VALUES (4, 'Шина', 0);


--
-- TOC entry 3037 (class 0 OID 31613)
-- Dependencies: 209
-- Data for Name: Shop; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3027 (class 0 OID 31490)
-- Dependencies: 199
-- Data for Name: Supplier; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2873 (class 2606 OID 31512)
-- Name: AgentPriorityHistory AgentPriorityHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AgentPriorityHistory"
    ADD CONSTRAINT "AgentPriorityHistory_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2863 (class 2606 OID 31479)
-- Name: AgentType AgentType_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AgentType"
    ADD CONSTRAINT "AgentType_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2871 (class 2606 OID 31502)
-- Name: Agent Agent_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Agent"
    ADD CONSTRAINT "Agent_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2877 (class 2606 OID 31535)
-- Name: MaterialCountHistory MaterialCountHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MaterialCountHistory"
    ADD CONSTRAINT "MaterialCountHistory_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2879 (class 2606 OID 31547)
-- Name: MaterialSupplier MaterialSupplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MaterialSupplier"
    ADD CONSTRAINT "MaterialSupplier_pkey" PRIMARY KEY ("MaterialID", "SupplierID");


--
-- TOC entry 2865 (class 2606 OID 31484)
-- Name: MaterialType MaterialType_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MaterialType"
    ADD CONSTRAINT "MaterialType_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2875 (class 2606 OID 31525)
-- Name: Material Material_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Material"
    ADD CONSTRAINT "Material_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2883 (class 2606 OID 31575)
-- Name: ProductCostHistory ProductCostHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductCostHistory"
    ADD CONSTRAINT "ProductCostHistory_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2885 (class 2606 OID 31587)
-- Name: ProductMaterial ProductMaterial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductMaterial"
    ADD CONSTRAINT "ProductMaterial_pkey" PRIMARY KEY ("ProductID", "MaterialID");


--
-- TOC entry 2887 (class 2606 OID 31602)
-- Name: ProductSale ProductSale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductSale"
    ADD CONSTRAINT "ProductSale_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2867 (class 2606 OID 31489)
-- Name: ProductType ProductType_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductType"
    ADD CONSTRAINT "ProductType_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2881 (class 2606 OID 31565)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2889 (class 2606 OID 31620)
-- Name: Shop Shop_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shop"
    ADD CONSTRAINT "Shop_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2869 (class 2606 OID 31494)
-- Name: Supplier Supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Supplier"
    ADD CONSTRAINT "Supplier_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 2891 (class 2606 OID 31513)
-- Name: AgentPriorityHistory AgentPriorityHistory_AgentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."AgentPriorityHistory"
    ADD CONSTRAINT "AgentPriorityHistory_AgentID_fkey" FOREIGN KEY ("AgentID") REFERENCES public."Agent"("ID");


--
-- TOC entry 2890 (class 2606 OID 31503)
-- Name: Agent Agent_AgentTypeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Agent"
    ADD CONSTRAINT "Agent_AgentTypeID_fkey" FOREIGN KEY ("AgentTypeID") REFERENCES public."AgentType"("ID");


--
-- TOC entry 2893 (class 2606 OID 31536)
-- Name: MaterialCountHistory MaterialCountHistory_MaterialID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MaterialCountHistory"
    ADD CONSTRAINT "MaterialCountHistory_MaterialID_fkey" FOREIGN KEY ("MaterialID") REFERENCES public."Material"("ID");


--
-- TOC entry 2894 (class 2606 OID 31548)
-- Name: MaterialSupplier MaterialSupplier_MaterialID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MaterialSupplier"
    ADD CONSTRAINT "MaterialSupplier_MaterialID_fkey" FOREIGN KEY ("MaterialID") REFERENCES public."Material"("ID");


--
-- TOC entry 2895 (class 2606 OID 31553)
-- Name: MaterialSupplier MaterialSupplier_SupplierID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."MaterialSupplier"
    ADD CONSTRAINT "MaterialSupplier_SupplierID_fkey" FOREIGN KEY ("SupplierID") REFERENCES public."Supplier"("ID");


--
-- TOC entry 2892 (class 2606 OID 31526)
-- Name: Material Material_MaterialtypeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Material"
    ADD CONSTRAINT "Material_MaterialtypeID_fkey" FOREIGN KEY ("MaterialTypeID") REFERENCES public."MaterialType"("ID");


--
-- TOC entry 2897 (class 2606 OID 31576)
-- Name: ProductCostHistory ProductCostHistory_ProductID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductCostHistory"
    ADD CONSTRAINT "ProductCostHistory_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES public."Product"("ID");


--
-- TOC entry 2898 (class 2606 OID 31588)
-- Name: ProductMaterial ProductMaterial_MaterialID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductMaterial"
    ADD CONSTRAINT "ProductMaterial_MaterialID_fkey" FOREIGN KEY ("MaterialID") REFERENCES public."Material"("ID");


--
-- TOC entry 2899 (class 2606 OID 31593)
-- Name: ProductMaterial ProductMaterial_ProductID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductMaterial"
    ADD CONSTRAINT "ProductMaterial_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES public."Product"("ID");


--
-- TOC entry 2900 (class 2606 OID 31603)
-- Name: ProductSale ProductSale_AgentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductSale"
    ADD CONSTRAINT "ProductSale_AgentID_fkey" FOREIGN KEY ("AgentID") REFERENCES public."Agent"("ID");


--
-- TOC entry 2901 (class 2606 OID 31608)
-- Name: ProductSale ProductSale_ProductID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ProductSale"
    ADD CONSTRAINT "ProductSale_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES public."Product"("ID");


--
-- TOC entry 2896 (class 2606 OID 31566)
-- Name: Product Product_ProductTypeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_ProductTypeID_fkey" FOREIGN KEY ("ProductTypeID") REFERENCES public."ProductType"("ID");


--
-- TOC entry 2902 (class 2606 OID 31621)
-- Name: Shop Shop_AgentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Shop"
    ADD CONSTRAINT "Shop_AgentID_fkey" FOREIGN KEY ("AgentID") REFERENCES public."Agent"("ID");


-- Completed on 2022-11-10 22:48:34

--
-- PostgreSQL database dump complete
--

