--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE medusadb;




--
-- Drop roles
--

DROP ROLE medusauser;


--
-- Roles
--

CREATE ROLE medusauser;
ALTER ROLE medusauser WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:9JIO5GHLqMAQ/fASwp5fmQ==$wpaEvd4xPXIisJdhsaNi/s0Jalic24KrNJx9q/GyFcU=:iYi3xSKrDyUd7Z8oHrjtzzJNthyuVWi8f1aW/7SY5os=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: medusauser
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO medusauser;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: medusauser
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: medusauser
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: medusauser
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "medusadb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: medusadb; Type: DATABASE; Schema: -; Owner: medusauser
--

CREATE DATABASE medusadb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE medusadb OWNER TO medusauser;

\connect medusadb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: PAYMENT_COLLECTION_STATUS_ENUM; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public."PAYMENT_COLLECTION_STATUS_ENUM" AS ENUM (
    'not_paid',
    'awaiting',
    'authorized',
    'partially_authorized',
    'canceled'
);


ALTER TYPE public."PAYMENT_COLLECTION_STATUS_ENUM" OWNER TO medusauser;

--
-- Name: PAYMENT_COLLECTION_TYPE_ENUM; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public."PAYMENT_COLLECTION_TYPE_ENUM" AS ENUM (
    'order_edit'
);


ALTER TYPE public."PAYMENT_COLLECTION_TYPE_ENUM" OWNER TO medusauser;

--
-- Name: cart_type_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.cart_type_enum AS ENUM (
    'default',
    'swap',
    'draft_order',
    'payment_link',
    'claim'
);


ALTER TYPE public.cart_type_enum OWNER TO medusauser;

--
-- Name: claim_item_reason_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.claim_item_reason_enum AS ENUM (
    'missing_item',
    'wrong_item',
    'production_failure',
    'other'
);


ALTER TYPE public.claim_item_reason_enum OWNER TO medusauser;

--
-- Name: claim_order_fulfillment_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.claim_order_fulfillment_status_enum AS ENUM (
    'not_fulfilled',
    'partially_fulfilled',
    'fulfilled',
    'partially_shipped',
    'shipped',
    'partially_returned',
    'returned',
    'canceled',
    'requires_action'
);


ALTER TYPE public.claim_order_fulfillment_status_enum OWNER TO medusauser;

--
-- Name: claim_order_payment_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.claim_order_payment_status_enum AS ENUM (
    'na',
    'not_refunded',
    'refunded'
);


ALTER TYPE public.claim_order_payment_status_enum OWNER TO medusauser;

--
-- Name: claim_order_type_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.claim_order_type_enum AS ENUM (
    'refund',
    'replace'
);


ALTER TYPE public.claim_order_type_enum OWNER TO medusauser;

--
-- Name: discount_condition_operator_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.discount_condition_operator_enum AS ENUM (
    'in',
    'not_in'
);


ALTER TYPE public.discount_condition_operator_enum OWNER TO medusauser;

--
-- Name: discount_condition_type_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.discount_condition_type_enum AS ENUM (
    'products',
    'product_types',
    'product_collections',
    'product_tags',
    'customer_groups'
);


ALTER TYPE public.discount_condition_type_enum OWNER TO medusauser;

--
-- Name: discount_rule_allocation_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.discount_rule_allocation_enum AS ENUM (
    'total',
    'item'
);


ALTER TYPE public.discount_rule_allocation_enum OWNER TO medusauser;

--
-- Name: discount_rule_type_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.discount_rule_type_enum AS ENUM (
    'fixed',
    'percentage',
    'free_shipping'
);


ALTER TYPE public.discount_rule_type_enum OWNER TO medusauser;

--
-- Name: draft_order_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.draft_order_status_enum AS ENUM (
    'open',
    'completed'
);


ALTER TYPE public.draft_order_status_enum OWNER TO medusauser;

--
-- Name: invite_role_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.invite_role_enum AS ENUM (
    'admin',
    'member',
    'developer'
);


ALTER TYPE public.invite_role_enum OWNER TO medusauser;

--
-- Name: order_fulfillment_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.order_fulfillment_status_enum AS ENUM (
    'not_fulfilled',
    'partially_fulfilled',
    'fulfilled',
    'partially_shipped',
    'shipped',
    'partially_returned',
    'returned',
    'canceled',
    'requires_action'
);


ALTER TYPE public.order_fulfillment_status_enum OWNER TO medusauser;

--
-- Name: order_item_change_type_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.order_item_change_type_enum AS ENUM (
    'item_add',
    'item_remove',
    'item_update'
);


ALTER TYPE public.order_item_change_type_enum OWNER TO medusauser;

--
-- Name: order_payment_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.order_payment_status_enum AS ENUM (
    'not_paid',
    'awaiting',
    'captured',
    'partially_refunded',
    'refunded',
    'canceled',
    'requires_action'
);


ALTER TYPE public.order_payment_status_enum OWNER TO medusauser;

--
-- Name: order_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.order_status_enum AS ENUM (
    'pending',
    'completed',
    'archived',
    'canceled',
    'requires_action'
);


ALTER TYPE public.order_status_enum OWNER TO medusauser;

--
-- Name: payment_session_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.payment_session_status_enum AS ENUM (
    'authorized',
    'pending',
    'requires_more',
    'error',
    'canceled'
);


ALTER TYPE public.payment_session_status_enum OWNER TO medusauser;

--
-- Name: price_list_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.price_list_status_enum AS ENUM (
    'active',
    'draft'
);


ALTER TYPE public.price_list_status_enum OWNER TO medusauser;

--
-- Name: price_list_type_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.price_list_type_enum AS ENUM (
    'sale',
    'override'
);


ALTER TYPE public.price_list_type_enum OWNER TO medusauser;

--
-- Name: product_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.product_status_enum AS ENUM (
    'draft',
    'proposed',
    'published',
    'rejected'
);


ALTER TYPE public.product_status_enum OWNER TO medusauser;

--
-- Name: refund_reason_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.refund_reason_enum AS ENUM (
    'discount',
    'return',
    'swap',
    'claim',
    'other'
);


ALTER TYPE public.refund_reason_enum OWNER TO medusauser;

--
-- Name: return_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.return_status_enum AS ENUM (
    'requested',
    'received',
    'requires_action',
    'canceled'
);


ALTER TYPE public.return_status_enum OWNER TO medusauser;

--
-- Name: shipping_option_price_type_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.shipping_option_price_type_enum AS ENUM (
    'flat_rate',
    'calculated'
);


ALTER TYPE public.shipping_option_price_type_enum OWNER TO medusauser;

--
-- Name: shipping_option_requirement_type_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.shipping_option_requirement_type_enum AS ENUM (
    'min_subtotal',
    'max_subtotal'
);


ALTER TYPE public.shipping_option_requirement_type_enum OWNER TO medusauser;

--
-- Name: shipping_profile_type_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.shipping_profile_type_enum AS ENUM (
    'default',
    'gift_card',
    'custom'
);


ALTER TYPE public.shipping_profile_type_enum OWNER TO medusauser;

--
-- Name: swap_fulfillment_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.swap_fulfillment_status_enum AS ENUM (
    'not_fulfilled',
    'fulfilled',
    'shipped',
    'partially_shipped',
    'canceled',
    'requires_action'
);


ALTER TYPE public.swap_fulfillment_status_enum OWNER TO medusauser;

--
-- Name: swap_payment_status_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.swap_payment_status_enum AS ENUM (
    'not_paid',
    'awaiting',
    'captured',
    'confirmed',
    'canceled',
    'difference_refunded',
    'partially_refunded',
    'refunded',
    'requires_action'
);


ALTER TYPE public.swap_payment_status_enum OWNER TO medusauser;

--
-- Name: user_role_enum; Type: TYPE; Schema: public; Owner: medusauser
--

CREATE TYPE public.user_role_enum AS ENUM (
    'admin',
    'member',
    'developer'
);


