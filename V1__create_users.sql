-- V1__create_users.sql
-- Creates the users table (students, teachers, and admins share this table via the role column)

CREATE TABLE users (
    id             BIGSERIAL PRIMARY KEY,
    full_name      VARCHAR(100) NOT NULL,
    email          VARCHAR(255) NOT NULL,
    password_hash  VARCHAR(255) NOT NULL,
    role           VARCHAR(20)  NOT NULL,
    status         VARCHAR(20)  NOT NULL DEFAULT 'ACTIVE',
    email_verified BOOLEAN      NOT NULL DEFAULT FALSE,
    created_at     TIMESTAMP    NOT NULL DEFAULT NOW(),
    updated_at     TIMESTAMP    NOT NULL DEFAULT NOW(),

    CONSTRAINT uq_users_email            UNIQUE (email),
    CONSTRAINT chk_users_role            CHECK (role   IN ('STUDENT', 'TEACHER', 'ADMIN')),
    CONSTRAINT chk_users_status          CHECK (status IN ('ACTIVE', 'PENDING', 'DISABLED')),
    CONSTRAINT chk_users_email_lowercase CHECK (email = LOWER(email))
);
