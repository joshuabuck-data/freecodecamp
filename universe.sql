+------------------------+--------------------+-----------+----------+---------+
| schemaname             | name               |           |          |         |
| tablename              | name               |           |          |         |
| statistics_schemaname  | name               |           |          |         |
| statistics_name        | name               |           |          |         |
| statistics_owner       | name               |           |          |         |
| attnames               | name[]             |           |          |         |
| kinds                  | "char"[]           |           |          |         |
| n_distinct             | pg_ndistinct       | C         |          |         |
| dependencies           | pg_dependencies    | C         |          |         |
| most_common_vals       | text[]             |           |          |         |
| most_common_val_nulls  | boolean[]          |           |          |         |
| most_common_freqs      | double precision[] |           |          |         |
| most_common_base_freqs | double precision[] |           |          |         |
+------------------------+--------------------+-----------+----------+---------+

              Table "pg_catalog.pg_subscription"
+-----------------+---------+-----------+----------+---------+
|     Column      |  Type   | Collation | Nullable | Default |
+-----------------+---------+-----------+----------+---------+
| oid             | oid     |           | not null |         |
| subdbid         | oid     |           | not null |         |
| subname         | name    |           | not null |         |
| subowner        | oid     |           | not null |         |
| subenabled      | boolean |           | not null |         |
| subconninfo     | text    | C         | not null |         |
| subslotname     | name    |           | not null |         |
| subsynccommit   | text    | C         | not null |         |
| subpublications | text[]  | C         | not null |         |
+-----------------+---------+-----------+----------+---------+
Indexes:
    "pg_subscription_oid_index" UNIQUE, btree (oid), tablespace "pg_global"
    "pg_subscription_subname_index" UNIQUE, btree (subdbid, subname), tablespace "pg_global"
Tablespace: "pg_global"

Index "pg_catalog.pg_subscription_oid_index"
+--------+------+------+------------+
| Column | Type | Key? | Definition |
+--------+------+------+------------+
| oid    | oid  | yes  | oid        |
+--------+------+------+------------+
unique, btree, for table "pg_catalog.pg_subscription"
Tablespace: "pg_global"

         Table "pg_catalog.pg_subscription_rel"
+------------+--------+-----------+----------+---------+
|   Column   |  Type  | Collation | Nullable | Default |
+------------+--------+-----------+----------+---------+
| srsubid    | oid    |           | not null |         |
| srrelid    | oid    |           | not null |         |
| srsubstate | "char" |           | not null |         |
| srsublsn   | pg_lsn |           | not null |         |
+------------+--------+-----------+----------+---------+
Indexes:
    "pg_subscription_rel_srrelid_srsubid_index" UNIQUE, btree (srrelid, srsubid)

Index "pg_catalog.pg_subscription_rel_srrelid_srsubid_index"
+---------+------+------+------------+
| Column  | Type | Key? | Definition |
+---------+------+------+------------+
| srrelid | oid  | yes  | srrelid    |
| srsubid | oid  | yes  | srsubid    |
+---------+------+------+------------+
unique, btree, for table "pg_catalog.pg_subscription_rel"

Index "pg_catalog.pg_subscription_subname_index"
+---------+---------+------+------------+
| Column  |  Type   | Key? | Definition |
+---------+---------+------+------------+
| subdbid | oid     | yes  | subdbid    |
| subname | cstring | yes  | subname    |
+---------+---------+------+------------+
unique, btree, for table "pg_catalog.pg_subscription"
Tablespace: "pg_global"

               View "pg_catalog.pg_tables"
+-------------+---------+-----------+----------+---------+
|   Column    |  Type   | Collation | Nullable | Default |
+-------------+---------+-----------+----------+---------+
| schemaname  | name    |           |          |         |
| tablename   | name    |           |          |         |
| tableowner  | name    |           |          |         |
| tablespace  | name    |           |          |         |
| hasindexes  | boolean |           |          |         |
| hasrules    | boolean |           |          |         |
| hastriggers | boolean |           |          |         |
| rowsecurity | boolean |           |          |         |
+-------------+---------+-----------+----------+---------+

             Table "pg_catalog.pg_tablespace"
+------------+-----------+-----------+----------+---------+
|   Column   |   Type    | Collation | Nullable | Default |
+------------+-----------+-----------+----------+---------+
| oid        | oid       |           | not null |         |
| spcname    | name      |           | not null |         |
| spcowner   | oid       |           | not null |         |
| spcacl     | aclitem[] |           |          |         |
| spcoptions | text[]    | C         |          |         |
+------------+-----------+-----------+----------+---------+
Indexes:
    "pg_tablespace_oid_index" UNIQUE, btree (oid), tablespace "pg_global"
    "pg_tablespace_spcname_index" UNIQUE, btree (spcname), tablespace "pg_global"
Tablespace: "pg_global"

Index "pg_catalog.pg_tablespace_oid_index"
+--------+------+------+------------+
| Column | Type | Key? | Definition |
+--------+------+------+------------+
| oid    | oid  | yes  | oid        |
+--------+------+------+------------+
unique, btree, for table "pg_catalog.pg_tablespace"
Tablespace: "pg_global"

Index "pg_catalog.pg_tablespace_spcname_index"
+---------+---------+------+------------+
| Column  |  Type   | Key? | Definition |
+---------+---------+------+------------+
| spcname | cstring | yes  | spcname    |
+---------+---------+------+------------+
unique, btree, for table "pg_catalog.pg_tablespace"
Tablespace: "pg_global"

          View "pg_catalog.pg_timezone_abbrevs"
+------------+----------+-----------+----------+---------+
|   Column   |   Type   | Collation | Nullable | Default |
+------------+----------+-----------+----------+---------+
| abbrev     | text     |           |          |         |
| utc_offset | interval |           |          |         |
| is_dst     | boolean  |           |          |         |
+------------+----------+-----------+----------+---------+

           View "pg_catalog.pg_timezone_names"
+------------+----------+-----------+----------+---------+
|   Column   |   Type   | Collation | Nullable | Default |
+------------+----------+-----------+----------+---------+
| name       | text     |           |          |         |
| abbrev     | text     |           |          |         |
| utc_offset | interval |           |          |         |
| is_dst     | boolean  |           |          |         |
+------------+----------+-----------+----------+---------+

             Table "pg_catalog.pg_transform"