ALTER TYPE public.user_role_enum OWNER TO medusauser;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.address (
    id character varying NOT NULL,
    customer_id character varying,
    company character varying,
    first_name character varying,
    last_name character varying,
    address_1 character varying,
    address_2 character varying,
    city character varying,
    country_code character varying,
    province character varying,
    postal_code character varying,
    phone character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.address OWNER TO medusauser;

--
-- Name: analytics_config; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.analytics_config (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    user_id character varying NOT NULL,
    opt_out boolean DEFAULT false NOT NULL,
    anonymize boolean DEFAULT false NOT NULL
);


ALTER TABLE public.analytics_config OWNER TO medusauser;

--
-- Name: batch_job; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.batch_job (
    id character varying NOT NULL,
    type text NOT NULL,
    created_by character varying,
    context jsonb,
    result jsonb,
    dry_run boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    pre_processed_at timestamp with time zone,
    confirmed_at timestamp with time zone,
    processing_at timestamp with time zone,
    completed_at timestamp with time zone,
    failed_at timestamp with time zone,
    canceled_at timestamp with time zone,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.batch_job OWNER TO medusauser;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.cart (
    id character varying NOT NULL,
    email character varying,
    billing_address_id character varying,
    shipping_address_id character varying,
    region_id character varying NOT NULL,
    customer_id character varying,
    payment_id character varying,
    type public.cart_type_enum DEFAULT 'default'::public.cart_type_enum NOT NULL,
    completed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    idempotency_key character varying,
    context jsonb,
    payment_authorized_at timestamp with time zone,
    sales_channel_id character varying
);


ALTER TABLE public.cart OWNER TO medusauser;

--
-- Name: cart_discounts; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.cart_discounts (
    cart_id character varying NOT NULL,
    discount_id character varying NOT NULL
);


ALTER TABLE public.cart_discounts OWNER TO medusauser;

--
-- Name: cart_gift_cards; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.cart_gift_cards (
    cart_id character varying NOT NULL,
    gift_card_id character varying NOT NULL
);


ALTER TABLE public.cart_gift_cards OWNER TO medusauser;

--
-- Name: claim_image; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.claim_image (
    id character varying NOT NULL,
    claim_item_id character varying NOT NULL,
    url character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.claim_image OWNER TO medusauser;

--
-- Name: claim_item; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.claim_item (
    id character varying NOT NULL,
    claim_order_id character varying NOT NULL,
    item_id character varying NOT NULL,
    variant_id character varying NOT NULL,
    reason public.claim_item_reason_enum NOT NULL,
    note character varying,
    quantity integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.claim_item OWNER TO medusauser;

--
-- Name: claim_item_tags; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.claim_item_tags (
    item_id character varying NOT NULL,
    tag_id character varying NOT NULL
);


ALTER TABLE public.claim_item_tags OWNER TO medusauser;

--
-- Name: claim_order; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.claim_order (
    id character varying NOT NULL,
    payment_status public.claim_order_payment_status_enum DEFAULT 'na'::public.claim_order_payment_status_enum NOT NULL,
    fulfillment_status public.claim_order_fulfillment_status_enum DEFAULT 'not_fulfilled'::public.claim_order_fulfillment_status_enum NOT NULL,
    type public.claim_order_type_enum NOT NULL,
    order_id character varying NOT NULL,
    shipping_address_id character varying,
    refund_amount integer,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    idempotency_key character varying,
    no_notification boolean
);


ALTER TABLE public.claim_order OWNER TO medusauser;

--
-- Name: claim_tag; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.claim_tag (
    id character varying NOT NULL,
    value character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.claim_tag OWNER TO medusauser;

--
-- Name: country; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.country (
    id integer NOT NULL,
    iso_2 character varying NOT NULL,
    iso_3 character varying NOT NULL,
    num_code integer NOT NULL,
    name character varying NOT NULL,
    display_name character varying NOT NULL,
    region_id character varying
);


ALTER TABLE public.country OWNER TO medusauser;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: medusauser
--

CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_id_seq OWNER TO medusauser;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medusauser
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: currency; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.currency (
    code character varying NOT NULL,
    symbol character varying NOT NULL,
    symbol_native character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.currency OWNER TO medusauser;

--
-- Name: custom_shipping_option; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.custom_shipping_option (
    id character varying NOT NULL,
    price integer NOT NULL,
    shipping_option_id character varying NOT NULL,
    cart_id character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.custom_shipping_option OWNER TO medusauser;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.customer (
    id character varying NOT NULL,
    email character varying NOT NULL,
    first_name character varying,
    last_name character varying,
    billing_address_id character varying,
    password_hash character varying,
    phone character varying,
    has_account boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.customer OWNER TO medusauser;

--
-- Name: customer_group; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.customer_group (
    id character varying NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.customer_group OWNER TO medusauser;

--
-- Name: customer_group_customers; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.customer_group_customers (
    customer_group_id character varying NOT NULL,
    customer_id character varying NOT NULL
);


ALTER TABLE public.customer_group_customers OWNER TO medusauser;

--
-- Name: discount; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.discount (
    id character varying NOT NULL,
    code character varying NOT NULL,
    is_dynamic boolean NOT NULL,
    rule_id character varying,
    is_disabled boolean NOT NULL,
    parent_discount_id character varying,
    starts_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ends_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    usage_limit integer,
    usage_count integer DEFAULT 0 NOT NULL,
    valid_duration character varying
);


ALTER TABLE public.discount OWNER TO medusauser;

--
-- Name: discount_condition; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.discount_condition (
    id character varying NOT NULL,
    type public.discount_condition_type_enum NOT NULL,
    operator public.discount_condition_operator_enum NOT NULL,
    discount_rule_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.discount_condition OWNER TO medusauser;

--
-- Name: discount_condition_customer_group; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.discount_condition_customer_group (
    customer_group_id character varying NOT NULL,
    condition_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.discount_condition_customer_group OWNER TO medusauser;

--
-- Name: discount_condition_product; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.discount_condition_product (
    product_id character varying NOT NULL,
    condition_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.discount_condition_product OWNER TO medusauser;

--
-- Name: discount_condition_product_collection; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.discount_condition_product_collection (
    product_collection_id character varying NOT NULL,
    condition_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.discount_condition_product_collection OWNER TO medusauser;

--
-- Name: discount_condition_product_tag; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.discount_condition_product_tag (
    product_tag_id character varying NOT NULL,
    condition_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.discount_condition_product_tag OWNER TO medusauser;

--
-- Name: discount_condition_product_type; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.discount_condition_product_type (
    product_type_id character varying NOT NULL,
    condition_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.discount_condition_product_type OWNER TO medusauser;

--
-- Name: discount_regions; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.discount_regions (
    discount_id character varying NOT NULL,
    region_id character varying NOT NULL
);


ALTER TABLE public.discount_regions OWNER TO medusauser;

--
-- Name: discount_rule; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.discount_rule (
    id character varying NOT NULL,
    description character varying,
    type public.discount_rule_type_enum NOT NULL,
    value integer NOT NULL,
    allocation public.discount_rule_allocation_enum,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.discount_rule OWNER TO medusauser;

--
-- Name: discount_rule_products; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.discount_rule_products (
    discount_rule_id character varying NOT NULL,
    product_id character varying NOT NULL
);


ALTER TABLE public.discount_rule_products OWNER TO medusauser;

--
-- Name: draft_order; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.draft_order (
    id character varying NOT NULL,
    status public.draft_order_status_enum DEFAULT 'open'::public.draft_order_status_enum NOT NULL,
    display_id integer NOT NULL,
    cart_id character varying,
    order_id character varying,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    completed_at timestamp with time zone,
    metadata jsonb,
    idempotency_key character varying,
    no_notification_order boolean
);


ALTER TABLE public.draft_order OWNER TO medusauser;

--
-- Name: draft_order_display_id_seq; Type: SEQUENCE; Schema: public; Owner: medusauser
--

CREATE SEQUENCE public.draft_order_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.draft_order_display_id_seq OWNER TO medusauser;

--
-- Name: draft_order_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medusauser
--

ALTER SEQUENCE public.draft_order_display_id_seq OWNED BY public.draft_order.display_id;


--
-- Name: fulfillment; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.fulfillment (
    id character varying NOT NULL,
    swap_id character varying,
    order_id character varying,
    tracking_numbers jsonb DEFAULT '[]'::jsonb NOT NULL,
    data jsonb NOT NULL,
    shipped_at timestamp with time zone,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    idempotency_key character varying,
    provider_id character varying,
    claim_order_id character varying,
    no_notification boolean,
    location_id character varying
);


ALTER TABLE public.fulfillment OWNER TO medusauser;

--
-- Name: fulfillment_item; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.fulfillment_item (
    fulfillment_id character varying NOT NULL,
    item_id character varying NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.fulfillment_item OWNER TO medusauser;

--
-- Name: fulfillment_provider; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.fulfillment_provider (
    id character varying NOT NULL,
    is_installed boolean DEFAULT true NOT NULL
);


ALTER TABLE public.fulfillment_provider OWNER TO medusauser;

--
-- Name: gift_card; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.gift_card (
    id character varying NOT NULL,
    code character varying NOT NULL,
    value integer NOT NULL,
    balance integer NOT NULL,
    region_id character varying NOT NULL,
    order_id character varying,
    is_disabled boolean DEFAULT false NOT NULL,
    ends_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    tax_rate real
);


ALTER TABLE public.gift_card OWNER TO medusauser;

--
-- Name: gift_card_transaction; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.gift_card_transaction (
    id character varying NOT NULL,
    gift_card_id character varying NOT NULL,
    order_id character varying NOT NULL,
    amount integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    is_taxable boolean,
    tax_rate real
);


ALTER TABLE public.gift_card_transaction OWNER TO medusauser;

--
-- Name: idempotency_key; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.idempotency_key (
    id character varying NOT NULL,
    idempotency_key character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    locked_at timestamp with time zone,
    request_method character varying,
    request_params jsonb,
    request_path character varying,
    response_code integer,
    response_body jsonb,
    recovery_point character varying DEFAULT 'started'::character varying NOT NULL
);


ALTER TABLE public.idempotency_key OWNER TO medusauser;

--
-- Name: image; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.image (
    id character varying NOT NULL,
    url character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.image OWNER TO medusauser;

--
-- Name: invite; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.invite (
    id character varying NOT NULL,
    user_email character varying NOT NULL,
    role public.invite_role_enum DEFAULT 'member'::public.invite_role_enum,
    accepted boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    token character varying NOT NULL,
    expires_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.invite OWNER TO medusauser;

--
-- Name: line_item; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.line_item (
    id character varying NOT NULL,
    cart_id character varying,
    order_id character varying,
    swap_id character varying,
    title character varying NOT NULL,
    description character varying,
    thumbnail character varying,
    is_giftcard boolean DEFAULT false NOT NULL,
    should_merge boolean DEFAULT true NOT NULL,
    allow_discounts boolean DEFAULT true NOT NULL,
    has_shipping boolean,
    unit_price integer NOT NULL,
    variant_id character varying,
    quantity integer NOT NULL,
    fulfilled_quantity integer,
    returned_quantity integer,
    shipped_quantity integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    claim_order_id character varying,
    is_return boolean DEFAULT false NOT NULL,
    original_item_id character varying,
    order_edit_id character varying,
    CONSTRAINT "CHK_0cd85e15610d11b553d5e8fda6" CHECK ((shipped_quantity <= fulfilled_quantity)),
    CONSTRAINT "CHK_64eef00a5064887634f1680866" CHECK ((quantity > 0)),
    CONSTRAINT "CHK_91f40396d847f6ecfd9f752bf8" CHECK ((returned_quantity <= quantity)),
    CONSTRAINT "CHK_c61716c68f5ad5de2834c827d3" CHECK ((fulfilled_quantity <= quantity))
);


ALTER TABLE public.line_item OWNER TO medusauser;

--
-- Name: line_item_adjustment; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.line_item_adjustment (
    id character varying NOT NULL,
    item_id character varying NOT NULL,
    description character varying NOT NULL,
    discount_id character varying,
    amount numeric NOT NULL,
    metadata jsonb
);


ALTER TABLE public.line_item_adjustment OWNER TO medusauser;

--
-- Name: line_item_tax_line; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.line_item_tax_line (
    id character varying NOT NULL,
    rate real NOT NULL,
    name character varying NOT NULL,
    code character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    item_id character varying NOT NULL
);


ALTER TABLE public.line_item_tax_line OWNER TO medusauser;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO medusauser;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: medusauser
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO medusauser;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medusauser
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: money_amount; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.money_amount (
    id character varying NOT NULL,
    currency_code character varying NOT NULL,
    amount integer NOT NULL,
    region_id character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    min_quantity integer,
    max_quantity integer,
    price_list_id character varying
);


ALTER TABLE public.money_amount OWNER TO medusauser;

--
-- Name: note; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.note (
    id character varying NOT NULL,
    value character varying NOT NULL,
    resource_type character varying NOT NULL,
    resource_id character varying NOT NULL,
    author_id character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.note OWNER TO medusauser;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.notification (
    id character varying NOT NULL,
    event_name character varying,
    resource_type character varying NOT NULL,
    resource_id character varying NOT NULL,
    customer_id character varying,
    "to" character varying NOT NULL,
    data jsonb NOT NULL,
    parent_id character varying,
    provider_id character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.notification OWNER TO medusauser;

--
-- Name: notification_provider; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.notification_provider (
    id character varying NOT NULL,
    is_installed boolean DEFAULT true NOT NULL
);


ALTER TABLE public.notification_provider OWNER TO medusauser;

--
-- Name: oauth; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.oauth (
    id character varying NOT NULL,
    display_name character varying NOT NULL,
    application_name character varying NOT NULL,
    install_url character varying,
    uninstall_url character varying,
    data jsonb
);


ALTER TABLE public.oauth OWNER TO medusauser;

--
-- Name: onboarding_state; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.onboarding_state (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    current_step character varying,
    is_complete boolean NOT NULL,
    product_id character varying
);


ALTER TABLE public.onboarding_state OWNER TO medusauser;

--
-- Name: order; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public."order" (
    id character varying NOT NULL,
    status public.order_status_enum DEFAULT 'pending'::public.order_status_enum NOT NULL,
    fulfillment_status public.order_fulfillment_status_enum DEFAULT 'not_fulfilled'::public.order_fulfillment_status_enum NOT NULL,
    payment_status public.order_payment_status_enum DEFAULT 'not_paid'::public.order_payment_status_enum NOT NULL,
    display_id integer NOT NULL,
    cart_id character varying,
    customer_id character varying NOT NULL,
    email character varying NOT NULL,
    billing_address_id character varying,
    shipping_address_id character varying,
    region_id character varying NOT NULL,
    currency_code character varying NOT NULL,
    tax_rate real,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    idempotency_key character varying,
    draft_order_id character varying,
    no_notification boolean,
    external_id character varying,
    sales_channel_id character varying
);


ALTER TABLE public."order" OWNER TO medusauser;

--
-- Name: order_discounts; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.order_discounts (
    order_id character varying NOT NULL,
    discount_id character varying NOT NULL
);


ALTER TABLE public.order_discounts OWNER TO medusauser;

--
-- Name: order_display_id_seq; Type: SEQUENCE; Schema: public; Owner: medusauser
--

CREATE SEQUENCE public.order_display_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_display_id_seq OWNER TO medusauser;

--
-- Name: order_display_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: medusauser
--

ALTER SEQUENCE public.order_display_id_seq OWNED BY public."order".display_id;


--
-- Name: order_edit; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.order_edit (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    order_id character varying NOT NULL,
    internal_note character varying,
    created_by character varying NOT NULL,
    requested_by character varying,
    requested_at timestamp with time zone,
    confirmed_by character varying,
    confirmed_at timestamp with time zone,
    declined_by character varying,
    declined_reason character varying,
    declined_at timestamp with time zone,
    canceled_by character varying,
    canceled_at timestamp with time zone,
    payment_collection_id character varying
);


ALTER TABLE public.order_edit OWNER TO medusauser;

--
-- Name: order_gift_cards; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.order_gift_cards (
    order_id character varying NOT NULL,
    gift_card_id character varying NOT NULL
);


ALTER TABLE public.order_gift_cards OWNER TO medusauser;

--
-- Name: order_item_change; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.order_item_change (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    type public.order_item_change_type_enum NOT NULL,
    order_edit_id character varying NOT NULL,
    original_line_item_id character varying,
    line_item_id character varying
);


ALTER TABLE public.order_item_change OWNER TO medusauser;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.payment (
    id character varying NOT NULL,
    swap_id character varying,
    cart_id character varying,
    order_id character varying,
    amount integer NOT NULL,
    currency_code character varying NOT NULL,
    amount_refunded integer DEFAULT 0 NOT NULL,
    provider_id character varying NOT NULL,
    data jsonb NOT NULL,
    captured_at timestamp with time zone,
    canceled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    idempotency_key character varying
);


ALTER TABLE public.payment OWNER TO medusauser;

--
-- Name: payment_collection; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.payment_collection (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    type public."PAYMENT_COLLECTION_TYPE_ENUM" NOT NULL,
    status public."PAYMENT_COLLECTION_STATUS_ENUM" NOT NULL,
    description text,
    amount integer NOT NULL,
    authorized_amount integer,
    region_id character varying NOT NULL,
    currency_code character varying NOT NULL,
    metadata jsonb,
    created_by character varying NOT NULL
);


ALTER TABLE public.payment_collection OWNER TO medusauser;

--
-- Name: payment_collection_payments; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.payment_collection_payments (
    payment_collection_id character varying NOT NULL,
    payment_id character varying NOT NULL
);


ALTER TABLE public.payment_collection_payments OWNER TO medusauser;

--
-- Name: payment_collection_sessions; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.payment_collection_sessions (
    payment_collection_id character varying NOT NULL,
    payment_session_id character varying NOT NULL
);


ALTER TABLE public.payment_collection_sessions OWNER TO medusauser;

--
-- Name: payment_provider; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.payment_provider (
    id character varying NOT NULL,
    is_installed boolean DEFAULT true NOT NULL
);


ALTER TABLE public.payment_provider OWNER TO medusauser;

--
-- Name: payment_session; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.payment_session (
    id character varying NOT NULL,
    cart_id character varying,
    provider_id character varying NOT NULL,
    is_selected boolean,
    status public.payment_session_status_enum NOT NULL,
    data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    idempotency_key character varying,
    payment_authorized_at timestamp with time zone,
    amount integer,
    is_initiated boolean DEFAULT false NOT NULL
);


ALTER TABLE public.payment_session OWNER TO medusauser;

--
-- Name: price_list; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.price_list (
    id character varying NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    type public.price_list_type_enum DEFAULT 'sale'::public.price_list_type_enum NOT NULL,
    status public.price_list_status_enum DEFAULT 'draft'::public.price_list_status_enum NOT NULL,
    starts_at timestamp with time zone,
    ends_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.price_list OWNER TO medusauser;

--
-- Name: price_list_customer_groups; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.price_list_customer_groups (
    price_list_id character varying NOT NULL,
    customer_group_id character varying NOT NULL
);


ALTER TABLE public.price_list_customer_groups OWNER TO medusauser;

--
-- Name: product; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product (
    id character varying NOT NULL,
    title character varying NOT NULL,
    subtitle character varying,
    description character varying,
    handle character varying,
    is_giftcard boolean DEFAULT false NOT NULL,
    thumbnail character varying,
    weight integer,
    length integer,
    height integer,
    width integer,
    hs_code character varying,
    origin_country character varying,
    mid_code character varying,
    material character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    collection_id character varying,
    type_id character varying,
    discountable boolean DEFAULT true NOT NULL,
    status public.product_status_enum DEFAULT 'draft'::public.product_status_enum NOT NULL,
    external_id character varying
);


ALTER TABLE public.product OWNER TO medusauser;

--
-- Name: product_category; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_category (
    id character varying NOT NULL,
    name text NOT NULL,
    handle text NOT NULL,
    parent_category_id character varying,
    mpath text,
    is_active boolean DEFAULT false,
    is_internal boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    rank integer DEFAULT 0 NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    metadata jsonb,
    CONSTRAINT product_category_rank_check CHECK ((rank >= 0))
);


ALTER TABLE public.product_category OWNER TO medusauser;

--
-- Name: product_category_product; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_category_product (
    product_category_id character varying NOT NULL,
    product_id character varying NOT NULL
);


ALTER TABLE public.product_category_product OWNER TO medusauser;

--
-- Name: product_collection; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_collection (
    id character varying NOT NULL,
    title character varying NOT NULL,
    handle character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.product_collection OWNER TO medusauser;

--
-- Name: product_images; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_images (
    product_id character varying NOT NULL,
    image_id character varying NOT NULL
);


ALTER TABLE public.product_images OWNER TO medusauser;

--
-- Name: product_option; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_option (
    id character varying NOT NULL,
    title character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    product_id character varying
);


ALTER TABLE public.product_option OWNER TO medusauser;

--
-- Name: product_option_value; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_option_value (
    id character varying NOT NULL,
    value character varying NOT NULL,
    option_id character varying NOT NULL,
    variant_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.product_option_value OWNER TO medusauser;

--
-- Name: product_sales_channel; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_sales_channel (
    product_id character varying NOT NULL,
    sales_channel_id character varying NOT NULL
);


ALTER TABLE public.product_sales_channel OWNER TO medusauser;

--
-- Name: product_shipping_profile; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_shipping_profile (
    profile_id text NOT NULL,
    product_id text NOT NULL
);


ALTER TABLE public.product_shipping_profile OWNER TO medusauser;

--
-- Name: product_tag; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_tag (
    id character varying NOT NULL,
    value character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.product_tag OWNER TO medusauser;

--
-- Name: product_tags; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_tags (
    product_id character varying NOT NULL,
    product_tag_id character varying NOT NULL
);


ALTER TABLE public.product_tags OWNER TO medusauser;

--
-- Name: product_tax_rate; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_tax_rate (
    product_id character varying NOT NULL,
    rate_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.product_tax_rate OWNER TO medusauser;

--
-- Name: product_type; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_type (
    id character varying NOT NULL,
    value character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.product_type OWNER TO medusauser;

--
-- Name: product_type_tax_rate; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_type_tax_rate (
    product_type_id character varying NOT NULL,
    rate_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.product_type_tax_rate OWNER TO medusauser;

--
-- Name: product_variant; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_variant (
    id character varying NOT NULL,
    title character varying NOT NULL,
    product_id character varying NOT NULL,
    sku character varying,
    barcode character varying,
    ean character varying,
    upc character varying,
    inventory_quantity integer NOT NULL,
    allow_backorder boolean DEFAULT false NOT NULL,
    manage_inventory boolean DEFAULT true NOT NULL,
    hs_code character varying,
    origin_country character varying,
    mid_code character varying,
    material character varying,
    weight integer,
    length integer,
    height integer,
    width integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    variant_rank integer DEFAULT 0
);


ALTER TABLE public.product_variant OWNER TO medusauser;

--
-- Name: product_variant_inventory_item; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_variant_inventory_item (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    inventory_item_id text NOT NULL,
    variant_id text NOT NULL,
    required_quantity integer DEFAULT 1 NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.product_variant_inventory_item OWNER TO medusauser;

--
-- Name: product_variant_money_amount; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.product_variant_money_amount (
    id character varying NOT NULL,
    money_amount_id text NOT NULL,
    variant_id text NOT NULL,
    deleted_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.product_variant_money_amount OWNER TO medusauser;

--
-- Name: publishable_api_key; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.publishable_api_key (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying,
    revoked_by character varying,
    revoked_at timestamp with time zone,
    title character varying NOT NULL
);


ALTER TABLE public.publishable_api_key OWNER TO medusauser;

--
-- Name: publishable_api_key_sales_channel; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.publishable_api_key_sales_channel (
    sales_channel_id character varying NOT NULL,
    publishable_key_id character varying NOT NULL,
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.publishable_api_key_sales_channel OWNER TO medusauser;

--
-- Name: refund; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.refund (
    id character varying NOT NULL,
    order_id character varying,
    amount integer NOT NULL,
    note character varying,
    reason public.refund_reason_enum NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    idempotency_key character varying,
    payment_id character varying
);


ALTER TABLE public.refund OWNER TO medusauser;

--
-- Name: region; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.region (
    id character varying NOT NULL,
    name character varying NOT NULL,
    currency_code character varying NOT NULL,
    tax_rate real NOT NULL,
    tax_code character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    gift_cards_taxable boolean DEFAULT true NOT NULL,
    automatic_taxes boolean DEFAULT true NOT NULL,
    tax_provider_id character varying
);


ALTER TABLE public.region OWNER TO medusauser;

--
-- Name: region_fulfillment_providers; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.region_fulfillment_providers (
    region_id character varying NOT NULL,
    provider_id character varying NOT NULL
);


ALTER TABLE public.region_fulfillment_providers OWNER TO medusauser;

--
-- Name: region_payment_providers; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.region_payment_providers (
    region_id character varying NOT NULL,
    provider_id character varying NOT NULL
);


ALTER TABLE public.region_payment_providers OWNER TO medusauser;

--
-- Name: return; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.return (
    id character varying NOT NULL,
    status public.return_status_enum DEFAULT 'requested'::public.return_status_enum NOT NULL,
    swap_id character varying,
    order_id character varying,
    shipping_data jsonb,
    refund_amount integer NOT NULL,
    received_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    idempotency_key character varying,
    claim_order_id character varying,
    no_notification boolean,
    location_id character varying
);


ALTER TABLE public.return OWNER TO medusauser;

--
-- Name: return_item; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.return_item (
    return_id character varying NOT NULL,
    item_id character varying NOT NULL,
    quantity integer NOT NULL,
    is_requested boolean DEFAULT true NOT NULL,
    requested_quantity integer,
    received_quantity integer,
    metadata jsonb,
    reason_id character varying,
    note character varying
);


ALTER TABLE public.return_item OWNER TO medusauser;

--
-- Name: return_reason; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.return_reason (
    id character varying NOT NULL,
    value character varying NOT NULL,
    label character varying NOT NULL,
    description character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    parent_return_reason_id character varying
);


ALTER TABLE public.return_reason OWNER TO medusauser;

--
-- Name: sales_channel; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.sales_channel (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    name character varying NOT NULL,
    description character varying,
    is_disabled boolean DEFAULT false NOT NULL,
    metadata jsonb
);


ALTER TABLE public.sales_channel OWNER TO medusauser;

--
-- Name: sales_channel_location; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.sales_channel_location (
    id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    sales_channel_id text NOT NULL,
    location_id text NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.sales_channel_location OWNER TO medusauser;

--
-- Name: shipping_method; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.shipping_method (
    id character varying NOT NULL,
    shipping_option_id character varying NOT NULL,
    order_id character varying,
    cart_id character varying,
    swap_id character varying,
    return_id character varying,
    price integer NOT NULL,
    data jsonb NOT NULL,
    claim_order_id character varying,
    CONSTRAINT "CHK_64c6812fe7815be30d688df513" CHECK ((price >= 0)),
    CONSTRAINT "CHK_a7020b08665bbd64d84a6641cf" CHECK (((claim_order_id IS NOT NULL) OR (order_id IS NOT NULL) OR (cart_id IS NOT NULL) OR (swap_id IS NOT NULL) OR (return_id IS NOT NULL)))
);


ALTER TABLE public.shipping_method OWNER TO medusauser;

--
-- Name: shipping_method_tax_line; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.shipping_method_tax_line (
    id character varying NOT NULL,
    rate real NOT NULL,
    name character varying NOT NULL,
    code character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    shipping_method_id character varying NOT NULL
);


ALTER TABLE public.shipping_method_tax_line OWNER TO medusauser;

--
-- Name: shipping_option; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.shipping_option (
    id character varying NOT NULL,
    name character varying NOT NULL,
    region_id character varying NOT NULL,
    profile_id character varying NOT NULL,
    provider_id character varying NOT NULL,
    price_type public.shipping_option_price_type_enum NOT NULL,
    amount integer,
    is_return boolean DEFAULT false NOT NULL,
    data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    admin_only boolean DEFAULT false NOT NULL,
    CONSTRAINT "CHK_7a367f5901ae0a5b0df75aee38" CHECK ((amount >= 0))
);


ALTER TABLE public.shipping_option OWNER TO medusauser;

--
-- Name: shipping_option_requirement; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.shipping_option_requirement (
    id character varying NOT NULL,
    shipping_option_id character varying NOT NULL,
    type public.shipping_option_requirement_type_enum NOT NULL,
    amount integer NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.shipping_option_requirement OWNER TO medusauser;

--
-- Name: shipping_profile; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.shipping_profile (
    id character varying NOT NULL,
    name character varying NOT NULL,
    type public.shipping_profile_type_enum NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb
);


ALTER TABLE public.shipping_profile OWNER TO medusauser;

--
-- Name: shipping_tax_rate; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.shipping_tax_rate (
    shipping_option_id character varying NOT NULL,
    rate_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.shipping_tax_rate OWNER TO medusauser;

--
-- Name: staged_job; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.staged_job (
    id character varying NOT NULL,
    event_name character varying NOT NULL,
    data jsonb NOT NULL,
    options jsonb DEFAULT '{}'::jsonb NOT NULL
);


ALTER TABLE public.staged_job OWNER TO medusauser;

--
-- Name: store; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.store (
    id character varying NOT NULL,
    name character varying DEFAULT 'Medusa Store'::character varying NOT NULL,
    default_currency_code character varying DEFAULT 'usd'::character varying NOT NULL,
    swap_link_template character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb,
    payment_link_template character varying,
    invite_link_template character varying,
    default_sales_channel_id character varying,
    default_location_id character varying
);


ALTER TABLE public.store OWNER TO medusauser;

--
-- Name: store_currencies; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.store_currencies (
    store_id character varying NOT NULL,
    currency_code character varying NOT NULL
);


ALTER TABLE public.store_currencies OWNER TO medusauser;

--
-- Name: swap; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.swap (
    id character varying NOT NULL,
    fulfillment_status public.swap_fulfillment_status_enum NOT NULL,
    payment_status public.swap_payment_status_enum NOT NULL,
    order_id character varying NOT NULL,
    difference_due integer,
    shipping_address_id character varying,
    cart_id character varying,
    confirmed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    idempotency_key character varying,
    no_notification boolean,
    canceled_at timestamp with time zone,
    allow_backorder boolean DEFAULT false NOT NULL
);


ALTER TABLE public.swap OWNER TO medusauser;

--
-- Name: tax_provider; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.tax_provider (
    id character varying NOT NULL,
    is_installed boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tax_provider OWNER TO medusauser;

--
-- Name: tax_rate; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.tax_rate (
    id character varying NOT NULL,
    rate real,
    code character varying,
    name character varying NOT NULL,
    region_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    metadata jsonb
);


ALTER TABLE public.tax_rate OWNER TO medusauser;

--
-- Name: tracking_link; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public.tracking_link (
    id character varying NOT NULL,
    url character varying,
    tracking_number character varying NOT NULL,
    fulfillment_id character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    idempotency_key character varying
);


ALTER TABLE public.tracking_link OWNER TO medusauser;

--
-- Name: user; Type: TABLE; Schema: public; Owner: medusauser
--

CREATE TABLE public."user" (
    id character varying NOT NULL,
    email character varying NOT NULL,
    first_name character varying,
    last_name character varying,
    password_hash character varying,
    api_token character varying,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    metadata jsonb,
    role public.user_role_enum DEFAULT 'member'::public.user_role_enum
);


ALTER TABLE public."user" OWNER TO medusauser;

--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: draft_order display_id; Type: DEFAULT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.draft_order ALTER COLUMN display_id SET DEFAULT nextval('public.draft_order_display_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: order display_id; Type: DEFAULT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order" ALTER COLUMN display_id SET DEFAULT nextval('public.order_display_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.address (id, customer_id, company, first_name, last_name, address_1, address_2, city, country_code, province, postal_code, phone, created_at, updated_at, deleted_at, metadata) FROM stdin;
addr_01J8D3P9Z4M69R50A4HJ5G31P4	\N		Patipat	Chewprecha	111		Nakhon Pathom	us	Nakhon Pathom	73170	0924934708	2024-09-22 14:55:37.423977+00	2024-09-22 14:55:37.423977+00	\N	\N
addr_01J8D3P9Z4FDZ6NPYB7RTMCW61	\N		Patipat	Chewprecha	111		Nakhon Pathom	us	Nakhon Pathom	73170	0924934708	2024-09-22 14:55:37.423977+00	2024-09-22 14:55:37.423977+00	\N	\N
addr_01J8D3R7D90DCT1VXA3GZMHPE6	\N		Test	Name	ICT Mahidol		Nakhon Pathom	ca	Nakhon Pathom	73170	0924934708	2024-09-22 14:56:40.34705+00	2024-09-22 14:56:40.34705+00	\N	\N
addr_01J8D3R7D9NYMSVSM99MKRVBAK	\N		Test	Name	ICT Mahidol		Nakhon Pathom	ca	Nakhon Pathom	73170	0924934708	2024-09-22 14:56:40.34705+00	2024-09-22 14:56:40.34705+00	\N	\N
addr_01J8D4M93F9CY3XYVVQFT28M6V	\N	\N	\N	\N	\N	\N	\N	th	\N	\N	\N	2024-09-22 15:11:59.595749+00	2024-09-22 15:11:59.595749+00	\N	\N
\.


--
-- Data for Name: analytics_config; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.analytics_config (id, created_at, updated_at, deleted_at, user_id, opt_out, anonymize) FROM stdin;
acfg_01J8BYTA54Y389J55B70JNDEN0	2024-09-22 04:11:11.396251+00	2024-09-22 04:11:11.396251+00	\N	usr_01J8BYT9WRWDHGYVQYE549GF6V	f	t
\.


--
-- Data for Name: batch_job; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.batch_job (id, type, created_by, context, result, dry_run, created_at, pre_processed_at, confirmed_at, processing_at, completed_at, failed_at, canceled_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.cart (id, email, billing_address_id, shipping_address_id, region_id, customer_id, payment_id, type, completed_at, created_at, updated_at, deleted_at, metadata, idempotency_key, context, payment_authorized_at, sales_channel_id) FROM stdin;
cart_01J8BYWCEZNCVJ4BBX4FBBZZTD	\N	\N	\N	reg_01J8BYQBJCYB0N9BYR9TR01HK0	\N	\N	default	\N	2024-09-22 04:12:19.181673+00	2024-09-22 04:12:19.181673+00	\N	\N	\N	{"ip": "::1", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"}	\N	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
cart_01J8BZ2061BXPCA2SB9Y89MEAY	\N	\N	\N	reg_01J8BYQBJCYB0N9BYR9TR01HK0	\N	\N	default	\N	2024-09-22 04:15:23.229123+00	2024-09-22 04:15:23.229123+00	\N	\N	\N	{"ip": "::1", "user_agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36"}	\N	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
cart_01J8BZ2DMZ29B0RJVAQTSFND3T	\N	\N	\N	reg_01J8BYQBJCYB0N9BYR9TR01HK0	\N	\N	default	\N	2024-09-22 04:15:37.025018+00	2024-09-22 04:15:37.025018+00	\N	\N	\N	{"ip": "::1", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"}	\N	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
cart_01J8BZ2DV7K39ZK3V7QMNYKJHN	pcbimon@gmail.com	addr_01J8D3P9Z4M69R50A4HJ5G31P4	addr_01J8D3P9Z4FDZ6NPYB7RTMCW61	reg_01J8BYQBJCYB0N9BYR9TR01HK0	cus_01J8D3NCEBW8NGPZ328E3FN7WQ	pay_01J8D3PH9A9VJH82WEEBFQK9XR	default	2024-09-22 14:55:44.967+00	2024-09-22 04:15:37.225781+00	2024-09-22 14:55:44.943454+00	\N	\N	\N	{"ip": "::1", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"}	2024-09-22 14:55:44.939+00	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
cart_01J8D3QFV17HV9G47KQ8S938ER	patipat.chewprecha@hotmail.com	addr_01J8D3R7D90DCT1VXA3GZMHPE6	addr_01J8D3R7D9NYMSVSM99MKRVBAK	reg_01J8BYQBJCYB0N9BYR9TR01HK0	cus_01J8D3R7D5B0RG69STH2J32XH0	pay_01J8D3RC7B3E022WGKTXTPV25N	default	2024-09-22 14:56:45.332+00	2024-09-22 14:56:16.22292+00	2024-09-22 14:56:45.295885+00	\N	\N	\N	{"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}	2024-09-22 14:56:45.292+00	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
cart_01J8D4M93FQDGXNWA8BXDP20K1	\N	\N	addr_01J8D4M93F9CY3XYVVQFT28M6V	reg_01J8D42DAW9NN5YTXY422JW2D4	\N	\N	default	\N	2024-09-22 15:11:59.595749+00	2024-09-22 15:11:59.595749+00	\N	\N	\N	{"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}	\N	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
\.


--
-- Data for Name: cart_discounts; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.cart_discounts (cart_id, discount_id) FROM stdin;
\.


--
-- Data for Name: cart_gift_cards; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.cart_gift_cards (cart_id, gift_card_id) FROM stdin;
\.


--
-- Data for Name: claim_image; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.claim_image (id, claim_item_id, url, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: claim_item; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.claim_item (id, claim_order_id, item_id, variant_id, reason, note, quantity, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: claim_item_tags; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.claim_item_tags (item_id, tag_id) FROM stdin;
\.


--
-- Data for Name: claim_order; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.claim_order (id, payment_status, fulfillment_status, type, order_id, shipping_address_id, refund_amount, canceled_at, created_at, updated_at, deleted_at, metadata, idempotency_key, no_notification) FROM stdin;
\.


--
-- Data for Name: claim_tag; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.claim_tag (id, value, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.country (id, iso_2, iso_3, num_code, name, display_name, region_id) FROM stdin;
1	af	afg	4	AFGHANISTAN	Afghanistan	\N
2	al	alb	8	ALBANIA	Albania	\N
3	dz	dza	12	ALGERIA	Algeria	\N
4	as	asm	16	AMERICAN SAMOA	American Samoa	\N
5	ad	and	20	ANDORRA	Andorra	\N
6	ao	ago	24	ANGOLA	Angola	\N
7	ai	aia	660	ANGUILLA	Anguilla	\N
8	aq	ata	10	ANTARCTICA	Antarctica	\N
9	ag	atg	28	ANTIGUA AND BARBUDA	Antigua and Barbuda	\N
10	ar	arg	32	ARGENTINA	Argentina	\N
11	am	arm	51	ARMENIA	Armenia	\N
12	aw	abw	533	ARUBA	Aruba	\N
13	au	aus	36	AUSTRALIA	Australia	\N
14	at	aut	40	AUSTRIA	Austria	\N
15	az	aze	31	AZERBAIJAN	Azerbaijan	\N
16	bs	bhs	44	BAHAMAS	Bahamas	\N
17	bh	bhr	48	BAHRAIN	Bahrain	\N
18	bd	bgd	50	BANGLADESH	Bangladesh	\N
19	bb	brb	52	BARBADOS	Barbados	\N
20	by	blr	112	BELARUS	Belarus	\N
21	be	bel	56	BELGIUM	Belgium	\N
22	bz	blz	84	BELIZE	Belize	\N
23	bj	ben	204	BENIN	Benin	\N
24	bm	bmu	60	BERMUDA	Bermuda	\N
25	bt	btn	64	BHUTAN	Bhutan	\N
26	bo	bol	68	BOLIVIA	Bolivia	\N
27	bq	bes	535	BONAIRE, SINT EUSTATIUS AND SABA	Bonaire, Sint Eustatius and Saba	\N
28	ba	bih	70	BOSNIA AND HERZEGOVINA	Bosnia and Herzegovina	\N
29	bw	bwa	72	BOTSWANA	Botswana	\N
30	bv	bvd	74	BOUVET ISLAND	Bouvet Island	\N
31	br	bra	76	BRAZIL	Brazil	\N
32	io	iot	86	BRITISH INDIAN OCEAN TERRITORY	British Indian Ocean Territory	\N
33	bn	brn	96	BRUNEI DARUSSALAM	Brunei Darussalam	\N
34	bg	bgr	100	BULGARIA	Bulgaria	\N
35	bf	bfa	854	BURKINA FASO	Burkina Faso	\N
36	bi	bdi	108	BURUNDI	Burundi	\N
37	kh	khm	116	CAMBODIA	Cambodia	\N
38	cm	cmr	120	CAMEROON	Cameroon	\N
40	cv	cpv	132	CAPE VERDE	Cape Verde	\N
41	ky	cym	136	CAYMAN ISLANDS	Cayman Islands	\N
42	cf	caf	140	CENTRAL AFRICAN REPUBLIC	Central African Republic	\N
43	td	tcd	148	CHAD	Chad	\N
44	cl	chl	152	CHILE	Chile	\N
45	cn	chn	156	CHINA	China	\N
46	cx	cxr	162	CHRISTMAS ISLAND	Christmas Island	\N
47	cc	cck	166	COCOS (KEELING) ISLANDS	Cocos (Keeling) Islands	\N
48	co	col	170	COLOMBIA	Colombia	\N
49	km	com	174	COMOROS	Comoros	\N
50	cg	cog	178	CONGO	Congo	\N
51	cd	cod	180	CONGO, THE DEMOCRATIC REPUBLIC OF THE	Congo, the Democratic Republic of the	\N
52	ck	cok	184	COOK ISLANDS	Cook Islands	\N
53	cr	cri	188	COSTA RICA	Costa Rica	\N
54	ci	civ	384	COTE D'IVOIRE	Cote D'Ivoire	\N
55	hr	hrv	191	CROATIA	Croatia	\N
56	cu	cub	192	CUBA	Cuba	\N
57	cw	cuw	531	CURAÇAO	Curaçao	\N
58	cy	cyp	196	CYPRUS	Cyprus	\N
59	cz	cze	203	CZECH REPUBLIC	Czech Republic	\N
61	dj	dji	262	DJIBOUTI	Djibouti	\N
62	dm	dma	212	DOMINICA	Dominica	\N
63	do	dom	214	DOMINICAN REPUBLIC	Dominican Republic	\N
64	ec	ecu	218	ECUADOR	Ecuador	\N
65	eg	egy	818	EGYPT	Egypt	\N
66	sv	slv	222	EL SALVADOR	El Salvador	\N
67	gq	gnq	226	EQUATORIAL GUINEA	Equatorial Guinea	\N
68	er	eri	232	ERITREA	Eritrea	\N
69	ee	est	233	ESTONIA	Estonia	\N
70	et	eth	231	ETHIOPIA	Ethiopia	\N
71	fk	flk	238	FALKLAND ISLANDS (MALVINAS)	Falkland Islands (Malvinas)	\N
72	fo	fro	234	FAROE ISLANDS	Faroe Islands	\N
73	fj	fji	242	FIJI	Fiji	\N
74	fi	fin	246	FINLAND	Finland	\N
76	gf	guf	254	FRENCH GUIANA	French Guiana	\N
77	pf	pyf	258	FRENCH POLYNESIA	French Polynesia	\N
78	tf	atf	260	FRENCH SOUTHERN TERRITORIES	French Southern Territories	\N
79	ga	gab	266	GABON	Gabon	\N
80	gm	gmb	270	GAMBIA	Gambia	\N
81	ge	geo	268	GEORGIA	Georgia	\N
83	gh	gha	288	GHANA	Ghana	\N
84	gi	gib	292	GIBRALTAR	Gibraltar	\N
85	gr	grc	300	GREECE	Greece	\N
86	gl	grl	304	GREENLAND	Greenland	\N
87	gd	grd	308	GRENADA	Grenada	\N
88	gp	glp	312	GUADELOUPE	Guadeloupe	\N
89	gu	gum	316	GUAM	Guam	\N
90	gt	gtm	320	GUATEMALA	Guatemala	\N
91	gg	ggy	831	GUERNSEY	Guernsey	\N
92	gn	gin	324	GUINEA	Guinea	\N
93	gw	gnb	624	GUINEA-BISSAU	Guinea-Bissau	\N
94	gy	guy	328	GUYANA	Guyana	\N
95	ht	hti	332	HAITI	Haiti	\N
96	hm	hmd	334	HEARD ISLAND AND MCDONALD ISLANDS	Heard Island And Mcdonald Islands	\N
97	va	vat	336	HOLY SEE (VATICAN CITY STATE)	Holy See (Vatican City State)	\N
98	hn	hnd	340	HONDURAS	Honduras	\N
99	hk	hkg	344	HONG KONG	Hong Kong	\N
100	hu	hun	348	HUNGARY	Hungary	\N
101	is	isl	352	ICELAND	Iceland	\N
102	in	ind	356	INDIA	India	\N
103	id	idn	360	INDONESIA	Indonesia	\N
104	ir	irn	364	IRAN, ISLAMIC REPUBLIC OF	Iran, Islamic Republic of	\N
105	iq	irq	368	IRAQ	Iraq	\N
106	ie	irl	372	IRELAND	Ireland	\N
107	im	imn	833	ISLE OF MAN	Isle Of Man	\N
108	il	isr	376	ISRAEL	Israel	\N
110	jm	jam	388	JAMAICA	Jamaica	\N
111	jp	jpn	392	JAPAN	Japan	\N
112	je	jey	832	JERSEY	Jersey	\N
113	jo	jor	400	JORDAN	Jordan	\N
114	kz	kaz	398	KAZAKHSTAN	Kazakhstan	\N
115	ke	ken	404	KENYA	Kenya	\N
116	ki	kir	296	KIRIBATI	Kiribati	\N
117	kp	prk	408	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	Korea, Democratic People's Republic of	\N
118	kr	kor	410	KOREA, REPUBLIC OF	Korea, Republic of	\N
119	xk	xkx	900	KOSOVO	Kosovo	\N
120	kw	kwt	414	KUWAIT	Kuwait	\N
121	kg	kgz	417	KYRGYZSTAN	Kyrgyzstan	\N
122	la	lao	418	LAO PEOPLE'S DEMOCRATIC REPUBLIC	Lao People's Democratic Republic	\N
123	lv	lva	428	LATVIA	Latvia	\N
124	lb	lbn	422	LEBANON	Lebanon	\N
125	ls	lso	426	LESOTHO	Lesotho	\N
126	lr	lbr	430	LIBERIA	Liberia	\N
127	ly	lby	434	LIBYA	Libya	\N
128	li	lie	438	LIECHTENSTEIN	Liechtenstein	\N
129	lt	ltu	440	LITHUANIA	Lithuania	\N
130	lu	lux	442	LUXEMBOURG	Luxembourg	\N
131	mo	mac	446	MACAO	Macao	\N
132	mk	mkd	807	MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF	Macedonia, the Former Yugoslav Republic of	\N
133	mg	mdg	450	MADAGASCAR	Madagascar	\N
134	mw	mwi	454	MALAWI	Malawi	\N
135	my	mys	458	MALAYSIA	Malaysia	\N
136	mv	mdv	462	MALDIVES	Maldives	\N
137	ml	mli	466	MALI	Mali	\N
138	mt	mlt	470	MALTA	Malta	\N
139	mh	mhl	584	MARSHALL ISLANDS	Marshall Islands	\N
140	mq	mtq	474	MARTINIQUE	Martinique	\N
141	mr	mrt	478	MAURITANIA	Mauritania	\N
142	mu	mus	480	MAURITIUS	Mauritius	\N
143	yt	myt	175	MAYOTTE	Mayotte	\N
144	mx	mex	484	MEXICO	Mexico	\N
145	fm	fsm	583	MICRONESIA, FEDERATED STATES OF	Micronesia, Federated States of	\N
146	md	mda	498	MOLDOVA, REPUBLIC OF	Moldova, Republic of	\N
147	mc	mco	492	MONACO	Monaco	\N
148	mn	mng	496	MONGOLIA	Mongolia	\N
149	me	mne	499	MONTENEGRO	Montenegro	\N
150	ms	msr	500	MONTSERRAT	Montserrat	\N
151	ma	mar	504	MOROCCO	Morocco	\N
152	mz	moz	508	MOZAMBIQUE	Mozambique	\N
153	mm	mmr	104	MYANMAR	Myanmar	\N
154	na	nam	516	NAMIBIA	Namibia	\N
155	nr	nru	520	NAURU	Nauru	\N
156	np	npl	524	NEPAL	Nepal	\N
157	nl	nld	528	NETHERLANDS	Netherlands	\N
158	nc	ncl	540	NEW CALEDONIA	New Caledonia	\N
159	nz	nzl	554	NEW ZEALAND	New Zealand	\N
160	ni	nic	558	NICARAGUA	Nicaragua	\N
161	ne	ner	562	NIGER	Niger	\N
162	ng	nga	566	NIGERIA	Nigeria	\N
163	nu	niu	570	NIUE	Niue	\N
164	nf	nfk	574	NORFOLK ISLAND	Norfolk Island	\N
165	mp	mnp	580	NORTHERN MARIANA ISLANDS	Northern Mariana Islands	\N
166	no	nor	578	NORWAY	Norway	\N
167	om	omn	512	OMAN	Oman	\N
168	pk	pak	586	PAKISTAN	Pakistan	\N
169	pw	plw	585	PALAU	Palau	\N
170	ps	pse	275	PALESTINIAN TERRITORY, OCCUPIED	Palestinian Territory, Occupied	\N
171	pa	pan	591	PANAMA	Panama	\N
172	pg	png	598	PAPUA NEW GUINEA	Papua New Guinea	\N
173	py	pry	600	PARAGUAY	Paraguay	\N
174	pe	per	604	PERU	Peru	\N
175	ph	phl	608	PHILIPPINES	Philippines	\N
176	pn	pcn	612	PITCAIRN	Pitcairn	\N
177	pl	pol	616	POLAND	Poland	\N
178	pt	prt	620	PORTUGAL	Portugal	\N
179	pr	pri	630	PUERTO RICO	Puerto Rico	\N
180	qa	qat	634	QATAR	Qatar	\N
181	re	reu	638	REUNION	Reunion	\N
182	ro	rom	642	ROMANIA	Romania	\N
183	ru	rus	643	RUSSIAN FEDERATION	Russian Federation	\N
184	rw	rwa	646	RWANDA	Rwanda	\N
185	bl	blm	652	SAINT BARTHÉLEMY	Saint Barthélemy	\N
186	sh	shn	654	SAINT HELENA	Saint Helena	\N
187	kn	kna	659	SAINT KITTS AND NEVIS	Saint Kitts and Nevis	\N
188	lc	lca	662	SAINT LUCIA	Saint Lucia	\N
189	mf	maf	663	SAINT MARTIN (FRENCH PART)	Saint Martin (French part)	\N
190	pm	spm	666	SAINT PIERRE AND MIQUELON	Saint Pierre and Miquelon	\N
191	vc	vct	670	SAINT VINCENT AND THE GRENADINES	Saint Vincent and the Grenadines	\N
192	ws	wsm	882	SAMOA	Samoa	\N
193	sm	smr	674	SAN MARINO	San Marino	\N
194	st	stp	678	SAO TOME AND PRINCIPE	Sao Tome and Principe	\N
195	sa	sau	682	SAUDI ARABIA	Saudi Arabia	\N
196	sn	sen	686	SENEGAL	Senegal	\N
197	rs	srb	688	SERBIA	Serbia	\N
198	sc	syc	690	SEYCHELLES	Seychelles	\N
199	sl	sle	694	SIERRA LEONE	Sierra Leone	\N
200	sg	sgp	702	SINGAPORE	Singapore	\N
201	sx	sxm	534	SINT MAARTEN	Sint Maarten	\N
202	sk	svk	703	SLOVAKIA	Slovakia	\N
203	si	svn	705	SLOVENIA	Slovenia	\N
204	sb	slb	90	SOLOMON ISLANDS	Solomon Islands	\N
205	so	som	706	SOMALIA	Somalia	\N
206	za	zaf	710	SOUTH AFRICA	South Africa	\N
207	gs	sgs	239	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	South Georgia and the South Sandwich Islands	\N
208	ss	ssd	728	SOUTH SUDAN	South Sudan	\N
210	lk	lka	144	SRI LANKA	Sri Lanka	\N
211	sd	sdn	729	SUDAN	Sudan	\N
212	sr	sur	740	SURINAME	Suriname	\N
213	sj	sjm	744	SVALBARD AND JAN MAYEN	Svalbard and Jan Mayen	\N
214	sz	swz	748	SWAZILAND	Swaziland	\N
216	ch	che	756	SWITZERLAND	Switzerland	\N
217	sy	syr	760	SYRIAN ARAB REPUBLIC	Syrian Arab Republic	\N
218	tw	twn	158	TAIWAN, PROVINCE OF CHINA	Taiwan, Province of China	\N
219	tj	tjk	762	TAJIKISTAN	Tajikistan	\N
220	tz	tza	834	TANZANIA, UNITED REPUBLIC OF	Tanzania, United Republic of	\N
222	tl	tls	626	TIMOR LESTE	Timor Leste	\N
223	tg	tgo	768	TOGO	Togo	\N
224	tk	tkl	772	TOKELAU	Tokelau	\N
225	to	ton	776	TONGA	Tonga	\N
226	tt	tto	780	TRINIDAD AND TOBAGO	Trinidad and Tobago	\N
227	tn	tun	788	TUNISIA	Tunisia	\N
228	tr	tur	792	TURKEY	Turkey	\N
229	tm	tkm	795	TURKMENISTAN	Turkmenistan	\N
230	tc	tca	796	TURKS AND CAICOS ISLANDS	Turks and Caicos Islands	\N
221	th	tha	764	THAILAND	Thailand	reg_01J8D42DAW9NN5YTXY422JW2D4
231	tv	tuv	798	TUVALU	Tuvalu	\N
232	ug	uga	800	UGANDA	Uganda	\N
233	ua	ukr	804	UKRAINE	Ukraine	\N
234	ae	are	784	UNITED ARAB EMIRATES	United Arab Emirates	\N
237	um	umi	581	UNITED STATES MINOR OUTLYING ISLANDS	United States Minor Outlying Islands	\N
238	uy	ury	858	URUGUAY	Uruguay	\N
239	uz	uzb	860	UZBEKISTAN	Uzbekistan	\N
240	vu	vut	548	VANUATU	Vanuatu	\N
241	ve	ven	862	VENEZUELA	Venezuela	\N
242	vn	vnm	704	VIET NAM	Viet Nam	\N
243	vg	vgb	92	VIRGIN ISLANDS, BRITISH	Virgin Islands, British	\N
244	vi	vir	850	VIRGIN ISLANDS, U.S.	Virgin Islands, U.S.	\N
245	wf	wlf	876	WALLIS AND FUTUNA	Wallis and Futuna	\N
246	eh	esh	732	WESTERN SAHARA	Western Sahara	\N
247	ye	yem	887	YEMEN	Yemen	\N
248	zm	zmb	894	ZAMBIA	Zambia	\N
249	zw	zwe	716	ZIMBABWE	Zimbabwe	\N
250	ax	ala	248	ÅLAND ISLANDS	Åland Islands	\N
235	gb	gbr	826	UNITED KINGDOM	United Kingdom	reg_01J8BYQANZ18VMHSHMJYBDMNPJ
82	de	deu	276	GERMANY	Germany	reg_01J8BYQANZ18VMHSHMJYBDMNPJ
60	dk	dnk	208	DENMARK	Denmark	reg_01J8BYQANZ18VMHSHMJYBDMNPJ
215	se	swe	752	SWEDEN	Sweden	reg_01J8BYQANZ18VMHSHMJYBDMNPJ
75	fr	fra	250	FRANCE	France	reg_01J8BYQANZ18VMHSHMJYBDMNPJ
209	es	esp	724	SPAIN	Spain	reg_01J8BYQANZ18VMHSHMJYBDMNPJ
109	it	ita	380	ITALY	Italy	reg_01J8BYQANZ18VMHSHMJYBDMNPJ
236	us	usa	840	UNITED STATES	United States	reg_01J8BYQBJCYB0N9BYR9TR01HK0
39	ca	can	124	CANADA	Canada	reg_01J8BYQBJCYB0N9BYR9TR01HK0
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.currency (code, symbol, symbol_native, name) FROM stdin;
usd	$	$	US Dollar
cad	CA$	$	Canadian Dollar
eur	€	€	Euro
aed	AED	د.إ.‏	United Arab Emirates Dirham
afn	Af	؋	Afghan Afghani
all	ALL	Lek	Albanian Lek
amd	AMD	դր.	Armenian Dram
ars	AR$	$	Argentine Peso
aud	AU$	$	Australian Dollar
azn	man.	ман.	Azerbaijani Manat
bam	KM	KM	Bosnia-Herzegovina Convertible Mark
bdt	Tk	৳	Bangladeshi Taka
bgn	BGN	лв.	Bulgarian Lev
bhd	BD	د.ب.‏	Bahraini Dinar
bif	FBu	FBu	Burundian Franc
bnd	BN$	$	Brunei Dollar
bob	Bs	Bs	Bolivian Boliviano
brl	R$	R$	Brazilian Real
bwp	BWP	P	Botswanan Pula
byn	Br	руб.	Belarusian Ruble
bzd	BZ$	$	Belize Dollar
cdf	CDF	FrCD	Congolese Franc
chf	CHF	CHF	Swiss Franc
clp	CL$	$	Chilean Peso
cny	CN¥	CN¥	Chinese Yuan
cop	CO$	$	Colombian Peso
crc	₡	₡	Costa Rican Colón
cve	CV$	CV$	Cape Verdean Escudo
czk	Kč	Kč	Czech Republic Koruna
djf	Fdj	Fdj	Djiboutian Franc
dkk	Dkr	kr	Danish Krone
dop	RD$	RD$	Dominican Peso
dzd	DA	د.ج.‏	Algerian Dinar
eek	Ekr	kr	Estonian Kroon
egp	EGP	ج.م.‏	Egyptian Pound
ern	Nfk	Nfk	Eritrean Nakfa
etb	Br	Br	Ethiopian Birr
gbp	£	£	British Pound Sterling
gel	GEL	GEL	Georgian Lari
ghs	GH₵	GH₵	Ghanaian Cedi
gnf	FG	FG	Guinean Franc
gtq	GTQ	Q	Guatemalan Quetzal
hkd	HK$	$	Hong Kong Dollar
hnl	HNL	L	Honduran Lempira
hrk	kn	kn	Croatian Kuna
huf	Ft	Ft	Hungarian Forint
idr	Rp	Rp	Indonesian Rupiah
ils	₪	₪	Israeli New Sheqel
inr	Rs	₹	Indian Rupee
iqd	IQD	د.ع.‏	Iraqi Dinar
irr	IRR	﷼	Iranian Rial
isk	Ikr	kr	Icelandic Króna
jmd	J$	$	Jamaican Dollar
jod	JD	د.أ.‏	Jordanian Dinar
jpy	¥	￥	Japanese Yen
kes	Ksh	Ksh	Kenyan Shilling
khr	KHR	៛	Cambodian Riel
kmf	CF	FC	Comorian Franc
krw	₩	₩	South Korean Won
kwd	KD	د.ك.‏	Kuwaiti Dinar
kzt	KZT	тңг.	Kazakhstani Tenge
lbp	LB£	ل.ل.‏	Lebanese Pound
lkr	SLRs	SL Re	Sri Lankan Rupee
ltl	Lt	Lt	Lithuanian Litas
lvl	Ls	Ls	Latvian Lats
lyd	LD	د.ل.‏	Libyan Dinar
mad	MAD	د.م.‏	Moroccan Dirham
mdl	MDL	MDL	Moldovan Leu
mga	MGA	MGA	Malagasy Ariary
mkd	MKD	MKD	Macedonian Denar
mmk	MMK	K	Myanma Kyat
mnt	MNT	₮	Mongolian Tugrig
mop	MOP$	MOP$	Macanese Pataca
mur	MURs	MURs	Mauritian Rupee
mxn	MX$	$	Mexican Peso
myr	RM	RM	Malaysian Ringgit
mzn	MTn	MTn	Mozambican Metical
nad	N$	N$	Namibian Dollar
ngn	₦	₦	Nigerian Naira
nio	C$	C$	Nicaraguan Córdoba
nok	Nkr	kr	Norwegian Krone
npr	NPRs	नेरू	Nepalese Rupee
nzd	NZ$	$	New Zealand Dollar
omr	OMR	ر.ع.‏	Omani Rial
pab	B/.	B/.	Panamanian Balboa
pen	S/.	S/.	Peruvian Nuevo Sol
php	₱	₱	Philippine Peso
pkr	PKRs	₨	Pakistani Rupee
pln	zł	zł	Polish Zloty
pyg	₲	₲	Paraguayan Guarani
qar	QR	ر.ق.‏	Qatari Rial
ron	RON	RON	Romanian Leu
rsd	din.	дин.	Serbian Dinar
rub	RUB	₽.	Russian Ruble
rwf	RWF	FR	Rwandan Franc
sar	SR	ر.س.‏	Saudi Riyal
sdg	SDG	SDG	Sudanese Pound
sek	Skr	kr	Swedish Krona
sgd	S$	$	Singapore Dollar
sos	Ssh	Ssh	Somali Shilling
syp	SY£	ل.س.‏	Syrian Pound
thb	฿	฿	Thai Baht
tnd	DT	د.ت.‏	Tunisian Dinar
top	T$	T$	Tongan Paʻanga
try	TL	TL	Turkish Lira
ttd	TT$	$	Trinidad and Tobago Dollar
twd	NT$	NT$	New Taiwan Dollar
tzs	TSh	TSh	Tanzanian Shilling
uah	₴	₴	Ukrainian Hryvnia
ugx	USh	USh	Ugandan Shilling
uyu	$U	$	Uruguayan Peso
uzs	UZS	UZS	Uzbekistan Som
vef	Bs.F.	Bs.F.	Venezuelan Bolívar
vnd	₫	₫	Vietnamese Dong
xaf	FCFA	FCFA	CFA Franc BEAC
xof	CFA	CFA	CFA Franc BCEAO
yer	YR	ر.ي.‏	Yemeni Rial
zar	R	R	South African Rand
zmk	ZK	ZK	Zambian Kwacha
zwl	ZWL$	ZWL$	Zimbabwean Dollar
\.


--
-- Data for Name: custom_shipping_option; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.custom_shipping_option (id, price, shipping_option_id, cart_id, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.customer (id, email, first_name, last_name, billing_address_id, password_hash, phone, has_account, created_at, updated_at, deleted_at, metadata) FROM stdin;
cus_01J8D3NCEBW8NGPZ328E3FN7WQ	pcbimon@gmail.com	Patipat	Chewprecha	\N	c2NyeXB0AAEAAAABAAAAAdN17Hs7rPLogBiCpyuWYi1BXBvaCVcfVJTMpHRh2Ue/g0erYbLUVDivl/Ska6/sLcF9K6mGrX+eNdXC1SKOuw9FE3gaTgljTqd+LDu9gXCj		t	2024-09-22 14:55:07.209455+00	2024-09-22 14:55:07.209455+00	\N	\N
cus_01J8D3R7D5B0RG69STH2J32XH0	patipat.chewprecha@hotmail.com	\N	\N	\N	\N	\N	f	2024-09-22 14:56:40.34705+00	2024-09-22 14:56:40.34705+00	\N	\N
\.


--
-- Data for Name: customer_group; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.customer_group (id, name, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: customer_group_customers; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.customer_group_customers (customer_group_id, customer_id) FROM stdin;
\.


--
-- Data for Name: discount; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.discount (id, code, is_dynamic, rule_id, is_disabled, parent_discount_id, starts_at, ends_at, created_at, updated_at, deleted_at, metadata, usage_limit, usage_count, valid_duration) FROM stdin;
\.


--
-- Data for Name: discount_condition; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.discount_condition (id, type, operator, discount_rule_id, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_condition_customer_group; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.discount_condition_customer_group (customer_group_id, condition_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_condition_product; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.discount_condition_product (product_id, condition_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_condition_product_collection; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.discount_condition_product_collection (product_collection_id, condition_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_condition_product_tag; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.discount_condition_product_tag (product_tag_id, condition_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_condition_product_type; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.discount_condition_product_type (product_type_id, condition_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_regions; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.discount_regions (discount_id, region_id) FROM stdin;
\.


--
-- Data for Name: discount_rule; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.discount_rule (id, description, type, value, allocation, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: discount_rule_products; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.discount_rule_products (discount_rule_id, product_id) FROM stdin;
\.


--
-- Data for Name: draft_order; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.draft_order (id, status, display_id, cart_id, order_id, canceled_at, created_at, updated_at, completed_at, metadata, idempotency_key, no_notification_order) FROM stdin;
\.


--
-- Data for Name: fulfillment; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.fulfillment (id, swap_id, order_id, tracking_numbers, data, shipped_at, canceled_at, created_at, updated_at, metadata, idempotency_key, provider_id, claim_order_id, no_notification, location_id) FROM stdin;
\.


--
-- Data for Name: fulfillment_item; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.fulfillment_item (fulfillment_id, item_id, quantity) FROM stdin;
\.


--
-- Data for Name: fulfillment_provider; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.fulfillment_provider (id, is_installed) FROM stdin;
manual	t
\.


--
-- Data for Name: gift_card; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.gift_card (id, code, value, balance, region_id, order_id, is_disabled, ends_at, created_at, updated_at, deleted_at, metadata, tax_rate) FROM stdin;
\.


--
-- Data for Name: gift_card_transaction; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.gift_card_transaction (id, gift_card_id, order_id, amount, created_at, is_taxable, tax_rate) FROM stdin;
\.


--
-- Data for Name: idempotency_key; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.idempotency_key (id, idempotency_key, created_at, locked_at, request_method, request_params, request_path, response_code, response_body, recovery_point) FROM stdin;
ikey_01J8D3NQ5VBQ5Y2JR30H6VASWV	47523aee-a6b0-4e67-a8d0-b5e2160ffa48	2024-09-22 14:55:18.201411+00	\N	POST	{"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN"}	/cart_01J8BZ2DV7K39ZK3V7QMNYKJHN/payment-sessions	200	{"cart": {"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "type": "default", "email": "pcbimon@gmail.com", "items": [{"id": "item_01J8BZ2EDZNN00WR10PC7HFDYE", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "variant": {"id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "title": "Medusa T-Shirt", "width": null, "handle": "medusa-t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:11:31.557Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01J8BYTXH3NKK0VFK37JBH4KWX", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "product_id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "updated_at": "2024-09-22T04:11:31.557Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8BZ2EDZNN00WR10PC7HFDYE"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:15:37.225Z", "unit_price": 2200, "updated_at": "2024-09-22T04:15:37.225Z", "variant_id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 2200, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"}, "payment": null, "customer": {"id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "email": "pcbimon@gmail.com", "phone": "", "metadata": null, "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:07.209Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:07.209Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T04:15:37.225Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:55:18.147Z", "customer_id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:18.212Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:18.212Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01J8D3PA2JNHJPAD7Q48HMNT03	944cf570-c583-44c0-af44-9f891d99f2b3	2024-09-22 14:55:37.552293+00	\N	POST	{"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN"}	/cart_01J8BZ2DV7K39ZK3V7QMNYKJHN/payment-sessions	200	{"cart": {"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "type": "default", "email": "pcbimon@gmail.com", "items": [{"id": "item_01J8BZ2EDZNN00WR10PC7HFDYE", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "variant": {"id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "title": "Medusa T-Shirt", "width": null, "handle": "medusa-t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:11:31.557Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01J8BYTXH3NKK0VFK37JBH4KWX", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "product_id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "updated_at": "2024-09-22T04:11:31.557Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8BZ2EDZNN00WR10PC7HFDYE"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:15:37.225Z", "unit_price": 2200, "updated_at": "2024-09-22T04:15:37.225Z", "variant_id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 2200, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"}, "payment": null, "customer": {"id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "email": "pcbimon@gmail.com", "phone": "", "metadata": null, "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:07.209Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:07.209Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T04:15:37.225Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": {"id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:18.212Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:18.212Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "shipping_methods": [], "billing_address_id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "payment_authorized_at": null}}	finished
ikey_01J8D3PA2WBS5D0RY5MRP41SBM	87e25e0a-1775-4332-a4cc-05c49c0c7eee	2024-09-22 14:55:37.56292+00	\N	POST	{"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN"}	/cart_01J8BZ2DV7K39ZK3V7QMNYKJHN/payment-sessions	200	{"cart": {"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "type": "default", "email": "pcbimon@gmail.com", "items": [{"id": "item_01J8BZ2EDZNN00WR10PC7HFDYE", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "variant": {"id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "title": "Medusa T-Shirt", "width": null, "handle": "medusa-t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:11:31.557Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01J8BYTXH3NKK0VFK37JBH4KWX", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "product_id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "updated_at": "2024-09-22T04:11:31.557Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8BZ2EDZNN00WR10PC7HFDYE"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:15:37.225Z", "unit_price": 2200, "updated_at": "2024-09-22T04:15:37.225Z", "variant_id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 2200, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"}, "payment": null, "customer": {"id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "email": "pcbimon@gmail.com", "phone": "", "metadata": null, "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:07.209Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:07.209Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T04:15:37.225Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": {"id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:18.212Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:18.212Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "shipping_methods": [], "billing_address_id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "payment_authorized_at": null}}	finished
ikey_01J8D3PBHZKGH6M12DKEBD30B0	4a7467a0-16a6-4cc9-a2dd-ca75e9aaf0c1	2024-09-22 14:55:39.07066+00	\N	POST	{"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN"}	/cart_01J8BZ2DV7K39ZK3V7QMNYKJHN/payment-sessions	200	{"cart": {"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "type": "default", "email": "pcbimon@gmail.com", "items": [{"id": "item_01J8BZ2EDZNN00WR10PC7HFDYE", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "variant": {"id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "title": "Medusa T-Shirt", "width": null, "handle": "medusa-t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:11:31.557Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01J8BYTXH3NKK0VFK37JBH4KWX", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "product_id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "updated_at": "2024-09-22T04:11:31.557Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8BZ2EDZNN00WR10PC7HFDYE"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:15:37.225Z", "unit_price": 2200, "updated_at": "2024-09-22T14:55:39.032Z", "variant_id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 3000, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"}, "payment": null, "customer": {"id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "email": "pcbimon@gmail.com", "phone": "", "metadata": null, "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:07.209Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:07.209Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T04:15:37.225Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 800, "billing_address": {"id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:38.986Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:38.986Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "shipping_methods": [{"id": "sm_01J8D3PBFQEF4YGDR9T33C1RHC", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "order_id": null, "subtotal": 800, "return_id": null, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "shipping_method_id": "sm_01J8D3PBFQEF4YGDR9T33C1RHC"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "shipping_option": {"id": "so_01J8BYQCHM6TYND255921H5YR4", "data": {"id": "manual-fulfillment"}, "name": "FakeEx Standard", "amount": 800, "metadata": null, "is_return": false, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "admin_only": false, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "price_type": "flat_rate", "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "provider_id": "manual"}, "original_tax_total": 0, "shipping_option_id": "so_01J8BYQCHM6TYND255921H5YR4"}], "billing_address_id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "payment_authorized_at": null}}	finished
ikey_01J8D3PE15HGVZKYQRXFZKJ958	c25702be-0f21-494b-9099-c3779683f8e9	2024-09-22 14:55:41.604732+00	\N	POST	{"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN"}	/cart_01J8BZ2DV7K39ZK3V7QMNYKJHN/payment-sessions	200	{"cart": {"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "type": "default", "email": "pcbimon@gmail.com", "items": [{"id": "item_01J8BZ2EDZNN00WR10PC7HFDYE", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "variant": {"id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "title": "Medusa T-Shirt", "width": null, "handle": "medusa-t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:11:31.557Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01J8BYTXH3NKK0VFK37JBH4KWX", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "product_id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "updated_at": "2024-09-22T04:11:31.557Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8BZ2EDZNN00WR10PC7HFDYE"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:15:37.225Z", "unit_price": 2200, "updated_at": "2024-09-22T14:55:39.032Z", "variant_id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 3000, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"}, "payment": null, "customer": {"id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "email": "pcbimon@gmail.com", "phone": "", "metadata": null, "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:07.209Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:07.209Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T04:15:37.225Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 800, "billing_address": {"id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:38.986Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:38.986Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "shipping_methods": [{"id": "sm_01J8D3PBFQEF4YGDR9T33C1RHC", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "order_id": null, "subtotal": 800, "return_id": null, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "shipping_method_id": "sm_01J8D3PBFQEF4YGDR9T33C1RHC"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "shipping_option": {"id": "so_01J8BYQCHM6TYND255921H5YR4", "data": {"id": "manual-fulfillment"}, "name": "FakeEx Standard", "amount": 800, "metadata": null, "is_return": false, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "admin_only": false, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "price_type": "flat_rate", "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "provider_id": "manual"}, "original_tax_total": 0, "shipping_option_id": "so_01J8BYQCHM6TYND255921H5YR4"}], "billing_address_id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "payment_authorized_at": null}}	finished
ikey_01J8D3PF85B1852MVJGMDF5F8H	f0aed765-a566-4b90-b5fa-18d2ddddc2d8	2024-09-22 14:55:42.852396+00	\N	POST	{"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN"}	/cart_01J8BZ2DV7K39ZK3V7QMNYKJHN/payment-sessions	200	{"cart": {"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "type": "default", "email": "pcbimon@gmail.com", "items": [{"id": "item_01J8BZ2EDZNN00WR10PC7HFDYE", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "variant": {"id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "title": "Medusa T-Shirt", "width": null, "handle": "medusa-t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:11:31.557Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01J8BYTXH3NKK0VFK37JBH4KWX", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "product_id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "updated_at": "2024-09-22T04:11:31.557Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8BZ2EDZNN00WR10PC7HFDYE"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:15:37.225Z", "unit_price": 2200, "updated_at": "2024-09-22T14:55:39.032Z", "variant_id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 3000, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::1", "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36"}, "payment": null, "customer": {"id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "email": "pcbimon@gmail.com", "phone": "", "metadata": null, "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:07.209Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:07.209Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T04:15:37.225Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 800, "billing_address": {"id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:38.986Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3NQ6641SC2JYHCW51XV01", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "created_at": "2024-09-22T14:55:18.212Z", "updated_at": "2024-09-22T14:55:38.986Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "shipping_methods": [{"id": "sm_01J8D3PBFQEF4YGDR9T33C1RHC", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "order_id": null, "subtotal": 800, "return_id": null, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "shipping_method_id": "sm_01J8D3PBFQEF4YGDR9T33C1RHC"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "shipping_option": {"id": "so_01J8BYQCHM6TYND255921H5YR4", "data": {"id": "manual-fulfillment"}, "name": "FakeEx Standard", "amount": 800, "metadata": null, "is_return": false, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "admin_only": false, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "price_type": "flat_rate", "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "provider_id": "manual"}, "original_tax_total": 0, "shipping_option_id": "so_01J8BYQCHM6TYND255921H5YR4"}], "billing_address_id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "payment_authorized_at": null}}	finished
ikey_01J8D3PH8H974PTG0W3V0WKRNZ	6602d173-9676-4690-9183-61ae1477bf9d	2024-09-22 14:55:44.912707+00	\N	POST	{"id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN"}	/cart_01J8BZ2DV7K39ZK3V7QMNYKJHN/complete	200	{"data": {"id": "order_01J8D3PH9ZE4S9MGG87P00W6B3", "email": "pcbimon@gmail.com", "items": [{"id": "item_01J8BZ2EDZNN00WR10PC7HFDYE", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "variant": {"id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:11:31.557Z", "deleted_at": null, "product_id": "prod_01J8BYTY2ZG983PSSPZV641XGG", "updated_at": "2024-09-22T14:55:44.943Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 99}, "metadata": {}, "order_id": "order_01J8D3PH9ZE4S9MGG87P00W6B3", "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"id": "litl_01J8D3PH8R5D0JY1P6QC78GSPM", "code": "default", "name": "default", "rate": 0, "item_id": "item_01J8BZ2EDZNN00WR10PC7HFDYE", "metadata": null, "created_at": "2024-09-22T14:55:44.915Z", "updated_at": "2024-09-22T14:55:44.943Z"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:15:37.225Z", "refundable": 2200, "unit_price": 2200, "updated_at": "2024-09-22T14:55:44.943Z", "variant_id": "variant_01J8BYTYMV1E0K303K4YEGGAH5", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "swaps": [], "total": 3000, "claims": [], "object": "order", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "gift_cards_taxable": true}, "status": "pending", "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "refunds": [], "metadata": {}, "payments": [{"id": "pay_01J8D3PH9A9VJH82WEEBFQK9XR", "data": {"status": "authorized"}, "amount": 3000, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "metadata": null, "order_id": "order_01J8D3PH9ZE4S9MGG87P00W6B3", "created_at": "2024-09-22T14:55:44.923Z", "updated_at": "2024-09-22T14:55:44.943Z", "canceled_at": null, "captured_at": null, "provider_id": "manual", "currency_code": "usd", "amount_refunded": 0, "idempotency_key": null}], "subtotal": 2200, "tax_rate": null, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T14:55:44.943Z", "display_id": 1, "gift_cards": [], "paid_total": 3000, "updated_at": "2024-09-22T14:55:44.943Z", "canceled_at": null, "customer_id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "external_id": null, "currency_code": "usd", "discount_total": 0, "draft_order_id": null, "item_tax_total": 0, "payment_status": "awaiting", "refunded_total": 0, "shipping_total": 800, "gift_card_total": 0, "idempotency_key": null, "no_notification": null, "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "111", "address_2": "", "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:37.423Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:37.423Z", "customer_id": null, "postal_code": "73170", "country_code": "us"}, "shipping_methods": [{"id": "sm_01J8D3PBFQEF4YGDR9T33C1RHC", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01J8BZ2DV7K39ZK3V7QMNYKJHN", "swap_id": null, "order_id": "order_01J8D3PH9ZE4S9MGG87P00W6B3", "subtotal": 800, "return_id": null, "tax_lines": [{"id": "smtl_01J8D3PH8S5PEVXKE67GJV38RD", "code": "default", "name": "default", "rate": 0, "metadata": null, "created_at": "2024-09-22T14:55:44.915Z", "updated_at": "2024-09-22T14:55:44.943Z", "shipping_method_id": "sm_01J8D3PBFQEF4YGDR9T33C1RHC"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "original_tax_total": 0, "shipping_option_id": "so_01J8BYQCHM6TYND255921H5YR4"}], "refundable_amount": 3000, "billing_address_id": "addr_01J8D3P9Z4M69R50A4HJ5G31P4", "fulfillment_status": "not_fulfilled", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3P9Z4FDZ6NPYB7RTMCW61", "gift_card_transactions": []}, "type": "order"}	finished
ikey_01J8D3RC6PPDZZ496HFJR42Z6D	f812d2df-a13b-4bf9-a646-c4797ce48623	2024-09-22 14:56:45.269192+00	\N	POST	{"id": "cart_01J8D3QFV17HV9G47KQ8S938ER"}	/cart_01J8D3QFV17HV9G47KQ8S938ER/complete	200	{"data": {"id": "order_01J8D3RC8ETYVE7HJ6J7AD7RGE", "email": "patipat.chewprecha@hotmail.com", "items": [{"id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "variant": {"id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "product_id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "updated_at": "2024-09-22T14:56:45.295Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 99}, "metadata": {}, "order_id": "order_01J8D3RC8ETYVE7HJ6J7AD7RGE", "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"id": "litl_01J8D3RC6X6HVE7VRFC8CYQR12", "code": "default", "name": "default", "rate": 0, "item_id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H", "metadata": null, "created_at": "2024-09-22T14:56:45.272Z", "updated_at": "2024-09-22T14:56:45.295Z"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T14:56:16.246Z", "refundable": 2200, "unit_price": 2200, "updated_at": "2024-09-22T14:56:45.295Z", "variant_id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": true, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "swaps": [], "total": 3000, "claims": [], "object": "order", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "gift_cards_taxable": true}, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "refunds": [], "metadata": {}, "payments": [{"id": "pay_01J8D3RC7B3E022WGKTXTPV25N", "data": {"status": "authorized"}, "amount": 3000, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "metadata": null, "order_id": "order_01J8D3RC8ETYVE7HJ6J7AD7RGE", "created_at": "2024-09-22T14:56:45.280Z", "updated_at": "2024-09-22T14:56:45.295Z", "canceled_at": null, "captured_at": null, "provider_id": "manual", "currency_code": "usd", "amount_refunded": 0, "idempotency_key": null}], "subtotal": 2200, "tax_rate": null, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T14:56:45.295Z", "display_id": 2, "gift_cards": [], "paid_total": 3000, "updated_at": "2024-09-22T14:56:45.295Z", "canceled_at": null, "customer_id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "external_id": null, "currency_code": "usd", "discount_total": 0, "draft_order_id": null, "item_tax_total": 0, "payment_status": "awaiting", "refunded_total": 0, "shipping_total": 800, "gift_card_total": 0, "idempotency_key": null, "no_notification": null, "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "shipping_methods": [{"id": "sm_01J8D3R9PMX4VPNT6T7PDRSRE1", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "order_id": "order_01J8D3RC8ETYVE7HJ6J7AD7RGE", "subtotal": 800, "return_id": null, "tax_lines": [{"id": "smtl_01J8D3RC6X1X452B6ZV3M67Z5H", "code": "default", "name": "default", "rate": 0, "metadata": null, "created_at": "2024-09-22T14:56:45.272Z", "updated_at": "2024-09-22T14:56:45.295Z", "shipping_method_id": "sm_01J8D3R9PMX4VPNT6T7PDRSRE1"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "original_tax_total": 0, "shipping_option_id": "so_01J8BYQCHM6TYND255921H5YR4"}], "refundable_amount": 3000, "billing_address_id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "fulfillment_status": "not_fulfilled", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "gift_card_transactions": []}, "type": "order"}	finished
ikey_01J8D3QFVFKPCKB7HF6SFXRBMJ	5db286a8-6fea-4cf8-9193-4e80ec80ddaa	2024-09-22 14:56:16.239331+00	\N	POST	{"id": "cart_01J8D3QFV17HV9G47KQ8S938ER"}	/cart_01J8D3QFV17HV9G47KQ8S938ER/line-items	200	{"cart": {"id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "type": "default", "email": "pcbimon@gmail.com", "items": [{"id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "variant": {"id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "title": "Medusa T-Shirt", "width": null, "handle": "t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": null, "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "product_id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "updated_at": "2024-09-22T04:09:32.516Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T14:56:16.246Z", "unit_price": 2200, "updated_at": "2024-09-22T14:56:16.246Z", "variant_id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 2200, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "email": "pcbimon@gmail.com", "phone": "", "metadata": null, "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:07.209Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:07.209Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T14:56:16.222Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:56:16.222Z", "customer_id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_sessions": [], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01J8D3QS8RVFH0329WYG16DFRS	cf7df5c5-4e60-4f5c-a599-bff0a6fb1806	2024-09-22 14:56:25.878956+00	\N	POST	{"id": "cart_01J8D3QFV17HV9G47KQ8S938ER"}	/cart_01J8D3QFV17HV9G47KQ8S938ER/payment-sessions	200	{"cart": {"id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "type": "default", "email": "pcbimon@gmail.com", "items": [{"id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "variant": {"id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "title": "Medusa T-Shirt", "width": null, "handle": "t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": null, "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "product_id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "updated_at": "2024-09-22T04:09:32.516Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T14:56:16.246Z", "unit_price": 2200, "updated_at": "2024-09-22T14:56:16.246Z", "variant_id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 2200, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "email": "pcbimon@gmail.com", "phone": "", "metadata": null, "last_name": "Chewprecha", "created_at": "2024-09-22T14:55:07.209Z", "deleted_at": null, "first_name": "Patipat", "updated_at": "2024-09-22T14:55:07.209Z", "has_account": true, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T14:56:16.222Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:56:17.921Z", "customer_id": "cus_01J8D3NCEBW8NGPZ328E3FN7WQ", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:25.890Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:25.890Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": null, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": null, "payment_authorized_at": null}}	finished
ikey_01J8D3R7FZR2HRE480E7F4R51B	abb95247-b9e2-4a31-a335-576707f549f1	2024-09-22 14:56:40.446858+00	\N	POST	{"id": "cart_01J8D3QFV17HV9G47KQ8S938ER"}	/cart_01J8D3QFV17HV9G47KQ8S938ER/payment-sessions	200	{"cart": {"id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "type": "default", "email": "patipat.chewprecha@hotmail.com", "items": [{"id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "variant": {"id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "title": "Medusa T-Shirt", "width": null, "handle": "t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": null, "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "product_id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "updated_at": "2024-09-22T04:09:32.516Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T14:56:16.246Z", "unit_price": 2200, "updated_at": "2024-09-22T14:56:16.246Z", "variant_id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 2200, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "email": "patipat.chewprecha@hotmail.com", "phone": null, "metadata": null, "last_name": null, "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": null, "updated_at": "2024-09-22T14:56:40.347Z", "has_account": false, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T14:56:16.222Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": {"id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:25.890Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:25.890Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "shipping_methods": [], "billing_address_id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "payment_authorized_at": null}}	finished
ikey_01J8D3R7G1DVEFRQ0FZPA59T4W	0200b8e9-5057-4d07-955d-bac54a66a900	2024-09-22 14:56:40.449103+00	\N	POST	{"id": "cart_01J8D3QFV17HV9G47KQ8S938ER"}	/cart_01J8D3QFV17HV9G47KQ8S938ER/payment-sessions	200	{"cart": {"id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "type": "default", "email": "patipat.chewprecha@hotmail.com", "items": [{"id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "variant": {"id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "title": "Medusa T-Shirt", "width": null, "handle": "t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": null, "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "product_id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "updated_at": "2024-09-22T04:09:32.516Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T14:56:16.246Z", "unit_price": 2200, "updated_at": "2024-09-22T14:56:16.246Z", "variant_id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 2200, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "email": "patipat.chewprecha@hotmail.com", "phone": null, "metadata": null, "last_name": null, "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": null, "updated_at": "2024-09-22T14:56:40.347Z", "has_account": false, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T14:56:16.222Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 0, "billing_address": {"id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:25.890Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 2200, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:25.890Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "shipping_methods": [], "billing_address_id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "payment_authorized_at": null}}	finished
ikey_01J8D3R9RFDPR9EAAPQPTV9P8B	3ada8423-3e0c-4e89-ac72-c7e173f7f46f	2024-09-22 14:56:42.766407+00	\N	POST	{"id": "cart_01J8D3QFV17HV9G47KQ8S938ER"}	/cart_01J8D3QFV17HV9G47KQ8S938ER/payment-sessions	200	{"cart": {"id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "type": "default", "email": "patipat.chewprecha@hotmail.com", "items": [{"id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "variant": {"id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "title": "Medusa T-Shirt", "width": null, "handle": "t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": null, "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "product_id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "updated_at": "2024-09-22T04:09:32.516Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T14:56:16.246Z", "unit_price": 2200, "updated_at": "2024-09-22T14:56:42.699Z", "variant_id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": true, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 3000, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "email": "patipat.chewprecha@hotmail.com", "phone": null, "metadata": null, "last_name": null, "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": null, "updated_at": "2024-09-22T14:56:40.347Z", "has_account": false, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T14:56:16.222Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 800, "billing_address": {"id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:42.699Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:42.699Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "shipping_methods": [{"id": "sm_01J8D3R9PMX4VPNT6T7PDRSRE1", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "order_id": null, "subtotal": 800, "return_id": null, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "shipping_method_id": "sm_01J8D3R9PMX4VPNT6T7PDRSRE1"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "shipping_option": {"id": "so_01J8BYQCHM6TYND255921H5YR4", "data": {"id": "manual-fulfillment"}, "name": "FakeEx Standard", "amount": 800, "metadata": null, "is_return": false, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "admin_only": false, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "price_type": "flat_rate", "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "provider_id": "manual"}, "original_tax_total": 0, "shipping_option_id": "so_01J8BYQCHM6TYND255921H5YR4"}], "billing_address_id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "payment_authorized_at": null}}	finished
ikey_01J8D3RA9BYPY14GEX9E78HJ42	f9f87690-de50-4975-878b-4478d1fe0590	2024-09-22 14:56:43.306049+00	\N	POST	{"id": "cart_01J8D3QFV17HV9G47KQ8S938ER"}	/cart_01J8D3QFV17HV9G47KQ8S938ER/payment-sessions	200	{"cart": {"id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "type": "default", "email": "patipat.chewprecha@hotmail.com", "items": [{"id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "variant": {"id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "title": "Medusa T-Shirt", "width": null, "handle": "t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": null, "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "product_id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "updated_at": "2024-09-22T04:09:32.516Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T14:56:16.246Z", "unit_price": 2200, "updated_at": "2024-09-22T14:56:42.699Z", "variant_id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": true, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 3000, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "email": "patipat.chewprecha@hotmail.com", "phone": null, "metadata": null, "last_name": null, "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": null, "updated_at": "2024-09-22T14:56:40.347Z", "has_account": false, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T14:56:16.222Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 800, "billing_address": {"id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:42.699Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:42.699Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "shipping_methods": [{"id": "sm_01J8D3R9PMX4VPNT6T7PDRSRE1", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "order_id": null, "subtotal": 800, "return_id": null, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "shipping_method_id": "sm_01J8D3R9PMX4VPNT6T7PDRSRE1"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "shipping_option": {"id": "so_01J8BYQCHM6TYND255921H5YR4", "data": {"id": "manual-fulfillment"}, "name": "FakeEx Standard", "amount": 800, "metadata": null, "is_return": false, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "admin_only": false, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "price_type": "flat_rate", "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "provider_id": "manual"}, "original_tax_total": 0, "shipping_option_id": "so_01J8BYQCHM6TYND255921H5YR4"}], "billing_address_id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "payment_authorized_at": null}}	finished
ikey_01J8D3RB6HXAXHB9RGJFBZ3VKQ	0888367f-a7bb-4253-94fe-e6a2709d17c9	2024-09-22 14:56:44.241087+00	\N	POST	{"id": "cart_01J8D3QFV17HV9G47KQ8S938ER"}	/cart_01J8D3QFV17HV9G47KQ8S938ER/payment-sessions	200	{"cart": {"id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "type": "default", "email": "patipat.chewprecha@hotmail.com", "items": [{"id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H", "title": "Medusa T-Shirt", "total": 2200, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "variant": {"id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "title": "Medusa T-Shirt", "width": null, "handle": "t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": null, "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "product_id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "updated_at": "2024-09-22T04:09:32.516Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 100}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "item_id": "item_01J8D3QFVV4WW2VS0DS4Y9QA2H"}], "tax_total": 0, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T14:56:16.246Z", "unit_price": 2200, "updated_at": "2024-09-22T14:56:42.699Z", "variant_id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": true, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2200, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 0, "raw_discount_total": 0}], "total": 3000, "object": "cart", "region": {"id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "name": "NA", "metadata": null, "tax_code": null, "tax_rate": 0, "countries": [{"id": 39, "name": "CANADA", "iso_2": "ca", "iso_3": "can", "num_code": 124, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "Canada"}, {"id": 236, "name": "UNITED STATES", "iso_2": "us", "iso_3": "usa", "num_code": 840, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "display_name": "United States"}], "tax_rates": [], "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:32.516Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": {"id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "email": "patipat.chewprecha@hotmail.com", "phone": null, "metadata": null, "last_name": null, "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": null, "updated_at": "2024-09-22T14:56:40.347Z", "has_account": false, "billing_address_id": null}, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "tax_total": 0, "created_at": "2024-09-22T14:56:16.222Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": "cus_01J8D3R7D5B0RG69STH2J32XH0", "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 0, "shipping_total": 800, "billing_address": {"id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:42.699Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D3QS93T4FY8WGJDYTSEDDK", "data": {"status": "pending"}, "amount": 3000, "status": "pending", "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "created_at": "2024-09-22T14:56:25.890Z", "updated_at": "2024-09-22T14:56:42.699Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "city": "Nakhon Pathom", "phone": "0924934708", "company": "", "metadata": null, "province": "Nakhon Pathom", "address_1": "ICT Mahidol", "address_2": "", "last_name": "Name", "created_at": "2024-09-22T14:56:40.347Z", "deleted_at": null, "first_name": "Test", "updated_at": "2024-09-22T14:56:40.347Z", "customer_id": null, "postal_code": "73170", "country_code": "ca"}, "shipping_methods": [{"id": "sm_01J8D3R9PMX4VPNT6T7PDRSRE1", "data": {}, "price": 800, "total": 800, "cart_id": "cart_01J8D3QFV17HV9G47KQ8S938ER", "swap_id": null, "order_id": null, "subtotal": 800, "return_id": null, "tax_lines": [{"code": "default", "name": "default", "rate": 0, "shipping_method_id": "sm_01J8D3R9PMX4VPNT6T7PDRSRE1"}], "tax_total": 0, "claim_order_id": null, "original_total": 800, "shipping_option": {"id": "so_01J8BYQCHM6TYND255921H5YR4", "data": {"id": "manual-fulfillment"}, "name": "FakeEx Standard", "amount": 800, "metadata": null, "is_return": false, "region_id": "reg_01J8BYQBJCYB0N9BYR9TR01HK0", "admin_only": false, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "price_type": "flat_rate", "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T04:09:32.516Z", "provider_id": "manual"}, "original_tax_total": 0, "shipping_option_id": "so_01J8BYQCHM6TYND255921H5YR4"}], "billing_address_id": "addr_01J8D3R7D90DCT1VXA3GZMHPE6", "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D3R7D9NYMSVSM99MKRVBAK", "payment_authorized_at": null}}	finished
ikey_01J8D4M942S2X6V5E59CBP0PFJ	0f4b5937-b0fc-4fb7-bd0c-4d21f328cdae	2024-09-22 15:11:59.617959+00	\N	POST	{"id": "cart_01J8D4M93FQDGXNWA8BXDP20K1"}	/cart_01J8D4M93FQDGXNWA8BXDP20K1/line-items	200	{"cart": {"id": "cart_01J8D4M93FQDGXNWA8BXDP20K1", "type": "default", "email": null, "items": [{"id": "item_01J8D4M94F70PP2M13BCEM6P52", "title": "Medusa T-Shirt", "total": 2354, "cart_id": "cart_01J8D4M93FQDGXNWA8BXDP20K1", "swap_id": null, "variant": {"id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "title": "Medusa T-Shirt", "width": null, "handle": "t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T14:58:14.989Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01J8BYTXH3NKK0VFK37JBH4KWX", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "product_id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "updated_at": "2024-09-22T14:56:45.295Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 99}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 7, "item_id": "item_01J8D4M94F70PP2M13BCEM6P52"}], "tax_total": 154, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T15:11:59.625Z", "unit_price": 2200, "updated_at": "2024-09-22T15:11:59.625Z", "variant_id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2354, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 154, "raw_discount_total": 0}], "total": 2354, "object": "cart", "region": {"id": "reg_01J8D42DAW9NN5YTXY422JW2D4", "name": "Thailand", "metadata": {}, "tax_code": null, "tax_rate": 7, "countries": [{"id": 221, "name": "THAILAND", "iso_2": "th", "iso_3": "tha", "num_code": 764, "region_id": "reg_01J8D42DAW9NN5YTXY422JW2D4", "display_name": "Thailand"}], "tax_rates": [], "created_at": "2024-09-22T15:02:14.103Z", "deleted_at": null, "updated_at": "2024-09-22T15:10:17.524Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8D42DAW9NN5YTXY422JW2D4", "tax_total": 154, "created_at": "2024-09-22T15:11:59.595Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T15:11:59.595Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 154, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_sessions": [], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D4M93F9CY3XYVVQFT28M6V", "city": null, "phone": null, "company": null, "metadata": null, "province": null, "address_1": null, "address_2": null, "last_name": null, "created_at": "2024-09-22T15:11:59.595Z", "deleted_at": null, "first_name": null, "updated_at": "2024-09-22T15:11:59.595Z", "customer_id": null, "postal_code": null, "country_code": "th"}, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D4M93F9CY3XYVVQFT28M6V", "payment_authorized_at": null}}	finished
ikey_01J8D4MMT7R0P4GY17KHVEEY86	0f8aca96-637c-46db-ad99-3a67a33a14c6	2024-09-22 15:12:11.590523+00	\N	POST	{"id": "cart_01J8D4M93FQDGXNWA8BXDP20K1"}	/cart_01J8D4M93FQDGXNWA8BXDP20K1/payment-sessions	200	{"cart": {"id": "cart_01J8D4M93FQDGXNWA8BXDP20K1", "type": "default", "email": null, "items": [{"id": "item_01J8D4M94F70PP2M13BCEM6P52", "title": "Medusa T-Shirt", "total": 2354, "cart_id": "cart_01J8D4M93FQDGXNWA8BXDP20K1", "swap_id": null, "variant": {"id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "ean": null, "sku": null, "upc": null, "title": "S / Black", "width": null, "height": null, "length": null, "weight": null, "barcode": null, "hs_code": null, "product": {"id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "title": "Medusa T-Shirt", "width": null, "handle": "t-shirt", "height": null, "length": null, "status": "published", "weight": 400, "hs_code": null, "profile": {"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}, "type_id": null, "material": null, "metadata": null, "mid_code": null, "profiles": [{"id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "name": "Default Shipping Profile", "type": "default", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z"}], "subtitle": null, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "profile_id": "sp_01J8BYQ289TPQV0YGQC4JGVZB9", "updated_at": "2024-09-22T14:58:14.989Z", "description": "Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.", "external_id": null, "is_giftcard": false, "discountable": true, "collection_id": "pcol_01J8BYTXH3NKK0VFK37JBH4KWX", "origin_country": null}, "material": null, "metadata": null, "mid_code": null, "created_at": "2024-09-22T04:09:32.516Z", "deleted_at": null, "product_id": "prod_01J8BYQE9XHB0HNWB0VHNTF9W3", "updated_at": "2024-09-22T14:56:45.295Z", "variant_rank": 0, "origin_country": null, "allow_backorder": false, "manage_inventory": true, "inventory_quantity": 99}, "metadata": {}, "order_id": null, "quantity": 1, "subtotal": 2200, "is_return": false, "tax_lines": [{"code": "default", "name": "default", "rate": 7, "item_id": "item_01J8D4M94F70PP2M13BCEM6P52"}], "tax_total": 154, "thumbnail": "https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png", "created_at": "2024-09-22T15:11:59.625Z", "unit_price": 2200, "updated_at": "2024-09-22T15:11:59.625Z", "variant_id": "variant_01J8BYQEWZH2Y3G27SHTMP8VCA", "adjustments": [], "description": "S / Black", "is_giftcard": false, "has_shipping": false, "should_merge": true, "order_edit_id": null, "claim_order_id": null, "discount_total": 0, "original_total": 2354, "allow_discounts": true, "original_item_id": null, "shipped_quantity": null, "returned_quantity": null, "fulfilled_quantity": null, "original_tax_total": 154, "raw_discount_total": 0}], "total": 2354, "object": "cart", "region": {"id": "reg_01J8D42DAW9NN5YTXY422JW2D4", "name": "Thailand", "metadata": {}, "tax_code": null, "tax_rate": 7, "countries": [{"id": 221, "name": "THAILAND", "iso_2": "th", "iso_3": "tha", "num_code": 764, "region_id": "reg_01J8D42DAW9NN5YTXY422JW2D4", "display_name": "Thailand"}], "tax_rates": [], "created_at": "2024-09-22T15:02:14.103Z", "deleted_at": null, "updated_at": "2024-09-22T15:10:17.524Z", "currency_code": "usd", "automatic_taxes": true, "tax_provider_id": null, "payment_providers": [{"id": "manual", "is_installed": true}], "gift_cards_taxable": true}, "context": {"ip": "::ffff:172.22.0.1", "user_agent": "axios/0.24.0"}, "payment": null, "customer": null, "metadata": null, "subtotal": 2200, "discounts": [], "region_id": "reg_01J8D42DAW9NN5YTXY422JW2D4", "tax_total": 154, "created_at": "2024-09-22T15:11:59.595Z", "deleted_at": null, "gift_cards": [], "payment_id": null, "updated_at": "2024-09-22T15:11:59.595Z", "customer_id": null, "completed_at": null, "sales_channel": {"id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "name": "Default Sales Channel", "metadata": null, "created_at": "2024-09-22T04:09:24.800Z", "deleted_at": null, "updated_at": "2024-09-22T04:09:24.800Z", "description": "Created by Medusa", "is_disabled": false}, "discount_total": 0, "item_tax_total": 154, "shipping_total": 0, "billing_address": null, "gift_card_total": 0, "idempotency_key": null, "payment_session": {"id": "ps_01J8D4MMTJMBX6MZ7AA0JEA1TQ", "data": {"status": "pending"}, "amount": 2354, "status": "pending", "cart_id": "cart_01J8D4M93FQDGXNWA8BXDP20K1", "created_at": "2024-09-22T15:12:11.600Z", "updated_at": "2024-09-22T15:12:11.600Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}, "payment_sessions": [{"id": "ps_01J8D4MMTJMBX6MZ7AA0JEA1TQ", "data": {"status": "pending"}, "amount": 2354, "status": "pending", "cart_id": "cart_01J8D4M93FQDGXNWA8BXDP20K1", "created_at": "2024-09-22T15:12:11.600Z", "updated_at": "2024-09-22T15:12:11.600Z", "is_selected": true, "provider_id": "manual", "is_initiated": true, "idempotency_key": null, "payment_authorized_at": null}], "sales_channel_id": "sc_01J8BYQ2PBJW9XPRZ33WNFCRS8", "shipping_address": {"id": "addr_01J8D4M93F9CY3XYVVQFT28M6V", "city": null, "phone": null, "company": null, "metadata": null, "province": null, "address_1": null, "address_2": null, "last_name": null, "created_at": "2024-09-22T15:11:59.595Z", "deleted_at": null, "first_name": null, "updated_at": "2024-09-22T15:11:59.595Z", "customer_id": null, "postal_code": null, "country_code": "th"}, "shipping_methods": [], "billing_address_id": null, "raw_discount_total": 0, "shipping_tax_total": 0, "gift_card_tax_total": 0, "shipping_address_id": "addr_01J8D4M93F9CY3XYVVQFT28M6V", "payment_authorized_at": null}}	finished
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.image (id, url, created_at, updated_at, deleted_at, metadata) FROM stdin;
img_01J8BYQE23TSDMHB0FHTY1FT5S	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQE23434G0389BP1VJXAX	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-back.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQE23DABG1GN9E3862ZZQ	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-white-front.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQE23T0K33C4145PACB30	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-white-back.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQJSA2D9BGC0AMMFNNDET	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-front.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQJSA6J1418C46V65Q9X2	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-back.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQNG64BP37NYXT89ZA60H	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQNG6V2Q7PS9YT17T3THV	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-back.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQR6E1DF8ZNM67HXPQPWV	https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-front.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQR6EX22HXSKE1V1D28KN	https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-back.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQTX013N4R7DQMDKHH60P	https://medusa-public-images.s3.eu-west-1.amazonaws.com/black_hoodie_front.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQTX0TBKSDAQQZXMMGGGM	https://medusa-public-images.s3.eu-west-1.amazonaws.com/black_hoodie_back.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQXKHSDQEQ3MME68RS6BM	https://medusa-public-images.s3.eu-west-1.amazonaws.com/ls-black-front.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYQXKHJKMZPKH0D89AFDB3	https://medusa-public-images.s3.eu-west-1.amazonaws.com/ls-black-back.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
img_01J8BYR0A48E0DS4JDT8V0PNSK	https://medusa-public-images.s3.eu-west-1.amazonaws.com/coffee-mug.png	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
\.


--
-- Data for Name: invite; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.invite (id, user_email, role, accepted, created_at, updated_at, deleted_at, metadata, token, expires_at) FROM stdin;
\.


--
-- Data for Name: line_item; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.line_item (id, cart_id, order_id, swap_id, title, description, thumbnail, is_giftcard, should_merge, allow_discounts, has_shipping, unit_price, variant_id, quantity, fulfilled_quantity, returned_quantity, shipped_quantity, created_at, updated_at, metadata, claim_order_id, is_return, original_item_id, order_edit_id) FROM stdin;
item_01J8BYWD4W4F96F2SWYAPV99CA	cart_01J8BYWCEZNCVJ4BBX4FBBZZTD	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01J8BYTYMV1E0K303K4YEGGAH5	1	\N	\N	\N	2024-09-22 04:12:19.181673+00	2024-09-22 04:12:19.181673+00	{}	\N	f	\N	\N
item_01J8BZ20Z1K2D6M86G9NH0B3SY	cart_01J8BZ2061BXPCA2SB9Y89MEAY	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01J8BYTYMV1E0K303K4YEGGAH5	1	\N	\N	\N	2024-09-22 04:15:23.229123+00	2024-09-22 04:15:23.229123+00	{}	\N	f	\N	\N
item_01J8BZ2E819R9ZKCVZGZBT6TZX	cart_01J8BZ2DMZ29B0RJVAQTSFND3T	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01J8BYTYMV1E0K303K4YEGGAH5	1	\N	\N	\N	2024-09-22 04:15:37.025018+00	2024-09-22 04:15:37.025018+00	{}	\N	f	\N	\N
item_01J8BZ2EDZNN00WR10PC7HFDYE	cart_01J8BZ2DV7K39ZK3V7QMNYKJHN	order_01J8D3PH9ZE4S9MGG87P00W6B3	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01J8BYTYMV1E0K303K4YEGGAH5	1	\N	\N	\N	2024-09-22 04:15:37.225781+00	2024-09-22 14:55:44.943454+00	{}	\N	f	\N	\N
item_01J8D3QFVV4WW2VS0DS4Y9QA2H	cart_01J8D3QFV17HV9G47KQ8S938ER	order_01J8D3RC8ETYVE7HJ6J7AD7RGE	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	t	2200	variant_01J8BYQEWZH2Y3G27SHTMP8VCA	1	\N	\N	\N	2024-09-22 14:56:16.246899+00	2024-09-22 14:56:45.295885+00	{}	\N	f	\N	\N
item_01J8D4M94F70PP2M13BCEM6P52	cart_01J8D4M93FQDGXNWA8BXDP20K1	\N	\N	Medusa T-Shirt	S / Black	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	f	t	t	f	2200	variant_01J8BYQEWZH2Y3G27SHTMP8VCA	1	\N	\N	\N	2024-09-22 15:11:59.625908+00	2024-09-22 15:11:59.625908+00	{}	\N	f	\N	\N
\.


--
-- Data for Name: line_item_adjustment; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.line_item_adjustment (id, item_id, description, discount_id, amount, metadata) FROM stdin;
\.


--
-- Data for Name: line_item_tax_line; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.line_item_tax_line (id, rate, name, code, created_at, updated_at, metadata, item_id) FROM stdin;
litl_01J8D3PH8R5D0JY1P6QC78GSPM	0	default	default	2024-09-22 14:55:44.915817+00	2024-09-22 14:55:44.943454+00	\N	item_01J8BZ2EDZNN00WR10PC7HFDYE
litl_01J8D3RC6X6HVE7VRFC8CYQR12	0	default	default	2024-09-22 14:56:45.272058+00	2024-09-22 14:56:45.295885+00	\N	item_01J8D3QFVV4WW2VS0DS4Y9QA2H
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1611063162649	initialSchema1611063162649
2	1611063174563	countriesCurrencies1611063174563
3	1612284947120	claims1612284947120
4	1612353094577	indexes1612353094577
5	1613146953072	notifications1613146953072
6	1613146953073	productTypeCategoryTags1613146953073
7	1613384784316	draftOrders1613384784316
8	1613656135167	trackingLinks1613656135167
9	1614684597235	cartContext1614684597235
10	1615891636559	returnReason1615891636559
11	1615970124120	discountUsageCount1615970124120
12	1617002207608	discountUsage1617002207608
13	1619108646647	nullablePassword1619108646647
14	1623231564533	noNotification1623231564533
15	1624287602631	gcRemoveUniqueOrder1624287602631
16	1624610325746	softDeletingUniqueConstraints1624610325746
17	1625560513367	ensureCancellationFieldsExist1625560513367
18	1627995307200	addDiscountableToProduct1627995307200
19	1630505790603	allowBackorderSwaps1630505790603
20	1631104895519	RankColumnWithDefaultValue1631104895519
21	1631261634964	enforceUniqueness1631261634964
22	1631696624528	validDurationForDiscount1631696624528
23	1631800727788	nestedReturnReasons1631800727788
24	1631864388026	statusOnProduct1631864388026
25	1632220294687	addNotes1632220294687
26	1632828114899	deleteDateOnShippingOptionRequirements1632828114899
27	1633512755401	extendedUserApi1633512755401
28	1633614437919	addCustomShippingOptions1633614437919
29	1638543550000	orderTaxRateToRealType1638543550000
30	1638952072999	externalIdOrder1638952072999
31	1641636508055	newTaxSystem1641636508055
32	1644943746861	customerGroups1644943746861
33	1646324713514	discountConditions1646324713514
34	1646915480108	updateMoneyAmountAddPriceList1646915480108
35	1648600574750	addLineItemAdjustments1648600574750
36	1648641130007	taxLineConstraints1648641130007
37	1649775522087	addBatchJobModel1649775522087
38	1656949291839	salesChannel1656949291839
39	1657098186554	taxedGiftCardTransactions1657098186554
40	1657267320181	extendedBatchJob1657267320181
41	1660040729000	paymentSessionUniqCartIdProviderId1660040729000
42	1661345741249	multiPaymentCart1661345741249
43	1661863940645	swapFulfillmentStatusRequiresAction1661863940645
44	1663059812399	orderEditing1663059812399
45	1663059812400	lineItemOriginalItemRelation1663059812400
46	1664880666982	paymentCollection1664880666982
47	1666173221888	addAnalyticsConfig1666173221888
48	1667815005070	publishableApiKey1667815005070
49	1669032280562	updateCustomerEmailConstraint_1669032280562
50	1670855241304	addTaxRateToGiftCards1670855241304
51	1671711415179	multiLocation1671711415179
52	1672906846559	productCategory1672906846559
53	1672906846560	paymentSessionIsInitiated1672906846560
54	1673003729870	stagedJobOptions1673003729870
55	1673550502785	uniquePaySessCartId1673550502785
56	1674455083104	productCategoryProduct1674455083104
57	1675689306130	multiLocationSoftDelete1675689306130
58	1677234878504	productCategoryRank1677234878504
59	1678093365811	ensureRequiredQuantity1678093365811
60	1678093365812	lineItemAdjustmentsAmount1678093365812
61	1679950221063	categoryRemoveSoftDelete1679950221063
62	1679950645253	categoryCreateIndexes1679950645253
63	1679950645254	productDomainImprovedIndexes1679950645254
64	1679950645254	productSearchGinIndexes1679950645254
65	1680714052628	addSalesChannelMetadata1680714052628
66	1680857773272	addDescriptionToProductCategory1680857773272
67	1680857773272	lineItemTaxAdjustmentOnCascadeDelete1680857773272
68	1680857773273	addTableProductShippingProfile1680857773273
69	1680857773273	dropProductIdFkSalesChannels1680857773273
70	1680857773273	dropVariantIdFkMoneyAmount1680857773273
71	1685715079776	CreateOnboarding1685715079776
72	1686062614694	AddOnboardingProduct1686062614694
73	1690996567455	CorrectOnboardingFields1690996567455
74	1692870898423	UpdateReturnReasonIndex1692870898423
75	1692953518123	dropMoneyAmountConstraintsForPricingModule1692953518123
76	1699564794649	AddMetadataToProductCategory1699564794649
77	1701894188811	PublishableKeySalesChannelLink1701894188811
78	1709888477798	AlterCustomerUniqueConstraint1709888477798
\.


--
-- Data for Name: money_amount; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.money_amount (id, currency_code, amount, region_id, created_at, updated_at, deleted_at, min_quantity, max_quantity, price_list_id) FROM stdin;
ma_01J8BYQF4RBB3FKJ21KA32B3W1	eur	1950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQF4RZ5JHP4B1QABDXF2C	usd	2200	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQFMCR6F113RVPT5ZZ14Z	eur	1950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQFMC95FQ6D1PQBZQ58YW	usd	2200	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQG40GZABV925R4DK1P8C	eur	1950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQG40H3GBA7B12FKP324F	usd	2200	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQGKYNZ97RRRDFWTM0N8E	eur	1950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQGKYR2RRQKYE4TA3ZZE0	usd	2200	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQH3JBADRMC5Z8T9K80SC	eur	1950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQH3JJ6QDM089M37RK4CF	usd	2200	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQHK6FEM0ME4ZPGVD8SJZ	eur	1950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQHK6CF0MZNCGX8XDABG4	usd	2200	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQJ3451A7XGD4M1R383YW	eur	1950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQJ34VGFYAK8A3K1HDNRH	usd	2200	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQJK2PSAEQ2GBC5E8Q4RK	eur	1950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQJK21TJTEF0SZSGF98C7	usd	2200	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQKTSKPXX24WCED8JCKXW	eur	2950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQKTST23FK2FKS2JFVW2W	usd	3350	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQMAC28TY79TMAAFVGKKE	eur	2950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQMACJJ13XCZD8F62BWE1	usd	3350	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQMTAB71BRQ37V3FVSQT1	eur	2950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQMTAQAN0Q2PEJNFNZBQG	usd	3350	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQN9YWB732G4PZV0AKR3Y	eur	2950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQN9Y80TZBKJHYM25M5G3	usd	3350	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQPH077RDB1TXECJWV9DS	eur	2950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQPH0BFNTPNYQP7E43K8N	usd	3350	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQQ0MY9Z5AS45DPD7WQ5Q	eur	2950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQQ0M7KSXJJ1A3DY8GDQV	usd	3350	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQQG8A8DET3A0KX95TGYR	eur	2950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQQG8RCVJ43W3DSH687QD	usd	3350	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQR06SPCCFX9E2Q4FJY4P	eur	2950	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQR06C6NR7F9XRAZCSW7E	usd	3350	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQS7WHMQCVA9PE4BB47Y7	eur	2500	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQS7WE50PAZ875XYBDAWR	usd	2850	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQSQG5H7M0XJ20RG8K9PH	eur	2500	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQSQG9BYDY4E0FFB7B662	usd	2850	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQT74TA5P6BZ2G0CBWWH3	eur	2500	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQT7451605Q8WVWMCZDER	usd	2850	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQTPRT0C3YXW1MK32EVGB	eur	2500	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQTPR59HRSFTT99EW0MRP	usd	2850	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQVY4HX882NV6HGA5WE6Y	eur	3650	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQVY4NQJEMS98YK6KFD9F	usd	4150	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQWE2MC0P8G6M2NPKYYBA	eur	3650	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQWE2MH8QC78YPAXK0ZES	usd	4150	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQWXPYE5AM0Y2YFZFRW02	eur	3650	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQWXPF7MS87J8XZ6K49T0	usd	4150	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQXDAEGKC53YPPY3Q2TAH	eur	3650	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQXDAF53Q1V6EP4PNS1B3	usd	4150	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQYMPYYB0B9KQA2A4PTZ1	eur	3650	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQYMPEV2KR3JYXS1P9YMR	usd	4150	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQZ4MNGYFS2GB26NCE573	eur	3650	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQZ4MGXH62B4CSQ2KKXHX	usd	4150	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQZM8X5Z1ZFWD2ENTE1TK	eur	3650	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYQZM8Y0DPYH1DDDAD3DZB	usd	4150	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYR03W22QB4S3DPZWGAX00	eur	3650	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYR03WBDZ970NEHMDPGY5J	usd	4150	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYR1AY3BH8BKERJYX93PJP	eur	1000	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYR1AY97PE1H993WGYB4PV	usd	1200	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	\N	\N
ma_01J8BYTZXDGWXBBYKJQJKV6BKR	usd	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXDKSY2G16PS7ZKQKQN	eur	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXDBE50P1W1F088V5BN	usd	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXD3BMNYVM7CPHNJRGR	eur	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXDNHRJ33DHNYEF6HTW	usd	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXDMW5HG7M7FWZVJ1VD	eur	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXDX108MFKSKN51GHV4	usd	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXD600V3E5R9FKT4Q2A	eur	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXDZ5K4V6E582X9W055	usd	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXDBADXWF4YT6XGNM7Y	eur	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXD86VT6HZ6F4NMKH2B	usd	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXDQ78NJG91FMEA9YBQ	eur	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXD2KFXE0J7AT43YN32	usd	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXDEJA9ZEWQT95TMN49	eur	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXD1WFR5FQ35AEJXXJR	usd	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
ma_01J8BYTZXD96BH03MXBDEGQGQV	eur	2200	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	\N	\N
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.note (id, value, resource_type, resource_id, author_id, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.notification (id, event_name, resource_type, resource_id, customer_id, "to", data, parent_id, provider_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: notification_provider; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.notification_provider (id, is_installed) FROM stdin;
\.


--
-- Data for Name: oauth; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.oauth (id, display_name, application_name, install_url, uninstall_url, data) FROM stdin;
\.


--
-- Data for Name: onboarding_state; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.onboarding_state (id, created_at, updated_at, current_step, is_complete, product_id) FROM stdin;
onboarding_01J8BYPDPBZVXXMANE6PJ8ZMNH	2024-09-22 04:08:39.668802+00	2024-09-22 14:55:55.918678+00	setup_finished_nextjs	t	prod_01J8BYTY2ZG983PSSPZV641XGG
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public."order" (id, status, fulfillment_status, payment_status, display_id, cart_id, customer_id, email, billing_address_id, shipping_address_id, region_id, currency_code, tax_rate, canceled_at, created_at, updated_at, metadata, idempotency_key, draft_order_id, no_notification, external_id, sales_channel_id) FROM stdin;
order_01J8D3PH9ZE4S9MGG87P00W6B3	pending	not_fulfilled	awaiting	1	cart_01J8BZ2DV7K39ZK3V7QMNYKJHN	cus_01J8D3NCEBW8NGPZ328E3FN7WQ	pcbimon@gmail.com	addr_01J8D3P9Z4M69R50A4HJ5G31P4	addr_01J8D3P9Z4FDZ6NPYB7RTMCW61	reg_01J8BYQBJCYB0N9BYR9TR01HK0	usd	\N	\N	2024-09-22 14:55:44.943454+00	2024-09-22 14:55:44.943454+00	{}	\N	\N	\N	\N	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
order_01J8D3RC8ETYVE7HJ6J7AD7RGE	pending	not_fulfilled	awaiting	2	cart_01J8D3QFV17HV9G47KQ8S938ER	cus_01J8D3R7D5B0RG69STH2J32XH0	patipat.chewprecha@hotmail.com	addr_01J8D3R7D90DCT1VXA3GZMHPE6	addr_01J8D3R7D9NYMSVSM99MKRVBAK	reg_01J8BYQBJCYB0N9BYR9TR01HK0	usd	\N	\N	2024-09-22 14:56:45.295885+00	2024-09-22 14:56:45.295885+00	{}	\N	\N	\N	\N	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
\.


--
-- Data for Name: order_discounts; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.order_discounts (order_id, discount_id) FROM stdin;
\.


--
-- Data for Name: order_edit; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.order_edit (id, created_at, updated_at, order_id, internal_note, created_by, requested_by, requested_at, confirmed_by, confirmed_at, declined_by, declined_reason, declined_at, canceled_by, canceled_at, payment_collection_id) FROM stdin;
\.


--
-- Data for Name: order_gift_cards; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.order_gift_cards (order_id, gift_card_id) FROM stdin;
\.


--
-- Data for Name: order_item_change; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.order_item_change (id, created_at, updated_at, deleted_at, type, order_edit_id, original_line_item_id, line_item_id) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.payment (id, swap_id, cart_id, order_id, amount, currency_code, amount_refunded, provider_id, data, captured_at, canceled_at, created_at, updated_at, metadata, idempotency_key) FROM stdin;
pay_01J8D3PH9A9VJH82WEEBFQK9XR	\N	cart_01J8BZ2DV7K39ZK3V7QMNYKJHN	order_01J8D3PH9ZE4S9MGG87P00W6B3	3000	usd	0	manual	{"status": "authorized"}	\N	\N	2024-09-22 14:55:44.923963+00	2024-09-22 14:55:44.943454+00	\N	\N
pay_01J8D3RC7B3E022WGKTXTPV25N	\N	cart_01J8D3QFV17HV9G47KQ8S938ER	order_01J8D3RC8ETYVE7HJ6J7AD7RGE	3000	usd	0	manual	{"status": "authorized"}	\N	\N	2024-09-22 14:56:45.280129+00	2024-09-22 14:56:45.295885+00	\N	\N
\.


--
-- Data for Name: payment_collection; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.payment_collection (id, created_at, updated_at, deleted_at, type, status, description, amount, authorized_amount, region_id, currency_code, metadata, created_by) FROM stdin;
\.


--
-- Data for Name: payment_collection_payments; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.payment_collection_payments (payment_collection_id, payment_id) FROM stdin;
\.


--
-- Data for Name: payment_collection_sessions; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.payment_collection_sessions (payment_collection_id, payment_session_id) FROM stdin;
\.


--
-- Data for Name: payment_provider; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.payment_provider (id, is_installed) FROM stdin;
manual	t
\.


--
-- Data for Name: payment_session; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.payment_session (id, cart_id, provider_id, is_selected, status, data, created_at, updated_at, idempotency_key, payment_authorized_at, amount, is_initiated) FROM stdin;
ps_01J8D3NQ6641SC2JYHCW51XV01	cart_01J8BZ2DV7K39ZK3V7QMNYKJHN	manual	t	authorized	{"status": "authorized"}	2024-09-22 14:55:18.212847+00	2024-09-22 14:55:44.923963+00	\N	2024-09-22 14:55:44.935+00	3000	t
ps_01J8D3QS93T4FY8WGJDYTSEDDK	cart_01J8D3QFV17HV9G47KQ8S938ER	manual	t	authorized	{"status": "authorized"}	2024-09-22 14:56:25.890918+00	2024-09-22 14:56:45.280129+00	\N	2024-09-22 14:56:45.289+00	3000	t
ps_01J8D4MMTJMBX6MZ7AA0JEA1TQ	cart_01J8D4M93FQDGXNWA8BXDP20K1	manual	t	pending	{"status": "pending"}	2024-09-22 15:12:11.600765+00	2024-09-22 15:12:11.600765+00	\N	\N	2354	t
\.


--
-- Data for Name: price_list; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.price_list (id, name, description, type, status, starts_at, ends_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: price_list_customer_groups; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.price_list_customer_groups (price_list_id, customer_group_id) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product (id, title, subtitle, description, handle, is_giftcard, thumbnail, weight, length, height, width, hs_code, origin_country, mid_code, material, created_at, updated_at, deleted_at, metadata, collection_id, type_id, discountable, status, external_id) FROM stdin;
prod_01J8BYTY2ZG983PSSPZV641XGG	Medusa T-Shirt	\N	Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.	medusa-t-shirt	f	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	400	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	pcol_01J8BYTXH3NKK0VFK37JBH4KWX	\N	t	published	\N
prod_01J8BYQE9XHB0HNWB0VHNTF9W3	Medusa T-Shirt	\N	Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.	t-shirt	f	https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png	400	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 14:58:14.989711+00	\N	\N	pcol_01J8BYTXH3NKK0VFK37JBH4KWX	\N	t	published	\N
prod_01J8BYQK1EX1RWNZ5J9890NFRZ	Medusa Sweatshirt	\N	Reimagine the feeling of a classic sweatshirt. With our cotton sweatshirt, everyday essentials no longer have to be ordinary.	sweatshirt	f	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-front.png	400	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 14:58:14.989711+00	\N	\N	pcol_01J8BYTXH3NKK0VFK37JBH4KWX	\N	t	published	\N
prod_01J8BYQNR0HBVJHQNJTEJ2NNC4	Medusa Sweatpants	\N	Reimagine the feeling of classic sweatpants. With our cotton sweatpants, everyday essentials no longer have to be ordinary.	sweatpants	f	https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png	400	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 14:58:14.989711+00	\N	\N	pcol_01J8BYTXH3NKK0VFK37JBH4KWX	\N	t	published	\N
prod_01J8BYQREJV4RXE26MARMB0XC1	Medusa Shorts	\N	Reimagine the feeling of classic shorts. With our cotton shorts, everyday essentials no longer have to be ordinary.	shorts	f	https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-front.png	400	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 14:58:14.989711+00	\N	\N	pcol_01J8BYTXH3NKK0VFK37JBH4KWX	\N	t	published	\N
prod_01J8BYQV4T573Z8X6GKWS03XGR	Medusa Hoodie	\N	Reimagine the feeling of a classic hoodie. With our cotton hoodie, everyday essentials no longer have to be ordinary.	hoodie	f	https://medusa-public-images.s3.eu-west-1.amazonaws.com/black_hoodie_front.png	400	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 14:58:14.989711+00	\N	\N	pcol_01J8BYTXH3NKK0VFK37JBH4KWX	\N	t	published	\N
prod_01J8BYQXVPK48136JPKNNMAN03	Medusa Longsleeve	\N	Reimagine the feeling of a classic longsleeve. With our cotton longsleeve, everyday essentials no longer have to be ordinary.	longsleeve	f	https://medusa-public-images.s3.eu-west-1.amazonaws.com/ls-black-front.png	400	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 14:58:14.989711+00	\N	\N	pcol_01J8BYTXH3NKK0VFK37JBH4KWX	\N	t	published	\N
prod_01J8BYR0HYPHBZB3NBTZKVF966	Medusa Coffee Mug	\N	Every programmer's best friend.	coffee-mug	f	https://medusa-public-images.s3.eu-west-1.amazonaws.com/coffee-mug.png	400	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 14:58:14.989711+00	\N	\N	pcol_01J8BYTXH3NKK0VFK37JBH4KWX	\N	t	published	\N
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_category (id, name, handle, parent_category_id, mpath, is_active, is_internal, created_at, updated_at, rank, description, metadata) FROM stdin;
pcat_pants	Pants	pants	\N	pcat_pants.	t	f	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	0		\N
pcat_shirts	Shirts	shirts	\N	pcat_shirts.	t	f	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	1		\N
pcat_merch	Merch	merch	\N	pcat_merch.	t	f	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	2		\N
pcat_hidden_carousel	Hidden homepage carousel	hidden-homepage-carousel	\N	pcat_hidden_carousel.	t	f	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	3		\N
pcat_hidden_featured	Hidden homepage featured	hidden-homepage-featured-items	\N	pcat_hidden_featured.	t	f	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	4		\N
\.


--
-- Data for Name: product_category_product; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_category_product (product_category_id, product_id) FROM stdin;
pcat_shirts	prod_01J8BYQE9XHB0HNWB0VHNTF9W3
pcat_shirts	prod_01J8BYQK1EX1RWNZ5J9890NFRZ
pcat_pants	prod_01J8BYQNR0HBVJHQNJTEJ2NNC4
pcat_merch	prod_01J8BYQREJV4RXE26MARMB0XC1
pcat_merch	prod_01J8BYQV4T573Z8X6GKWS03XGR
pcat_hidden_featured	prod_01J8BYQV4T573Z8X6GKWS03XGR
pcat_shirts	prod_01J8BYQXVPK48136JPKNNMAN03
pcat_hidden_featured	prod_01J8BYQXVPK48136JPKNNMAN03
pcat_merch	prod_01J8BYR0HYPHBZB3NBTZKVF966
pcat_hidden_featured	prod_01J8BYR0HYPHBZB3NBTZKVF966
\.


--
-- Data for Name: product_collection; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_collection (id, title, handle, created_at, updated_at, deleted_at, metadata) FROM stdin;
pcol_01J8BYTXH3NKK0VFK37JBH4KWX	Merch	merch	2024-09-22 04:11:31.235347+00	2024-09-22 04:11:31.235347+00	\N	\N
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_images (product_id, image_id) FROM stdin;
prod_01J8BYQE9XHB0HNWB0VHNTF9W3	img_01J8BYQE23TSDMHB0FHTY1FT5S
prod_01J8BYQE9XHB0HNWB0VHNTF9W3	img_01J8BYQE23434G0389BP1VJXAX
prod_01J8BYQE9XHB0HNWB0VHNTF9W3	img_01J8BYQE23DABG1GN9E3862ZZQ
prod_01J8BYQE9XHB0HNWB0VHNTF9W3	img_01J8BYQE23T0K33C4145PACB30
prod_01J8BYQK1EX1RWNZ5J9890NFRZ	img_01J8BYQJSA2D9BGC0AMMFNNDET
prod_01J8BYQK1EX1RWNZ5J9890NFRZ	img_01J8BYQJSA6J1418C46V65Q9X2
prod_01J8BYQNR0HBVJHQNJTEJ2NNC4	img_01J8BYQNG64BP37NYXT89ZA60H
prod_01J8BYQNR0HBVJHQNJTEJ2NNC4	img_01J8BYQNG6V2Q7PS9YT17T3THV
prod_01J8BYQREJV4RXE26MARMB0XC1	img_01J8BYQR6E1DF8ZNM67HXPQPWV
prod_01J8BYQREJV4RXE26MARMB0XC1	img_01J8BYQR6EX22HXSKE1V1D28KN
prod_01J8BYQV4T573Z8X6GKWS03XGR	img_01J8BYQTX013N4R7DQMDKHH60P
prod_01J8BYQV4T573Z8X6GKWS03XGR	img_01J8BYQTX0TBKSDAQQZXMMGGGM
prod_01J8BYQXVPK48136JPKNNMAN03	img_01J8BYQXKHSDQEQ3MME68RS6BM
prod_01J8BYQXVPK48136JPKNNMAN03	img_01J8BYQXKHJKMZPKH0D89AFDB3
prod_01J8BYR0HYPHBZB3NBTZKVF966	img_01J8BYR0A48E0DS4JDT8V0PNSK
prod_01J8BYTY2ZG983PSSPZV641XGG	img_01J8BYQE23TSDMHB0FHTY1FT5S
prod_01J8BYTY2ZG983PSSPZV641XGG	img_01J8BYQE23434G0389BP1VJXAX
prod_01J8BYTY2ZG983PSSPZV641XGG	img_01J8BYQE23DABG1GN9E3862ZZQ
prod_01J8BYTY2ZG983PSSPZV641XGG	img_01J8BYQE23T0K33C4145PACB30
\.


--
-- Data for Name: product_option; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_option (id, title, created_at, updated_at, deleted_at, metadata, product_id) FROM stdin;
opt_01J8BYQEJ1N1K10BWM7RMDE8Z7	Size	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	prod_01J8BYQE9XHB0HNWB0VHNTF9W3
opt_01J8BYQEJ16GPV26XNP5SVW6N8	Color	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	prod_01J8BYQE9XHB0HNWB0VHNTF9W3
opt_01J8BYQK99EY86X27RP1DRY0V3	Size	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	prod_01J8BYQK1EX1RWNZ5J9890NFRZ
opt_01J8BYQNZTPM8A90ZAGTS0CTYV	Size	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	prod_01J8BYQNR0HBVJHQNJTEJ2NNC4
opt_01J8BYQRPCV572283QTNNMM98A	Size	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	prod_01J8BYQREJV4RXE26MARMB0XC1
opt_01J8BYQVCM2RG77X0THJS0CQ1X	Size	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	prod_01J8BYQV4T573Z8X6GKWS03XGR
opt_01J8BYQY3GWRM26DBHMY21RCR7	Size	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	prod_01J8BYQXVPK48136JPKNNMAN03
opt_01J8BYR0SRNTW12451J6F3SNG6	Size	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	prod_01J8BYR0HYPHBZB3NBTZKVF966
opt_01J8BYTY96FZ0J86XXEHTZDJ2K	Size	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	prod_01J8BYTY2ZG983PSSPZV641XGG
opt_01J8BYTY979F6TH42Z7Z3J8FW2	Color	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	prod_01J8BYTY2ZG983PSSPZV641XGG
\.


--
-- Data for Name: product_option_value; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_option_value (id, value, option_id, variant_id, created_at, updated_at, deleted_at, metadata) FROM stdin;
optval_01J8BYQEWZMWE0VCEK4VJ9MVSR	S	opt_01J8BYQEJ1N1K10BWM7RMDE8Z7	variant_01J8BYQEWZH2Y3G27SHTMP8VCA	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQEWZ1Z58DZMZZM2854YB	Black	opt_01J8BYQEJ16GPV26XNP5SVW6N8	variant_01J8BYQEWZH2Y3G27SHTMP8VCA	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQFCKPMZZR9EAAWGJQX3D	S	opt_01J8BYQEJ1N1K10BWM7RMDE8Z7	variant_01J8BYQFCKGMH9S1MDFWT2ZMQG	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQFCKD0QVNWZ252YZ939T	White	opt_01J8BYQEJ16GPV26XNP5SVW6N8	variant_01J8BYQFCKGMH9S1MDFWT2ZMQG	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQFW7ANNV4AEQEP3MZ839	M	opt_01J8BYQEJ1N1K10BWM7RMDE8Z7	variant_01J8BYQFW708YRK3A772WCBW5H	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQFW7AXFHM1HFJQ524ZS8	Black	opt_01J8BYQEJ16GPV26XNP5SVW6N8	variant_01J8BYQFW708YRK3A772WCBW5H	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQGC590X044J8V4WNQ37P	M	opt_01J8BYQEJ1N1K10BWM7RMDE8Z7	variant_01J8BYQGC5STKZW771M4HTD0QF	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQGC5D07B091K0X9QN1K2	White	opt_01J8BYQEJ16GPV26XNP5SVW6N8	variant_01J8BYQGC5STKZW771M4HTD0QF	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQGVTH7DBMG27P1RD80YA	L	opt_01J8BYQEJ1N1K10BWM7RMDE8Z7	variant_01J8BYQGVTKK3WWJ4Z5AESDJBN	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQGVTMBV7VDB07C6G139N	Black	opt_01J8BYQEJ16GPV26XNP5SVW6N8	variant_01J8BYQGVTKK3WWJ4Z5AESDJBN	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQHBFDC6EHR6WS62QYDJH	L	opt_01J8BYQEJ1N1K10BWM7RMDE8Z7	variant_01J8BYQHBFM9XT4GPC0QN1RPXJ	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQHBFVKQAJPWKPVK0R2Y4	White	opt_01J8BYQEJ16GPV26XNP5SVW6N8	variant_01J8BYQHBFM9XT4GPC0QN1RPXJ	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQHVC94WV7BS6JPJBRPPC	XL	opt_01J8BYQEJ1N1K10BWM7RMDE8Z7	variant_01J8BYQHVCYHDVHJEC8RJD4ETQ	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQHVCPR5X4XYK9CFRC06J	Black	opt_01J8BYQEJ16GPV26XNP5SVW6N8	variant_01J8BYQHVCYHDVHJEC8RJD4ETQ	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQJBAK81S72A0TXVVT0VD	XL	opt_01J8BYQEJ1N1K10BWM7RMDE8Z7	variant_01J8BYQJBA1RQ1BXJFG8610WJ9	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQJBA6F6EC6CS517SMEF4	White	opt_01J8BYQEJ16GPV26XNP5SVW6N8	variant_01J8BYQJBA1RQ1BXJFG8610WJ9	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQKJZ40HB3QYGM90NJAWK	S	opt_01J8BYQK99EY86X27RP1DRY0V3	variant_01J8BYQKJYN2V2VBQ5KC8B75SX	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQM2JTD3V7XRZZ4G4QSED	M	opt_01J8BYQK99EY86X27RP1DRY0V3	variant_01J8BYQM2JQD0AF5KPHF86R4HW	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQMJH23A0YJ6G1SEEGXX8	L	opt_01J8BYQK99EY86X27RP1DRY0V3	variant_01J8BYQMJHYH5GVMDA53P3Y154	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQN25CDJ9C7EF8YDDRRRK	XL	opt_01J8BYQK99EY86X27RP1DRY0V3	variant_01J8BYQN24V6K42776AAGND89V	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQP96HX03P4MXT1HD9AJJ	S	opt_01J8BYQNZTPM8A90ZAGTS0CTYV	variant_01J8BYQP966R79003G9M3H62YK	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQPRTVT9XT8F1STE81GCY	M	opt_01J8BYQNZTPM8A90ZAGTS0CTYV	variant_01J8BYQPRT9JW145XJFA21YZMS	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQQ8FZHTNSVCT73ZJKFWN	L	opt_01J8BYQNZTPM8A90ZAGTS0CTYV	variant_01J8BYQQ8F1NZQK67C30DET5NP	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQQR2Q9BC5Q1HSDJ3V8ED	XL	opt_01J8BYQNZTPM8A90ZAGTS0CTYV	variant_01J8BYQQR215SRCQRDF241PBMN	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQS020Y2APGMQTKSCJEDG	S	opt_01J8BYQRPCV572283QTNNMM98A	variant_01J8BYQS02VARJ83KAHEXE3616	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQSFPJG8C6MD7H5M79KNK	M	opt_01J8BYQRPCV572283QTNNMM98A	variant_01J8BYQSFP69YAYXMJ2TG06Y2W	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQSZBKDCVWSSS6FV80BSV	L	opt_01J8BYQRPCV572283QTNNMM98A	variant_01J8BYQSZBYD7NJ58F7DM7KH1R	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQTEYCR4KK4X5241VVQ12	XL	opt_01J8BYQRPCV572283QTNNMM98A	variant_01J8BYQTEY7YBKQTTPN50X0Q0B	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQVP04M2YX526R4Z5KSGC	S	opt_01J8BYQVCM2RG77X0THJS0CQ1X	variant_01J8BYQVP0DHB5R402GM6H99R9	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQW5YRPB7XK6DXEEWAKY7	M	opt_01J8BYQVCM2RG77X0THJS0CQ1X	variant_01J8BYQW5Y8686ZE13WP7DBBKH	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQWNWWG75SWVFGPZE27WP	L	opt_01J8BYQVCM2RG77X0THJS0CQ1X	variant_01J8BYQWNWHRJ3GFKX706PRW8E	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQX5GEV9VZ25ADPK54G00	XL	opt_01J8BYQVCM2RG77X0THJS0CQ1X	variant_01J8BYQX5GEM4T11EBRPFPDTN1	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQYCWZD5SV3CM1RG8GEJW	S	opt_01J8BYQY3GWRM26DBHMY21RCR7	variant_01J8BYQYCWPRYCNEW2WC6KBNFH	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQYWTD42WH8F27WXB03P7	M	opt_01J8BYQY3GWRM26DBHMY21RCR7	variant_01J8BYQYWTY5NZA9ZWR9GS3R4C	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQZCEMH31JDHKFRCSVPF5	L	opt_01J8BYQY3GWRM26DBHMY21RCR7	variant_01J8BYQZCEWAQZMZC9V2PQR57Q	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYQZW2TT51P00K2P6RRBZY	XL	opt_01J8BYQY3GWRM26DBHMY21RCR7	variant_01J8BYQZW2JQQ793CVG8RE2SKX	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYR134GSJPHZBSP21RS60C	One Size	opt_01J8BYR0SRNTW12451J6F3SNG6	variant_01J8BYR134EQAZ2393QZB7E5KZ	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N
optval_01J8BYTYMVBKGTRCHKJSTRJZ0B	S	opt_01J8BYTY96FZ0J86XXEHTZDJ2K	variant_01J8BYTYMV1E0K303K4YEGGAH5	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMVMN8FXF6ZP74XKK22	Black	opt_01J8BYTY979F6TH42Z7Z3J8FW2	variant_01J8BYTYMV1E0K303K4YEGGAH5	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMV6EC86G1PREK4MC3X	S	opt_01J8BYTY96FZ0J86XXEHTZDJ2K	variant_01J8BYTYMVXGCEGCPSWQZVA4YZ	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMV2ZF722FRGJT7PFY7	White	opt_01J8BYTY979F6TH42Z7Z3J8FW2	variant_01J8BYTYMVXGCEGCPSWQZVA4YZ	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMVW2C9SVNE325J3AKA	M	opt_01J8BYTY96FZ0J86XXEHTZDJ2K	variant_01J8BYTYMVPRNKXJCXWKZ5X4RM	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMV6PQ2FS4Q055Z02NJ	Black	opt_01J8BYTY979F6TH42Z7Z3J8FW2	variant_01J8BYTYMVPRNKXJCXWKZ5X4RM	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMW0CCTQC44QTT05HQP	M	opt_01J8BYTY96FZ0J86XXEHTZDJ2K	variant_01J8BYTYMW70GKTSYPRPZ0G3EP	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMWMGCG3JDNQFZGQSPC	White	opt_01J8BYTY979F6TH42Z7Z3J8FW2	variant_01J8BYTYMW70GKTSYPRPZ0G3EP	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMW2Z958F17VAN74MNJ	L	opt_01J8BYTY96FZ0J86XXEHTZDJ2K	variant_01J8BYTYMWTQAQZQFJYACVCF5V	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMWXZ6PVPQF5DDANTKW	Black	opt_01J8BYTY979F6TH42Z7Z3J8FW2	variant_01J8BYTYMWTQAQZQFJYACVCF5V	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMWA0RS76NGZ96XDWSW	L	opt_01J8BYTY96FZ0J86XXEHTZDJ2K	variant_01J8BYTYMW4F7P66RQV6R0ZN89	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMWVBGXYYAQYMSTG36Z	White	opt_01J8BYTY979F6TH42Z7Z3J8FW2	variant_01J8BYTYMW4F7P66RQV6R0ZN89	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMWKYF3W08VNDQGMX0K	XL	opt_01J8BYTY96FZ0J86XXEHTZDJ2K	variant_01J8BYTYMWM41DCM4HJ311KPVE	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMWT4Z51KC0NCQPR8MT	Black	opt_01J8BYTY979F6TH42Z7Z3J8FW2	variant_01J8BYTYMWM41DCM4HJ311KPVE	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMWH192Q3FYZDDZTK73	XL	opt_01J8BYTY96FZ0J86XXEHTZDJ2K	variant_01J8BYTYMWV1QA4PWNB556ZE54	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
optval_01J8BYTYMWHWH6G9A953AM901T	White	opt_01J8BYTY979F6TH42Z7Z3J8FW2	variant_01J8BYTYMWV1QA4PWNB556ZE54	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N
\.


--
-- Data for Name: product_sales_channel; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_sales_channel (product_id, sales_channel_id) FROM stdin;
prod_01J8BYQE9XHB0HNWB0VHNTF9W3	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
prod_01J8BYQK1EX1RWNZ5J9890NFRZ	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
prod_01J8BYQNR0HBVJHQNJTEJ2NNC4	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
prod_01J8BYQREJV4RXE26MARMB0XC1	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
prod_01J8BYQV4T573Z8X6GKWS03XGR	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
prod_01J8BYQXVPK48136JPKNNMAN03	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
prod_01J8BYR0HYPHBZB3NBTZKVF966	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
prod_01J8BYTY2ZG983PSSPZV641XGG	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8
\.


--
-- Data for Name: product_shipping_profile; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_shipping_profile (profile_id, product_id) FROM stdin;
sp_01J8BYQ289TPQV0YGQC4JGVZB9	prod_01J8BYQE9XHB0HNWB0VHNTF9W3
sp_01J8BYQ289TPQV0YGQC4JGVZB9	prod_01J8BYQK1EX1RWNZ5J9890NFRZ
sp_01J8BYQ289TPQV0YGQC4JGVZB9	prod_01J8BYQNR0HBVJHQNJTEJ2NNC4
sp_01J8BYQ289TPQV0YGQC4JGVZB9	prod_01J8BYQREJV4RXE26MARMB0XC1
sp_01J8BYQ289TPQV0YGQC4JGVZB9	prod_01J8BYQV4T573Z8X6GKWS03XGR
sp_01J8BYQ289TPQV0YGQC4JGVZB9	prod_01J8BYQXVPK48136JPKNNMAN03
sp_01J8BYQ289TPQV0YGQC4JGVZB9	prod_01J8BYR0HYPHBZB3NBTZKVF966
sp_01J8BYQ289TPQV0YGQC4JGVZB9	prod_01J8BYTY2ZG983PSSPZV641XGG
\.


--
-- Data for Name: product_tag; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_tag (id, value, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: product_tags; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_tags (product_id, product_tag_id) FROM stdin;
\.


--
-- Data for Name: product_tax_rate; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_tax_rate (product_id, rate_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_type (id, value, created_at, updated_at, deleted_at, metadata) FROM stdin;
\.


--
-- Data for Name: product_type_tax_rate; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_type_tax_rate (product_type_id, rate_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: product_variant; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_variant (id, title, product_id, sku, barcode, ean, upc, inventory_quantity, allow_backorder, manage_inventory, hs_code, origin_country, mid_code, material, weight, length, height, width, created_at, updated_at, deleted_at, metadata, variant_rank) FROM stdin;
variant_01J8BYQFCKGMH9S1MDFWT2ZMQG	S / White	prod_01J8BYQE9XHB0HNWB0VHNTF9W3	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	1
variant_01J8BYQFW708YRK3A772WCBW5H	M / Black	prod_01J8BYQE9XHB0HNWB0VHNTF9W3	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	2
variant_01J8BYQGC5STKZW771M4HTD0QF	M / White	prod_01J8BYQE9XHB0HNWB0VHNTF9W3	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	3
variant_01J8BYQGVTKK3WWJ4Z5AESDJBN	L / Black	prod_01J8BYQE9XHB0HNWB0VHNTF9W3	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	4
variant_01J8BYQHBFM9XT4GPC0QN1RPXJ	L / White	prod_01J8BYQE9XHB0HNWB0VHNTF9W3	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	5
variant_01J8BYQHVCYHDVHJEC8RJD4ETQ	XL / Black	prod_01J8BYQE9XHB0HNWB0VHNTF9W3	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	6
variant_01J8BYQJBA1RQ1BXJFG8610WJ9	XL / White	prod_01J8BYQE9XHB0HNWB0VHNTF9W3	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	7
variant_01J8BYQKJYN2V2VBQ5KC8B75SX	S	prod_01J8BYQK1EX1RWNZ5J9890NFRZ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	0
variant_01J8BYQM2JQD0AF5KPHF86R4HW	M	prod_01J8BYQK1EX1RWNZ5J9890NFRZ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	1
variant_01J8BYQMJHYH5GVMDA53P3Y154	L	prod_01J8BYQK1EX1RWNZ5J9890NFRZ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	2
variant_01J8BYQN24V6K42776AAGND89V	XL	prod_01J8BYQK1EX1RWNZ5J9890NFRZ	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	3
variant_01J8BYQP966R79003G9M3H62YK	S	prod_01J8BYQNR0HBVJHQNJTEJ2NNC4	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	0
variant_01J8BYQPRT9JW145XJFA21YZMS	M	prod_01J8BYQNR0HBVJHQNJTEJ2NNC4	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	1
variant_01J8BYQQ8F1NZQK67C30DET5NP	L	prod_01J8BYQNR0HBVJHQNJTEJ2NNC4	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	2
variant_01J8BYQQR215SRCQRDF241PBMN	XL	prod_01J8BYQNR0HBVJHQNJTEJ2NNC4	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	3
variant_01J8BYQS02VARJ83KAHEXE3616	S	prod_01J8BYQREJV4RXE26MARMB0XC1	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	0
variant_01J8BYQSFP69YAYXMJ2TG06Y2W	M	prod_01J8BYQREJV4RXE26MARMB0XC1	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	1
variant_01J8BYQSZBYD7NJ58F7DM7KH1R	L	prod_01J8BYQREJV4RXE26MARMB0XC1	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	2
variant_01J8BYQTEY7YBKQTTPN50X0Q0B	XL	prod_01J8BYQREJV4RXE26MARMB0XC1	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	3
variant_01J8BYQVP0DHB5R402GM6H99R9	S	prod_01J8BYQV4T573Z8X6GKWS03XGR	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	0
variant_01J8BYQW5Y8686ZE13WP7DBBKH	M	prod_01J8BYQV4T573Z8X6GKWS03XGR	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	1
variant_01J8BYQWNWHRJ3GFKX706PRW8E	L	prod_01J8BYQV4T573Z8X6GKWS03XGR	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	2
variant_01J8BYQX5GEM4T11EBRPFPDTN1	XL	prod_01J8BYQV4T573Z8X6GKWS03XGR	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	3
variant_01J8BYQYCWPRYCNEW2WC6KBNFH	S	prod_01J8BYQXVPK48136JPKNNMAN03	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	0
variant_01J8BYQYWTY5NZA9ZWR9GS3R4C	M	prod_01J8BYQXVPK48136JPKNNMAN03	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	1
variant_01J8BYQZCEWAQZMZC9V2PQR57Q	L	prod_01J8BYQXVPK48136JPKNNMAN03	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	2
variant_01J8BYQZW2JQQ793CVG8RE2SKX	XL	prod_01J8BYQXVPK48136JPKNNMAN03	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	3
variant_01J8BYR134EQAZ2393QZB7E5KZ	One Size	prod_01J8BYR0HYPHBZB3NBTZKVF966	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	0
variant_01J8BYTYMVXGCEGCPSWQZVA4YZ	S / White	prod_01J8BYTY2ZG983PSSPZV641XGG	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	1
variant_01J8BYTYMVPRNKXJCXWKZ5X4RM	M / Black	prod_01J8BYTY2ZG983PSSPZV641XGG	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	2
variant_01J8BYTYMW70GKTSYPRPZ0G3EP	M / White	prod_01J8BYTY2ZG983PSSPZV641XGG	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	3
variant_01J8BYTYMWTQAQZQFJYACVCF5V	L / Black	prod_01J8BYTY2ZG983PSSPZV641XGG	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	4
variant_01J8BYTYMW4F7P66RQV6R0ZN89	L / White	prod_01J8BYTY2ZG983PSSPZV641XGG	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	5
variant_01J8BYTYMWM41DCM4HJ311KPVE	XL / Black	prod_01J8BYTY2ZG983PSSPZV641XGG	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	6
variant_01J8BYTYMWV1QA4PWNB556ZE54	XL / White	prod_01J8BYTY2ZG983PSSPZV641XGG	\N	\N	\N	\N	100	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00	\N	\N	7
variant_01J8BYTYMV1E0K303K4YEGGAH5	S / Black	prod_01J8BYTY2ZG983PSSPZV641XGG	\N	\N	\N	\N	99	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:11:31.557503+00	2024-09-22 14:55:44.943454+00	\N	\N	0
variant_01J8BYQEWZH2Y3G27SHTMP8VCA	S / Black	prod_01J8BYQE9XHB0HNWB0VHNTF9W3	\N	\N	\N	\N	99	f	t	\N	\N	\N	\N	\N	\N	\N	\N	2024-09-22 04:09:32.516482+00	2024-09-22 14:56:45.295885+00	\N	\N	0
\.


--
-- Data for Name: product_variant_inventory_item; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_variant_inventory_item (id, created_at, updated_at, inventory_item_id, variant_id, required_quantity, deleted_at) FROM stdin;
\.


--
-- Data for Name: product_variant_money_amount; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.product_variant_money_amount (id, money_amount_id, variant_id, deleted_at, created_at, updated_at) FROM stdin;
pvma__01J8BYQF6BT9NVXDKEVK4PJWAF	ma_01J8BYQF4RBB3FKJ21KA32B3W1	variant_01J8BYQEWZH2Y3G27SHTMP8VCA	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQF6BJH1R4QAGPS839W7S	ma_01J8BYQF4RZ5JHP4B1QABDXF2C	variant_01J8BYQEWZH2Y3G27SHTMP8VCA	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQFNZVJPY0KS704RVGV8Q	ma_01J8BYQFMCR6F113RVPT5ZZ14Z	variant_01J8BYQFCKGMH9S1MDFWT2ZMQG	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQFNZ20892KZ6238X14AB	ma_01J8BYQFMC95FQ6D1PQBZQ58YW	variant_01J8BYQFCKGMH9S1MDFWT2ZMQG	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQG5J1XN1BEYGRV25GPDZ	ma_01J8BYQG40GZABV925R4DK1P8C	variant_01J8BYQFW708YRK3A772WCBW5H	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQG5J1GM1C420HMRBQRMD	ma_01J8BYQG40H3GBA7B12FKP324F	variant_01J8BYQFW708YRK3A772WCBW5H	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQGNGGZ18M1E56VASFVGA	ma_01J8BYQGKYNZ97RRRDFWTM0N8E	variant_01J8BYQGC5STKZW771M4HTD0QF	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQGNGGTTJB0M8MX0WCY9C	ma_01J8BYQGKYR2RRQKYE4TA3ZZE0	variant_01J8BYQGC5STKZW771M4HTD0QF	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQH54MFVXE21Z95APQNZ8	ma_01J8BYQH3JBADRMC5Z8T9K80SC	variant_01J8BYQGVTKK3WWJ4Z5AESDJBN	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQH54MRJBRKGCVCV64F45	ma_01J8BYQH3JJ6QDM089M37RK4CF	variant_01J8BYQGVTKK3WWJ4Z5AESDJBN	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQHMRMQPWWGQTJQ89TGGV	ma_01J8BYQHK6FEM0ME4ZPGVD8SJZ	variant_01J8BYQHBFM9XT4GPC0QN1RPXJ	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQHMR1ARRGM177VTKFCC3	ma_01J8BYQHK6CF0MZNCGX8XDABG4	variant_01J8BYQHBFM9XT4GPC0QN1RPXJ	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQJ4PSTAB0599NPYSYBTT	ma_01J8BYQJ3451A7XGD4M1R383YW	variant_01J8BYQHVCYHDVHJEC8RJD4ETQ	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQJ4P82P0NT6G3XERY693	ma_01J8BYQJ34VGFYAK8A3K1HDNRH	variant_01J8BYQHVCYHDVHJEC8RJD4ETQ	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQJMMGKN3PKSYN55GTDMN	ma_01J8BYQJK2PSAEQ2GBC5E8Q4RK	variant_01J8BYQJBA1RQ1BXJFG8610WJ9	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQJMMWWD2BQG2D5H7RD3S	ma_01J8BYQJK21TJTEF0SZSGF98C7	variant_01J8BYQJBA1RQ1BXJFG8610WJ9	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQKWA2BVTVZ53WXN95NM9	ma_01J8BYQKTSKPXX24WCED8JCKXW	variant_01J8BYQKJYN2V2VBQ5KC8B75SX	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQKWAXVDWY8EM58FBRHRS	ma_01J8BYQKTST23FK2FKS2JFVW2W	variant_01J8BYQKJYN2V2VBQ5KC8B75SX	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQMBY3BPEGSW5352DCNSE	ma_01J8BYQMAC28TY79TMAAFVGKKE	variant_01J8BYQM2JQD0AF5KPHF86R4HW	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQMBY3X44EYV7G0XQ1TK4	ma_01J8BYQMACJJ13XCZD8F62BWE1	variant_01J8BYQM2JQD0AF5KPHF86R4HW	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQMVW3QJTQ7NMBDX0GCQ9	ma_01J8BYQMTAB71BRQ37V3FVSQT1	variant_01J8BYQMJHYH5GVMDA53P3Y154	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQMVWWZ1WPPFYN8JVD5NE	ma_01J8BYQMTAQAN0Q2PEJNFNZBQG	variant_01J8BYQMJHYH5GVMDA53P3Y154	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQNBGA8RYFBJBT1Z3BFZK	ma_01J8BYQN9YWB732G4PZV0AKR3Y	variant_01J8BYQN24V6K42776AAGND89V	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQNBGWCN7T21EK6BCA5ZD	ma_01J8BYQN9Y80TZBKJHYM25M5G3	variant_01J8BYQN24V6K42776AAGND89V	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQPJJC5D12NYMJ5JFFWQA	ma_01J8BYQPH077RDB1TXECJWV9DS	variant_01J8BYQP966R79003G9M3H62YK	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQPJJ3JH1871AD7EBQTN8	ma_01J8BYQPH0BFNTPNYQP7E43K8N	variant_01J8BYQP966R79003G9M3H62YK	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQQ26GXTJB2MQGWEZ6B8N	ma_01J8BYQQ0MY9Z5AS45DPD7WQ5Q	variant_01J8BYQPRT9JW145XJFA21YZMS	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQQ26JCRNT4D016ZP6T58	ma_01J8BYQQ0M7KSXJJ1A3DY8GDQV	variant_01J8BYQPRT9JW145XJFA21YZMS	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQQHTQK3Q1GDFC4JCZK6H	ma_01J8BYQQG8A8DET3A0KX95TGYR	variant_01J8BYQQ8F1NZQK67C30DET5NP	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQQHTF5867K83HFRPDHXH	ma_01J8BYQQG8RCVJ43W3DSH687QD	variant_01J8BYQQ8F1NZQK67C30DET5NP	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQR1RX4G9ZWFQEAAMBVSR	ma_01J8BYQR06SPCCFX9E2Q4FJY4P	variant_01J8BYQQR215SRCQRDF241PBMN	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQR1RB6NP50B6CCAF6TVA	ma_01J8BYQR06C6NR7F9XRAZCSW7E	variant_01J8BYQQR215SRCQRDF241PBMN	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQS9EN8CJQDSDGSW02PR7	ma_01J8BYQS7WHMQCVA9PE4BB47Y7	variant_01J8BYQS02VARJ83KAHEXE3616	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQS9EDEYPEPQNMKJ362TB	ma_01J8BYQS7WE50PAZ875XYBDAWR	variant_01J8BYQS02VARJ83KAHEXE3616	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQSS214XM8GY4D0F1YQ01	ma_01J8BYQSQG5H7M0XJ20RG8K9PH	variant_01J8BYQSFP69YAYXMJ2TG06Y2W	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQSS2WPHMKRP4691XSWX9	ma_01J8BYQSQG9BYDY4E0FFB7B662	variant_01J8BYQSFP69YAYXMJ2TG06Y2W	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQT8PMNCK6ZYN5HNPDSBG	ma_01J8BYQT74TA5P6BZ2G0CBWWH3	variant_01J8BYQSZBYD7NJ58F7DM7KH1R	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQT8PZ9TJGS2RTHPK1RGF	ma_01J8BYQT7451605Q8WVWMCZDER	variant_01J8BYQSZBYD7NJ58F7DM7KH1R	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQTRAMQHCRJNFFJ7XD3JP	ma_01J8BYQTPRT0C3YXW1MK32EVGB	variant_01J8BYQTEY7YBKQTTPN50X0Q0B	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQTRAAVFEZ345XYR9N906	ma_01J8BYQTPR59HRSFTT99EW0MRP	variant_01J8BYQTEY7YBKQTTPN50X0Q0B	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQVZP9MTC73GR9Z030Q3W	ma_01J8BYQVY4HX882NV6HGA5WE6Y	variant_01J8BYQVP0DHB5R402GM6H99R9	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQVZPWC6RHSC3NVGHHWZD	ma_01J8BYQVY4NQJEMS98YK6KFD9F	variant_01J8BYQVP0DHB5R402GM6H99R9	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQWFM7K3TCGVKW41ZZF8V	ma_01J8BYQWE2MC0P8G6M2NPKYYBA	variant_01J8BYQW5Y8686ZE13WP7DBBKH	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQWFM29BSMNJRAW6KADBY	ma_01J8BYQWE2MH8QC78YPAXK0ZES	variant_01J8BYQW5Y8686ZE13WP7DBBKH	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQWZ881ZB7YJXF8CYWGAP	ma_01J8BYQWXPYE5AM0Y2YFZFRW02	variant_01J8BYQWNWHRJ3GFKX706PRW8E	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQWZ8G8GVKB6HRW6BYYVE	ma_01J8BYQWXPF7MS87J8XZ6K49T0	variant_01J8BYQWNWHRJ3GFKX706PRW8E	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQXEWT38NAXG8N2XNC467	ma_01J8BYQXDAEGKC53YPPY3Q2TAH	variant_01J8BYQX5GEM4T11EBRPFPDTN1	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQXEWP3X5YN77NXFGS95T	ma_01J8BYQXDAF53Q1V6EP4PNS1B3	variant_01J8BYQX5GEM4T11EBRPFPDTN1	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQYPJCKPFT9NFKDQVXDAE	ma_01J8BYQYMPYYB0B9KQA2A4PTZ1	variant_01J8BYQYCWPRYCNEW2WC6KBNFH	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQYPJ3ZAGCAPRRBTDSZKG	ma_01J8BYQYMPEV2KR3JYXS1P9YMR	variant_01J8BYQYCWPRYCNEW2WC6KBNFH	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQZ660MHMA48C3X2271BW	ma_01J8BYQZ4MNGYFS2GB26NCE573	variant_01J8BYQYWTY5NZA9ZWR9GS3R4C	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQZ66G1MSQWDZB339NHD9	ma_01J8BYQZ4MGXH62B4CSQ2KKXHX	variant_01J8BYQYWTY5NZA9ZWR9GS3R4C	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQZNTX17JWY9APE9JW12E	ma_01J8BYQZM8X5Z1ZFWD2ENTE1TK	variant_01J8BYQZCEWAQZMZC9V2PQR57Q	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYQZNTBMJEGCTCEQK37VYX	ma_01J8BYQZM8Y0DPYH1DDDAD3DZB	variant_01J8BYQZCEWAQZMZC9V2PQR57Q	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYR05EB49DRJ8KNSSSKRHZ	ma_01J8BYR03W22QB4S3DPZWGAX00	variant_01J8BYQZW2JQQ793CVG8RE2SKX	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYR05EC9EVTFY1WS27WRSG	ma_01J8BYR03WBDZ970NEHMDPGY5J	variant_01J8BYQZW2JQQ793CVG8RE2SKX	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYR1CGR4E1HT1TWZ4PSCMH	ma_01J8BYR1AY3BH8BKERJYX93PJP	variant_01J8BYR134EQAZ2393QZB7E5KZ	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYR1CGFPEXJPJB93MEQ4BJ	ma_01J8BYR1AY97PE1H993WGYB4PV	variant_01J8BYR134EQAZ2393QZB7E5KZ	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00
pvma__01J8BYTZYZ77774E71R5F7PZX9	ma_01J8BYTZXDGWXBBYKJQJKV6BKR	variant_01J8BYTYMV1E0K303K4YEGGAH5	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZV2CVZZ08CH5ATNXT	ma_01J8BYTZXDKSY2G16PS7ZKQKQN	variant_01J8BYTYMV1E0K303K4YEGGAH5	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZDX8DDGB0N970E0SR	ma_01J8BYTZXDBE50P1W1F088V5BN	variant_01J8BYTYMVXGCEGCPSWQZVA4YZ	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZ8SGDCRW536F2K630	ma_01J8BYTZXD3BMNYVM7CPHNJRGR	variant_01J8BYTYMVXGCEGCPSWQZVA4YZ	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZJEV08294DZ71VNW5	ma_01J8BYTZXDNHRJ33DHNYEF6HTW	variant_01J8BYTYMVPRNKXJCXWKZ5X4RM	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZT2569RQMAWN7R3SF	ma_01J8BYTZXDMW5HG7M7FWZVJ1VD	variant_01J8BYTYMVPRNKXJCXWKZ5X4RM	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZZ3Y70QP3G178V1YB	ma_01J8BYTZXDX108MFKSKN51GHV4	variant_01J8BYTYMW70GKTSYPRPZ0G3EP	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZA83VK5MN058DS7PP	ma_01J8BYTZXD600V3E5R9FKT4Q2A	variant_01J8BYTYMW70GKTSYPRPZ0G3EP	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZ9K618P7FFKB9JA24	ma_01J8BYTZXDZ5K4V6E582X9W055	variant_01J8BYTYMWTQAQZQFJYACVCF5V	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZBWD1VSMS1M0VVCXG	ma_01J8BYTZXDBADXWF4YT6XGNM7Y	variant_01J8BYTYMWTQAQZQFJYACVCF5V	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZMFYVSBZB6R2AWJ5S	ma_01J8BYTZXD86VT6HZ6F4NMKH2B	variant_01J8BYTYMW4F7P66RQV6R0ZN89	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZRWKX6QK8F2DYPQEG	ma_01J8BYTZXDQ78NJG91FMEA9YBQ	variant_01J8BYTYMW4F7P66RQV6R0ZN89	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZHTA4AD4JPR4YAWCY	ma_01J8BYTZXD2KFXE0J7AT43YN32	variant_01J8BYTYMWM41DCM4HJ311KPVE	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZKB0HFPXDF53X556N	ma_01J8BYTZXDEJA9ZEWQT95TMN49	variant_01J8BYTYMWM41DCM4HJ311KPVE	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZMXPMR81N047TVZ9F	ma_01J8BYTZXD1WFR5FQ35AEJXXJR	variant_01J8BYTYMWV1QA4PWNB556ZE54	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
pvma__01J8BYTZYZF9V8VV7T3MBXXX8F	ma_01J8BYTZXD96BH03MXBDEGQGQV	variant_01J8BYTYMWV1QA4PWNB556ZE54	\N	2024-09-22 04:11:31.557503+00	2024-09-22 04:11:31.557503+00
\.


--
-- Data for Name: publishable_api_key; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.publishable_api_key (id, created_at, updated_at, created_by, revoked_by, revoked_at, title) FROM stdin;
\.


--
-- Data for Name: publishable_api_key_sales_channel; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.publishable_api_key_sales_channel (sales_channel_id, publishable_key_id, id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: refund; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.refund (id, order_id, amount, note, reason, created_at, updated_at, metadata, idempotency_key, payment_id) FROM stdin;
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.region (id, name, currency_code, tax_rate, tax_code, created_at, updated_at, deleted_at, metadata, gift_cards_taxable, automatic_taxes, tax_provider_id) FROM stdin;
reg_01J8BYQANZ18VMHSHMJYBDMNPJ	EU	eur	0	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	t	t	\N
reg_01J8BYQBJCYB0N9BYR9TR01HK0	NA	usd	0	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	t	t	\N
reg_01J8D42DAW9NN5YTXY422JW2D4	Thailand	usd	7	\N	2024-09-22 15:02:14.103114+00	2024-09-22 15:10:17.524707+00	\N	{}	t	t	\N
\.


--
-- Data for Name: region_fulfillment_providers; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.region_fulfillment_providers (region_id, provider_id) FROM stdin;
reg_01J8BYQANZ18VMHSHMJYBDMNPJ	manual
reg_01J8BYQBJCYB0N9BYR9TR01HK0	manual
reg_01J8D42DAW9NN5YTXY422JW2D4	manual
\.


--
-- Data for Name: region_payment_providers; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.region_payment_providers (region_id, provider_id) FROM stdin;
reg_01J8BYQANZ18VMHSHMJYBDMNPJ	manual
reg_01J8BYQBJCYB0N9BYR9TR01HK0	manual
reg_01J8D42DAW9NN5YTXY422JW2D4	manual
\.


--
-- Data for Name: return; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.return (id, status, swap_id, order_id, shipping_data, refund_amount, received_at, created_at, updated_at, metadata, idempotency_key, claim_order_id, no_notification, location_id) FROM stdin;
\.


--
-- Data for Name: return_item; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.return_item (return_id, item_id, quantity, is_requested, requested_quantity, received_quantity, metadata, reason_id, note) FROM stdin;
\.


--
-- Data for Name: return_reason; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.return_reason (id, value, label, description, created_at, updated_at, deleted_at, metadata, parent_return_reason_id) FROM stdin;
\.


--
-- Data for Name: sales_channel; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.sales_channel (id, created_at, updated_at, deleted_at, name, description, is_disabled, metadata) FROM stdin;
sc_01J8BYQ2PBJW9XPRZ33WNFCRS8	2024-09-22 04:09:24.800879+00	2024-09-22 04:09:24.800879+00	\N	Default Sales Channel	Created by Medusa	f	\N
\.


--
-- Data for Name: sales_channel_location; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.sales_channel_location (id, created_at, updated_at, sales_channel_id, location_id, deleted_at) FROM stdin;
\.


--
-- Data for Name: shipping_method; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.shipping_method (id, shipping_option_id, order_id, cart_id, swap_id, return_id, price, data, claim_order_id) FROM stdin;
sm_01J8D3PBFQEF4YGDR9T33C1RHC	so_01J8BYQCHM6TYND255921H5YR4	order_01J8D3PH9ZE4S9MGG87P00W6B3	cart_01J8BZ2DV7K39ZK3V7QMNYKJHN	\N	\N	800	{}	\N
sm_01J8D3R9PMX4VPNT6T7PDRSRE1	so_01J8BYQCHM6TYND255921H5YR4	order_01J8D3RC8ETYVE7HJ6J7AD7RGE	cart_01J8D3QFV17HV9G47KQ8S938ER	\N	\N	800	{}	\N
\.


--
-- Data for Name: shipping_method_tax_line; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.shipping_method_tax_line (id, rate, name, code, created_at, updated_at, metadata, shipping_method_id) FROM stdin;
smtl_01J8D3PH8S5PEVXKE67GJV38RD	0	default	default	2024-09-22 14:55:44.915817+00	2024-09-22 14:55:44.943454+00	\N	sm_01J8D3PBFQEF4YGDR9T33C1RHC
smtl_01J8D3RC6X1X452B6ZV3M67Z5H	0	default	default	2024-09-22 14:56:45.272058+00	2024-09-22 14:56:45.295885+00	\N	sm_01J8D3R9PMX4VPNT6T7PDRSRE1
\.


--
-- Data for Name: shipping_option; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.shipping_option (id, name, region_id, profile_id, provider_id, price_type, amount, is_return, data, created_at, updated_at, deleted_at, metadata, admin_only) FROM stdin;
so_01J8BYQBYXE82NMMH5YB41JA6W	PostFake Standard	reg_01J8BYQANZ18VMHSHMJYBDMNPJ	sp_01J8BYQ289TPQV0YGQC4JGVZB9	manual	flat_rate	1000	f	{"id": "manual-fulfillment"}	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	f
so_01J8BYQC3J9PGXZPXYZF0GG380	PostFake Express	reg_01J8BYQANZ18VMHSHMJYBDMNPJ	sp_01J8BYQ289TPQV0YGQC4JGVZB9	manual	flat_rate	1500	f	{"id": "manual-fulfillment"}	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	f
so_01J8BYQC89FS2SAX4V94ZVBYXK	PostFake Return	reg_01J8BYQANZ18VMHSHMJYBDMNPJ	sp_01J8BYQ289TPQV0YGQC4JGVZB9	manual	flat_rate	1000	t	{"id": "manual-fulfillment"}	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	f
so_01J8BYQCCZ14VKNMRX276BFQ6S	I want to return it myself	reg_01J8BYQANZ18VMHSHMJYBDMNPJ	sp_01J8BYQ289TPQV0YGQC4JGVZB9	manual	flat_rate	0	t	{"id": "manual-fulfillment"}	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	f
so_01J8BYQCHM6TYND255921H5YR4	FakeEx Standard	reg_01J8BYQBJCYB0N9BYR9TR01HK0	sp_01J8BYQ289TPQV0YGQC4JGVZB9	manual	flat_rate	800	f	{"id": "manual-fulfillment"}	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	f
so_01J8BYQCPB4VVV9XXMX6AT9MTK	FakeEx Express	reg_01J8BYQBJCYB0N9BYR9TR01HK0	sp_01J8BYQ289TPQV0YGQC4JGVZB9	manual	flat_rate	1200	f	{"id": "manual-fulfillment"}	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	f
so_01J8BYQCV0RSZVGRNNGKCHB06V	FakeEx Return	reg_01J8BYQBJCYB0N9BYR9TR01HK0	sp_01J8BYQ289TPQV0YGQC4JGVZB9	manual	flat_rate	800	t	{"id": "manual-fulfillment"}	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	f
so_01J8BYQCZQ9PZYV6Y5FKY1GJHX	I want to return it myself	reg_01J8BYQBJCYB0N9BYR9TR01HK0	sp_01J8BYQ289TPQV0YGQC4JGVZB9	manual	flat_rate	0	t	{"id": "manual-fulfillment"}	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	f
so_01J8D44AAHNHB8MP70N953QDJQ	Thailand Post	reg_01J8D42DAW9NN5YTXY422JW2D4	sp_01J8BYQ289TPQV0YGQC4JGVZB9	manual	flat_rate	100	f	{"id": "manual-fulfillment"}	2024-09-22 15:03:16.559448+00	2024-09-22 15:10:23.635718+00	\N	{}	f
so_01J8D49TP1EAY2AWWP75GGX6HV	I want to return it myself	reg_01J8D42DAW9NN5YTXY422JW2D4	sp_01J8BYQ289TPQV0YGQC4JGVZB9	manual	flat_rate	100	t	{"id": "manual-fulfillment"}	2024-09-22 15:06:17.151659+00	2024-09-22 15:10:28.882872+00	\N	{}	f
\.


--
-- Data for Name: shipping_option_requirement; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.shipping_option_requirement (id, shipping_option_id, type, amount, deleted_at) FROM stdin;
\.


--
-- Data for Name: shipping_profile; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.shipping_profile (id, name, type, created_at, updated_at, deleted_at, metadata) FROM stdin;
sp_01J8BYQ289TPQV0YGQC4JGVZB9	Default Shipping Profile	default	2024-09-22 04:09:24.800879+00	2024-09-22 04:09:24.800879+00	\N	\N
sp_01J8BYQ29VDXG4N7018H8B9WXG	Gift Card Profile	gift_card	2024-09-22 04:09:24.800879+00	2024-09-22 04:09:24.800879+00	\N	\N
\.


--
-- Data for Name: shipping_tax_rate; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.shipping_tax_rate (shipping_option_id, rate_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: staged_job; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.staged_job (id, event_name, data, options) FROM stdin;
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.store (id, name, default_currency_code, swap_link_template, created_at, updated_at, metadata, payment_link_template, invite_link_template, default_sales_channel_id, default_location_id) FROM stdin;
store_01J8BYQ23N78FYGV39RBYT0D3K	Medusa Store	usd	\N	2024-09-22 04:09:24.800879+00	2024-09-22 04:09:24.800879+00	\N	\N	\N	sc_01J8BYQ2PBJW9XPRZ33WNFCRS8	\N
\.


--
-- Data for Name: store_currencies; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.store_currencies (store_id, currency_code) FROM stdin;
store_01J8BYQ23N78FYGV39RBYT0D3K	usd
store_01J8BYQ23N78FYGV39RBYT0D3K	eur
store_01J8BYQ23N78FYGV39RBYT0D3K	thb
\.


--
-- Data for Name: swap; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.swap (id, fulfillment_status, payment_status, order_id, difference_due, shipping_address_id, cart_id, confirmed_at, created_at, updated_at, deleted_at, metadata, idempotency_key, no_notification, canceled_at, allow_backorder) FROM stdin;
\.


--
-- Data for Name: tax_provider; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.tax_provider (id, is_installed) FROM stdin;
\.


--
-- Data for Name: tax_rate; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.tax_rate (id, rate, code, name, region_id, created_at, updated_at, metadata) FROM stdin;
\.


--
-- Data for Name: tracking_link; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public.tracking_link (id, url, tracking_number, fulfillment_id, created_at, updated_at, deleted_at, metadata, idempotency_key) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: medusauser
--

COPY public."user" (id, email, first_name, last_name, password_hash, api_token, created_at, updated_at, deleted_at, metadata, role) FROM stdin;
usr_01J8BYQA03MW6XP8CY705D41QT	admin@medusa-test.com	\N	\N	c2NyeXB0AAEAAAABAAAAAU4a1/hr20EGzijDYxboJQbcwm/gKgFChc2h/WDx9SaSwo9vH0I716KGzP/k7R9rGb6MsjnSoGUdADG9Zhd45HYbEvh8wdw2PYS25W+qz/MZ	\N	2024-09-22 04:09:32.516482+00	2024-09-22 04:09:32.516482+00	\N	\N	member
usr_01J8BYT9WRWDHGYVQYE549GF6V	patipat.che@mahidol.edu			c2NyeXB0AAEAAAABAAAAAX2p/Yl/VOw/GyIvdHb78ZFW0jggBbablg8ZznGOIN2jZ7X1TQKePeY1sonNroXRqX2J+qmeddpKPYTWEIOAr7YakaFsjcwBfQ1W5wGYioea	\N	2024-09-22 04:11:10.980865+00	2024-09-22 04:11:10.980865+00	\N	\N	admin
\.


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medusauser
--

SELECT pg_catalog.setval('public.country_id_seq', 250, true);


--
-- Name: draft_order_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medusauser
--

SELECT pg_catalog.setval('public.draft_order_display_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medusauser
--

SELECT pg_catalog.setval('public.migrations_id_seq', 78, true);


--
-- Name: order_display_id_seq; Type: SEQUENCE SET; Schema: public; Owner: medusauser
--

SELECT pg_catalog.setval('public.order_display_id_seq', 2, true);


--
-- Name: payment_session OneSelected; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_session
    ADD CONSTRAINT "OneSelected" UNIQUE (cart_id, is_selected);


--
-- Name: money_amount PK_022e49a7e21a8dfb820f788778a; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.money_amount
    ADD CONSTRAINT "PK_022e49a7e21a8dfb820f788778a" PRIMARY KEY (id);


--
-- Name: notification_provider PK_0425c2423e2ce9fdfd5c23761d9; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.notification_provider
    ADD CONSTRAINT "PK_0425c2423e2ce9fdfd5c23761d9" PRIMARY KEY (id);


--
-- Name: store_currencies PK_0f2bff3bccc785c320a4df836de; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.store_currencies
    ADD CONSTRAINT "PK_0f2bff3bccc785c320a4df836de" PRIMARY KEY (store_id, currency_code);


--
-- Name: order PK_1031171c13130102495201e3e20; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "PK_1031171c13130102495201e3e20" PRIMARY KEY (id);


--
-- Name: cart_discounts PK_10bd412c9071ccc0cf555afd9bb; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart_discounts
    ADD CONSTRAINT "PK_10bd412c9071ccc0cf555afd9bb" PRIMARY KEY (cart_id, discount_id);


--
-- Name: product_images PK_10de97980da2e939c4c0e8423f2; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT "PK_10de97980da2e939c4c0e8423f2" PRIMARY KEY (product_id, image_id);


--
-- Name: product_tag PK_1439455c6528caa94fcc8564fda; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_tag
    ADD CONSTRAINT "PK_1439455c6528caa94fcc8564fda" PRIMARY KEY (id);


--
-- Name: discount_regions PK_15974566a8b6e04a7c754e85b75; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_regions
    ADD CONSTRAINT "PK_15974566a8b6e04a7c754e85b75" PRIMARY KEY (discount_id, region_id);


--
-- Name: product_variant PK_1ab69c9935c61f7c70791ae0a9f; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "PK_1ab69c9935c61f7c70791ae0a9f" PRIMARY KEY (id);


--
-- Name: price_list_customer_groups PK_1afcbe15cc8782dc80c05707df9; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.price_list_customer_groups
    ADD CONSTRAINT "PK_1afcbe15cc8782dc80c05707df9" PRIMARY KEY (price_list_id, customer_group_id);


--
-- Name: product_tags PK_1cf5c9537e7198df494b71b993f; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT "PK_1cf5c9537e7198df494b71b993f" PRIMARY KEY (product_id, product_tag_id);


--
-- Name: idempotency_key PK_213f125e14469be304f9ff1d452; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.idempotency_key
    ADD CONSTRAINT "PK_213f125e14469be304f9ff1d452" PRIMARY KEY (id);


--
-- Name: cart_gift_cards PK_2389be82bf0ef3635e2014c9ef1; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart_gift_cards
    ADD CONSTRAINT "PK_2389be82bf0ef3635e2014c9ef1" PRIMARY KEY (cart_id, gift_card_id);


--
-- Name: tax_rate PK_23b71b53f650c0b39e99ccef4fd; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "PK_23b71b53f650c0b39e99ccef4fd" PRIMARY KEY (id);


--
-- Name: product_option_value PK_2ab71ed3b21be5800905c621535; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_option_value
    ADD CONSTRAINT "PK_2ab71ed3b21be5800905c621535" PRIMARY KEY (id);


--
-- Name: line_item_adjustment PK_2b1360103753df2dc8257c2c8c3; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item_adjustment
    ADD CONSTRAINT "PK_2b1360103753df2dc8257c2c8c3" PRIMARY KEY (id);


--
-- Name: shipping_option PK_2e56fddaa65f3a26d402e5d786e; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT "PK_2e56fddaa65f3a26d402e5d786e" PRIMARY KEY (id);


--
-- Name: product_tax_rate PK_326257ce468df46cd5c8c5922e9; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_tax_rate
    ADD CONSTRAINT "PK_326257ce468df46cd5c8c5922e9" PRIMARY KEY (product_id, rate_id);


--
-- Name: discount_rule_products PK_351c8c92f5d27283c445cd022ee; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_rule_products
    ADD CONSTRAINT "PK_351c8c92f5d27283c445cd022ee" PRIMARY KEY (discount_rule_id, product_id);


--
-- Name: discount_condition_product_type PK_35d538a5a24399d0df978df12ed; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product_type
    ADD CONSTRAINT "PK_35d538a5a24399d0df978df12ed" PRIMARY KEY (product_type_id, condition_id);


--
-- Name: return_item PK_46409dc1dd5f38509b9000c3069; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT "PK_46409dc1dd5f38509b9000c3069" PRIMARY KEY (return_id, item_id);


--
-- Name: order_gift_cards PK_49a8ec66a6625d7c2e3526e05b4; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_gift_cards
    ADD CONSTRAINT "PK_49a8ec66a6625d7c2e3526e05b4" PRIMARY KEY (order_id, gift_card_id);


--
-- Name: product_collection PK_49d419fc77d3aed46c835c558ac; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT "PK_49d419fc77d3aed46c835c558ac" PRIMARY KEY (id);


--
-- Name: line_item_tax_line PK_4a0f4322fcd5ce4af85727f89a8; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item_tax_line
    ADD CONSTRAINT "PK_4a0f4322fcd5ce4af85727f89a8" PRIMARY KEY (id);


--
-- Name: swap PK_4a10d0f359339acef77e7f986d9; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.swap
    ADD CONSTRAINT "PK_4a10d0f359339acef77e7f986d9" PRIMARY KEY (id);


--
-- Name: product_option PK_4cf3c467e9bc764bdd32c4cd938; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT "PK_4cf3c467e9bc764bdd32c4cd938" PRIMARY KEY (id);


--
-- Name: fulfillment PK_50c102da132afffae660585981f; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "PK_50c102da132afffae660585981f" PRIMARY KEY (id);


--
-- Name: price_list PK_52ea7826468b1c889cb2c28df03; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.price_list
    ADD CONSTRAINT "PK_52ea7826468b1c889cb2c28df03" PRIMARY KEY (id);


--
-- Name: claim_item_tags PK_54ab8ce0f7e99167068188fbd81; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_item_tags
    ADD CONSTRAINT "PK_54ab8ce0f7e99167068188fbd81" PRIMARY KEY (item_id, tag_id);


--
-- Name: shipping_method_tax_line PK_54c94f5908aacbd51cf0a73edb1; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method_tax_line
    ADD CONSTRAINT "PK_54c94f5908aacbd51cf0a73edb1" PRIMARY KEY (id);


--
-- Name: claim_item PK_5679662039bc4c7c6bc7fa1be2d; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_item
    ADD CONSTRAINT "PK_5679662039bc4c7c6bc7fa1be2d" PRIMARY KEY (id);


--
-- Name: order_edit PK_58ab6acf2e84b4e827f5f846f7a; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_edit
    ADD CONSTRAINT "PK_58ab6acf2e84b4e827f5f846f7a" PRIMARY KEY (id);


--
-- Name: region_fulfillment_providers PK_5b7d928a1fb50d6803868cfab3a; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.region_fulfillment_providers
    ADD CONSTRAINT "PK_5b7d928a1fb50d6803868cfab3a" PRIMARY KEY (region_id, provider_id);


--
-- Name: region PK_5f48ffc3af96bc486f5f3f3a6da; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT "PK_5f48ffc3af96bc486f5f3f3a6da" PRIMARY KEY (id);


--
-- Name: publishable_api_key_sales_channel PK_68eaeb14bdac8954460054c567c; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.publishable_api_key_sales_channel
    ADD CONSTRAINT "PK_68eaeb14bdac8954460054c567c" PRIMARY KEY (sales_channel_id, publishable_key_id);


--
-- Name: notification PK_705b6c7cdf9b2c2ff7ac7872cb7; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "PK_705b6c7cdf9b2c2ff7ac7872cb7" PRIMARY KEY (id);


--
-- Name: currency PK_723472e41cae44beb0763f4039c; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT "PK_723472e41cae44beb0763f4039c" PRIMARY KEY (code);


--
-- Name: claim_tag PK_7761180541142a5926501018d34; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_tag
    ADD CONSTRAINT "PK_7761180541142a5926501018d34" PRIMARY KEY (id);


--
-- Name: claim_image PK_7c49e44bfe8840ca7d917890101; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_image
    ADD CONSTRAINT "PK_7c49e44bfe8840ca7d917890101" PRIMARY KEY (id);


--
-- Name: customer_group PK_88e7da3ff7262d9e0a35aa3664e; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.customer_group
    ADD CONSTRAINT "PK_88e7da3ff7262d9e0a35aa3664e" PRIMARY KEY (id);


--
-- Name: onboarding_state PK_891b72628471aada55d7b8c9410; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.onboarding_state
    ADD CONSTRAINT "PK_891b72628471aada55d7b8c9410" PRIMARY KEY (id);


--
-- Name: claim_order PK_8981f5595a4424021466aa4c7a4; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_order
    ADD CONSTRAINT "PK_8981f5595a4424021466aa4c7a4" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: custom_shipping_option PK_8dfcb5c1172c29eec4a728420cc; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.custom_shipping_option
    ADD CONSTRAINT "PK_8dfcb5c1172c29eec4a728420cc" PRIMARY KEY (id);


--
-- Name: analytics_config PK_93505647c5d7cb479becb810b0f; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.analytics_config
    ADD CONSTRAINT "PK_93505647c5d7cb479becb810b0f" PRIMARY KEY (id);


--
-- Name: return_reason PK_95fd1172973165790903e65660a; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return_reason
    ADD CONSTRAINT "PK_95fd1172973165790903e65660a" PRIMARY KEY (id);


--
-- Name: note PK_96d0c172a4fba276b1bbed43058; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT "PK_96d0c172a4fba276b1bbed43058" PRIMARY KEY (id);


--
-- Name: discount_condition_product PK_994eb4529fdbf14450d64ec17e8; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product
    ADD CONSTRAINT "PK_994eb4529fdbf14450d64ec17e8" PRIMARY KEY (product_id, condition_id);


--
-- Name: product_variant_inventory_item PK_9a1188b8d36f4d198303b4f7efa; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_variant_inventory_item
    ADD CONSTRAINT "PK_9a1188b8d36f4d198303b4f7efa" PRIMARY KEY (id);


--
-- Name: staged_job PK_9a28fb48c46c5509faf43ac8c8d; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.staged_job
    ADD CONSTRAINT "PK_9a28fb48c46c5509faf43ac8c8d" PRIMARY KEY (id);


--
-- Name: publishable_api_key PK_9e613278673a87de92c606b4494; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.publishable_api_key
    ADD CONSTRAINT "PK_9e613278673a87de92c606b4494" PRIMARY KEY (id);


--
-- Name: region_payment_providers PK_9fa1e69914d3dd752de6b1da407; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.region_payment_providers
    ADD CONSTRAINT "PK_9fa1e69914d3dd752de6b1da407" PRIMARY KEY (region_id, provider_id);


--
-- Name: shipping_option_requirement PK_a0ff15442606d9f783602cb23a7; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_option_requirement
    ADD CONSTRAINT "PK_a0ff15442606d9f783602cb23a7" PRIMARY KEY (id);


--
-- Name: payment_session PK_a1a91b20f7f3b1e5afb5485cbcd; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_session
    ADD CONSTRAINT "PK_a1a91b20f7f3b1e5afb5485cbcd" PRIMARY KEY (id);


--
-- Name: order_discounts PK_a7418714ffceebc125bf6d8fcfe; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_discounts
    ADD CONSTRAINT "PK_a7418714ffceebc125bf6d8fcfe" PRIMARY KEY (order_id, discount_id);


--
-- Name: customer PK_a7a13f4cacb744524e44dfdad32; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "PK_a7a13f4cacb744524e44dfdad32" PRIMARY KEY (id);


--
-- Name: discount_condition_product_tag PK_a95382c1e62205b121aa058682b; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product_tag
    ADD CONSTRAINT "PK_a95382c1e62205b121aa058682b" PRIMARY KEY (product_tag_id, condition_id);


--
-- Name: oauth PK_a957b894e50eb16b969c0640a8d; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.oauth
    ADD CONSTRAINT "PK_a957b894e50eb16b969c0640a8d" PRIMARY KEY (id);


--
-- Name: discount_rule PK_ac2c280de3701b2d66f6817f760; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_rule
    ADD CONSTRAINT "PK_ac2c280de3701b2d66f6817f760" PRIMARY KEY (id);


--
-- Name: gift_card PK_af4e338d2d41035042843ad641f; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.gift_card
    ADD CONSTRAINT "PK_af4e338d2d41035042843ad641f" PRIMARY KEY (id);


--
-- Name: sales_channel_location PK_afd2c2c52634bc8280a9c9ee533; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.sales_channel_location
    ADD CONSTRAINT "PK_afd2c2c52634bc8280a9c9ee533" PRIMARY KEY (id);


--
-- Name: tax_provider PK_b198bf82ba6a317c11763d99b99; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.tax_provider
    ADD CONSTRAINT "PK_b198bf82ba6a317c11763d99b99" PRIMARY KEY (id);


--
-- Name: discount_condition_product_collection PK_b3508fc787aa4a38705866cbb6d; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product_collection
    ADD CONSTRAINT "PK_b3508fc787aa4a38705866cbb6d" PRIMARY KEY (product_collection_id, condition_id);


--
-- Name: shipping_method PK_b9b0adfad3c6b99229c1e7d4865; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "PK_b9b0adfad3c6b99229c1e7d4865" PRIMARY KEY (id);


--
-- Name: fulfillment_item PK_bc3e8a388de75db146a249922e0; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.fulfillment_item
    ADD CONSTRAINT "PK_bc3e8a388de75db146a249922e0" PRIMARY KEY (fulfillment_id, item_id);


--
-- Name: shipping_tax_rate PK_bcd93b14d7e2695365d383f5eae; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_tax_rate
    ADD CONSTRAINT "PK_bcd93b14d7e2695365d383f5eae" PRIMARY KEY (shipping_option_id, rate_id);


--
-- Name: fulfillment_provider PK_beb35a6de60a6c4f91d5ae57e44; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.fulfillment_provider
    ADD CONSTRAINT "PK_beb35a6de60a6c4f91d5ae57e44" PRIMARY KEY (id);


--
-- Name: product PK_bebc9158e480b949565b4dc7a82; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);


--
-- Name: country PK_bf6e37c231c4f4ea56dcd887269; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT "PK_bf6e37c231c4f4ea56dcd887269" PRIMARY KEY (id);


--
-- Name: cart PK_c524ec48751b9b5bcfbf6e59be7; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "PK_c524ec48751b9b5bcfbf6e59be7" PRIMARY KEY (id);


--
-- Name: shipping_profile PK_c8120e4543a5a3a121f2968a1ec; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_profile
    ADD CONSTRAINT "PK_c8120e4543a5a3a121f2968a1ec" PRIMARY KEY (id);


--
-- Name: return PK_c8ad68d13e76d75d803b5aeebc4; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "PK_c8ad68d13e76d75d803b5aeebc4" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: line_item PK_cce6b13e67fa506d1d9618ac68b; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "PK_cce6b13e67fa506d1d9618ac68b" PRIMARY KEY (id);


--
-- Name: discount_condition_customer_group PK_cdc8b2277169a16b8b7d4c73e0e; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_customer_group
    ADD CONSTRAINT "PK_cdc8b2277169a16b8b7d4c73e0e" PRIMARY KEY (customer_group_id, condition_id);


--
-- Name: gift_card_transaction PK_cfb5b4ba5447a507aef87d73fe7; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.gift_card_transaction
    ADD CONSTRAINT "PK_cfb5b4ba5447a507aef87d73fe7" PRIMARY KEY (id);


--
-- Name: discount PK_d05d8712e429673e459e7f1cddb; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT "PK_d05d8712e429673e459e7f1cddb" PRIMARY KEY (id);


--
-- Name: sales_channel PK_d1eb0b923ea5a0eb1e0916191f1; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.sales_channel
    ADD CONSTRAINT "PK_d1eb0b923ea5a0eb1e0916191f1" PRIMARY KEY (id);


--
-- Name: image PK_d6db1ab4ee9ad9dbe86c64e4cc3; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT "PK_d6db1ab4ee9ad9dbe86c64e4cc3" PRIMARY KEY (id);


--
-- Name: order_item_change PK_d6eb138f77ffdee83567b85af0c; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "PK_d6eb138f77ffdee83567b85af0c" PRIMARY KEY (id);


--
-- Name: address PK_d92de1f82754668b5f5f5dd4fd5; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "PK_d92de1f82754668b5f5f5dd4fd5" PRIMARY KEY (id);


--
-- Name: product_type_tax_rate PK_ddc9242de1d99bc7674969289f0; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_type_tax_rate
    ADD CONSTRAINT "PK_ddc9242de1d99bc7674969289f0" PRIMARY KEY (product_type_id, rate_id);


--
-- Name: product_type PK_e0843930fbb8854fe36ca39dae1; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT "PK_e0843930fbb8854fe36ca39dae1" PRIMARY KEY (id);


--
-- Name: customer_group_customers PK_e28a55e34ad1e2d3df9a0ac86d3; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.customer_group_customers
    ADD CONSTRAINT "PK_e28a55e34ad1e2d3df9a0ac86d3" PRIMARY KEY (customer_group_id, customer_id);


--
-- Name: batch_job PK_e57f84d485145d5be96bc6d871e; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.batch_job
    ADD CONSTRAINT "PK_e57f84d485145d5be96bc6d871e" PRIMARY KEY (id);


--
-- Name: discount_condition PK_e6b81d83133ddc21a2baf2e2204; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition
    ADD CONSTRAINT "PK_e6b81d83133ddc21a2baf2e2204" PRIMARY KEY (id);


--
-- Name: payment_provider PK_ea94f42b6c88e9191c3649d7522; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_provider
    ADD CONSTRAINT "PK_ea94f42b6c88e9191c3649d7522" PRIMARY KEY (id);


--
-- Name: refund PK_f1cefa2e60d99b206c46c1116e5; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT "PK_f1cefa2e60d99b206c46c1116e5" PRIMARY KEY (id);


--
-- Name: store PK_f3172007d4de5ae8e7692759d79; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT "PK_f3172007d4de5ae8e7692759d79" PRIMARY KEY (id);


--
-- Name: draft_order PK_f478946c183d98f8d88a94cfcd7; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.draft_order
    ADD CONSTRAINT "PK_f478946c183d98f8d88a94cfcd7" PRIMARY KEY (id);


--
-- Name: invite PK_fc9fa190e5a3c5d80604a4f63e1; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.invite
    ADD CONSTRAINT "PK_fc9fa190e5a3c5d80604a4f63e1" PRIMARY KEY (id);


--
-- Name: payment PK_fcaec7df5adf9cac408c686b2ab; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "PK_fcaec7df5adf9cac408c686b2ab" PRIMARY KEY (id);


--
-- Name: tracking_link PK_fcfd77feb9012ec2126d7c0bfb6; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.tracking_link
    ADD CONSTRAINT "PK_fcfd77feb9012ec2126d7c0bfb6" PRIMARY KEY (id);


--
-- Name: product_sales_channel PK_fd29b6a8bd641052628dee19583; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_sales_channel
    ADD CONSTRAINT "PK_fd29b6a8bd641052628dee19583" PRIMARY KEY (product_id, sales_channel_id);


--
-- Name: payment_collection PK_payment_collection_id; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_collection
    ADD CONSTRAINT "PK_payment_collection_id" PRIMARY KEY (id);


--
-- Name: payment_collection_payments PK_payment_collection_payments; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_collection_payments
    ADD CONSTRAINT "PK_payment_collection_payments" PRIMARY KEY (payment_collection_id, payment_id);


--
-- Name: payment_collection_sessions PK_payment_collection_sessions; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_collection_sessions
    ADD CONSTRAINT "PK_payment_collection_sessions" PRIMARY KEY (payment_collection_id, payment_session_id);


--
-- Name: product_variant_money_amount PK_product_variant_money_amount; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_variant_money_amount
    ADD CONSTRAINT "PK_product_variant_money_amount" PRIMARY KEY (id);


--
-- Name: product_category PK_qgguwbn1cwstxk93efl0px9oqwt; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT "PK_qgguwbn1cwstxk93efl0px9oqwt" PRIMARY KEY (id);


--
-- Name: shipping_method REL_1d9ad62038998c3a85c77a53cf; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "REL_1d9ad62038998c3a85c77a53cf" UNIQUE (return_id);


--
-- Name: swap REL_402e8182bc553e082f6380020b; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.swap
    ADD CONSTRAINT "REL_402e8182bc553e082f6380020b" UNIQUE (cart_id);


--
-- Name: draft_order REL_5bd11d0e2a9628128e2c26fd0a; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.draft_order
    ADD CONSTRAINT "REL_5bd11d0e2a9628128e2c26fd0a" UNIQUE (cart_id);


--
-- Name: order_item_change REL_5f9688929761f7df108b630e64; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "REL_5f9688929761f7df108b630e64" UNIQUE (line_item_id);


--
-- Name: customer REL_8abe81b9aac151ae60bf507ad1; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "REL_8abe81b9aac151ae60bf507ad1" UNIQUE (billing_address_id);


--
-- Name: draft_order REL_8f6dd6c49202f1466ebf21e77d; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.draft_order
    ADD CONSTRAINT "REL_8f6dd6c49202f1466ebf21e77d" UNIQUE (order_id);


--
-- Name: cart REL_9d1a161434c610aae7c3df2dc7; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "REL_9d1a161434c610aae7c3df2dc7" UNIQUE (payment_id);


--
-- Name: return REL_bad82d7bff2b08b87094bfac3d; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "REL_bad82d7bff2b08b87094bfac3d" UNIQUE (swap_id);


--
-- Name: payment REL_c17aff091441b7c25ec3d68d36; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "REL_c17aff091441b7c25ec3d68d36" UNIQUE (swap_id);


--
-- Name: order REL_c99a206eb11ad45f6b7f04f2dc; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "REL_c99a206eb11ad45f6b7f04f2dc" UNIQUE (cart_id);


--
-- Name: custom_shipping_option UQ_0f838b122a9a01d921aa1cdb669; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.custom_shipping_option
    ADD CONSTRAINT "UQ_0f838b122a9a01d921aa1cdb669" UNIQUE (shipping_option_id, cart_id);


--
-- Name: line_item_tax_line UQ_3c2af51043ed7243e7d9775a2ad; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item_tax_line
    ADD CONSTRAINT "UQ_3c2af51043ed7243e7d9775a2ad" UNIQUE (item_id, code);


--
-- Name: order_item_change UQ_5b7a99181e4db2ea821be0b6196; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "UQ_5b7a99181e4db2ea821be0b6196" UNIQUE (order_edit_id, original_line_item_id);


--
-- Name: store UQ_61b0f48cccbb5f41c750bac7286; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT "UQ_61b0f48cccbb5f41c750bac7286" UNIQUE (default_sales_channel_id);


--
-- Name: return UQ_71773d56eb2bacb922bc3283398; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "UQ_71773d56eb2bacb922bc3283398" UNIQUE (claim_order_id);


--
-- Name: order UQ_727b872f86c7378474a8fa46147; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "UQ_727b872f86c7378474a8fa46147" UNIQUE (draft_order_id);


--
-- Name: product_variant_inventory_item UQ_c9be7c1b11a1a729eb51d1b6bca; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_variant_inventory_item
    ADD CONSTRAINT "UQ_c9be7c1b11a1a729eb51d1b6bca" UNIQUE (variant_id, inventory_item_id);


--
-- Name: shipping_method_tax_line UQ_cd147fca71e50bc954139fa3104; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method_tax_line
    ADD CONSTRAINT "UQ_cd147fca71e50bc954139fa3104" UNIQUE (shipping_method_id, code);


--
-- Name: order_item_change UQ_da93cee3ca0dd50a5246268c2e9; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "UQ_da93cee3ca0dd50a5246268c2e9" UNIQUE (order_edit_id, line_item_id);


--
-- Name: discount_condition dctypeuniq; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition
    ADD CONSTRAINT dctypeuniq UNIQUE (type, operator, discount_rule_id);


--
-- Name: gift_card_transaction gcuniq; Type: CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.gift_card_transaction
    ADD CONSTRAINT gcuniq UNIQUE (gift_card_id, order_id);


--
-- Name: IDX_012a62ba743e427b5ebe9dee18; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_012a62ba743e427b5ebe9dee18" ON public.shipping_option_requirement USING btree (shipping_option_id);


--
-- Name: IDX_01486cc9dc6b36bf658685535f; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_01486cc9dc6b36bf658685535f" ON public.discount_condition_product_tag USING btree (product_tag_id);


--
-- Name: IDX_017d58bf8260c6e1a2588d258e; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_017d58bf8260c6e1a2588d258e" ON public.claim_order USING btree (shipping_address_id);


--
-- Name: IDX_045d4a149c09f4704e0bc08dd4; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_045d4a149c09f4704e0bc08dd4" ON public.product_variant USING btree (barcode) WHERE (deleted_at IS NULL);


--
-- Name: IDX_0fb38b6d167793192bc126d835; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_0fb38b6d167793192bc126d835" ON public.cart_gift_cards USING btree (gift_card_id);


--
-- Name: IDX_0fc1ec4e3db9001ad60c19daf1; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_0fc1ec4e3db9001ad60c19daf1" ON public.order_discounts USING btree (discount_id);


--
-- Name: IDX_118e3c48f09a7728f41023c94e; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_118e3c48f09a7728f41023c94e" ON public.line_item USING btree (claim_order_id);


--
-- Name: IDX_19b0c6293443d1b464f604c331; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_19b0c6293443d1b464f604c331" ON public."order" USING btree (shipping_address_id);


--
-- Name: IDX_1d04aebeabb6a89f87e536a124; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_1d04aebeabb6a89f87e536a124" ON public.product_tax_rate USING btree (product_id);


--
-- Name: IDX_1d9ad62038998c3a85c77a53cf; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_1d9ad62038998c3a85c77a53cf" ON public.shipping_method USING btree (return_id);


--
-- Name: IDX_21683a063fe82dafdf681ecc9c; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_21683a063fe82dafdf681ecc9c" ON public.product_tags USING btree (product_tag_id);


--
-- Name: IDX_21cbfedd83d736d86f4c6f4ce5; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_21cbfedd83d736d86f4c6f4ce5" ON public.claim_image USING btree (claim_item_id);


--
-- Name: IDX_2212515ba306c79f42c46a99db; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_2212515ba306c79f42c46a99db" ON public.product_images USING btree (image_id);


--
-- Name: IDX_242205c81c1152fab1b6e84847; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_242205c81c1152fab1b6e84847" ON public.cart USING btree (customer_id);


--
-- Name: IDX_2484cf14c437a04586b07e7ddd; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_2484cf14c437a04586b07e7ddd" ON public.product_tax_rate USING btree (rate_id);


--
-- Name: IDX_25a3138bb236f63d9bb6c8ff11; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_25a3138bb236f63d9bb6c8ff11" ON public.product_type_tax_rate USING btree (product_type_id);


--
-- Name: IDX_27283ee631862266d0f1c68064; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_27283ee631862266d0f1c68064" ON public.line_item USING btree (cart_id);


--
-- Name: IDX_2ca8cfbdafb998ecfd6d340389; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_2ca8cfbdafb998ecfd6d340389" ON public.product_variant USING btree (sku) WHERE (deleted_at IS NULL);


--
-- Name: IDX_2f41b20a71f30e60471d7e3769; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_2f41b20a71f30e60471d7e3769" ON public.line_item_adjustment USING btree (discount_id);


--
-- Name: IDX_3287f98befad26c3a7dab088cf; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_3287f98befad26c3a7dab088cf" ON public.note USING btree (resource_id);


--
-- Name: IDX_346e0016cf045b998074774764; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_346e0016cf045b998074774764" ON public.shipping_tax_rate USING btree (rate_id);


--
-- Name: IDX_37341bad297fe5cca91f921032; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_37341bad297fe5cca91f921032" ON public.product_sales_channel USING btree (sales_channel_id);


--
-- Name: IDX_379ca70338ce9991f3affdeedf; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_379ca70338ce9991f3affdeedf" ON public.analytics_config USING btree (id, user_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_37f361c38a18d12a3fa3158d0c; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_37f361c38a18d12a3fa3158d0c" ON public.region_fulfillment_providers USING btree (provider_id);


--
-- Name: IDX_3a6947180aeec283cd92c59ebb; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_3a6947180aeec283cd92c59ebb" ON public.region_payment_providers USING btree (provider_id);


--
-- Name: IDX_3c6412d076292f439269abe1a2; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_3c6412d076292f439269abe1a2" ON public.customer_group_customers USING btree (customer_id);


--
-- Name: IDX_3fa354d8d1233ff81097b2fcb6; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_3fa354d8d1233ff81097b2fcb6" ON public.line_item USING btree (swap_id);


--
-- Name: IDX_43a2b24495fe1d9fc2a9c835bc; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_43a2b24495fe1d9fc2a9c835bc" ON public.line_item USING btree (order_id);


--
-- Name: IDX_44090cb11b06174cbcc667e91c; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_44090cb11b06174cbcc667e91c" ON public.custom_shipping_option USING btree (shipping_option_id);


--
-- Name: IDX_4665f17abc1e81dd58330e5854; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_4665f17abc1e81dd58330e5854" ON public.payment USING btree (cart_id);


--
-- Name: IDX_484c329f4783be4e18e5e2ff09; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_484c329f4783be4e18e5e2ff09" ON public.cart USING btree (region_id);


--
-- Name: IDX_4d5f98645a67545d8dea42e2eb; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_4d5f98645a67545d8dea42e2eb" ON public.discount_condition_customer_group USING btree (customer_group_id);


--
-- Name: IDX_4e0739e5f0244c08d41174ca08; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_4e0739e5f0244c08d41174ca08" ON public.discount_rule_products USING btree (discount_rule_id);


--
-- Name: IDX_4f166bb8c2bfcef2498d97b406; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_4f166bb8c2bfcef2498d97b406" ON public.product_images USING btree (product_id);


--
-- Name: IDX_5077fa54b0d037e984385dfe8a; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_5077fa54b0d037e984385dfe8a" ON public.line_item_tax_line USING btree (item_id);


--
-- Name: IDX_5267705a43d547e232535b656c; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_5267705a43d547e232535b656c" ON public.shipping_method USING btree (order_id);


--
-- Name: IDX_52875734e9dd69064f0041f4d9; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_52875734e9dd69064f0041f4d9" ON public.price_list_customer_groups USING btree (price_list_id);


--
-- Name: IDX_52dd74e8c989aa5665ad2852b8; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_52dd74e8c989aa5665ad2852b8" ON public.swap USING btree (order_id);


--
-- Name: IDX_5371cbaa3be5200f373d24e3d5; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_5371cbaa3be5200f373d24e3d5" ON public.line_item USING btree (variant_id);


--
-- Name: IDX_53cb5605fa42e82b4d47b47bda; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_53cb5605fa42e82b4d47b47bda" ON public.gift_card USING btree (code);


--
-- Name: IDX_5568d3b9ce9f7abeeb37511ecf; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_5568d3b9ce9f7abeeb37511ecf" ON public."order" USING btree (billing_address_id);


--
-- Name: IDX_579e01fb94f4f58db480857e05; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_579e01fb94f4f58db480857e05" ON public."order" USING btree (display_id);


--
-- Name: IDX_5a4d5e1e60f97633547821ec8d; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_5a4d5e1e60f97633547821ec8d" ON public.product_sales_channel USING btree (product_id);


--
-- Name: IDX_5b0c6fc53c574299ecc7f9ee22; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_5b0c6fc53c574299ecc7f9ee22" ON public.product_tags USING btree (product_id);


--
-- Name: IDX_5bd11d0e2a9628128e2c26fd0a; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_5bd11d0e2a9628128e2c26fd0a" ON public.draft_order USING btree (cart_id);


--
-- Name: IDX_5c58105f1752fca0f4ce69f466; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_5c58105f1752fca0f4ce69f466" ON public.shipping_option USING btree (region_id);


--
-- Name: IDX_620330964db8d2999e67b0dbe3; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_620330964db8d2999e67b0dbe3" ON public.customer_group_customers USING btree (customer_group_id);


--
-- Name: IDX_64980511ca32c8e92b417644af; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_64980511ca32c8e92b417644af" ON public.claim_item USING btree (variant_id);


--
-- Name: IDX_6680319ebe1f46d18f106191d5; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_6680319ebe1f46d18f106191d5" ON public.cart_discounts USING btree (cart_id);


--
-- Name: IDX_6b0ce4b4bcfd24491510bf19d1; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_6b0ce4b4bcfd24491510bf19d1" ON public.invite USING btree (user_email);


--
-- Name: IDX_6b9c66b5e36f7c827dfaa092f9; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_6b9c66b5e36f7c827dfaa092f9" ON public.cart USING btree (billing_address_id);


--
-- Name: IDX_6e0cad0daef76bb642675910b9; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_6e0cad0daef76bb642675910b9" ON public.claim_item USING btree (item_id);


--
-- Name: IDX_6ef23ce0b1d9cf9b5b833e52b9; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_6ef23ce0b1d9cf9b5b833e52b9" ON public.discount_condition_product_type USING btree (condition_id);


--
-- Name: IDX_6f234f058bbbea810dce1d04d0; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_6f234f058bbbea810dce1d04d0" ON public.product_collection USING btree (handle) WHERE (deleted_at IS NULL);


--
-- Name: IDX_71773d56eb2bacb922bc328339; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_71773d56eb2bacb922bc328339" ON public.return USING btree (claim_order_id);


--
-- Name: IDX_82a6bbb0b527c20a0002ddcbd6; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_82a6bbb0b527c20a0002ddcbd6" ON public.store_currencies USING btree (currency_code);


--
-- Name: IDX_8486ee16e69013c645d0b8716b; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_8486ee16e69013c645d0b8716b" ON public.discount_condition_customer_group USING btree (condition_id);


--
-- Name: IDX_8aaa78ba90d3802edac317df86; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_8aaa78ba90d3802edac317df86" ON public.region_payment_providers USING btree (region_id);


--
-- Name: IDX_8abe81b9aac151ae60bf507ad1; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_8abe81b9aac151ae60bf507ad1" ON public.customer USING btree (billing_address_id);


--
-- Name: IDX_8df75ef4f35f217768dc113545; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_8df75ef4f35f217768dc113545" ON public.cart_discounts USING btree (discount_id);


--
-- Name: IDX_8f6dd6c49202f1466ebf21e77d; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_8f6dd6c49202f1466ebf21e77d" ON public.draft_order USING btree (order_id);


--
-- Name: IDX_900a9c3834257304396b2b0fe7; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_900a9c3834257304396b2b0fe7" ON public.claim_item USING btree (claim_order_id);


--
-- Name: IDX_926ca9f29014af8091722dede0; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_926ca9f29014af8091722dede0" ON public.shipping_method_tax_line USING btree (shipping_method_id);


--
-- Name: IDX_93caeb1bb70d37c1d36d6701a7; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_93caeb1bb70d37c1d36d6701a7" ON public.custom_shipping_option USING btree (cart_id);


--
-- Name: IDX_9c9614b2f9d01665800ea8dbff; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_9c9614b2f9d01665800ea8dbff" ON public.address USING btree (customer_id);


--
-- Name: IDX_9d1a161434c610aae7c3df2dc7; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_9d1a161434c610aae7c3df2dc7" ON public.cart USING btree (payment_id);


--
-- Name: IDX_a0b05dc4257abe639cb75f8eae; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_a0b05dc4257abe639cb75f8eae" ON public.discount_condition_product_collection USING btree (product_collection_id);


--
-- Name: IDX_a0e206bfaed3cb63c186091734; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_a0e206bfaed3cb63c186091734" ON public.shipping_option USING btree (provider_id);


--
-- Name: IDX_a1c4f9cfb599ad1f0db39cadd5; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_a1c4f9cfb599ad1f0db39cadd5" ON public.discount_condition_product_collection USING btree (condition_id);


--
-- Name: IDX_a21a7ffbe420d492eb46c305fe; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_a21a7ffbe420d492eb46c305fe" ON public.discount_regions USING btree (region_id);


--
-- Name: IDX_a421bf4588d0004a9b0c0fe84f; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_a421bf4588d0004a9b0c0fe84f" ON public.idempotency_key USING btree (idempotency_key);


--
-- Name: IDX_a52e234f729db789cf473297a5; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_a52e234f729db789cf473297a5" ON public.fulfillment USING btree (swap_id);


--
-- Name: IDX_aa16f61348be02dd07ce3fc54e; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_aa16f61348be02dd07ce3fc54e" ON public.product_variant USING btree (upc) WHERE (deleted_at IS NULL);


--
-- Name: IDX_aac4855eadda71aa1e4b6d7684; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_aac4855eadda71aa1e4b6d7684" ON public.payment USING btree (cart_id) WHERE (canceled_at IS NOT NULL);


--
-- Name: IDX_ac2c280de3701b2d66f6817f76; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_ac2c280de3701b2d66f6817f76" ON public.discount USING btree (rule_id);


--
-- Name: IDX_b1aac8314662fa6b25569a575b; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_b1aac8314662fa6b25569a575b" ON public.country USING btree (region_id);


--
-- Name: IDX_b4f4b63d1736689b7008980394; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_b4f4b63d1736689b7008980394" ON public.store_currencies USING btree (store_id);


--
-- Name: IDX_b5b6225539ee8501082fbc0714; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_b5b6225539ee8501082fbc0714" ON public.product_variant USING btree (ean) WHERE (deleted_at IS NULL);


--
-- Name: IDX_b5df0f53a74b9d0c0a2b652c88; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_b5df0f53a74b9d0c0a2b652c88" ON public.notification USING btree (customer_id);


--
-- Name: IDX_b6bcf8c3903097b84e85154eed; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_b6bcf8c3903097b84e85154eed" ON public.gift_card USING btree (region_id);


--
-- Name: IDX_ba8de19442d86957a3aa3b5006; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_ba8de19442d86957a3aa3b5006" ON public."user" USING btree (email) WHERE (deleted_at IS NULL);


--
-- Name: IDX_bad82d7bff2b08b87094bfac3d; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_bad82d7bff2b08b87094bfac3d" ON public.return USING btree (swap_id);


--
-- Name: IDX_be66106a673b88a81c603abe7e; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_be66106a673b88a81c603abe7e" ON public.discount_rule_products USING btree (product_id);


--
-- Name: IDX_be9aea2ccf3567007b6227da4d; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_be9aea2ccf3567007b6227da4d" ON public.line_item_adjustment USING btree (item_id);


--
-- Name: IDX_beb35a6de60a6c4f91d5ae57e4; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_beb35a6de60a6c4f91d5ae57e4" ON public.fulfillment USING btree (provider_id);


--
-- Name: IDX_bf701b88d2041392a288785ada; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_bf701b88d2041392a288785ada" ON public.line_item_adjustment USING btree (discount_id, item_id) WHERE (discount_id IS NOT NULL);


--
-- Name: IDX_c17aff091441b7c25ec3d68d36; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_c17aff091441b7c25ec3d68d36" ON public.payment USING btree (swap_id);


--
-- Name: IDX_c2c0f3edf39515bd15432afe6e; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_c2c0f3edf39515bd15432afe6e" ON public.claim_item_tags USING btree (item_id);


--
-- Name: IDX_c49c061b1a686843c5d673506f; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_c49c061b1a686843c5d673506f" ON public.oauth USING btree (application_name);


--
-- Name: IDX_c4c3a5225a7a1f0af782c40abc; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_c4c3a5225a7a1f0af782c40abc" ON public.customer_group USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: IDX_c5516f550433c9b1c2630d787a; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_c5516f550433c9b1c2630d787a" ON public.price_list_customer_groups USING btree (customer_group_id);


--
-- Name: IDX_c556e14eff4d6f03db593df955; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_c556e14eff4d6f03db593df955" ON public.region_fulfillment_providers USING btree (region_id);


--
-- Name: IDX_c759f53b2e48e8cfb50638fe4e; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_c759f53b2e48e8cfb50638fe4e" ON public.discount_condition_product USING btree (product_id);


--
-- Name: IDX_c951439af4c98bf2bd7fb8726c; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_c951439af4c98bf2bd7fb8726c" ON public.shipping_option USING btree (profile_id);


--
-- Name: IDX_c99a206eb11ad45f6b7f04f2dc; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_c99a206eb11ad45f6b7f04f2dc" ON public."order" USING btree (cart_id);


--
-- Name: IDX_ca67dd080aac5ecf99609960cd; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_ca67dd080aac5ecf99609960cd" ON public.product_variant USING btree (product_id);


--
-- Name: IDX_cd7812c96209c5bdd48a6b858b; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_cd7812c96209c5bdd48a6b858b" ON public."order" USING btree (customer_id);


--
-- Name: IDX_ced15a9a695d2b5db9dabce763; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_ced15a9a695d2b5db9dabce763" ON public.cart USING btree (shipping_address_id);


--
-- Name: IDX_cf9cc6c3f2e6414b992223fff1; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_cf9cc6c3f2e6414b992223fff1" ON public.product USING btree (handle) WHERE (deleted_at IS NULL);


--
-- Name: IDX_d18ad72f2fb7c87f075825b6f8; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_d18ad72f2fb7c87f075825b6f8" ON public.payment_session USING btree (provider_id);


--
-- Name: IDX_d25ba0787e1510ddc5d442ebcf; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_d25ba0787e1510ddc5d442ebcf" ON public.payment_session USING btree (cart_id);


--
-- Name: IDX_d38047a90f3d42f0be7909e8ae; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_d38047a90f3d42f0be7909e8ae" ON public.cart_gift_cards USING btree (cart_id);


--
-- Name: IDX_d4bd17f918fc6c332b74a368c3; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_d4bd17f918fc6c332b74a368c3" ON public.return USING btree (order_id);


--
-- Name: IDX_d73e55964e0ff2db8f03807d52; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_d73e55964e0ff2db8f03807d52" ON public.fulfillment USING btree (claim_order_id);


--
-- Name: IDX_d783a66d1c91c0858752c933e6; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_d783a66d1c91c0858752c933e6" ON public.shipping_method USING btree (claim_order_id);


--
-- Name: IDX_d7d441b81012f87d4265fa57d2; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_d7d441b81012f87d4265fa57d2" ON public.gift_card_transaction USING btree (order_id);


--
-- Name: IDX_d92993a7d554d84571f4eea1d1; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_d92993a7d554d84571f4eea1d1" ON public.shipping_method USING btree (cart_id);


--
-- Name: IDX_dc9bbf9fcb9ba458d25d512811; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_dc9bbf9fcb9ba458d25d512811" ON public.claim_item_tags USING btree (tag_id);


--
-- Name: IDX_df1494d263740fcfb1d09a98fc; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_df1494d263740fcfb1d09a98fc" ON public.notification USING btree (resource_type);


--
-- Name: IDX_dfc1f02bb0552e79076aa58dbb; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_dfc1f02bb0552e79076aa58dbb" ON public.gift_card USING btree (order_id);


--
-- Name: IDX_e1fcce2b18dbcdbe0a5ba9a68b; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_e1fcce2b18dbcdbe0a5ba9a68b" ON public."order" USING btree (region_id);


--
-- Name: IDX_e62ff11e4730bb3adfead979ee; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_e62ff11e4730bb3adfead979ee" ON public.order_gift_cards USING btree (order_id);


--
-- Name: IDX_e706deb68f52ab2756119b9e70; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_e706deb68f52ab2756119b9e70" ON public.discount_condition_product_type USING btree (product_type_id);


--
-- Name: IDX_e78901b1131eaf8203d9b1cb5f; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_e78901b1131eaf8203d9b1cb5f" ON public.country USING btree (iso_2);


--
-- Name: IDX_e7b488cebe333f449398769b2c; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_e7b488cebe333f449398769b2c" ON public.order_discounts USING btree (order_id);


--
-- Name: IDX_e87cc617a22ef4edce5601edab; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_e87cc617a22ef4edce5601edab" ON public.draft_order USING btree (display_id);


--
-- Name: IDX_ea6a358d9ce41c16499aae55f9; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_ea6a358d9ce41c16499aae55f9" ON public.notification USING btree (resource_id);


--
-- Name: IDX_ea94f42b6c88e9191c3649d752; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_ea94f42b6c88e9191c3649d752" ON public.payment USING btree (provider_id);


--
-- Name: IDX_ec10c54769877840c132260e4a; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_ec10c54769877840c132260e4a" ON public.claim_tag USING btree (value);


--
-- Name: IDX_ece65a774192b34253abc4cd67; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_ece65a774192b34253abc4cd67" ON public.product_type_tax_rate USING btree (rate_id);


--
-- Name: IDX_eec9d9af4ca098e19ea6b499ea; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_eec9d9af4ca098e19ea6b499ea" ON public.refund USING btree (order_id);


--
-- Name: IDX_efff700651718e452ca9580a62; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_efff700651718e452ca9580a62" ON public.discount_condition USING btree (discount_rule_id);


--
-- Name: IDX_f05132301e95bdab4ba1cf29a2; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_f05132301e95bdab4ba1cf29a2" ON public.discount_condition_product USING btree (condition_id);


--
-- Name: IDX_f129acc85e346a10eed12b86fc; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_f129acc85e346a10eed12b86fc" ON public.fulfillment USING btree (order_id);


--
-- Name: IDX_f2bb9f71e95b315eb24b2b84cb; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_f2bb9f71e95b315eb24b2b84cb" ON public.order_gift_cards USING btree (gift_card_id);


--
-- Name: IDX_f4194aa81073f3fab8aa86906f; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_f4194aa81073f3fab8aa86906f" ON public.discount_regions USING btree (discount_id);


--
-- Name: IDX_f49e3974465d3c3a33d449d3f3; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_f49e3974465d3c3a33d449d3f3" ON public.claim_order USING btree (order_id);


--
-- Name: IDX_f5221735ace059250daac9d980; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_f5221735ace059250daac9d980" ON public.payment USING btree (order_id);


--
-- Name: IDX_f65bf52e2239ace276ece2b2f4; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_f65bf52e2239ace276ece2b2f4" ON public.discount USING btree (code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_f672727ab020df6c50fb64c1a7; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_f672727ab020df6c50fb64c1a7" ON public.shipping_tax_rate USING btree (shipping_option_id);


--
-- Name: IDX_f74980b411cf94af523a72af7d; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_f74980b411cf94af523a72af7d" ON public.note USING btree (resource_type);


--
-- Name: IDX_fb94fa8d5ca940daa2a58139f8; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_fb94fa8d5ca940daa2a58139f8" ON public.shipping_method USING btree (swap_id);


--
-- Name: IDX_fbb2499551ed074526f3ee3624; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_fbb2499551ed074526f3ee3624" ON public.discount_condition_product_tag USING btree (condition_id);


--
-- Name: IDX_fc963e94854bff2714ca84cd19; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_fc963e94854bff2714ca84cd19" ON public.shipping_method USING btree (shipping_option_id);


--
-- Name: IDX_id_publishable_api_key_sales_channel; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_id_publishable_api_key_sales_channel" ON public.publishable_api_key_sales_channel USING btree (id);


--
-- Name: IDX_money_amount_currency_code; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_money_amount_currency_code" ON public.money_amount USING btree (currency_code);


--
-- Name: IDX_order_currency_code; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_order_currency_code" ON public."order" USING btree (currency_code);


--
-- Name: IDX_order_edit_order_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_order_edit_order_id" ON public.order_edit USING btree (order_id);


--
-- Name: IDX_order_edit_payment_collection_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_order_edit_payment_collection_id" ON public.order_edit USING btree (payment_collection_id);


--
-- Name: IDX_payment_collection_currency_code; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_payment_collection_currency_code" ON public.payment_collection USING btree (currency_code) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_collection_payments_payment_collection_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_payment_collection_payments_payment_collection_id" ON public.payment_collection_payments USING btree (payment_collection_id);


--
-- Name: IDX_payment_collection_payments_payment_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_payment_collection_payments_payment_id" ON public.payment_collection_payments USING btree (payment_id);


--
-- Name: IDX_payment_collection_region_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_payment_collection_region_id" ON public.payment_collection USING btree (region_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_payment_collection_sessions_payment_collection_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_payment_collection_sessions_payment_collection_id" ON public.payment_collection_sessions USING btree (payment_collection_id);


--
-- Name: IDX_payment_collection_sessions_payment_session_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_payment_collection_sessions_payment_session_id" ON public.payment_collection_sessions USING btree (payment_session_id);


--
-- Name: IDX_payment_currency_code; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_payment_currency_code" ON public.payment USING btree (currency_code);


--
-- Name: IDX_pcp_product_category_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_pcp_product_category_id" ON public.product_category_product USING btree (product_category_id);


--
-- Name: IDX_pcp_product_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_pcp_product_id" ON public.product_category_product USING btree (product_id);


--
-- Name: IDX_product_category_active_public; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_product_category_active_public" ON public.product_category USING btree (parent_category_id, is_active, is_internal) WHERE ((is_active IS TRUE) AND (is_internal IS FALSE));


--
-- Name: IDX_product_category_handle; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_product_category_handle" ON public.product_category USING btree (handle);


--
-- Name: IDX_product_category_path; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_product_category_path" ON public.product_category USING btree (mpath);


--
-- Name: IDX_product_variant_inventory_item_inventory_item_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_product_variant_inventory_item_inventory_item_id" ON public.product_variant_inventory_item USING btree (inventory_item_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_product_variant_inventory_item_variant_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_product_variant_inventory_item_variant_id" ON public.product_variant_inventory_item USING btree (variant_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_refund_payment_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_refund_payment_id" ON public.refund USING btree (payment_id);


--
-- Name: IDX_region_currency_code; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_region_currency_code" ON public.region USING btree (currency_code);


--
-- Name: IDX_return_reason_value; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_return_reason_value" ON public.return_reason USING btree (value) WHERE (deleted_at IS NULL);


--
-- Name: IDX_sales_channel_location_location_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_sales_channel_location_location_id" ON public.sales_channel_location USING btree (location_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_sales_channel_location_sales_channel_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX "IDX_sales_channel_location_sales_channel_id" ON public.sales_channel_location USING btree (sales_channel_id) WHERE (deleted_at IS NULL);


--
-- Name: IDX_unique_email_for_guests_and_customer_accounts; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_unique_email_for_guests_and_customer_accounts" ON public.customer USING btree (email, has_account) WHERE (deleted_at IS NULL);


--
-- Name: IDX_upcp_product_id_product_category_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "IDX_upcp_product_id_product_category_id" ON public.product_category_product USING btree (product_category_id, product_id);


--
-- Name: UniqPaymentSessionCartIdProviderId; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "UniqPaymentSessionCartIdProviderId" ON public.payment_session USING btree (cart_id, provider_id) WHERE (cart_id IS NOT NULL);


--
-- Name: UniqProductCategoryParentIdRank; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "UniqProductCategoryParentIdRank" ON public.product_category USING btree (parent_category_id, rank);


--
-- Name: UniquePaymentActive; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX "UniquePaymentActive" ON public.payment USING btree (cart_id) WHERE (canceled_at IS NULL);


--
-- Name: idx_gin_product_collection; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_gin_product_collection ON public.product_collection USING gin (title public.gin_trgm_ops) WHERE (deleted_at IS NULL);


--
-- Name: idx_gin_product_description; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_gin_product_description ON public.product USING gin (description public.gin_trgm_ops) WHERE (deleted_at IS NULL);


--
-- Name: idx_gin_product_title; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_gin_product_title ON public.product USING gin (title public.gin_trgm_ops) WHERE (deleted_at IS NULL);


--
-- Name: idx_gin_product_variant_sku; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_gin_product_variant_sku ON public.product_variant USING gin (sku public.gin_trgm_ops) WHERE (deleted_at IS NULL);


--
-- Name: idx_gin_product_variant_title; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_gin_product_variant_title ON public.product_variant USING gin (title public.gin_trgm_ops) WHERE (deleted_at IS NULL);


--
-- Name: idx_money_amount_region_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_money_amount_region_id ON public.money_amount USING btree (region_id);


--
-- Name: idx_product_option_value_option_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_product_option_value_option_id ON public.product_option_value USING btree (option_id);


--
-- Name: idx_product_option_value_variant_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_product_option_value_variant_id ON public.product_option_value USING btree (variant_id);


--
-- Name: idx_product_shipping_profile_product_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_product_shipping_profile_product_id ON public.product_shipping_profile USING btree (product_id);


--
-- Name: idx_product_shipping_profile_profile_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_product_shipping_profile_profile_id ON public.product_shipping_profile USING btree (profile_id);


--
-- Name: idx_product_shipping_profile_profile_id_product_id_unique; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX idx_product_shipping_profile_profile_id_product_id_unique ON public.product_shipping_profile USING btree (profile_id, product_id);


--
-- Name: idx_product_variant_money_amount_money_amount_id_unique; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX idx_product_variant_money_amount_money_amount_id_unique ON public.product_variant_money_amount USING btree (money_amount_id);


--
-- Name: idx_product_variant_money_amount_variant_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE INDEX idx_product_variant_money_amount_variant_id ON public.product_variant_money_amount USING btree (variant_id);


--
-- Name: unique_li_original_item_id_order_edit_id; Type: INDEX; Schema: public; Owner: medusauser
--

CREATE UNIQUE INDEX unique_li_original_item_id_order_edit_id ON public.line_item USING btree (order_edit_id, original_item_id) WHERE ((original_item_id IS NOT NULL) AND (order_edit_id IS NOT NULL));


--
-- Name: shipping_option_requirement FK_012a62ba743e427b5ebe9dee18e; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_option_requirement
    ADD CONSTRAINT "FK_012a62ba743e427b5ebe9dee18e" FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id);


--
-- Name: discount_condition_product_tag FK_01486cc9dc6b36bf658685535f6; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product_tag
    ADD CONSTRAINT "FK_01486cc9dc6b36bf658685535f6" FOREIGN KEY (product_tag_id) REFERENCES public.product_tag(id) ON DELETE CASCADE;


--
-- Name: claim_order FK_017d58bf8260c6e1a2588d258e2; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_order
    ADD CONSTRAINT "FK_017d58bf8260c6e1a2588d258e2" FOREIGN KEY (shipping_address_id) REFERENCES public.address(id);


--
-- Name: notification FK_0425c2423e2ce9fdfd5c23761d9; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_0425c2423e2ce9fdfd5c23761d9" FOREIGN KEY (provider_id) REFERENCES public.notification_provider(id);


--
-- Name: cart_gift_cards FK_0fb38b6d167793192bc126d835e; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart_gift_cards
    ADD CONSTRAINT "FK_0fb38b6d167793192bc126d835e" FOREIGN KEY (gift_card_id) REFERENCES public.gift_card(id) ON DELETE CASCADE;


--
-- Name: order_discounts FK_0fc1ec4e3db9001ad60c19daf16; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_discounts
    ADD CONSTRAINT "FK_0fc1ec4e3db9001ad60c19daf16" FOREIGN KEY (discount_id) REFERENCES public.discount(id) ON DELETE CASCADE;


--
-- Name: line_item FK_118e3c48f09a7728f41023c94ef; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "FK_118e3c48f09a7728f41023c94ef" FOREIGN KEY (claim_order_id) REFERENCES public.claim_order(id);


--
-- Name: order FK_19b0c6293443d1b464f604c3316; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_19b0c6293443d1b464f604c3316" FOREIGN KEY (shipping_address_id) REFERENCES public.address(id);


--
-- Name: product_tax_rate FK_1d04aebeabb6a89f87e536a124d; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_tax_rate
    ADD CONSTRAINT "FK_1d04aebeabb6a89f87e536a124d" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: shipping_method FK_1d9ad62038998c3a85c77a53cfb; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_1d9ad62038998c3a85c77a53cfb" FOREIGN KEY (return_id) REFERENCES public.return(id);


--
-- Name: order_edit FK_1f3a251488a91510f57e1bf93cd; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_edit
    ADD CONSTRAINT "FK_1f3a251488a91510f57e1bf93cd" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: product_tags FK_21683a063fe82dafdf681ecc9c4; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT "FK_21683a063fe82dafdf681ecc9c4" FOREIGN KEY (product_tag_id) REFERENCES public.product_tag(id) ON DELETE CASCADE;


--
-- Name: claim_image FK_21cbfedd83d736d86f4c6f4ce56; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_image
    ADD CONSTRAINT "FK_21cbfedd83d736d86f4c6f4ce56" FOREIGN KEY (claim_item_id) REFERENCES public.claim_item(id);


--
-- Name: product_images FK_2212515ba306c79f42c46a99db7; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT "FK_2212515ba306c79f42c46a99db7" FOREIGN KEY (image_id) REFERENCES public.image(id) ON DELETE CASCADE;


--
-- Name: return_reason FK_2250c5d9e975987ab212f61a657; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return_reason
    ADD CONSTRAINT "FK_2250c5d9e975987ab212f61a657" FOREIGN KEY (parent_return_reason_id) REFERENCES public.return_reason(id);


--
-- Name: discount FK_2250c5d9e975987ab212f61a663; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT "FK_2250c5d9e975987ab212f61a663" FOREIGN KEY (parent_discount_id) REFERENCES public.discount(id);


--
-- Name: cart FK_242205c81c1152fab1b6e848470; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_242205c81c1152fab1b6e848470" FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: product_tax_rate FK_2484cf14c437a04586b07e7dddb; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_tax_rate
    ADD CONSTRAINT "FK_2484cf14c437a04586b07e7dddb" FOREIGN KEY (rate_id) REFERENCES public.tax_rate(id) ON DELETE CASCADE;


--
-- Name: product_type_tax_rate FK_25a3138bb236f63d9bb6c8ff111; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_type_tax_rate
    ADD CONSTRAINT "FK_25a3138bb236f63d9bb6c8ff111" FOREIGN KEY (product_type_id) REFERENCES public.product_type(id) ON DELETE CASCADE;


--
-- Name: line_item FK_27283ee631862266d0f1c680646; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "FK_27283ee631862266d0f1c680646" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: line_item_adjustment FK_2f41b20a71f30e60471d7e3769c; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item_adjustment
    ADD CONSTRAINT "FK_2f41b20a71f30e60471d7e3769c" FOREIGN KEY (discount_id) REFERENCES public.discount(id);


--
-- Name: shipping_tax_rate FK_346e0016cf045b9980747747645; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_tax_rate
    ADD CONSTRAINT "FK_346e0016cf045b9980747747645" FOREIGN KEY (rate_id) REFERENCES public.tax_rate(id) ON DELETE CASCADE;


--
-- Name: notification FK_371db513192c083f48ba63c33be; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_371db513192c083f48ba63c33be" FOREIGN KEY (parent_id) REFERENCES public.notification(id);


--
-- Name: product_sales_channel FK_37341bad297fe5cca91f921032b; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_sales_channel
    ADD CONSTRAINT "FK_37341bad297fe5cca91f921032b" FOREIGN KEY (sales_channel_id) REFERENCES public.sales_channel(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: region_fulfillment_providers FK_37f361c38a18d12a3fa3158d0cf; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.region_fulfillment_providers
    ADD CONSTRAINT "FK_37f361c38a18d12a3fa3158d0cf" FOREIGN KEY (provider_id) REFERENCES public.fulfillment_provider(id) ON DELETE CASCADE;


--
-- Name: region_payment_providers FK_3a6947180aeec283cd92c59ebb0; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.region_payment_providers
    ADD CONSTRAINT "FK_3a6947180aeec283cd92c59ebb0" FOREIGN KEY (provider_id) REFERENCES public.payment_provider(id) ON DELETE CASCADE;


--
-- Name: region FK_3bdd5896ec93be2f1c62a3309a5; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT "FK_3bdd5896ec93be2f1c62a3309a5" FOREIGN KEY (currency_code) REFERENCES public.currency(code);


--
-- Name: customer_group_customers FK_3c6412d076292f439269abe1a23; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.customer_group_customers
    ADD CONSTRAINT "FK_3c6412d076292f439269abe1a23" FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: line_item FK_3fa354d8d1233ff81097b2fcb6b; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "FK_3fa354d8d1233ff81097b2fcb6b" FOREIGN KEY (swap_id) REFERENCES public.swap(id);


--
-- Name: gift_card_transaction FK_3ff5597f1d7e02bba41541846f4; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.gift_card_transaction
    ADD CONSTRAINT "FK_3ff5597f1d7e02bba41541846f4" FOREIGN KEY (gift_card_id) REFERENCES public.gift_card(id);


--
-- Name: swap FK_402e8182bc553e082f6380020b4; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.swap
    ADD CONSTRAINT "FK_402e8182bc553e082f6380020b4" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: line_item FK_43a2b24495fe1d9fc2a9c835bc7; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "FK_43a2b24495fe1d9fc2a9c835bc7" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: custom_shipping_option FK_44090cb11b06174cbcc667e91ca; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.custom_shipping_option
    ADD CONSTRAINT "FK_44090cb11b06174cbcc667e91ca" FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id);


--
-- Name: order_item_change FK_44feeebb258bf4cfa4cc4202281; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "FK_44feeebb258bf4cfa4cc4202281" FOREIGN KEY (order_edit_id) REFERENCES public.order_edit(id);


--
-- Name: payment FK_4665f17abc1e81dd58330e58542; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "FK_4665f17abc1e81dd58330e58542" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: tracking_link FK_471e9e4c96e02ba209a307db32b; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.tracking_link
    ADD CONSTRAINT "FK_471e9e4c96e02ba209a307db32b" FOREIGN KEY (fulfillment_id) REFERENCES public.fulfillment(id);


--
-- Name: cart FK_484c329f4783be4e18e5e2ff090; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_484c329f4783be4e18e5e2ff090" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: product FK_49d419fc77d3aed46c835c558ac; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_49d419fc77d3aed46c835c558ac" FOREIGN KEY (collection_id) REFERENCES public.product_collection(id);


--
-- Name: discount_condition_customer_group FK_4d5f98645a67545d8dea42e2eb8; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_customer_group
    ADD CONSTRAINT "FK_4d5f98645a67545d8dea42e2eb8" FOREIGN KEY (customer_group_id) REFERENCES public.customer_group(id) ON DELETE CASCADE;


--
-- Name: discount_rule_products FK_4e0739e5f0244c08d41174ca08a; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_rule_products
    ADD CONSTRAINT "FK_4e0739e5f0244c08d41174ca08a" FOREIGN KEY (discount_rule_id) REFERENCES public.discount_rule(id) ON DELETE CASCADE;


--
-- Name: product_images FK_4f166bb8c2bfcef2498d97b4068; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT "FK_4f166bb8c2bfcef2498d97b4068" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: line_item_tax_line FK_5077fa54b0d037e984385dfe8ad; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item_tax_line
    ADD CONSTRAINT "FK_5077fa54b0d037e984385dfe8ad" FOREIGN KEY (item_id) REFERENCES public.line_item(id) ON DELETE CASCADE;


--
-- Name: shipping_method FK_5267705a43d547e232535b656c2; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_5267705a43d547e232535b656c2" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: price_list_customer_groups FK_52875734e9dd69064f0041f4d92; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.price_list_customer_groups
    ADD CONSTRAINT "FK_52875734e9dd69064f0041f4d92" FOREIGN KEY (price_list_id) REFERENCES public.price_list(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: swap FK_52dd74e8c989aa5665ad2852b8b; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.swap
    ADD CONSTRAINT "FK_52dd74e8c989aa5665ad2852b8b" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: line_item FK_5371cbaa3be5200f373d24e3d5b; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT "FK_5371cbaa3be5200f373d24e3d5b" FOREIGN KEY (variant_id) REFERENCES public.product_variant(id);


--
-- Name: order FK_5568d3b9ce9f7abeeb37511ecf2; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_5568d3b9ce9f7abeeb37511ecf2" FOREIGN KEY (billing_address_id) REFERENCES public.address(id);


--
-- Name: store FK_55beebaa09e947cccca554af222; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT "FK_55beebaa09e947cccca554af222" FOREIGN KEY (default_currency_code) REFERENCES public.currency(code);


--
-- Name: product_tags FK_5b0c6fc53c574299ecc7f9ee22e; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_tags
    ADD CONSTRAINT "FK_5b0c6fc53c574299ecc7f9ee22e" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: draft_order FK_5bd11d0e2a9628128e2c26fd0a6; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.draft_order
    ADD CONSTRAINT "FK_5bd11d0e2a9628128e2c26fd0a6" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: shipping_option FK_5c58105f1752fca0f4ce69f4663; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT "FK_5c58105f1752fca0f4ce69f4663" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: order_item_change FK_5f9688929761f7df108b630e64a; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "FK_5f9688929761f7df108b630e64a" FOREIGN KEY (line_item_id) REFERENCES public.line_item(id);


--
-- Name: store FK_61b0f48cccbb5f41c750bac7286; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT "FK_61b0f48cccbb5f41c750bac7286" FOREIGN KEY (default_sales_channel_id) REFERENCES public.sales_channel(id);


--
-- Name: customer_group_customers FK_620330964db8d2999e67b0dbe3e; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.customer_group_customers
    ADD CONSTRAINT "FK_620330964db8d2999e67b0dbe3e" FOREIGN KEY (customer_group_id) REFERENCES public.customer_group(id) ON DELETE CASCADE;


--
-- Name: claim_item FK_64980511ca32c8e92b417644afa; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_item
    ADD CONSTRAINT "FK_64980511ca32c8e92b417644afa" FOREIGN KEY (variant_id) REFERENCES public.product_variant(id);


--
-- Name: cart_discounts FK_6680319ebe1f46d18f106191d59; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart_discounts
    ADD CONSTRAINT "FK_6680319ebe1f46d18f106191d59" FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON DELETE CASCADE;


--
-- Name: cart FK_6b9c66b5e36f7c827dfaa092f94; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_6b9c66b5e36f7c827dfaa092f94" FOREIGN KEY (billing_address_id) REFERENCES public.address(id);


--
-- Name: address FK_6df8c6bf969a51d24c1980c4ff4; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_6df8c6bf969a51d24c1980c4ff4" FOREIGN KEY (country_code) REFERENCES public.country(iso_2);


--
-- Name: claim_item FK_6e0cad0daef76bb642675910b9d; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_item
    ADD CONSTRAINT "FK_6e0cad0daef76bb642675910b9d" FOREIGN KEY (item_id) REFERENCES public.line_item(id);


--
-- Name: discount_condition_product_type FK_6ef23ce0b1d9cf9b5b833e52b9d; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product_type
    ADD CONSTRAINT "FK_6ef23ce0b1d9cf9b5b833e52b9d" FOREIGN KEY (condition_id) REFERENCES public.discount_condition(id) ON DELETE CASCADE;


--
-- Name: order FK_6ff7e874f01b478c115fdd462eb; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_6ff7e874f01b478c115fdd462eb" FOREIGN KEY (sales_channel_id) REFERENCES public.sales_channel(id);


--
-- Name: return FK_71773d56eb2bacb922bc3283398; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "FK_71773d56eb2bacb922bc3283398" FOREIGN KEY (claim_order_id) REFERENCES public.claim_order(id);


--
-- Name: order FK_717a141f96b76d794d409f38129; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_717a141f96b76d794d409f38129" FOREIGN KEY (currency_code) REFERENCES public.currency(code);


--
-- Name: product_option_value FK_7234ed737ff4eb1b6ae6e6d7b01; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_option_value
    ADD CONSTRAINT "FK_7234ed737ff4eb1b6ae6e6d7b01" FOREIGN KEY (variant_id) REFERENCES public.product_variant(id) ON DELETE CASCADE;


--
-- Name: order FK_727b872f86c7378474a8fa46147; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_727b872f86c7378474a8fa46147" FOREIGN KEY (draft_order_id) REFERENCES public.draft_order(id);


--
-- Name: return_item FK_7edab75b4fc88ea6d4f2574f087; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT "FK_7edab75b4fc88ea6d4f2574f087" FOREIGN KEY (return_id) REFERENCES public.return(id);


--
-- Name: store_currencies FK_82a6bbb0b527c20a0002ddcbd60; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.store_currencies
    ADD CONSTRAINT "FK_82a6bbb0b527c20a0002ddcbd60" FOREIGN KEY (currency_code) REFERENCES public.currency(code) ON DELETE CASCADE;


--
-- Name: discount_condition_customer_group FK_8486ee16e69013c645d0b8716b6; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_customer_group
    ADD CONSTRAINT "FK_8486ee16e69013c645d0b8716b6" FOREIGN KEY (condition_id) REFERENCES public.discount_condition(id) ON DELETE CASCADE;


--
-- Name: return_item FK_87774591f44564effd8039d7162; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT "FK_87774591f44564effd8039d7162" FOREIGN KEY (item_id) REFERENCES public.line_item(id);


--
-- Name: region_payment_providers FK_8aaa78ba90d3802edac317df869; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.region_payment_providers
    ADD CONSTRAINT "FK_8aaa78ba90d3802edac317df869" FOREIGN KEY (region_id) REFERENCES public.region(id) ON DELETE CASCADE;


--
-- Name: customer FK_8abe81b9aac151ae60bf507ad15; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "FK_8abe81b9aac151ae60bf507ad15" FOREIGN KEY (billing_address_id) REFERENCES public.address(id);


--
-- Name: cart_discounts FK_8df75ef4f35f217768dc1135458; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart_discounts
    ADD CONSTRAINT "FK_8df75ef4f35f217768dc1135458" FOREIGN KEY (discount_id) REFERENCES public.discount(id) ON DELETE CASCADE;


--
-- Name: draft_order FK_8f6dd6c49202f1466ebf21e77da; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.draft_order
    ADD CONSTRAINT "FK_8f6dd6c49202f1466ebf21e77da" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: claim_item FK_900a9c3834257304396b2b0fe7c; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_item
    ADD CONSTRAINT "FK_900a9c3834257304396b2b0fe7c" FOREIGN KEY (claim_order_id) REFERENCES public.claim_order(id);


--
-- Name: region FK_91f88052197680f9790272aaf5b; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT "FK_91f88052197680f9790272aaf5b" FOREIGN KEY (tax_provider_id) REFERENCES public.tax_provider(id);


--
-- Name: shipping_method_tax_line FK_926ca9f29014af8091722dede08; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method_tax_line
    ADD CONSTRAINT "FK_926ca9f29014af8091722dede08" FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_method(id);


--
-- Name: custom_shipping_option FK_93caeb1bb70d37c1d36d6701a7a; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.custom_shipping_option
    ADD CONSTRAINT "FK_93caeb1bb70d37c1d36d6701a7a" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: address FK_9c9614b2f9d01665800ea8dbff7; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_9c9614b2f9d01665800ea8dbff7" FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: cart FK_9d1a161434c610aae7c3df2dc7e; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_9d1a161434c610aae7c3df2dc7e" FOREIGN KEY (payment_id) REFERENCES public.payment(id);


--
-- Name: fulfillment_item FK_a033f83cc6bd7701a5687ab4b38; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.fulfillment_item
    ADD CONSTRAINT "FK_a033f83cc6bd7701a5687ab4b38" FOREIGN KEY (fulfillment_id) REFERENCES public.fulfillment(id);


--
-- Name: discount_condition_product_collection FK_a0b05dc4257abe639cb75f8eae2; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product_collection
    ADD CONSTRAINT "FK_a0b05dc4257abe639cb75f8eae2" FOREIGN KEY (product_collection_id) REFERENCES public.product_collection(id) ON DELETE CASCADE;


--
-- Name: shipping_option FK_a0e206bfaed3cb63c1860917347; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT "FK_a0e206bfaed3cb63c1860917347" FOREIGN KEY (provider_id) REFERENCES public.fulfillment_provider(id);


--
-- Name: discount_condition_product_collection FK_a1c4f9cfb599ad1f0db39cadd5f; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product_collection
    ADD CONSTRAINT "FK_a1c4f9cfb599ad1f0db39cadd5f" FOREIGN KEY (condition_id) REFERENCES public.discount_condition(id) ON DELETE CASCADE;


--
-- Name: discount_regions FK_a21a7ffbe420d492eb46c305fec; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_regions
    ADD CONSTRAINT "FK_a21a7ffbe420d492eb46c305fec" FOREIGN KEY (region_id) REFERENCES public.region(id) ON DELETE CASCADE;


--
-- Name: cart FK_a2bd3c26f42e754b9249ba78fd6; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_a2bd3c26f42e754b9249ba78fd6" FOREIGN KEY (sales_channel_id) REFERENCES public.sales_channel(id);


--
-- Name: fulfillment FK_a52e234f729db789cf473297a5c; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "FK_a52e234f729db789cf473297a5c" FOREIGN KEY (swap_id) REFERENCES public.swap(id);


--
-- Name: discount FK_ac2c280de3701b2d66f6817f760; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT "FK_ac2c280de3701b2d66f6817f760" FOREIGN KEY (rule_id) REFERENCES public.discount_rule(id);


--
-- Name: country FK_b1aac8314662fa6b25569a575bb; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT "FK_b1aac8314662fa6b25569a575bb" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: money_amount FK_b433e27b7a83e6d12ab26b15b03; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.money_amount
    ADD CONSTRAINT "FK_b433e27b7a83e6d12ab26b15b03" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: order_item_change FK_b4d53b8d03c9f5e7d4317e818d9; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_item_change
    ADD CONSTRAINT "FK_b4d53b8d03c9f5e7d4317e818d9" FOREIGN KEY (original_line_item_id) REFERENCES public.line_item(id);


--
-- Name: store_currencies FK_b4f4b63d1736689b7008980394c; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.store_currencies
    ADD CONSTRAINT "FK_b4f4b63d1736689b7008980394c" FOREIGN KEY (store_id) REFERENCES public.store(id) ON DELETE CASCADE;


--
-- Name: notification FK_b5df0f53a74b9d0c0a2b652c88d; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT "FK_b5df0f53a74b9d0c0a2b652c88d" FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: gift_card FK_b6bcf8c3903097b84e85154eed3; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.gift_card
    ADD CONSTRAINT "FK_b6bcf8c3903097b84e85154eed3" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: tax_rate FK_b95a1e03b051993d208366cb960; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.tax_rate
    ADD CONSTRAINT "FK_b95a1e03b051993d208366cb960" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: return FK_bad82d7bff2b08b87094bfac3d6; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "FK_bad82d7bff2b08b87094bfac3d6" FOREIGN KEY (swap_id) REFERENCES public.swap(id);


--
-- Name: discount_rule_products FK_be66106a673b88a81c603abe7eb; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_rule_products
    ADD CONSTRAINT "FK_be66106a673b88a81c603abe7eb" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: line_item_adjustment FK_be9aea2ccf3567007b6227da4d2; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item_adjustment
    ADD CONSTRAINT "FK_be9aea2ccf3567007b6227da4d2" FOREIGN KEY (item_id) REFERENCES public.line_item(id) ON DELETE CASCADE;


--
-- Name: fulfillment FK_beb35a6de60a6c4f91d5ae57e44; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "FK_beb35a6de60a6c4f91d5ae57e44" FOREIGN KEY (provider_id) REFERENCES public.fulfillment_provider(id);


--
-- Name: payment FK_c17aff091441b7c25ec3d68d36c; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "FK_c17aff091441b7c25ec3d68d36c" FOREIGN KEY (swap_id) REFERENCES public.swap(id);


--
-- Name: claim_item_tags FK_c2c0f3edf39515bd15432afe6e5; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_item_tags
    ADD CONSTRAINT "FK_c2c0f3edf39515bd15432afe6e5" FOREIGN KEY (item_id) REFERENCES public.claim_item(id) ON DELETE CASCADE;


--
-- Name: price_list_customer_groups FK_c5516f550433c9b1c2630d787a7; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.price_list_customer_groups
    ADD CONSTRAINT "FK_c5516f550433c9b1c2630d787a7" FOREIGN KEY (customer_group_id) REFERENCES public.customer_group(id) ON DELETE CASCADE;


--
-- Name: region_fulfillment_providers FK_c556e14eff4d6f03db593df955e; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.region_fulfillment_providers
    ADD CONSTRAINT "FK_c556e14eff4d6f03db593df955e" FOREIGN KEY (region_id) REFERENCES public.region(id) ON DELETE CASCADE;


--
-- Name: discount_condition_product FK_c759f53b2e48e8cfb50638fe4e0; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product
    ADD CONSTRAINT "FK_c759f53b2e48e8cfb50638fe4e0" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: shipping_option FK_c951439af4c98bf2bd7fb8726cd; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_option
    ADD CONSTRAINT "FK_c951439af4c98bf2bd7fb8726cd" FOREIGN KEY (profile_id) REFERENCES public.shipping_profile(id);


--
-- Name: order FK_c99a206eb11ad45f6b7f04f2dcc; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_c99a206eb11ad45f6b7f04f2dcc" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: product_variant FK_ca67dd080aac5ecf99609960cd2; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_ca67dd080aac5ecf99609960cd2" FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: order FK_cd7812c96209c5bdd48a6b858b0; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_cd7812c96209c5bdd48a6b858b0" FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: product_option_value FK_cdf4388f294b30a25c627d69fe9; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_option_value
    ADD CONSTRAINT "FK_cdf4388f294b30a25c627d69fe9" FOREIGN KEY (option_id) REFERENCES public.product_option(id);


--
-- Name: cart FK_ced15a9a695d2b5db9dabce763d; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_ced15a9a695d2b5db9dabce763d" FOREIGN KEY (shipping_address_id) REFERENCES public.address(id);


--
-- Name: payment_session FK_d25ba0787e1510ddc5d442ebcfa; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_session
    ADD CONSTRAINT "FK_d25ba0787e1510ddc5d442ebcfa" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: cart_gift_cards FK_d38047a90f3d42f0be7909e8aea; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.cart_gift_cards
    ADD CONSTRAINT "FK_d38047a90f3d42f0be7909e8aea" FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON DELETE CASCADE;


--
-- Name: return FK_d4bd17f918fc6c332b74a368c36; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return
    ADD CONSTRAINT "FK_d4bd17f918fc6c332b74a368c36" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: fulfillment FK_d73e55964e0ff2db8f03807d52e; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "FK_d73e55964e0ff2db8f03807d52e" FOREIGN KEY (claim_order_id) REFERENCES public.claim_order(id);


--
-- Name: return_item FK_d742532378a65022e7ceb328828; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.return_item
    ADD CONSTRAINT "FK_d742532378a65022e7ceb328828" FOREIGN KEY (reason_id) REFERENCES public.return_reason(id);


--
-- Name: shipping_method FK_d783a66d1c91c0858752c933e68; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_d783a66d1c91c0858752c933e68" FOREIGN KEY (claim_order_id) REFERENCES public.claim_order(id);


--
-- Name: gift_card_transaction FK_d7d441b81012f87d4265fa57d24; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.gift_card_transaction
    ADD CONSTRAINT "FK_d7d441b81012f87d4265fa57d24" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: shipping_method FK_d92993a7d554d84571f4eea1d13; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_d92993a7d554d84571f4eea1d13" FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: claim_item_tags FK_dc9bbf9fcb9ba458d25d512811b; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_item_tags
    ADD CONSTRAINT "FK_dc9bbf9fcb9ba458d25d512811b" FOREIGN KEY (tag_id) REFERENCES public.claim_tag(id) ON DELETE CASCADE;


--
-- Name: gift_card FK_dfc1f02bb0552e79076aa58dbb0; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.gift_card
    ADD CONSTRAINT "FK_dfc1f02bb0552e79076aa58dbb0" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: product FK_e0843930fbb8854fe36ca39dae1; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_e0843930fbb8854fe36ca39dae1" FOREIGN KEY (type_id) REFERENCES public.product_type(id);


--
-- Name: fulfillment_item FK_e13ff60e74206b747a1896212d1; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.fulfillment_item
    ADD CONSTRAINT "FK_e13ff60e74206b747a1896212d1" FOREIGN KEY (item_id) REFERENCES public.line_item(id);


--
-- Name: money_amount FK_e15811f81339e4bd8c440aebe1c; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.money_amount
    ADD CONSTRAINT "FK_e15811f81339e4bd8c440aebe1c" FOREIGN KEY (currency_code) REFERENCES public.currency(code);


--
-- Name: order FK_e1fcce2b18dbcdbe0a5ba9a68b8; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_e1fcce2b18dbcdbe0a5ba9a68b8" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: order_gift_cards FK_e62ff11e4730bb3adfead979ee2; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_gift_cards
    ADD CONSTRAINT "FK_e62ff11e4730bb3adfead979ee2" FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: product_option FK_e634fca34f6b594b87fdbee95f6; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT "FK_e634fca34f6b594b87fdbee95f6" FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: discount_condition_product_type FK_e706deb68f52ab2756119b9e704; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product_type
    ADD CONSTRAINT "FK_e706deb68f52ab2756119b9e704" FOREIGN KEY (product_type_id) REFERENCES public.product_type(id) ON DELETE CASCADE;


--
-- Name: order_discounts FK_e7b488cebe333f449398769b2cc; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_discounts
    ADD CONSTRAINT "FK_e7b488cebe333f449398769b2cc" FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: product_type_tax_rate FK_ece65a774192b34253abc4cd672; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_type_tax_rate
    ADD CONSTRAINT "FK_ece65a774192b34253abc4cd672" FOREIGN KEY (rate_id) REFERENCES public.tax_rate(id) ON DELETE CASCADE;


--
-- Name: refund FK_eec9d9af4ca098e19ea6b499eaa; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT "FK_eec9d9af4ca098e19ea6b499eaa" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: discount_condition FK_efff700651718e452ca9580a624; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition
    ADD CONSTRAINT "FK_efff700651718e452ca9580a624" FOREIGN KEY (discount_rule_id) REFERENCES public.discount_rule(id);


--
-- Name: discount_condition_product FK_f05132301e95bdab4ba1cf29a24; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product
    ADD CONSTRAINT "FK_f05132301e95bdab4ba1cf29a24" FOREIGN KEY (condition_id) REFERENCES public.discount_condition(id) ON DELETE CASCADE;


--
-- Name: fulfillment FK_f129acc85e346a10eed12b86fca; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.fulfillment
    ADD CONSTRAINT "FK_f129acc85e346a10eed12b86fca" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: money_amount FK_f249976b079375499662eb80c40; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.money_amount
    ADD CONSTRAINT "FK_f249976b079375499662eb80c40" FOREIGN KEY (price_list_id) REFERENCES public.price_list(id) ON DELETE CASCADE;


--
-- Name: order_gift_cards FK_f2bb9f71e95b315eb24b2b84cb3; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_gift_cards
    ADD CONSTRAINT "FK_f2bb9f71e95b315eb24b2b84cb3" FOREIGN KEY (gift_card_id) REFERENCES public.gift_card(id) ON DELETE CASCADE;


--
-- Name: payment FK_f41553459a4b1491c9893ebc921; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "FK_f41553459a4b1491c9893ebc921" FOREIGN KEY (currency_code) REFERENCES public.currency(code);


--
-- Name: discount_regions FK_f4194aa81073f3fab8aa86906ff; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_regions
    ADD CONSTRAINT "FK_f4194aa81073f3fab8aa86906ff" FOREIGN KEY (discount_id) REFERENCES public.discount(id) ON DELETE CASCADE;


--
-- Name: claim_order FK_f49e3974465d3c3a33d449d3f31; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.claim_order
    ADD CONSTRAINT "FK_f49e3974465d3c3a33d449d3f31" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: swap FK_f5189d38b3d3bd496618bf54c57; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.swap
    ADD CONSTRAINT "FK_f5189d38b3d3bd496618bf54c57" FOREIGN KEY (shipping_address_id) REFERENCES public.address(id);


--
-- Name: payment FK_f5221735ace059250daac9d9803; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT "FK_f5221735ace059250daac9d9803" FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: shipping_tax_rate FK_f672727ab020df6c50fb64c1a70; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_tax_rate
    ADD CONSTRAINT "FK_f672727ab020df6c50fb64c1a70" FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id) ON DELETE CASCADE;


--
-- Name: batch_job FK_fa53ca4f5fd90605b532802a626; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.batch_job
    ADD CONSTRAINT "FK_fa53ca4f5fd90605b532802a626" FOREIGN KEY (created_by) REFERENCES public."user"(id);


--
-- Name: shipping_method FK_fb94fa8d5ca940daa2a58139f86; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_fb94fa8d5ca940daa2a58139f86" FOREIGN KEY (swap_id) REFERENCES public.swap(id);


--
-- Name: discount_condition_product_tag FK_fbb2499551ed074526f3ee36241; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.discount_condition_product_tag
    ADD CONSTRAINT "FK_fbb2499551ed074526f3ee36241" FOREIGN KEY (condition_id) REFERENCES public.discount_condition(id) ON DELETE CASCADE;


--
-- Name: shipping_method FK_fc963e94854bff2714ca84cd193; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT "FK_fc963e94854bff2714ca84cd193" FOREIGN KEY (shipping_option_id) REFERENCES public.shipping_option(id);


--
-- Name: order_edit FK_order_edit_payment_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.order_edit
    ADD CONSTRAINT "FK_order_edit_payment_collection_id" FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id);


--
-- Name: payment_collection_payments FK_payment_collection_payments_payment_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_collection_payments
    ADD CONSTRAINT "FK_payment_collection_payments_payment_collection_id" FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id) ON DELETE CASCADE;


--
-- Name: payment_collection_payments FK_payment_collection_payments_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_collection_payments
    ADD CONSTRAINT "FK_payment_collection_payments_payment_id" FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON DELETE CASCADE;


--
-- Name: payment_collection FK_payment_collection_region_id; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_collection
    ADD CONSTRAINT "FK_payment_collection_region_id" FOREIGN KEY (region_id) REFERENCES public.region(id);


--
-- Name: payment_collection_sessions FK_payment_collection_sessions_payment_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_collection_sessions
    ADD CONSTRAINT "FK_payment_collection_sessions_payment_collection_id" FOREIGN KEY (payment_collection_id) REFERENCES public.payment_collection(id) ON DELETE CASCADE;


--
-- Name: payment_collection_sessions FK_payment_collection_sessions_payment_session_id; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.payment_collection_sessions
    ADD CONSTRAINT "FK_payment_collection_sessions_payment_session_id" FOREIGN KEY (payment_session_id) REFERENCES public.payment_session(id) ON DELETE CASCADE;


--
-- Name: product_category_product FK_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_category_product
    ADD CONSTRAINT "FK_product_category_id" FOREIGN KEY (product_category_id) REFERENCES public.product_category(id) ON DELETE CASCADE;


--
-- Name: product_category_product FK_product_id; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.product_category_product
    ADD CONSTRAINT "FK_product_id" FOREIGN KEY (product_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: refund FK_refund_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.refund
    ADD CONSTRAINT "FK_refund_payment_id" FOREIGN KEY (payment_id) REFERENCES public.payment(id);


--
-- Name: line_item line_item_order_edit_fk; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT line_item_order_edit_fk FOREIGN KEY (order_edit_id) REFERENCES public.order_edit(id);


--
-- Name: line_item line_item_original_item_fk; Type: FK CONSTRAINT; Schema: public; Owner: medusauser
--

ALTER TABLE ONLY public.line_item
    ADD CONSTRAINT line_item_original_item_fk FOREIGN KEY (original_item_id) REFERENCES public.line_item(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: medusauser
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO medusauser;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: medusauser
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

