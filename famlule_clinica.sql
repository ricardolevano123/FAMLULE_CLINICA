--
-- PostgreSQL database dump
--

\restrict SqZqJeLviltAwqdNTUcRw8pNQHgClelrgoPqEYlLg3EbLe2yeyLhNB1874x5MkT

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-07-26 09:50:22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 17480)
-- Name: areas_medicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas_medicas (
    id_area integer NOT NULL,
    nombre_area character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE public.areas_medicas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17479)
-- Name: areas_medicas_id_area_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.areas_medicas_id_area_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.areas_medicas_id_area_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 221
-- Name: areas_medicas_id_area_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.areas_medicas_id_area_seq OWNED BY public.areas_medicas.id_area;


--
-- TOC entry 224 (class 1259 OID 17493)
-- Name: condiciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.condiciones (
    id_condicion integer NOT NULL,
    nombre_condicion character varying(100) NOT NULL,
    descripcion text,
    id_area integer NOT NULL
);


ALTER TABLE public.condiciones OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17492)
-- Name: condiciones_id_condicion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.condiciones_id_condicion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.condiciones_id_condicion_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 223
-- Name: condiciones_id_condicion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.condiciones_id_condicion_seq OWNED BY public.condiciones.id_condicion;


--
-- TOC entry 228 (class 1259 OID 17615)
-- Name: consultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consultas (
    id_consulta integer NOT NULL,
    id_lesion integer NOT NULL,
    fecha_consulta date DEFAULT CURRENT_DATE NOT NULL,
    motivo character varying(150),
    notas text,
    proximo_control date
);


ALTER TABLE public.consultas OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17614)
-- Name: consultas_id_consulta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consultas_id_consulta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consultas_id_consulta_seq OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 227
-- Name: consultas_id_consulta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consultas_id_consulta_seq OWNED BY public.consultas.id_consulta;


--
-- TOC entry 226 (class 1259 OID 17586)
-- Name: lesiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesiones (
    id_lesion integer NOT NULL,
    id_paciente integer NOT NULL,
    id_condicion integer NOT NULL,
    id_area integer NOT NULL,
    fecha_lesion date NOT NULL,
    tiempo_evolucion character varying(50),
    severidad character varying(20),
    descripcion text
);


ALTER TABLE public.lesiones OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17585)
-- Name: lesiones_id_lesion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesiones_id_lesion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesiones_id_lesion_seq OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 225
-- Name: lesiones_id_lesion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesiones_id_lesion_seq OWNED BY public.lesiones.id_lesion;


--
-- TOC entry 220 (class 1259 OID 17430)
-- Name: pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pacientes (
    id_pacientes integer NOT NULL,
    documento_identidad character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    fecha_nacimiento date,
    sexo character varying(10),
    telefono character varying(20),
    direccion character varying(150),
    fecha_registro date DEFAULT CURRENT_DATE
);


ALTER TABLE public.pacientes OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17429)
-- Name: pacientes_id_pacientes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pacientes_id_pacientes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pacientes_id_pacientes_seq OWNER TO postgres;

--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 219
-- Name: pacientes_id_pacientes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pacientes_id_pacientes_seq OWNED BY public.pacientes.id_pacientes;


--
-- TOC entry 230 (class 1259 OID 17633)
-- Name: tratamientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tratamientos (
    id_tratamiento integer CONSTRAINT tratamiento_id_tratamiento_not_null NOT NULL,
    id_lesion integer CONSTRAINT tratamiento_id_lesion_not_null NOT NULL,
    tipo_tratamiento character varying(100),
    descripcion text,
    fecha_inicio date,
    fecha_fin date
);


ALTER TABLE public.tratamientos OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17632)
-- Name: tratamiento_id_tratamiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tratamiento_id_tratamiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tratamiento_id_tratamiento_seq OWNER TO postgres;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 229
-- Name: tratamiento_id_tratamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tratamiento_id_tratamiento_seq OWNED BY public.tratamientos.id_tratamiento;


--
-- TOC entry 4782 (class 2604 OID 17483)
-- Name: areas_medicas id_area; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas_medicas ALTER COLUMN id_area SET DEFAULT nextval('public.areas_medicas_id_area_seq'::regclass);


