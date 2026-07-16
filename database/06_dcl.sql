MariaDB [db_praktikum]> CREATE USER IF NOT EXISTS
    -> 'praktikum_user'@'localhost'
    -> IDENTIFIED BY 'praktikum123';
Query OK, 0 rows affected, 1 warning (0.006 sec)

MariaDB [db_praktikum]> GRANT SELECT, INSERT, UPDATE, DELETE
    -> ON db_praktikum.*
    -> TO 'praktikum_user'@'localhost';
Query OK, 0 rows affected (0.005 sec)

MariaDB [db_praktikum]> SHOW GRANTS FOR 'praktikum_user'@'localhost';
+-----------------------------------------------------------------------------------------------------------------------+
| Grants for praktikum_user@localhost                                                                                   |
+-----------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `praktikum_user`@`localhost` IDENTIFIED BY PASSWORD '*849F0859CA4863B6D2F23B15DD7B85C0416EB670' |
+-----------------------------------------------------------------------------------------------------------------------+
1 row in set (0.000 sec)