+------------+---------+-----------+----------+---------+
|   Column   |  Type   | Collation | Nullable | Default |
+------------+---------+-----------+----------+---------+
| oid        | oid     |           | not null |         |
| trftype    | oid     |           | not null |         |
| trflang    | oid     |           | not null |         |
| trffromsql | regproc |           | not null |         |
| trftosql   | regproc |           | not null |         |
+------------+---------+-----------+----------+---------+
Indexes:
    "pg_transform_oid_index" UNIQUE, btree (oid)
    "pg_transform_type_lang_index" UNIQUE, btree (trftype, trflang)

Index "pg_catalog.pg_transform_oid_index"
+--------+------+------+------------+
| Column | Type | Key? | Definition |
+--------+------+------+------------+
| oid    | oid  | yes  | oid        |
+--------+------+------+------------+
unique, btree, for table "pg_catalog.pg_transform"

Index "pg_catalog.pg_transform_type_lang_index"
+---------+------+------+------------+
| Column  | Type | Key? | Definition |
+---------+------+------+------------+
| trftype | oid  | yes  | trftype    |
| trflang | oid  | yes  | trflang    |
+---------+------+------+------------+
unique, btree, for table "pg_catalog.pg_transform"

                  Table "pg_catalog.pg_trigger"
+----------------+--------------+-----------+----------+---------+
|     Column     |     Type     | Collation | Nullable | Default |
+----------------+--------------+-----------+----------+---------+
| oid            | oid          |           | not null |         |
| tgrelid        | oid          |           | not null |         |
| tgname         | name         |           | not null |         |
| tgfoid         | oid          |           | not null |         |
| tgtype         | smallint     |           | not null |         |
| tgenabled      | "char"       |           | not null |         |
| tgisinternal   | boolean      |           | not null |         |
| tgconstrrelid  | oid          |           | not null |         |
| tgconstrindid  | oid          |           | not null |         |
| tgconstraint   | oid          |           | not null |         |
| tgdeferrable   | boolean      |           | not null |         |
| tginitdeferred | boolean      |           | not null |         |
| tgnargs        | smallint     |           | not null |         |
| tgattr         | int2vector   |           | not null |         |
| tgargs         | bytea        |           | not null |         |
| tgqual         | pg_node_tree | C         |          |         |
| tgoldtable     | name         |           |          |         |
| tgnewtable     | name         |           |          |         |
+----------------+--------------+-----------+----------+---------+
Indexes:
    "pg_trigger_oid_index" UNIQUE, btree (oid)
    "pg_trigger_tgrelid_tgname_index" UNIQUE, btree (tgrelid, tgname)
    "pg_trigger_tgconstraint_index" btree (tgconstraint)

Index "pg_catalog.pg_trigger_oid_index"
+--------+------+------+------------+
| Column | Type | Key? | Definition |
+--------+------+------+------------+
| oid    | oid  | yes  | oid        |
+--------+------+------+------------+
unique, btree, for table "pg_catalog.pg_trigger"

Index "pg_catalog.pg_trigger_tgconstraint_index"
+--------------+------+------+--------------+
|    Column    | Type | Key? |  Definition  |
+--------------+------+------+--------------+
| tgconstraint | oid  | yes  | tgconstraint |
+--------------+------+------+--------------+
btree, for table "pg_catalog.pg_trigger"

Index "pg_catalog.pg_trigger_tgrelid_tgname_index"
+---------+---------+------+------------+
| Column  |  Type   | Key? | Definition |
+---------+---------+------+------------+
| tgrelid | oid     | yes  | tgrelid    |
| tgname  | cstring | yes  | tgname     |
+---------+---------+------+------------+
unique, btree, for table "pg_catalog.pg_trigger"

            Table "pg_catalog.pg_ts_config"
+--------------+------+-----------+----------+---------+
|    Column    | Type | Collation | Nullable | Default |
+--------------+------+-----------+----------+---------+
| oid          | oid  |           | not null |         |
| cfgname      | name |           | not null |         |
| cfgnamespace | oid  |           | not null |         |
| cfgowner     | oid  |           | not null |         |
| cfgparser    | oid  |           | not null |         |
+--------------+------+-----------+----------+---------+
Indexes:
    "pg_ts_config_cfgname_index" UNIQUE, btree (cfgname, cfgnamespace)
    "pg_ts_config_oid_index" UNIQUE, btree (oid)

 Index "pg_catalog.pg_ts_config_cfgname_index"
+--------------+---------+------+--------------+
|    Column    |  Type   | Key? |  Definition  |
+--------------+---------+------+--------------+
| cfgname      | cstring | yes  | cfgname      |
| cfgnamespace | oid     | yes  | cfgnamespace |
+--------------+---------+------+--------------+
unique, btree, for table "pg_catalog.pg_ts_config"

            Table "pg_catalog.pg_ts_config_map"
+--------------+---------+-----------+----------+---------+
|    Column    |  Type   | Collation | Nullable | Default |
+--------------+---------+-----------+----------+---------+
| mapcfg       | oid     |           | not null |         |
| maptokentype | integer |           | not null |         |
| mapseqno     | integer |           | not null |         |
| mapdict      | oid     |           | not null |         |
+--------------+---------+-----------+----------+---------+
Indexes:
    "pg_ts_config_map_index" UNIQUE, btree (mapcfg, maptokentype, mapseqno)

   Index "pg_catalog.pg_ts_config_map_index"
+--------------+---------+------+--------------+
|    Column    |  Type   | Key? |  Definition  |
+--------------+---------+------+--------------+
| mapcfg       | oid     | yes  | mapcfg       |
| maptokentype | integer | yes  | maptokentype |
| mapseqno     | integer | yes  | mapseqno     |
+--------------+---------+------+--------------+
unique, btree, for table "pg_catalog.pg_ts_config_map"

Index "pg_catalog.pg_ts_config_oid_index"
+--------+------+------+------------+
| Column | Type | Key? | Definition |
+--------+------+------+------------+
| oid    | oid  | yes  | oid        |
+--------+------+------+------------+
unique, btree, for table "pg_catalog.pg_ts_config"

              Table "pg_catalog.pg_ts_dict"
