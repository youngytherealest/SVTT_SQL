import pandas as pd
import pyodbc

server = '10.91.13.128'
database = 'SVTT'
username = 'sa'
password = 'Vnpt@123'

conn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password};CHARSET=UTF8')

# Đối với pyodbc
cursor = conn.cursor()

df = pd.read_json(f'xaphuong.json', encoding='utf8')

insert_query = """
INSERT INTO XaPhuong(DiaChi)
VALUES (?)
"""
for i in df.itertuples(index=False):
    # Thực hiện chèn dữ liệu
    cursor.execute(insert_query, i.province)
    conn.commit()

# Đóng kết nối sau khi hoàn thành
conn.close()
