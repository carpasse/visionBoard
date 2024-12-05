--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

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

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      NEW.updated_at = CURRENT_TIMESTAMP;
      RETURN NEW;
    END;
    $$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: github_organizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.github_organizations (
    id integer NOT NULL,
    login character varying(255) NOT NULL,
    github_org_id integer,
    node_id character varying(255),
    url character varying(255),
    avatar_url character varying(255),
    description text,
    name character varying(255),
    company character varying(255),
    blog character varying(255),
    location character varying(255),
    twitter_username character varying(255),
    is_verified boolean,
    has_organization_projects boolean,
    has_repository_projects boolean,
    public_repos integer,
    public_gists integer,
    followers integer,
    following integer,
    html_url character varying(255) NOT NULL,
    total_private_repos integer,
    owned_private_repos integer,
    private_gists integer,
    disk_usage integer,
    collaborators integer,
    default_repository_permission character varying(255),
    members_can_create_repositories boolean,
    two_factor_requirement_enabled boolean,
    members_allowed_repository_creation_type character varying(255),
    members_can_create_public_repositories boolean,
    members_can_create_private_repositories boolean,
    members_can_create_internal_repositories boolean,
    members_can_create_pages boolean,
    members_can_create_public_pages boolean,
    members_can_create_private_pages boolean,
    members_can_fork_private_repositories boolean,
    web_commit_signoff_required boolean,
    deploy_keys_enabled_for_repositories boolean,
    dependency_graph_enabled_for_new_repositories boolean,
    dependabot_alerts_enabled_for_new_repositories boolean,
    dependabot_security_updates_enabled_for_new_repositories boolean,
    advanced_security_enabled_for_new_repositories boolean,
    secret_scanning_enabled_for_new_repositories boolean,
    secret_scanning_push_protection_enabled_for_new_repositories boolean,
    secret_scanning_push_protection_custom_link character varying(255),
    secret_scanning_push_protection_custom_link_enabled boolean,
    github_created_at timestamp with time zone,
    github_updated_at timestamp with time zone,
    github_archived_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    project_id integer NOT NULL
);


--
-- Name: github_organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.github_organizations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: github_organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.github_organizations_id_seq OWNED BY public.github_organizations.id;


--
-- Name: github_repositories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.github_repositories (
    id integer NOT NULL,
    node_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    html_url character varying(255) NOT NULL,
    description text,
    fork boolean,
    url character varying(255) NOT NULL,
    git_url character varying(255) NOT NULL,
    ssh_url character varying(255) NOT NULL,
    clone_url character varying(255) NOT NULL,
    svn_url character varying(255),
    homepage character varying(255),
    size integer,
    stargazers_count integer,
    watchers_count integer,
    language character varying(255),
    has_issues boolean,
    has_projects boolean,
    has_downloads boolean,
    has_wiki boolean,
    has_pages boolean,
    has_discussions boolean,
    forks_count integer,
    mirror_url character varying(255),
    archived boolean,
    disabled boolean,
    open_issues_count integer,
    allow_forking boolean,
    is_template boolean,
    web_commit_signoff_required boolean,
    topics text[],
    visibility text NOT NULL,
    default_branch character varying(255) NOT NULL,
    allow_squash_merge boolean,
    allow_merge_commit boolean,
    allow_rebase_merge boolean,
    allow_auto_merge boolean,
    delete_branch_on_merge boolean,
    allow_update_branch boolean,
    use_squash_pr_title_as_default boolean,
    squash_merge_commit_message character varying(255),
    squash_merge_commit_title character varying(255),
    merge_commit_message character varying(255),
    merge_commit_title character varying(255),
    network_count integer,
    subscribers_count integer,
    github_repo_id integer,
    github_created_at timestamp with time zone,
    github_updated_at timestamp with time zone,
    github_archived_at timestamp with time zone,
    license_key character varying(255),
    license_name character varying(255),
    license_spdx_id character varying(255),
    license_url character varying(255),
    license_node_id character varying(255),
    secret_scanning_status text DEFAULT 'disabled'::text,
    secret_scanning_push_protection_status text DEFAULT 'disabled'::text,
    dependabot_security_updates_status text DEFAULT 'disabled'::text,
    secret_scanning_non_provider_patterns_status text DEFAULT 'disabled'::text,
    secret_scanning_validity_checks_status text DEFAULT 'disabled'::text,
    github_organization_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT github_repositories_dependabot_security_updates_status_check CHECK ((dependabot_security_updates_status = ANY (ARRAY['enabled'::text, 'disabled'::text]))),
    CONSTRAINT github_repositories_secret_scanning_non_provider_patterns_check CHECK ((secret_scanning_non_provider_patterns_status = ANY (ARRAY['enabled'::text, 'disabled'::text]))),
    CONSTRAINT github_repositories_secret_scanning_push_protection_statu_check CHECK ((secret_scanning_push_protection_status = ANY (ARRAY['enabled'::text, 'disabled'::text]))),
    CONSTRAINT github_repositories_secret_scanning_status_check CHECK ((secret_scanning_status = ANY (ARRAY['enabled'::text, 'disabled'::text]))),
    CONSTRAINT github_repositories_secret_scanning_validity_checks_statu_check CHECK ((secret_scanning_validity_checks_status = ANY (ARRAY['enabled'::text, 'disabled'::text]))),
    CONSTRAINT github_repositories_visibility_check CHECK ((visibility = ANY (ARRAY['public'::text, 'private'::text, 'internal'::text])))
);


--
-- Name: github_repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.github_repositories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: github_repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.github_repositories_id_seq OWNED BY public.github_repositories.id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    category text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT projects_category_check CHECK ((category = ANY (ARRAY['impact'::text, 'at-large'::text, 'incubation'::text, 'emeritus'::text])))
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: github_organizations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_organizations ALTER COLUMN id SET DEFAULT nextval('public.github_organizations_id_seq'::regclass);


--
-- Name: github_repositories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_repositories ALTER COLUMN id SET DEFAULT nextval('public.github_repositories_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: github_organizations github_organizations_github_org_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_organizations
    ADD CONSTRAINT github_organizations_github_org_id_unique UNIQUE (github_org_id);


--
-- Name: github_organizations github_organizations_login_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_organizations
    ADD CONSTRAINT github_organizations_login_unique UNIQUE (login);


--
-- Name: github_organizations github_organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_organizations
    ADD CONSTRAINT github_organizations_pkey PRIMARY KEY (id);


--
-- Name: github_repositories github_repositories_github_repo_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_repositories
    ADD CONSTRAINT github_repositories_github_repo_id_unique UNIQUE (github_repo_id);


--
-- Name: github_repositories github_repositories_node_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_repositories
    ADD CONSTRAINT github_repositories_node_id_unique UNIQUE (node_id);


--
-- Name: github_repositories github_repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_repositories
    ADD CONSTRAINT github_repositories_pkey PRIMARY KEY (id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: github_organizations set_updated_at_github_organizations; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at_github_organizations BEFORE UPDATE ON public.github_organizations FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: github_repositories set_updated_at_github_repositories; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at_github_repositories BEFORE UPDATE ON public.github_repositories FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: projects set_updated_at_projects; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER set_updated_at_projects BEFORE UPDATE ON public.projects FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: github_organizations github_organizations_project_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_organizations
    ADD CONSTRAINT github_organizations_project_id_foreign FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: github_repositories github_repositories_github_organization_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.github_repositories
    ADD CONSTRAINT github_repositories_github_organization_id_foreign FOREIGN KEY (github_organization_id) REFERENCES public.github_organizations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