+----------------+------+-----------+----------+---------+
|     Column     | Type | Collation | Nullable | Default |
+----------------+------+-----------+----------+---------+
| oid            | oid  |           | not null |         |
| dictname       | name |           | not null |         |
| dictnamespace  | oid  |           | not null |         |
| dictowner      | oid  |           | not null |         |
| dicttemplate   | oid  |           | not null |         |
| dictinitoption | text | C         |          |         |
+----------------+------+-----------+----------+---------+
Indexes:
    "pg_ts_dict_dictname_index" UNIQUE, btree (dictname, dictnamespace)
    "pg_ts_dict_oid_index" UNIQUE, btree (oid)

   Index "pg_catalog.pg_ts_dict_dictname_index"
+---------------+---------+------+---------------+
|    Column     |  Type   | Key? |  Definition   |
+---------------+---------+------+---------------+
| dictname      | cstring | yes  | dictname      |
| dictnamespace | oid     | yes  | dictnamespace |
+---------------+---------+------+---------------+
unique, btree, for table "pg_catalog.pg_ts_dict"

Index "pg_catalog.pg_ts_dict_oid_index"
+--------+------+------+------------+
| Column | Type | Key? | Definition |
+--------+------+------+------------+
| oid    | oid  | yes  | oid        |
+--------+------+------+------------+
unique, btree, for table "pg_catalog.pg_ts_dict"

              Table "pg_catalog.pg_ts_parser"
+--------------+---------+-----------+----------+---------+
|    Column    |  Type   | Collation | Nullable | Default |
+--------------+---------+-----------+----------+---------+
| oid          | oid     |           | not null |         |
| prsname      | name    |           | not null |         |
| prsnamespace | oid     |           | not null |         |
| prsstart     | regproc |           | not null |         |
| prstoken     | regproc |           | not null |         |
| prsend       | regproc |           | not null |         |
| prsheadline  | regproc |           | not null |         |
| prslextype   | regproc |           | not null |         |
+--------------+---------+-----------+----------+---------+
Indexes:
    "pg_ts_parser_oid_index" UNIQUE, btree (oid)
    "pg_ts_parser_prsname_index" UNIQUE, btree (prsname, prsnamespace)

Index "pg_catalog.pg_ts_parser_oid_index"
+--------+------+------+------------+
| Column | Type | Key? | Definition |
+--------+------+------+------------+
| oid    | oid  | yes  | oid        |
+--------+------+------+------------+
unique, btree, for table "pg_catalog.pg_ts_parser"

 Index "pg_catalog.pg_ts_parser_prsname_index"
+--------------+---------+------+--------------+
|    Column    |  Type   | Key? |  Definition  |
+--------------+---------+------+--------------+
| prsname      | cstring | yes  | prsname      |
| prsnamespace | oid     | yes  | prsnamespace |
+--------------+---------+------+--------------+
unique, btree, for table "pg_catalog.pg_ts_parser"

             Table "pg_catalog.pg_ts_template"
+---------------+---------+-----------+----------+---------+
|    Column     |  Type   | Collation | Nullable | Default |
+---------------+---------+-----------+----------+---------+
| oid           | oid     |           | not null |         |
| tmplname      | name    |           | not null |         |
| tmplnamespace | oid     |           | not null |         |
| tmplinit      | regproc |           | not null |         |
| tmpllexize    | regproc |           | not null |         |
+---------------+---------+-----------+----------+---------+
Indexes:
    "pg_ts_template_oid_index" UNIQUE, btree (oid)
    "pg_ts_template_tmplname_index" UNIQUE, btree (tmplname, tmplnamespace)

Index "pg_catalog.pg_ts_template_oid_index"
+--------+------+------+------------+
| Column | Type | Key? | Definition |
+--------+------+------+------------+
| oid    | oid  | yes  | oid        |
+--------+------+------+------------+
unique, btree, for table "pg_catalog.pg_ts_template"

 Index "pg_catalog.pg_ts_template_tmplname_index"
+---------------+---------+------+---------------+
|    Column     |  Type   | Key? |  Definition   |
+---------------+---------+------+---------------+
| tmplname      | cstring | yes  | tmplname      |
| tmplnamespace | oid     | yes  | tmplnamespace |
+---------------+---------+------+---------------+
unique, btree, for table "pg_catalog.pg_ts_template"

                    Table "pg_catalog.pg_type"
+----------------+--------------+-----------+----------+---------+
|     Column     |     Type     | Collation | Nullable | Default |
+----------------+--------------+-----------+----------+---------+
| oid            | oid          |           | not null |         |
| typname        | name         |           | not null |         |
| typnamespace   | oid          |           | not null |         |
| typowner       | oid          |           | not null |         |
| typlen         | smallint     |           | not null |         |
| typbyval       | boolean      |           | not null |         |
| typtype        | "char"       |           | not null |         |
| typcategory    | "char"       |           | not null |         |
| typispreferred | boolean      |           | not null |         |
| typisdefined   | boolean      |           | not null |         |
| typdelim       | "char"       |           | not null |         |
| typrelid       | oid          |           | not null |         |
| typelem        | oid          |           | not null |         |
| typarray       | oid          |           | not null |         |
| typinput       | regproc      |           | not null |         |
| typoutput      | regproc      |           | not null |         |
| typreceive     | regproc      |           | not null |         |
| typsend        | regproc      |           | not null |         |
| typmodin       | regproc      |           | not null |         |
| typmodout      | regproc      |           | not null |         |
| typanalyze     | regproc      |           | not null |         |
| typalign       | "char"       |           | not null |         |
| typstorage     | "char"       |           | not null |         |
| typnotnull     | boolean      |           | not null |         |
| typbasetype    | oid          |           | not null |         |
| typtypmod      | integer      |           | not null |         |
| typndims       | integer      |           | not null |         |
| typcollation   | oid          |           | not null |         |
| typdefaultbin  | pg_node_tree | C         |          |         |
| typdefault     | text         | C         |          |         |
| typacl         | aclitem[]    |           |          |         |
+----------------+--------------+-----------+----------+---------+
Indexes:
    "pg_type_oid_index" UNIQUE, btree (oid)
    "pg_type_typname_nsp_index" UNIQUE, btree (typname, typnamespace)

