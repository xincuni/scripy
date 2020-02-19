# -*- coding:utf-8 -*-
import pymysql

conn = pymysql.connect(host='127.0.0.1', port=3306, user='root', passwd='qwe123', db='mysql')

cursor = conn.cursor()

try:
    cursor.execute("CREATE USER 'admin'@'%' IDENTIFIED BY 'Root110qwe'")

    cursor.execute("GRANT ALL  ON *.* TO 'admin'@'%'")

    cursor.execute("CREATE USER 'develop'@'%' IDENTIFIED BY 'QWEqwe123'")

    cursor.execute("GRANT SELECT,INSERT,UPDATE,DELETE  ON *.* TO 'develop'@'%'")

    cursor.execute("FLUSH PRIVILEGES")

    conn.commit()
except Exception as e:
    print(e)
finally:
    cursor.close()
    conn.close()

print('MySQL user add finish!!!')
