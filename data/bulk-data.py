import pandas as pd
import pyodbc

server = '10.91.13.128'
database = 'SVTT'
username = 'sa'
password = 'Vnpt@123'

conn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};CHARSET=UTF8')

# Đối với pyodbc
cursor = conn.cursor()

find = cursor.execute("SELECT MSSV FROM SinhVien WHERE Truong='VLUTE'").fetchall()
for i in find:
    if len(i[0])==8:
        cursor.execute("UPDATE SinhVien SET MaLop=? WHERE MSSV=?", f'Đại học Công nghệ thông tin 20{i[0][:2]}', i[0])
        cursor.commit()
        print(f'Updated {i[0]}')

# Đóng kết nối sau khi hoàn thành
conn.close()