Index "pg_catalog.pg_type_oid_index"
+--------+------+------+------------+
| Column | Type | Key? | Definition |
+--------+------+------+------------+
| oid    | oid  | yes  | oid        |
+--------+------+------+------------+
unique, btree, for table "pg_catalog.pg_type"

  Index "pg_catalog.pg_type_typname_nsp_index"
+--------------+---------+------+--------------+
|    Column    |  Type   | Key? |  Definition  |
+--------------+---------+------+--------------+
| typname      | cstring | yes  | typname      |
| typnamespace | oid     | yes  | typnamespace |
+--------------+---------+------+--------------+
unique, btree, for table "pg_catalog.pg_type"

                         View "pg_catalog.pg_user"
+--------------+--------------------------+-----------+----------+---------+
|    Column    |           Type           | Collation | Nullable | Default |
+--------------+--------------------------+-----------+----------+---------+
| usename      | name                     |           |          |         |
| usesysid     | oid                      |           |          |         |
| usecreatedb  | boolean                  |           |          |         |
| usesuper     | boolean                  |           |          |         |
| userepl      | boolean                  |           |          |         |
| usebypassrls | boolean                  |           |          |         |
| passwd       | text                     |           |          |         |
| valuntil     | timestamp with time zone |           |          |         |
| useconfig    | text[]                   | C         |          |         |
+--------------+--------------------------+-----------+----------+---------+

          Table "pg_catalog.pg_user_mapping"
+-----------+--------+-----------+----------+---------+
|  Column   |  Type  | Collation | Nullable | Default |
+-----------+--------+-----------+----------+---------+
| oid       | oid    |           | not null |         |
| umuser    | oid    |           | not null |         |
| umserver  | oid    |           | not null |         |
| umoptions | text[] | C         |          |         |
+-----------+--------+-----------+----------+---------+
Indexes:
    "pg_user_mapping_oid_index" UNIQUE, btree (oid)
    "pg_user_mapping_user_server_index" UNIQUE, btree (umuser, umserver)

Index "pg_catalog.pg_user_mapping_oid_index"
+--------+------+------+------------+
| Column | Type | Key? | Definition |
+--------+------+------+------------+
| oid    | oid  | yes  | oid        |
+--------+------+------+------------+
unique, btree, for table "pg_catalog.pg_user_mapping"

Index "pg_catalog.pg_user_mapping_user_server_index"
+----------+------+------+------------+
|  Column  | Type | Key? | Definition |
+----------+------+------+------------+
| umuser   | oid  | yes  | umuser     |
| umserver | oid  | yes  | umserver   |
+----------+------+------+------------+
unique, btree, for table "pg_catalog.pg_user_mapping"

          View "pg_catalog.pg_user_mappings"
+-----------+--------+-----------+----------+---------+
|  Column   |  Type  | Collation | Nullable | Default |
+-----------+--------+-----------+----------+---------+
| umid      | oid    |           |          |         |
| srvid     | oid    |           |          |         |
| srvname   | name   |           |          |         |
| umuser    | oid    |           |          |         |
| usename   | name   |           |          |         |
| umoptions | text[] | C         |          |         |
+-----------+--------+-----------+----------+---------+

              View "pg_catalog.pg_views"
+------------+------+-----------+----------+---------+
|   Column   | Type | Collation | Nullable | Default |
+------------+------+-----------+----------+---------+
| schemaname | name |           |          |         |
| viewname   | name |           |          |         |
| viewowner  | name |           |          |         |
| definition | text |           |          |         |
+------------+------+-----------+----------+---------+

                                           Table "public.blackhole"
+---------------+-------------------+-----------+----------+-------------------------------------------------+
|    Column     |       Type        | Collation | Nullable |                     Default                     |
+---------------+-------------------+-----------+----------+-------------------------------------------------+
| blackhole_id  | integer           |           | not null | nextval('blackhole_blackhole_id_seq'::regclass) |
| name          | character varying |           | not null |                                                 |
| radius        | numeric           |           |          |                                                 |
| event_horizon | text              |           |          |                                                 |
| mass          | numeric           |           | not null |                                                 |
+---------------+-------------------+-----------+----------+-------------------------------------------------+
Indexes:
    "blackhole_pkey" PRIMARY KEY, btree (blackhole_id)
    "blackhole_mass_key" UNIQUE CONSTRAINT, btree (mass)

              Sequence "public.blackhole_blackhole_id_seq"
+---------+-------+---------+------------+-----------+---------+-------+
|  Type   | Start | Minimum |  Maximum   | Increment | Cycles? | Cache |
+---------+-------+---------+------------+-----------+---------+-------+
| integer |     1 |       1 | 2147483647 |         1 | no      |     1 |
+---------+-------+---------+------------+-----------+---------+-------+
Owned by: public.blackhole.blackhole_id

   Index "public.blackhole_mass_key"
+--------+---------+------+------------+
| Column |  Type   | Key? | Definition |
+--------+---------+------+------------+
| mass   | numeric | yes  | mass       |
+--------+---------+------+------------+
unique, btree, for table "public.blackhole"

         Index "public.blackhole_pkey"
+--------------+---------+------+--------------+
|    Column    |  Type   | Key? |  Definition  |
+--------------+---------+------+--------------+
| blackhole_id | integer | yes  | blackhole_id |
+--------------+---------+------+--------------+
primary key, btree, for table "public.blackhole"

                                              Table "public.galaxy"
+----------------------------+-----------------------+-----------+----------+------------------------------------+
|           Column           |         Type          | Collation | Nullable |              Default               |
+----------------------------+-----------------------+-----------+----------+------------------------------------+
| galaxy_id                  | integer               |           | not null | nextval('galaxy_id_seq'::regclass) |
| name                       | character varying(30) |           |          |                                    |
| age_in_million_of_years    | integer               |           |          |                                    |
| beyond_reach               | boolean               |           |          |                                    |
| contains_habitable_planets | boolean               |           |          |                                    |
| distance_from_earth        | integer               |           |          |                                    |
| redshift                   | numeric               |           | not null |                                    |
+----------------------------+-----------------------+-----------+----------+------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_redshift_key" UNIQUE CONSTRAINT, btree (redshift)
Referenced by:
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

                    Sequence "public.galaxy_id_seq"
