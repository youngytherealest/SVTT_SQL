import pandas as pd
import pyodbc

server = '10.91.13.128'
database = 'SVTT'
username = 'sa'
password = 'Vnpt@123'

conn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};CHARSET=UTF8')

# Đối với pyodbc
cursor = conn.cursor()

df = pd.read_json(f'nhomtt.json', encoding='utf8')

insert_query = """
UPDATE SinhVien
SET NhomHuongDan = ?
WHERE SinhVien.MSSV = ?
"""
for i in df.itertuples(index=False):
    # print(i)
    id = 1
    if not pd.isna(i.id):
        id = i.id
    # Giá trị cần chèn
    values = (id, i.mssv)

    # Thực hiện chèn dữ liệu
    cursor.execute(insert_query, values)
    conn.commit()

# Đóng kết nối sau khi hoàn thành
conn.close()
