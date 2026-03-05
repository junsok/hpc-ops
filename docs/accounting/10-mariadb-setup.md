# MariaDB Setup (Example)

Slurm Accounting을 위해 MariaDB(MySQL)를 사용합니다.

---

# Install MariaDB

Ubuntu Example

```bash
apt update
apt install mariadb-server
```

---

# Create Accounting Database

MariaDB 접속

```bash
mysql -u root -p
```

데이터베이스 생성

```sql
CREATE DATABASE <SLURM_ACCOUNTING_DB>;
```

사용자 생성

```sql
CREATE USER '<DB_USER>'@'localhost' IDENTIFIED BY '<DB_PASSWORD>';
```

권한 부여

```sql
GRANT ALL PRIVILEGES ON <SLURM_ACCOUNTING_DB>.* TO '<DB_USER>'@'localhost';
```

적용

```sql
FLUSH PRIVILEGES;
```

---

# Verify Database

```sql
SHOW DATABASES;
```

확인해야 할 항목

* `<SLURM_ACCOUNTING_DB>` 존재 여부