+---------+-------+---------+------------+-----------+---------+-------+
|  Type   | Start | Minimum |  Maximum   | Increment | Cycles? | Cache |
+---------+-------+---------+------------+-----------+---------+-------+
| integer |     1 |       1 | 2147483647 |         1 | no      |     1 |
+---------+-------+---------+------------+-----------+---------+-------+
Owned by: public.galaxy.galaxy_id

       Index "public.galaxy_pkey"
+--------+---------+------+------------+
| Column |  Type   | Key? | Definition |
+--------+---------+------+------------+
| id     | integer | yes  | galaxy_id  |
+--------+---------+------+------------+
primary key, btree, for table "public.galaxy"

    Index "public.galaxy_redshift_key"
+----------+---------+------+------------+
|  Column  |  Type   | Key? | Definition |
+----------+---------+------+------------+
| redshift | numeric | yes  | redshift   |
+----------+---------+------+------------+
unique, btree, for table "public.galaxy"

                                        Table "public.moon"
+--------------+-------------------+-----------+----------+---------------------------------------+
|    Column    |       Type        | Collation | Nullable |                Default                |
+--------------+-------------------+-----------+----------+---------------------------------------+
| name         | character varying |           |          |                                       |
| galaxy_id    | integer           |           |          |                                       |
| star_id      | integer           |           |          |                                       |
| spherical    | boolean           |           |          |                                       |
| moon_id      | integer           |           | not null | nextval('moon_moon_id_seq'::regclass) |
| planet_id    | integer           |           |          |                                       |
| density      | numeric           |           | not null |                                       |
| circumfrence | numeric           |           | not null |                                       |
+--------------+-------------------+-----------+----------+---------------------------------------+
Indexes:
    "moon_pkey" PRIMARY KEY, btree (moon_id)
    "moon_circumfrence_key" UNIQUE CONSTRAINT, btree (circumfrence)
Foreign-key constraints:
    "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

      Index "public.moon_circumfrence_key"
+--------------+---------+------+--------------+
|    Column    |  Type   | Key? |  Definition  |
+--------------+---------+------+--------------+
| circumfrence | numeric | yes  | circumfrence |
+--------------+---------+------+--------------+
unique, btree, for table "public.moon"

                   Sequence "public.moon_moon_id_seq"
+---------+-------+---------+------------+-----------+---------+-------+
|  Type   | Start | Minimum |  Maximum   | Increment | Cycles? | Cache |
+---------+-------+---------+------------+-----------+---------+-------+
| integer |     1 |       1 | 2147483647 |         1 | no      |     1 |
+---------+-------+---------+------------+-----------+---------+-------+
Owned by: public.moon.moon_id

        Index "public.moon_pkey"
+---------+---------+------+------------+
| Column  |  Type   | Key? | Definition |
+---------+---------+------+------------+
| moon_id | integer | yes  | moon_id    |
+---------+---------+------+------------+
primary key, btree, for table "public.moon"

                                              Table "public.planet"
+-------------------------+-------------------+-----------+----------+-------------------------------------------+
|         Column          |       Type        | Collation | Nullable |                  Default                  |
+-------------------------+-------------------+-----------+----------+-------------------------------------------+
| name                    | character varying |           |          |                                           |
| galaxy_id               | integer           |           |          |                                           |
| star_id                 | integer           |           |          |                                           |
| planet_radius           | integer           |           |          |                                           |
| surface_temp_in_celsius | numeric           |           |          |                                           |
| atmosphere              | boolean           |           |          |                                           |
| planet_id               | integer           |           | not null | nextval('planet_planet_id_seq'::regclass) |
| coordinates             | numeric           |           | not null |                                           |
+-------------------------+-------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_coordinates_key" UNIQUE CONSTRAINT, btree (coordinates)
Foreign-key constraints:
    "planet_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES star(star_id)
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

    Index "public.planet_coordinates_key"
+-------------+---------+------+-------------+
|   Column    |  Type   | Key? | Definition  |
+-------------+---------+------+-------------+
| coordinates | numeric | yes  | coordinates |
+-------------+---------+------+-------------+
unique, btree, for table "public.planet"

        Index "public.planet_pkey"
+-----------+---------+------+------------+
|  Column   |  Type   | Key? | Definition |
+-----------+---------+------+------------+
| planet_id | integer | yes  | planet_id  |
+-----------+---------+------+------------+
primary key, btree, for table "public.planet"

                 Sequence "public.planet_planet_id_seq"
+---------+-------+---------+------------+-----------+---------+-------+
|  Type   | Start | Minimum |  Maximum   | Increment | Cycles? | Cache |
+---------+-------+---------+------------+-----------+---------+-------+
| integer |     1 |       1 | 2147483647 |         1 | no      |     1 |
+---------+-------+---------+------------+-----------+---------+-------+
Owned by: public.planet.planet_id

                                             Table "public.star"
+-------------------------+-------------------+-----------+----------+---------------------------------------+
|         Column          |       Type        | Collation | Nullable |                Default                |
+-------------------------+-------------------+-----------+----------+---------------------------------------+
| name                    | character varying |           |          |                                       |
| galaxy_id               | integer           |           |          |                                       |
| star_type               | character varying |           |          |                                       |
| surface_temp_in_kelvins | numeric           |           |          |                                       |
| has_planets             | boolean           |           |          |                                       |
| star_id                 | integer           |           | not null | nextval('star_star_id_seq'::regclass) |
| internal_temp_in_kelvin | numeric           |           | not null |                                       |
+-------------------------+-------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_internal_temp_in_kelvin_key" UNIQUE CONSTRAINT, btree (internal_temp_in_kelvin)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "planet_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES star(star_id)
    TABLE "planet" CONSTRAINT "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

           Index "public.star_internal_temp_in_kelvin_key"
+-------------------------+---------+------+-------------------------+
|         Column          |  Type   | Key? |       Definition        |
+-------------------------+---------+------+-------------------------+
| internal_temp_in_kelvin | numeric | yes  | internal_temp_in_kelvin |
+-------------------------+---------+------+-------------------------+
unique, btree, for table "public.star"

        Index "public.star_pkey"
+---------+---------+------+------------+
| Column  |  Type   | Key? | Definition |
+---------+---------+------+------------+
| star_id | integer | yes  | star_id    |
+---------+---------+------+------------+
primary key, btree, for table "public.star"

                   Sequence "public.star_star_id_seq"
