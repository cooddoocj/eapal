PGDMP     5        
            w            dbu32ump51i16k     11.2 (Ubuntu 11.2-1.pgdg16.04+1)    11.2 %    u           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            v           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            w           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            x           1262    15074689    dbu32ump51i16k    DATABASE     �   CREATE DATABASE dbu32ump51i16k WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE dbu32ump51i16k;
             hronsnruwxdwem    false            y           0    0    DATABASE dbu32ump51i16k    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE dbu32ump51i16k FROM PUBLIC;
                  hronsnruwxdwem    false    3960            z           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO hronsnruwxdwem;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  hronsnruwxdwem    false    4            {           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO hronsnruwxdwem;
                  postgres    false    664                        3079    15076343    citext 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;
    DROP EXTENSION citext;
                  false            |           0    0    EXTENSION citext    COMMENT     S   COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';
                       false    2            �            1259    16119723    bookmark    TABLE     U   CREATE TABLE public.bookmark (
    id integer NOT NULL,
    content text NOT NULL
);
    DROP TABLE public.bookmark;
       public         hronsnruwxdwem    false            �            1259    16119729    bookmark_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bookmark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bookmark_id_seq;
       public       hronsnruwxdwem    false    197            }           0    0    bookmark_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.bookmark_id_seq OWNED BY public.bookmark.id;
            public       hronsnruwxdwem    false    198            �            1259    16119731    config    TABLE     {   CREATE TABLE public.config (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value text NOT NULL
);
    DROP TABLE public.config;
       public         hronsnruwxdwem    false            �            1259    16119737    config_id_seq    SEQUENCE     �   CREATE SEQUENCE public.config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.config_id_seq;
       public       hronsnruwxdwem    false    199            ~           0    0    config_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.config_id_seq OWNED BY public.config.id;
            public       hronsnruwxdwem    false    200            �            1259    16119775    notes    TABLE     R   CREATE TABLE public.notes (
    id integer NOT NULL,
    content text NOT NULL
);
    DROP TABLE public.notes;
       public         hronsnruwxdwem    false            �            1259    16119773    notes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.notes_id_seq;
       public       hronsnruwxdwem    false    204                       0    0    notes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;
            public       hronsnruwxdwem    false    203            �            1259    16119739    regex    TABLE     �   CREATE TABLE public.regex (
    id integer NOT NULL,
    s text NOT NULL,
    r text,
    flag character varying(10) DEFAULT 'g'::character varying NOT NULL
);
    DROP TABLE public.regex;
       public         hronsnruwxdwem    false            �            1259    16119746    regex_id_seq    SEQUENCE     �   CREATE SEQUENCE public.regex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.regex_id_seq;
       public       hronsnruwxdwem    false    201            �           0    0    regex_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.regex_id_seq OWNED BY public.regex.id;
            public       hronsnruwxdwem    false    202            �           2604    16119748    bookmark id    DEFAULT     j   ALTER TABLE ONLY public.bookmark ALTER COLUMN id SET DEFAULT nextval('public.bookmark_id_seq'::regclass);
 :   ALTER TABLE public.bookmark ALTER COLUMN id DROP DEFAULT;
       public       hronsnruwxdwem    false    198    197            �           2604    16119749 	   config id    DEFAULT     f   ALTER TABLE ONLY public.config ALTER COLUMN id SET DEFAULT nextval('public.config_id_seq'::regclass);
 8   ALTER TABLE public.config ALTER COLUMN id DROP DEFAULT;
       public       hronsnruwxdwem    false    200    199            �           2604    16119778    notes id    DEFAULT     d   ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);
 7   ALTER TABLE public.notes ALTER COLUMN id DROP DEFAULT;
       public       hronsnruwxdwem    false    203    204    204            �           2604    16119750    regex id    DEFAULT     d   ALTER TABLE ONLY public.regex ALTER COLUMN id SET DEFAULT nextval('public.regex_id_seq'::regclass);
 7   ALTER TABLE public.regex ALTER COLUMN id DROP DEFAULT;
       public       hronsnruwxdwem    false    202    201            k          0    16119723    bookmark 
   TABLE DATA               /   COPY public.bookmark (id, content) FROM stdin;
    public       hronsnruwxdwem    false    197   �#       m          0    16119731    config 
   TABLE DATA               1   COPY public.config (id, name, value) FROM stdin;
    public       hronsnruwxdwem    false    199   `1       r          0    16119775    notes 
   TABLE DATA               ,   COPY public.notes (id, content) FROM stdin;
    public       hronsnruwxdwem    false    204   2       o          0    16119739    regex 
   TABLE DATA               /   COPY public.regex (id, s, r, flag) FROM stdin;
    public       hronsnruwxdwem    false    201   7       �           0    0    bookmark_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.bookmark_id_seq', 104, true);
            public       hronsnruwxdwem    false    198            �           0    0    config_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.config_id_seq', 1, false);
            public       hronsnruwxdwem    false    200            �           0    0    notes_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.notes_id_seq', 3, true);
            public       hronsnruwxdwem    false    203            �           0    0    regex_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.regex_id_seq', 1, false);
            public       hronsnruwxdwem    false    202            �           2606    16119752    bookmark bookmark_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.bookmark
    ADD CONSTRAINT bookmark_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.bookmark DROP CONSTRAINT bookmark_pkey;
       public         hronsnruwxdwem    false    197            �           2606    16119754    config config_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.config DROP CONSTRAINT config_pkey;
       public         hronsnruwxdwem    false    199            �           2606    16119783    notes notes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.notes DROP CONSTRAINT notes_pkey;
       public         hronsnruwxdwem    false    204            �           2606    16119756    regex regex_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.regex
    ADD CONSTRAINT regex_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.regex DROP CONSTRAINT regex_pkey;
       public         hronsnruwxdwem    false    201            k   �  x��YQo��~��7o	"%��6@��զּ]h�	��c�F�� (�!(Z#�`kg�0\'5�6�X(����'���}��{%�r��ۋlI���|�w�seM}tm�����Aw�������x�\^�oe'���3Ax����'�pt��������Y����w{����A8��%�ۃ���'�xQ�x���2��k�?���?��|�2�)x{*��b�/���5˖M�0��=�Ѡ�(�~�7|��D����2������W!B���%��2�Q�[�x/�� �N&;a�$.�nU�rvp�̗�n�?A�Q��3K�|ĝ�j,�M��V��[�k7eg�����9�c��X.xr&C��,ݢG�6�S���v��B0�cs"�'}y���'>���x(�W�xg�n�/Q�_�Lnβ�Iգ���[��/��C����}w�롇�'�h���<�"QW�������ߕ��u���W]��i�Rx˧��-j�)��P��j&W<�D��H�d�U��0c��a&��>�zW坼'��^���<S������6����'���n�E�˚��O��%���1ʸ9�2�vɰ���?z���5\1ʣc�m�����`1��U~,,{j.d4�?�ȶ�ql��+��[`�Rf�ob&ʝ��I�ɵл$�*/E��w�'�����]J�Ǳ�B\)���;�@��;�(e��/|�Uc�
��k�[%��μҏ{r6�pm+~o޼�l�︘րL�9�y��y>�
x*����#��k_����)ߟ={6�?n_V�,� qab�H��^=AXEw��uV_8�1�����ԙ�g�=��<�͟Q�����V{�=��f_�t~��)�x@�P�(E {6-/Ci��a[z1��o��Q�"#�:��3�����H=���o~��`����o %���?��S-�c��$�����x��4�l�2�1
�R;���g�D\��:-�^x)�F!7�� �Цr��h|՚˫B��a鄾�J�/SK�US�A7�3#ᆞP�v��U�f+�
�����1|#lG�e(ɐa�|�>����z����Mk�]ӷN���&�3�ͺ�%�6�?ש;H����q�S%��_�.���*�rF�ʯ��@�����B{�����:���,�c[��>�p	D,-�Q�ZC�M�������)���n��:��P�9f�t�bh�Ƚ�슙�|�K���c ��Y�[,Ϊk�xe�b)��Uݯ�j-p"��F(����"�|�65���PFu��Q�/*J���P����P���j�)ʙ`Q��KRl96P�!Xs����>���v��\��nc�kj�W"��B����
�$ww��Ԧ�{Ow��u����T��;�yGny���W����
���0
���C�s���!��^A���{7����8��ϭ�i�툊6 x ?�-թH��k�C6��x�7�=���i5l�j�,�ɖ�*��m�b�ym���X:M4PFDT���V�+��6�>6E==�ބ��C���p�dϐ2�2s�e늨�������?�_�f7��Z�d���[h�Uo~���c��M��V����H�d/��hA#�O��WԌ�|jK4��=ZT]�E��/q�[���Ӄ�����\�&5�H5Q�{�t��j�A^���H��̓�@�m*�{9wd  .��a�����t_������kqu���G��b��a�w݄&�k��i�8UÀ%tg3'PcAY;���bb[�`|��"�fӞx�)�Z!!��*�
$ktC}+K���hf=�lW�Rj1��p졤æ�Q�����<j��u*0��6HJ�u*�ƃ�+�2��j�c�05�,ܧ~����b�ܦ�X�e�/	�:D����lF����2a󰕤��(��	�y[B�����=
�S��I��[�KVr���,��f��;�ۖp\���JE�j�_b;�>���͡	��롍�8��L|��ΩO���n���$+Ł�����zӣ���2����C$Y\:
7s�[�c����pq���ƤW:$jF�g�
���b�2���>����FZ�<�6B+�Wg�̡CG=2W�H��l�"弓��4#�f����<��R�������A�����UȮgt���H��s/>�I���D��T�:��2�6D͠1=�h1�����O+��er	����X^5g��=�E�㶙��C�-��9ʻ�V��?�C O��zʴ!�s9�[JC����m� ��,�]QskQ]Kw�8�ۡ^L���?
�I����G����<kt��&��v���5�����J'�c����V�(��P��Z�f�����U�}K<�V�I��^��c@8N�|8�Zt�a�"2K���C�eY����ό��W�#����(^�o����P�� Y�b#e�U"�J�p���IU���|h�Q�LLն#���J��>gT�C��Qȟ�eT3;L�	�W�f�Y��	~�� \}zhxS7�������a]���1AO�`l��w������˶�}2��\����Q=���9"zLL:��H݆g�d�"����gU�:���j,��MJ1�:��,�p�2T[��
 (��)�lRx�/�Z�Q���o&?�����z�k@�e���󺡏��5�ƻqA~��ML
}�ų��O�K�n�uwFe�QEz��]��������)E�J)���ո�f���+�^6�
��~(SB��xx�%-��X��d�
�9�0H6u�E����I�:������=7�� �)ͦ��ч�ug��ʙ$V�j����co�ć�E�iUD���0s�a�j�� n���:�f�n�[�i �ddK������B�MO꜑j�)@��V�|���gzR�(��7&�	�B��@�� �x~.���e���ѡn�֎�Q��<eA��&��V~�3�����U����h.x|Zͧτ����.!7S��S�:��=@|�+*`E{��;	;�D4�тktT��b�����/��>��պ��f�0�[W7G���u/AT `TJ���x�Tq���FQk:̮�az�
�»��(!�u�n�I�Kka�lr�(���lW���h8�C��.�� ���.�4�4���C4j��B[V�Җ痶��"���U���/S�4P2²/��Զ��Q?C;?)��f ����Nf��9�7���Nô�W�k���a߅=8��	�lZV�S�3܏[Qר�m�1�p����=(�Èہ9�G����CS�����:�(����˟�t[s3��Z�-�-������O�,��F��W4��8���GZXǰe;+�bgȚ�%7���V�H�� �avG�(��ިa���*c˘H~)XE⒉�2eT�9��n"��L�D�yZ�_���?      m   �   x�M���0 ϻ_A8��T�q �K�CSۤ��v!��%�<��m:X8��e�Zx�(ڵ�i��-��Wb�G*��#i졈a�/@q��W��FoC�z�9�~b3SS�>�N���F�6U�)�tL��Q�O��#�ZD�05\      r     x�}Wђ�8|���<�� �$���1T��l������O���"3�2�ڶ�j��⏿������.�}�y;���´�����~���Nf�Z�����+�B�|3�lo�-`���ں��������+(D�`�����a�����Rtt���lh�Bgڇ����1��������N�څ`��3t��ۙ�W�7׾�F����H�_V���4�HX3E���]wOI�ȧ�y�1r�,���NB�eS���;���3���JiR��3M\x��Y�D<��{|v<j�O���2\E��DK�W C�%��F�󾷾�S�Z�@�:��������̀��� CO��m��!���`]6,���;i��.�:!�[ A��5�����t^��X�#����237��V��*PhR��r�y�$�7Z0�$52���I�P�����!��rT�Ї:�ߔ:����ݤ�$���& �l�&��3���LI�/:�� �?��`\M]�X#:}�G�WZ�F�P�t9�i@ %������ɏ�9��R�ս��y`qK,7z
�w
��7-� ��G4����d-����I���@g]�&�����5�P�'5=u�>���&��=����J�+ �"ִcg��pDz��[�0�<m�����B��7S8���œI,b�l����d'^�w*7rż"��U_�Gp���K�o=�+􊞝���;�L�֐��2D�L��Ϡ��Ngί�����L��� EoS���t����4@��B�I
H����\jN�z�$�b�x)�Mj�g�dcg�GJ�@�J��ۤ�@t �z��K7K��*e�TA%HXN�/��ʦ�'�9�S��J�����:X�WqS����P�w��b���-Vh`�@�ү����p�W�Jx��;��FGk�
jx��l;��T'�u��	����u�\����T��2'��zR�Y�a��b�C���Nfͤ����Ƭ�j�s��b:�+w!��<�Bɠ���A��3Ѭwn5�pi�y6�s�x���gG���y�fk��(�w��I�����ٯ9;�5�X�5i��[
�&�kgY8J�X��O�&�:�#�s��%��Z�D`����[w��6��[|��������ߋ�Y\�2��؃�KNS?,7	��e��WF��r��V�e']z��4��!�t��z��q'���"��Y��c���O��F)�4�8��`�n
���5���L�z����C��*?i���h�}ȥ���ݚ�i�Sn?>������?8] a      o   2   x�3���SH�H�W(�HUH��τ�^ z�k?P���ٙ��\1z\\\ �=�     