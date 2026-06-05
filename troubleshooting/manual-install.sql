-- =============================================================
-- Respira for WordPress — manual table provisioning bundle
-- =============================================================
--
-- Use this file when your hosting environment blocks the WordPress
-- database user from CREATE TABLE / ALTER TABLE privileges (common
-- on locked-down shared hosting and some managed enterprise installs).
-- Respira normally creates these three tables on activation. With this
-- bundle, your DBA can run the schema once via phpMyAdmin / wp-cli /
-- direct mysql client, and Respira will detect the existing tables
-- and skip its own creation step. No elevation of the WordPress user's
-- privileges is required.
--
-- After the tables exist, Respira only performs INSERT / SELECT /
-- UPDATE / DELETE operations against them, which every standard
-- WordPress database user can do.
--
-- Idempotency: all CREATE statements use IF NOT EXISTS, so re-running
-- this file is safe and will never destroy data.
--
-- Table prefix: this file uses the default `wp_` prefix. If your
-- install uses a different prefix (check `$table_prefix` in
-- wp-config.php), replace every occurrence of `wp_` below with your
-- actual prefix before running.
--
-- Compatible with the schema as of plugin v7.0.35. Future minor
-- versions may add columns via the upgrader. Re-fetch this file from
-- the GitHub repo on major-version upgrades and have your DBA re-run
-- it (idempotent, only adds what is missing).
--
-- Source: wordpress-plugin/respira-for-wordpress/docs/manual-install.sql
-- =============================================================


-- -------------------------------------------------------------
-- 1. wp_respira_api_keys
--    Stores generated API keys, encrypted secrets, and per-key
--    permissions / license bindings.
-- -------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp_respira_api_keys` (
	`id`            bigint(20)   NOT NULL AUTO_INCREMENT,
	`api_key`       varchar(255) NOT NULL,
	`key_prefix`    varchar(20)  DEFAULT NULL,
	`encrypted_key` longtext     DEFAULT NULL,
	`user_id`       bigint(20)   NOT NULL,
	`name`          varchar(255) DEFAULT NULL,
	`permissions`   text         DEFAULT NULL,
	`license_key`   varchar(255) DEFAULT NULL,
	`last_used`     datetime     DEFAULT NULL,
	`created_at`    datetime     NOT NULL,
	`expires_at`    datetime     DEFAULT NULL,
	`is_active`     tinyint(1)   DEFAULT 1,
	PRIMARY KEY (`id`),
	UNIQUE KEY `api_key` (`api_key`),
	KEY `user_id` (`user_id`),
	KEY `license_key` (`license_key`),
	KEY `key_prefix` (`key_prefix`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


-- -------------------------------------------------------------
-- 2. wp_respira_audit_log
--    Records every API action (who, what, when, response code) for
--    audit + diagnostics. Visible in WP admin → Respira → Audit Log.
-- -------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp_respira_audit_log` (
	`id`            bigint(20)   NOT NULL AUTO_INCREMENT,
	`api_key_id`    bigint(20)   DEFAULT NULL,
	`user_id`       bigint(20)   DEFAULT NULL,
	`action`        varchar(100) NOT NULL,
	`resource_type` varchar(50)  DEFAULT NULL,
	`resource_id`   bigint(20)   DEFAULT NULL,
	`ip_address`    varchar(45)  DEFAULT NULL,
	`user_agent`    text         DEFAULT NULL,
	`request_data`  longtext     DEFAULT NULL,
	`response_code` int(11)      DEFAULT NULL,
	`created_at`    datetime     NOT NULL,
	PRIMARY KEY (`id`),
	KEY `api_key_id` (`api_key_id`),
	KEY `user_id` (`user_id`),
	KEY `created_at` (`created_at`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


-- -------------------------------------------------------------
-- 3. wp_respira_snapshots
--    Before/after content snapshots for the rollback + approval flow.
--    Payload is gzip-compressed base64; one row per snapshot.
-- -------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `wp_respira_snapshots` (
	`id`               bigint(20) unsigned NOT NULL AUTO_INCREMENT,
	`snapshot_uuid`    varchar(64)         NOT NULL,
	`post_id`          bigint(20) unsigned NOT NULL,
	`post_type`        varchar(64)         NOT NULL,
	`kind`             varchar(64)         NOT NULL,
	`builder`          varchar(64)         DEFAULT NULL,
	`created_at_gmt`   datetime            NOT NULL,
	`actor_api_key_id` bigint(20) unsigned DEFAULT NULL,
	`payload_gz_b64`   longtext            NOT NULL,
	`payload_bytes`    bigint(20) unsigned NOT NULL,
	`hashes_json`      longtext            NOT NULL,
	`pinned`           tinyint(1)          NOT NULL DEFAULT 0,
	`label`            varchar(255)        DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `snapshot_uuid` (`snapshot_uuid`),
	KEY `post_created` (`post_id`, `created_at_gmt`),
	KEY `post_type_post` (`post_type`, `post_id`),
	KEY `kind` (`kind`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


-- =============================================================
-- Done. Activate (or deactivate + reactivate) Respira after this
-- file runs. The plugin will detect the existing tables, skip its
-- own creation step, and proceed normally to the API-key setup.
-- =============================================================