+---------+-------+---------+------------+-----------+---------+-------+
|  Type   | Start | Minimum |  Maximum   | Increment | Cycles? | Cache |
+---------+-------+---------+------------+-----------+---------+-------+
| integer |     1 |       1 | 2147483647 |         1 | no      |     1 |
+---------+-------+---------+------------+-----------+---------+-------+
Owned by: public.star.star_id

universe=> alter table planet drop planet_planet_id_fkey
universe-> ;
ERROR:  column "planet_planet_id_fkey" of relation "planet" does not exist
universe=> alter table planet drop foreign key(planet_planet_id_fkey);
ERROR:  syntax error at or near "foreign"
LINE 1: alter table planet drop foreign key(planet_planet_id_fkey);
                                ^
universe=> alter table planet drop foreignkey(planet_planet_id_fkey);
ERROR:  syntax error at or near "("
LINE 1: alter table planet drop foreignkey(planet_planet_id_fkey);
                                          ^
universe=> alter table planet drop foreign key planet_planet_id_fkey;
ERROR:  syntax error at or near "foreign"
LINE 1: alter table planet drop foreign key planet_planet_id_fkey;
                                ^
universe=> alter table planet drop constraint planet_planet_id_fkey;
ALTER TABLE
universe=> alter table planet drop constraint planet_planet_id_fkey;
ERROR:  constraint "planet_planet_id_fkey" of relation "planet" does not exist
universe=> 
universe=> 
universe=> 
universe=> 
universe=> 
universe=> 
universe=> 
universe=> 
universe=> 
universe=> insert into moon(name,circumfrence, spherical) values('stacey',23345,0) 
universe-> ;
ERROR:  column "spherical" is of type boolean but expression is of type integer
LINE 1: ...moon(name,circumfrence, spherical) values('stacey',23345,0) 
                                                                    ^
HINT:  You will need to rewrite or cast the expression.
universe=> insert into moon(name,circumfrence, spherical) values('stacey',23345,true) ;
ERROR:  null value in column "density" violates not-null constraint
DETAIL:  Failing row contains (stacey, null, null, t, 1, null, null, 23345).
universe=> insert into moon(name,circumfrence, spherical,density) values('stacey',23345,true,0.9) ;
INSERT 0 1
universe=> select * from moon;
+--------+-----------+---------+-----------+---------+-----------+---------+--------------+
|  name  | galaxy_id | star_id | spherical | moon_id | planet_id | density | circumfrence |
+--------+-----------+---------+-----------+---------+-----------+---------+--------------+
| stacey |           |         | t         |       2 |           |     0.9 |        23345 |
+--------+-----------+---------+-----------+---------+-----------+---------+--------------+
(1 row)

universe=> insert into moon(name,circumfrence, spherical,density) values('iris',41835,true,0.5) ;
INSERT 0 1
universe=> insert into moon(name,circumfrence, spherical,density) values('iris',41835,true,0.5)('tetre',81204,t,.833) ;
ERROR:  syntax error at or near "("
LINE 1: ..., spherical,density) values('iris',41835,true,0.5)('tetre',8...
                                                             ^
universe=> insert into moon(name,circumfrence, spherical,density) values(('7887bhshjdes',47775,true,0.35),('tetre',81204,t,.833)) ;
ERROR:  column "t" does not exist
LINE 1: ...s(('7887bhshjdes',47775,true,0.35),('tetre',81204,t,.833)) ;
                                                             ^
universe=> insert into moon(name,circumfrence, spherical,density) values(('7887bhshjdes',47775,true,0.35),('tetre',81204,true,.833)) ;
ERROR:  INSERT has more target columns than expressions
LINE 1: insert into moon(name,circumfrence, spherical,density) value...
                                            ^
universe=> insert into moon(name,circumfrence, spherical,density) values('tetre',81204,true,.833) ;
INSERT 0 1
universe=> insert into moon(name) values('bartgh',sdui89) ;
ERROR:  column "sdui89" does not exist
LINE 1: insert into moon(name) values('bartgh',sdui89) ;
                                               ^
universe=> insert into moon(name) values('bartgh','sdui89') ;
ERROR:  INSERT has more expressions than target columns
LINE 1: insert into moon(name) values('bartgh','sdui89') ;
                                               ^
universe=> insert into moon(name) values(('bartgh'),('sdui89')) ;
ERROR:  INSERT has more expressions than target columns
LINE 1: insert into moon(name) values(('bartgh'),('sdui89')) ;
                                                  ^
universe=> insert into moon(name) values('bartgh'),('sdui89') ;
ERROR:  null value in column "density" violates not-null constraint
DETAIL:  Failing row contains (bartgh, null, null, null, 5, null, null, null).
universe=> insert into moon(name,density) values('bartgh',.875),('sdui89',0.44) ;
ERROR:  null value in column "circumfrence" violates not-null constraint
DETAIL:  Failing row contains (bartgh, null, null, null, 6, null, 0.875, null).
universe=> insert into moon(name,density,circumfrence) values('bartgh',.875,29578)('sdui89',0.44),94256);
ERROR:  syntax error at or near "("
LINE 1: ...,density,circumfrence) values('bartgh',.875,29578)('sdui89',...
                                                             ^
universe=> insert into moon(name,density,circumfrence) values('bartgh',.875,29578),('sdui89',0.44),94256);
ERROR:  syntax error at or near "94256"
LINE 1: ...mfrence) values('bartgh',.875,29578),('sdui89',0.44),94256);
                                                                ^
universe=> insert into moon(name,density,circumfrence) values('bartgh',.875,29578),('sdui89',0.44,94256);
INSERT 0 2
universe=> insert into moon(name,density,circumfrence) values('libra',.68775,22578),('scorpio',0.5744,52756);
INSERT 0 2
universe=> select * from moon;
+---------+-----------+---------+-----------+---------+-----------+---------+--------------+
|  name   | galaxy_id | star_id | spherical | moon_id | planet_id | density | circumfrence |
+---------+-----------+---------+-----------+---------+-----------+---------+--------------+
| stacey  |           |         | t         |       2 |           |     0.9 |        23345 |
| iris    |           |         | t         |       3 |           |     0.5 |        41835 |
| tetre   |           |         | t         |       4 |           |   0.833 |        81204 |
| bartgh  |           |         |           |       7 |           |   0.875 |        29578 |
| sdui89  |           |         |           |       8 |           |    0.44 |        94256 |
| libra   |           |         |           |       9 |           | 0.68775 |        22578 |
| scorpio |           |         |           |      10 |           |  0.5744 |        52756 |
+---------+-----------+---------+-----------+---------+-----------+---------+--------------+
(7 rows)