--
-- TOC entry 4783 (class 2604 OID 17496)
-- Name: condiciones id_condicion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condiciones ALTER COLUMN id_condicion SET DEFAULT nextval('public.condiciones_id_condicion_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 17618)
-- Name: consultas id_consulta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas ALTER COLUMN id_consulta SET DEFAULT nextval('public.consultas_id_consulta_seq'::regclass);


--
-- TOC entry 4784 (class 2604 OID 17589)
-- Name: lesiones id_lesion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesiones ALTER COLUMN id_lesion SET DEFAULT nextval('public.lesiones_id_lesion_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 17433)
-- Name: pacientes id_pacientes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes ALTER COLUMN id_pacientes SET DEFAULT nextval('public.pacientes_id_pacientes_seq'::regclass);


--
-- TOC entry 4787 (class 2604 OID 17636)
-- Name: tratamientos id_tratamiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamientos ALTER COLUMN id_tratamiento SET DEFAULT nextval('public.tratamiento_id_tratamiento_seq'::regclass);


--
-- TOC entry 4960 (class 0 OID 17480)
-- Dependencies: 222
-- Data for Name: areas_medicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.areas_medicas (id_area, nombre_area, descripcion) FROM stdin;
1	neurologia	atencion de condiciones relacionadas al sistema nervioso
2	traumatologia	atencion de lesiones oseas, musculares y articulares
\.


--
-- TOC entry 4962 (class 0 OID 17493)
-- Dependencies: 224
-- Data for Name: condiciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.condiciones (id_condicion, nombre_condicion, descripcion, id_area) FROM stdin;
2	ciatica	pinzamiento del nervio ciatico	1
3	fractura de tibia y perone	fractura expuesta de tipo 2	2
4	tendinitis manguito rotador	dolor en la articulacion al momento de moverlo	2
\.


--
-- TOC entry 4966 (class 0 OID 17615)
-- Dependencies: 228
-- Data for Name: consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consultas (id_consulta, id_lesion, fecha_consulta, motivo, notas, proximo_control) FROM stdin;
1	1	2026-06-11	primera evaluacion por dolor lumbar en pierna derecha	paciente comenta que el dolor es moderado, se recomienda antiinflamatorios en ampollas	2026-06-25
2	2	2026-06-16	Evaluacion por fractura expuesta en tibia-perone	ingreso inmediato del paciente a sala para la rapida antencion y colocacion de fijadores	2026-07-01
3	3	2026-06-21	evaluacion del movimiento del hombro al levantar el brazo	se recomienda descanso y terapia fisica inmediata	2026-07-05
\.


--
-- TOC entry 4964 (class 0 OID 17586)
-- Dependencies: 226
-- Data for Name: lesiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesiones (id_lesion, id_paciente, id_condicion, id_area, fecha_lesion, tiempo_evolucion, severidad, descripcion) FROM stdin;
1	1	2	1	2026-06-10	3 semanas	severa	dolor lumbar con irradiacion a pierna derecha, pinzamiento de nervio ciatico
2	2	3	2	2026-06-15	1 semana	grave	fractura abierta de tibia y perone por traumatismo severo
3	3	4	2	2026-06-20	2 semanas	leve	dolor de hombro al hacer circunduccion, debido a movimientos repetitivos, tendinitis manguito rotador
\.


--
-- TOC entry 4958 (class 0 OID 17430)
-- Dependencies: 220
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pacientes (id_pacientes, documento_identidad, nombre, apellido, fecha_nacimiento, sexo, telefono, direccion, fecha_registro) FROM stdin;
1	60453496	Juan	herrera souza	1989-03-22	masculino	996357008	Jr. los Alamos 245	2026-07-11
2	48372983	Carlos	barker london	1992-05-12	masculino	994374634	Prol. paseo de la republica 7632	2026-07-11
3	43475847	Maria	huapaya chinchai	1987-03-20	femenino	999789948	Av peru 2003	2026-07-11
\.


--
-- TOC entry 4968 (class 0 OID 17633)
-- Dependencies: 230
-- Data for Name: tratamientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tratamientos (id_tratamiento, id_lesion, tipo_tratamiento, descripcion, fecha_inicio, fecha_fin) FROM stdin;
1	1	farmacologico y reposo	Reposo relativo evitar cargar peso	2026-06-11	2026-06-25
2	2	fijacion mecanica de hueso de tibia y perone	inmovilizacion y aplicacion de yeso	2026-06-16	2026-08-15
3	3	sesione de fisioterapia uso de agentes fisicos	 dolor al movimiento, se recomienda el uso de agentes fisicos y medicacion para desinflamar la articulacion	2026-06-21	2026-07-19
\.


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 221
-- Name: areas_medicas_id_area_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.areas_medicas_id_area_seq', 2, true);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 223
-- Name: condiciones_id_condicion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.condiciones_id_condicion_seq', 6, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 227
-- Name: consultas_id_consulta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consultas_id_consulta_seq', 3, true);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 225
-- Name: lesiones_id_lesion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesiones_id_lesion_seq', 3, true);


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 219
-- Name: pacientes_id_pacientes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pacientes_id_pacientes_seq', 3, true);


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 229
-- Name: tratamiento_id_tratamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tratamiento_id_tratamiento_seq', 3, true);


--
-- TOC entry 4793 (class 2606 OID 17491)
-- Name: areas_medicas areas_medicas_nombre_area_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas_medicas
    ADD CONSTRAINT areas_medicas_nombre_area_key UNIQUE (nombre_area);


--
-- TOC entry 4795 (class 2606 OID 17489)
-- Name: areas_medicas areas_medicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas_medicas
    ADD CONSTRAINT areas_medicas_pkey PRIMARY KEY (id_area);


--
-- TOC entry 4797 (class 2606 OID 17503)
-- Name: condiciones condiciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condiciones
    ADD CONSTRAINT condiciones_pkey PRIMARY KEY (id_condicion);


--
-- TOC entry 4801 (class 2606 OID 17626)
-- Name: consultas consultas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_pkey PRIMARY KEY (id_consulta);


--
-- TOC entry 4799 (class 2606 OID 17598)
-- Name: lesiones lesiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesiones
    ADD CONSTRAINT lesiones_pkey PRIMARY KEY (id_lesion);


--
-- TOC entry 4789 (class 2606 OID 17442)
-- Name: pacientes pacientes_documento_identidad_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_documento_identidad_key UNIQUE (documento_identidad);


--
-- TOC entry 4791 (class 2606 OID 17440)
-- Name: pacientes pacientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id_pacientes);


--
-- TOC entry 4803 (class 2606 OID 17642)
-- Name: tratamientos tratamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamientos
    ADD CONSTRAINT tratamiento_pkey PRIMARY KEY (id_tratamiento);


--
-- TOC entry 4804 (class 2606 OID 17504)
-- Name: condiciones condiciones_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condiciones
    ADD CONSTRAINT condiciones_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.areas_medicas(id_area);


--
-- TOC entry 4808 (class 2606 OID 17627)
-- Name: consultas consultas_id_lesion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_id_lesion_fkey FOREIGN KEY (id_lesion) REFERENCES public.lesiones(id_lesion);


--
-- TOC entry 4805 (class 2606 OID 17609)
-- Name: lesiones lesiones_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesiones
    ADD CONSTRAINT lesiones_id_area_fkey FOREIGN KEY (id_area) REFERENCES public.areas_medicas(id_area);


--
-- TOC entry 4806 (class 2606 OID 17604)
-- Name: lesiones lesiones_id_condicion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesiones
    ADD CONSTRAINT lesiones_id_condicion_fkey FOREIGN KEY (id_condicion) REFERENCES public.condiciones(id_condicion);


--
-- TOC entry 4807 (class 2606 OID 17599)
-- Name: lesiones lesiones_id_paciente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesiones
    ADD CONSTRAINT lesiones_id_paciente_fkey FOREIGN KEY (id_paciente) REFERENCES public.pacientes(id_pacientes);


--
-- TOC entry 4809 (class 2606 OID 17643)
-- Name: tratamientos tratamiento_id_lesion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamientos
    ADD CONSTRAINT tratamiento_id_lesion_fkey FOREIGN KEY (id_lesion) REFERENCES public.lesiones(id_lesion);


-- Completed on 2026-07-26 09:50:24

--
-- PostgreSQL database dump complete
--

\unrestrict SqZqJeLviltAwqdNTUcRw8pNQHgClelrgoPqEYlLg3EbLe2yeyLhNB1874x5MkT

