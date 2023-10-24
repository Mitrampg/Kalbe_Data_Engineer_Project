# Melakukan import mysql connector

import mysql.connector

# Melakukan percobaan koneksi
conn = mysql.connector.connect(
    host="localhost",  # misalnya "localhost"
    user="root",
    password="Mysql130614",
    database="KARYAWAN"
)

# Membuat object cursor sebagai penanda
cursor = conn.cursor()

# Deklarasi SQL Query untuk memasukan record ke DB (KARYAWAN)
insert_sql = (

"INSERT INTO KARYAWAN (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME)"
"VALUES (%s, %s, %s, %s, %s)"

)
# Data yang akan dimasukkan
data = ("John", "Doe", 25, "M", 50000)

try:
    # Eksekusi SQL Command
    cursor.execute(insert_sql, data)
    
    # Melakukan perubahan (commit) pada DB
    conn.commit()

except mysql.connector.Error as err:
    print(f"Error: {err}")
    # Roll Back apabila ada issue
    conn.rollback()

# Menutup Koneksi
cursor.close()
conn.close()