universe=> insert into moon(name,density,circumfrence) values('kipa',.75,95726),('serdo',0.14,13635);
INSERT 0 2
universe=> insert into moon(name,density,circumfrence) values('kipa',.75,95726),('serdo',0.14,13635);06829679743757372909
ERROR:  duplicate key value violates unique constraint "moon_circumfrence_key"
DETAIL:  Key (circumfrence)=(95726) already exists.
universe-> 46768506277804894543
universe-> (,.69,32223),(,0.87,72809);
ERROR:  syntax error at or near "06829679743757372909"
LINE 1: 06829679743757372909
        ^
universe=> insert into moon(name,density,circumfrence) value('tegrsf',.679,74375),('uct9qnowir',0.73,729090),('xq2wyt',.69,32223),('htff',0.87,72809);                ERROR:  syntax error at or near "value"
LINE 1: insert into moon(name,density,circumfrence) value('tegrsf',....
                                                    ^
universe=> insert into moon(name,density,circumfrence) values('tegrsf',.679,74375),('uct9qnowir',0.73,729090),('xq2wyt',.69,32223),('htff',0.87,72809);
INSERT 0 4
universe=> select * from moon;
+------------+-----------+---------+-----------+---------+-----------+---------+--------------+
|    name    | galaxy_id | star_id | spherical | moon_id | planet_id | density | circumfrence |
+------------+-----------+---------+-----------+---------+-----------+---------+--------------+
| stacey     |           |         | t         |       2 |           |     0.9 |        23345 |
| iris       |           |         | t         |       3 |           |     0.5 |        41835 |
| tetre      |           |         | t         |       4 |           |   0.833 |        81204 |
| bartgh     |           |         |           |       7 |           |   0.875 |        29578 |
| sdui89     |           |         |           |       8 |           |    0.44 |        94256 |
| libra      |           |         |           |       9 |           | 0.68775 |        22578 |
| scorpio    |           |         |           |      10 |           |  0.5744 |        52756 |
| kipa       |           |         |           |      11 |           |    0.75 |        95726 |
| serdo      |           |         |           |      12 |           |    0.14 |        13635 |
| tegrsf     |           |         |           |      14 |           |   0.679 |        74375 |
| uct9qnowir |           |         |           |      15 |           |    0.73 |       729090 |
| xq2wyt     |           |         |           |      16 |           |    0.69 |        32223 |
| htff       |           |         |           |      17 |           |    0.87 |        72809 |
+------------+-----------+---------+-----------+---------+-----------+---------+--------------+
(13 rows)

universe=> insert into moon(name,density,circumfrence) values('toures',0.4,68436),('viwlis',0.81,78469),('quenk',0.2,46745),('nbvc',0.77,22725),('ruwi,0.55,91564),('obba',0.36,78246),('klnloo',0.4785,25381),('david,0.19,42652);
ERROR:  syntax error at or near "obba"
LINE 1: ...2,46745),('nbvc',0.77,22725),('ruwi,0.55,91564),('obba',0.36...
                                                             ^
universe=>                 universe=> insert into moon(name,density,circumfrence) values('toures',0.4,68436),('viwlis',0.81,78469),('quenk',0.2,46745),('nbvc',0.77,22725),('ruwi',0.55,91564),('oba',0.36,78246),('klnloo',0.4785,25381),('david,0.19,42652);
universe'>                 universe'> ;
universe'> stop
universe'> \h
universe'> ';
universe(> );
ERROR:  syntax error at or near ";"
LINE 6: ';
         ^
universe=> insert into moon(name,density,circumfrence) values('toures',0.4,68436),('viwlis',0.81,78469),('quenk',0.2,46745),('nbvc',0.77,22725),('ruwi',0.55,91564),('obba',0.36,78246),('klnloo',0.4785,25381),('david,0.19,42652);
universe'> ');
ERROR:  VALUES lists must all be the same length
LINE 1: ...564),('obba',0.36,78246),('klnloo',0.4785,25381),('david,0.1...
                                                             ^
universe=> insert into moon(name,density,circumfrence) values('toures',0.4,68436),('viwlis',0.81,78469),('quenk',0.2,46745),('nbvc',0.77,22725),('ruwi',0.55,91564),('obba',0.36,78246),('klnloo',0.4785,25381),('david',0.19,42652);
INSERT 0 8
universe=> select * from moon;                +------------+-----------+---------+-----------+---------+-----------+---------+--------------+
|    name    | galaxy_id | star_id | spherical | moon_id | planet_id | density | circumfrence |
+------------+-----------+---------+-----------+---------+-----------+---------+--------------+
| stacey     |           |         | t         |       2 |           |     0.9 |        23345 |
| iris       |           |         | t         |       3 |           |     0.5 |        41835 |
| tetre      |           |         | t         |       4 |           |   0.833 |        81204 |
| bartgh     |           |         |           |       7 |           |   0.875 |        29578 |
| sdui89     |           |         |           |       8 |           |    0.44 |        94256 |
| libra      |           |         |           |       9 |           | 0.68775 |        22578 |
| scorpio    |           |         |           |      10 |           |  0.5744 |        52756 |
| kipa       |           |         |           |      11 |           |    0.75 |        95726 |
| serdo      |           |         |           |      12 |           |    0.14 |        13635 |
| tegrsf     |           |         |           |      14 |           |   0.679 |        74375 |
| uct9qnowir |           |         |           |      15 |           |    0.73 |       729090 |
| xq2wyt     |           |         |           |      16 |           |    0.69 |        32223 |
| htff       |           |         |           |      17 |           |    0.87 |        72809 |
| toures     |           |         |           |      18 |           |     0.4 |        68436 |
| viwlis     |           |         |           |      19 |           |    0.81 |        78469 |
| quenk      |           |         |           |      20 |           |     0.2 |        46745 |
| nbvc       |           |         |           |      21 |           |    0.77 |        22725 |
| ruwi       |           |         |           |      22 |           |    0.55 |        91564 |
| obba       |           |         |           |      23 |           |    0.36 |        78246 |
| klnloo     |           |         |           |      24 |           |  0.4785 |        25381 |
| david      |           |         |           |      25 |           |    0.19 |        42652 |
+------------+-----------+---------+-----------+---------+-----------+---------+--------------+
(21 rows)

universe=> \d galaxy
                                              Table "public.galaxy"
+----------------------------+-----------------------+-----------+----------+------------------------------------+
|           Column           |         Type          | Collation | Nullable |              Default               |
+----------------------------+-----------------------+-----------+----------+------------------------------------+
| galaxy_id                  | integer               |           | not null | nextval('galaxy_id_seq'::regclass) |
| name                       | character varying(30) |           |          |                                    |
| age_in_million_of_years    | integer               |           |          |                                    |
| beyond_reach               | boolean               |           |          |                                    |
| contains_habitable_planets | boolean               |           |          |                                    |
| distance_from_earth        | integer               |           |          |                                    |
| redshift                   | numeric               |           | not null |                                    |
+----------------------------+-----------------------+-----------+----------+------------------------------------+
Indexes:
    "galaxy_pkey" PRIMARY KEY, btree (galaxy_id)
    "galaxy_redshift_key" UNIQUE CONSTRAINT, btree (redshift)
Referenced by:
    TABLE "star" CONSTRAINT "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)

universe=> insert into galaxy(redshift) values(9.9),(8.2),(2.8),(8.4),(7.0),(0.5);
INSERT 0 6
universe=> \d star
                                             Table "public.star"
+-------------------------+-------------------+-----------+----------+---------------------------------------+
|         Column          |       Type        | Collation | Nullable |                Default                |
+-------------------------+-------------------+-----------+----------+---------------------------------------+
| name                    | character varying |           |          |                                       |
| galaxy_id               | integer           |           |          |                                       |
| star_type               | character varying |           |          |                                       |
| surface_temp_in_kelvins | numeric           |           |          |                                       |
| has_planets             | boolean           |           |          |                                       |
| star_id                 | integer           |           | not null | nextval('star_star_id_seq'::regclass) |
| internal_temp_in_kelvin | numeric           |           | not null |                                       |
+-------------------------+-------------------+-----------+----------+---------------------------------------+
Indexes:
    "star_pkey" PRIMARY KEY, btree (star_id)
    "star_internal_temp_in_kelvin_key" UNIQUE CONSTRAINT, btree (internal_temp_in_kelvin)
Foreign-key constraints:
    "star_galaxy_id_fkey" FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
Referenced by:
    TABLE "planet" CONSTRAINT "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)

universe=> insert into star(internal_temp_in_kelvin) values(0),(54),(60.34),(.054),(488),(12.89); 
INSERT 0 6
universe=> \d planet
                                              Table "public.planet"
+-------------------------+-------------------+-----------+----------+-------------------------------------------+
|         Column          |       Type        | Collation | Nullable |                  Default                  |
+-------------------------+-------------------+-----------+----------+-------------------------------------------+
| name                    | character varying |           |          |                                           |
| galaxy_id               | integer           |           |          |                                           |
| star_id                 | integer           |           |          |                                           |
| planet_radius           | integer           |           |          |                                           |
| surface_temp_in_celsius | numeric           |           |          |                                           |
| atmosphere              | boolean           |           |          |                                           |
| planet_id               | integer           |           | not null | nextval('planet_planet_id_seq'::regclass) |
| coordinates             | numeric           |           | not null |                                           |
+-------------------------+-------------------+-----------+----------+-------------------------------------------+
Indexes:
    "planet_pkey" PRIMARY KEY, btree (planet_id)
    "planet_coordinates_key" UNIQUE CONSTRAINT, btree (coordinates)
Foreign-key constraints:
    "planet_star_id_fkey" FOREIGN KEY (star_id) REFERENCES star(star_id)
Referenced by:
    TABLE "moon" CONSTRAINT "moon_planet_id_fkey" FOREIGN KEY (planet_id) REFERENCES planet(planet_id)

universe=> insert into planet(coordinates) values(246816.6841156),(668168.644),(6556484186.02315687),(468864.24586),(879645.64583),(567982.498537),(4658.890756),(46951678.784555),(2686841534.12416),(7845415514.222),(88988898984.22),(184648468.78);
INSERT 0 12
universe=> \d blakhole
Did not find any relation named "blakhole".
universe=> \d blackhole
                                           Table "public.blackhole"
+---------------+-------------------+-----------+----------+-------------------------------------------------+
|    Column     |       Type        | Collation | Nullable |                     Default                     |
+---------------+-------------------+-----------+----------+-------------------------------------------------+
| blackhole_id  | integer           |           | not null | nextval('blackhole_blackhole_id_seq'::regclass) |
| name          | character varying |           | not null |                                                 |
| radius        | numeric           |           |          |                                                 |
| event_horizon | text              |           |          |                                                 |
| mass          | numeric           |           | not null |                                                 |
+---------------+-------------------+-----------+----------+-------------------------------------------------+
Indexes:
    "blackhole_pkey" PRIMARY KEY, btree (blackhole_id)
    "blackhole_mass_key" UNIQUE CONSTRAINT, btree (mass)

universe=> alter table blackhole alter column name drop constraints;
ERROR:  syntax error at or near "constraints"
LINE 1: alter table blackhole alter column name drop constraints;
                                                     ^
universe=> alter table blackhole alter column name drop constraint;
ERROR:  syntax error at or near "constraint"
LINE 1: alter table blackhole alter column name drop constraint;
                                                     ^
universe=> alter table blackhole drop constraint name;
ERROR:  constraint "name" of relation "blackhole" does not exist
universe=> alter table blackhole drop index name;
ERROR:  syntax error at or near "name"
LINE 1: alter table blackhole drop index name;
                                         ^
universe=> alter table blackhole drop unique constraint name;
ERROR:  syntax error at or near "unique"
LINE 1: alter table blackhole drop unique constraint name;
                                   ^
universe=> alter table blackhole drop column name;
ALTER TABLE
universe=> alter table blackhole add column name varchar;
ALTER TABLE
universe=> insert into blackhole(mass) values(458),(89346),(2) ;
INSERT 0 3
universe=> quit
