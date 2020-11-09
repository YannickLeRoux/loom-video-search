

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.loom_videos DISABLE TRIGGER ALL;

INSERT INTO public.loom_videos (id, title, description, link, createdat) VALUES ('f66bc811-8940-433d-819b-6c3cb7adec88', 'test', 'ahhh', 'https://yannickleroux.com', '2020-11-07 19:18:27.735014-08');


ALTER TABLE public.loom_videos ENABLE TRIGGER ALL;


